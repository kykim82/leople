// GET /api/catalog — 섹션+항목+요율 전체 반환
const J = (d, s=200) => new Response(JSON.stringify(d), {status:s, headers:{'content-type':'application/json; charset=utf-8'}});

export async function onRequestGet({ env }) {
  try {
    const secs = (await env.DB.prepare("SELECT * FROM sections ORDER BY sort").all()).results;
    const items = (await env.DB.prepare("SELECT * FROM items WHERE active=1 ORDER BY section_id,sort").all()).results;
    const rates = (await env.DB.prepare("SELECT * FROM rates ORDER BY sort").all()).results;
    const sections = secs.map(s => ({
      no:s.no, name:s.name, group:s.grp, pick:s.pick,
      items: items.filter(i=>i.section_id===s.id).map(i=>({
        id:i.id, code:i.code, name:i.name, ctrl:i.ctrl, mode:i.mode,
        unit:i.unit, addflat:i.addflat, maxc:i.maxc, cu:i.cu,
        options: i.options ? JSON.parse(i.options) : undefined
      }))
    }));
    const RATES = rates.map(r=>({id:r.id,label:r.label,desc:r.descr,val:r.val,suf:r.suf}));
    return J({ sections, rates: RATES });
  } catch (e) { return J({error:String(e)}, 500); }
}
