-- 레오플 견적 1단계 · D1 스키마 + 시드데이터
-- 적용: wrangler d1 execute leople-estimate --remote --file=schema.sql
PRAGMA foreign_keys=ON;
DROP TABLE IF EXISTS submissions;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS rates;

CREATE TABLE sections(id INTEGER PRIMARY KEY, no INTEGER, name TEXT, grp TEXT, pick TEXT, sort INTEGER);

CREATE TABLE items(id TEXT PRIMARY KEY, section_id INTEGER, code TEXT, name TEXT, ctrl TEXT, mode TEXT, unit REAL, addflat REAL, maxc INTEGER, cu TEXT, options TEXT, sort INTEGER, active INTEGER DEFAULT 1, FOREIGN KEY(section_id) REFERENCES sections(id));

CREATE TABLE rates(id TEXT PRIMARY KEY, label TEXT, descr TEXT, val REAL, suf TEXT, sort INTEGER);

CREATE TABLE submissions(id INTEGER PRIMARY KEY AUTOINCREMENT, created_at TEXT, name TEXT, phone TEXT, email TEXT, area REAL, facade_type TEXT, selections TEXT, total REAL);

INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(1,1,'골조공사','frame','one',0);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(2,2,'외장마감','ext','one',1);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(3,3,'지붕공사','roof','free',2);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(4,4,'창호공사','win','free',3);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(5,5,'단열공사','ins','free',4);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(6,6,'전기 · 설비','mep','free',5);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(7,7,'방수공사','water','free',6);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(8,8,'목공·인테리어','carp','free',7);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(9,9,'도배 · 도장','surf','free',8);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(10,10,'바닥공사','floor','free',9);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(11,11,'화장실·주방 타일','tile','free',10);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(12,12,'가구공사','furn','free',11);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(13,13,'가설공사','temp','free',12);
INSERT INTO sections(id,no,name,grp,pick,sort) VALUES(14,14,'건축 외 공사','extra','free',13);

INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('f_wood',1,'frame','경량목구조','radio','area',140,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('f_steel',1,'frame','스틸모듈러구조','radio','area',140,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('f_rc',1,'frame','철근콘크리트조','radio','area',200,NULL,NULL,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('f_caulk',1,'frame_caulk','골조기밀코킹 (목구조/모듈러만)','check','area',6,NULL,NULL,NULL,NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('e_summer',2,'ext','서머사이딩','radio','area',55,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('e_stuco',2,'ext','60T EPS 위 스타코플랙스','radio','area',65,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('e_brick',2,'ext','점토벽돌 (기본사이즈)','radio','area',70,NULL,NULL,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('e_ceramic',2,'ext','세라믹사이딩&세라믹타일','radio','area',100,NULL,NULL,NULL,NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('r_shingle',3,'roof','이중그림자 슁글','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"단면경사","unit":13.2},{"label":"박공","unit":26.4}]',0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('r_zinc',3,'roof','리얼징크','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"단면경사","unit":39.6},{"label":"박공","unit":90}]',1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('r_tile',3,'roof','점토기와','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"단면경사+일반기와","unit":55},{"label":"박공+일반기와","unit":110},{"label":"단면경사+수입기와","unit":66},{"label":"박공+수입기와","unit":132}]',2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_lg',4,'window','LG창호','check','area',35,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_us',4,'window','미국식 시스템창호','check','area',50,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_de',4,'window','독일식 시스템창호','check','area',70,NULL,NULL,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_eagon',4,'window','이건알루미늄 시스템창호','check','area',120,NULL,NULL,NULL,NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_sky',4,'window_sky','천창','unitcount','unitcount',NULL,NULL,20,NULL,'[{"label":"고정창","unit":100},{"label":"열리는 창","unit":140}]',4,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_door',4,'entrance','현관문','select','flat',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"독일식 시스템현관문","unit":180},{"label":"도어코코리아 현관문","unit":110}]',5,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('w_store',4,'storage_door','창고문 (방화문기본)','count','count',25,NULL,20,NULL,NULL,6,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('i_mat',5,'insulation','단열재','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"인슐레이션","unit":14},{"label":"우레탄 폼","unit":30}]',0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('m_elec',6,'electric','전기','check','area',17,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('m_plumb',6,'plumbing','설비 (난방/배관/소방)','check','area',25,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('wp',7,'waterproof','방수 (화장실/테라스/베란다)','count','count',70,NULL,20,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_mold',8,'molding','몰딩공사','check','area',9.5,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_well',8,'int_light','우물천정 등박스 (간접조명)','check','area',7,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_art',8,'int_light','아트월 등박스 (간접조명)','check','area',10,NULL,NULL,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_ceil',8,'ceiling','천정석고 2P','check','area',7,NULL,NULL,NULL,NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_wall',8,'wall_board','벽면 석고 / 석고+OSB','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"벽면석고 2P","unit":10},{"label":"석고+OSB","unit":20}]',4,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_luva',8,'luva','내부 미송목재루바','check','area',45,NULL,NULL,NULL,NULL,5,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_abs',8,'abs_door','ABS도어 (문+틀+손잡이)','count','count',25,NULL,20,NULL,NULL,6,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_pocket',8,'pocket_door','포켓도어','count','count',55,NULL,20,NULL,NULL,7,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('c_stair',8,'stair','계단공사','check','flat',500,NULL,NULL,NULL,NULL,8,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('p_wall',9,'wallpaper','도배','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"전체실크","unit":7},{"label":"전체합지","unit":4.55}]',0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('p_paint',9,'paint','도장','check','area',15,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('fl',10,'floor','마루','select','area',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"원목마루","unit":40.25},{"label":"강마루","unit":12.65},{"label":"강화마루 소폭","unit":9.66},{"label":"강화마루 광폭","unit":8.97},{"label":"데코타일","unit":4.83},{"label":"장판 1.8T","unit":4.37},{"label":"장판 2.0T","unit":5.175},{"label":"장판 4.5T","unit":9.775},{"label":"폴리싱 타일","unit":12},{"label":"포세린 타일","unit":15}]',0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('t_basic',11,'bath_basic','화장실 기본형 (보급형 도기류)','count','count',300,NULL,4,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('t_black',11,'bath_premium','화장실 블랙타입 (고급형)','count','count',450,NULL,4,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('t_kitchen',11,'kitchen_tile','주방타일','count','count',1.2,NULL,4,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('k_sink',12,'sink','싱크대','select','flat',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"2.4m ㅡ형","unit":180},{"label":"3.2m ㅡ형","unit":240},{"label":"2.4m ㄱ형","unit":200},{"label":"3.2m ㄱ형","unit":260}]',0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('k_tall',12,'tall_cabinet','키큰장(600)+냉장고장(1000)','check','flat',80,NULL,NULL,NULL,NULL,1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('k_island',12,'island','아일랜드식탁','select','flat',NULL,NULL,NULL,NULL,'[{"label":"선택 안 함","unit":0},{"label":"4인용","unit":45},{"label":"6인용","unit":65}]',2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('k_uv',12,'uv_cabinet','UV도장 키큰장 (자수)','count','count',15,NULL,12,'자',NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('k_dress',12,'dressroom','드레스룸 시스템장 (자수)','count','count',10,NULL,20,'자',NULL,4,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('s_scaffold',13,'scaffold','아시바 (+정액 120만)','check','area',9,120,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('x_attic',14,'attic','다락공사 (평 입력)','areainput','areainput',220,NULL,NULL,NULL,NULL,0,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('x_deck',14,'deck','데크공사 (평 입력)','areaselect','areainput',NULL,NULL,NULL,NULL,'[{"label":"미송방부목데크재","unit":50},{"label":"하드우드데크재","unit":65}]',1,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('x_water',14,'ext_water','외부수도공사','check','flat',100,NULL,NULL,NULL,NULL,2,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('x_temp',14,'temp_power','임시전기 및 한전계량기 인입비','check','flat',150,NULL,NULL,NULL,NULL,3,1);
INSERT INTO items(id,section_id,code,name,ctrl,mode,unit,addflat,maxc,cu,options,sort,active) VALUES('x_gas',14,'gas','가스인입비','check','flat',100,NULL,NULL,NULL,NULL,4,1);

INSERT INTO rates(id,label,descr,val,suf,sort) VALUES('ins','보험료 등','직접공사비 × %',3.8,'%',0);
INSERT INTO rates(id,label,descr,val,suf,sort) VALUES('base','평당 기본경비','평수 × 단가',5.35,'만원/평',1);
INSERT INTO rates(id,label,descr,val,suf,sort) VALUES('mgmt','일반관리비·이윤','직접공사비 × %',8,'%',2);
INSERT INTO rates(id,label,descr,val,suf,sort) VALUES('vat','부가세','공급가액 × %',10,'%',3);
