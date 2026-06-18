// /api/item — 항목 추가(POST)·수정(PUT)·삭제(DELETE)
const J = (d,s=200)=>new Response(JSON.stringify(d),{status:s,headers:{'content-type':'application/json; charset=utf-8'}});

export async function onRequestPost({ request, env }) {  // 추가
  try {
    const b = await request.json();
    const sec = await env.DB.prepare("SELECT id FROM sections WHERE grp=?").bind(b.group).first();
    if(!sec) return J({error:'섹션 없음'},400);
    const id = 'x'+Date.now();
    const mode = b.mode || 'area';
    const ctrl = b.ctrl || (mode === 'count' ? 'count' : 'check');
    const maxc = mode === 'count' ? (b.maxc || 20) : null;
    await env.DB.prepare(
      "INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,maxc,sort,active) VALUES(?,?,?,?,?,?,?,?,?,1)"
    ).bind(id, sec.id, b.code || 'custom', b.name, ctrl, mode, b.unit || 0, maxc, 999).run();
    return J({ok:true, id});
  } catch(e){ return J({error:String(e)},500); }
}

export async function onRequestPut({ request, env }) {  // 수정 (단가/이름/옵션)
  try {
    const b = await request.json();
    if (b.options !== undefined)
      await env.DB.prepare("UPDATE items SET options=? WHERE id=?").bind(JSON.stringify(b.options), b.id).run();
    if (b.name !== undefined)
      await env.DB.prepare("UPDATE items SET name=? WHERE id=?").bind(b.name, b.id).run();
    if (b.unit !== undefined)
      await env.DB.prepare("UPDATE items SET unit=? WHERE id=?").bind(b.unit, b.id).run();
    return J({ok:true});
  } catch(e){ return J({error:String(e)},500); }
}

export async function onRequestDelete({ request, env }) {  // 삭제(비활성)
  try {
    const id = new URL(request.url).searchParams.get('id');
    await env.DB.prepare("UPDATE items SET active=0 WHERE id=?").bind(id).run();
    return J({ok:true});
  } catch(e){ return J({error:String(e)},500); }
}
