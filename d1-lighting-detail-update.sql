-- Existing D1 data-safe update for detailed lighting options.
-- This does not drop tables or delete saved submissions.
UPDATE items SET sort=2 WHERE id='m_plumb';
INSERT OR IGNORE INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active)
VALUES('m_light',6,'lighting','조명 브랜드/사양 선택','select','area',NULL,NULL,NULL,NULL,'[{"label":"기본 LED 조명 (전기설비 포함)","unit":0},{"label":"국산 일반 LED 패키지","unit":12,"material":8,"labor":3,"expense":1},{"label":"필립스 LED 패키지","unit":19.5,"material":14,"labor":4,"expense":1.5},{"label":"LG/삼성 고급 LED 패키지","unit":25,"material":18,"labor":5,"expense":2}]',1,1);
UPDATE items SET
  code='lighting',
  name='조명 브랜드/사양 선택',
  ctrl='select',
  mode='area',
  unit=NULL,
  options='[{"label":"기본 LED 조명 (전기설비 포함)","unit":0},{"label":"국산 일반 LED 패키지","unit":12,"material":8,"labor":3,"expense":1},{"label":"필립스 LED 패키지","unit":19.5,"material":14,"labor":4,"expense":1.5},{"label":"LG/삼성 고급 LED 패키지","unit":25,"material":18,"labor":5,"expense":2}]',
  sort=1,
  active=1
WHERE id='m_light';
