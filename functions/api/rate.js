// PUT /api/rate — 요율 수정
const J=(d,s=200)=>new Response(JSON.stringify(d),{status:s,headers:{'content-type':'application/json; charset=utf-8'}});
export async function onRequestPut({ request, env }) {
  try { const b=await request.json();
    await env.DB.prepare("UPDATE rates SET val=? WHERE id=?").bind(b.val, b.id).run();
    return J({ok:true});
  } catch(e){ return J({error:String(e)},500); }
}
