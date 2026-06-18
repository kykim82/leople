// /api/submissions — 견적 저장(POST)·목록(GET)·삭제(DELETE)
const J=(d,s=200)=>new Response(JSON.stringify(d),{status:s,headers:{'content-type':'application/json; charset=utf-8'}});

export async function onRequestGet({ env }) {
  try {
    const r = (await env.DB.prepare("SELECT * FROM submissions ORDER BY id DESC LIMIT 200").all()).results;
    return J(r.map(s=>({id:s.id, at:s.created_at, name:s.name, phone:s.phone, email:s.email,
      area:s.area, facade_type:s.facade_type, selections:JSON.parse(s.selections||'[]'), total:s.total})));
  } catch(e){ return J({error:String(e)},500); }
}

export async function onRequestPost({ request, env }) {
  try {
    const b = await request.json();
    const at = new Date().toLocaleString('ko-KR',{timeZone:'Asia/Seoul'});
    const res = await env.DB.prepare(
      "INSERT INTO submissions(created_at,name,phone,email,area,facade_type,selections,total) VALUES(?,?,?,?,?,?,?,?)"
    ).bind(at, b.name, b.phone||'', b.email||'', b.area, b.facade_type||null, JSON.stringify(b.selections||[]), b.total).run();
    return J({ok:true, id:res.meta.last_row_id});
  } catch(e){ return J({error:String(e)},500); }
}

export async function onRequestDelete({ request, env }) {
  try {
    const id = new URL(request.url).searchParams.get('id');
    await env.DB.prepare("DELETE FROM submissions WHERE id=?").bind(id).run();
    return J({ok:true});
  } catch(e){ return J({error:String(e)},500); }
}
