-- create tables
create table departments (
    id                             number not null constraint departments_id_pk primary key,
    name                           varchar2(255) not null,
    location                       varchar2(4000),
    country                        varchar2(4000)
)
;

create table employees (
    id                             number not null constraint employees_id_pk primary key,
    department_id                  number
                                   constraint employees_department_id_fk
                                   references departments on delete cascade,
    name                           varchar2(50) not null,
    email                          varchar2(255),
    cost_center                    number,
    date_hired                     date,
    job                            varchar2(255)
)
;

-- additional constraints
ALTER TABLE departments
ADD CONSTRAINT departments_uk UNIQUE (name);

-- triggers
create or replace trigger departments_biu
    before insert or update
    on departments
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end departments_biu;
/

create or replace trigger employees_biu
    before insert or update
    on employees
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    :new.email := lower(:new.email);
end employees_biu;
/


-- indexes
create index employees_i1 on employees (department_id);

-- create views
create or replace view emp_v as
select
    departments.id                                     department_id,
    departments.name                                   department_name,
    departments.location                               location,
    departments.country                                country,
    employees.id                                       employee_id,
    employees.name                                     employee_name,
    employees.email                                    email,
    employees.cost_center                              cost_center,
    employees.date_hired                               date_hired,
    employees.job                                      job
from
    departments,
    employees
where
    employees.department_id(+) = departments.id
/

-- load data

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395266176965103742781982645600,
    'Creative Services',
    'Tanquecitos',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395267385890923357411157351776,
    'Governance and Acountability',
    'Sugarloaf',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395268594816742972040332057952,
    'Government Relations',
    'Dale City',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395269803742562586669506764128,
    'Governance and Acountability',
    'Grosvenor',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395271012668382201298681470304,
    'Creative Services',
    'Riverside',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395272221594201815927856176480,
    'Office of Compliance',
    'Ridgeley',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395273430520021430557030882656,
    'Human Resources',
    'Ashley Heights',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395274639445841045186205588832,
    'Consulting',
    'Monfort Heights',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395275848371660659815380295008,
    'Community Outreach',
    'Point Marion',
    'United States'
);

insert into departments (
    id,
    name,
    location,
    country
) values (
    230674380395277057297480274444555001184,
    'Consulting',
    'Eldon',
    'United States'
);

commit;
-- load data
-- load data

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395278266223299889073729707360,
    230674380395266176965103742781982645600,
    'Gricelda Luebbers',
    'gricelda.luebbers@aaab.com',
    59,
    sysdate - 70,
    'Programmer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395279475149119503702904413536,
    230674380395271012668382201298681470304,
    'Dean Bollich',
    'dean.bollich@aaac.com',
    48,
    sysdate - 38,
    'Programmer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395280684074939118332079119712,
    230674380395275848371660659815380295008,
    'Milo Manoni',
    'milo.manoni@aaad.com',
    31,
    sysdate - 89,
    'Web Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395281893000758732961253825888,
    230674380395266176965103742781982645600,
    'Laurice Karl',
    'laurice.karl@aaae.com',
    92,
    sysdate - 9,
    'Help Desk Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395283101926578347590428532064,
    230674380395277057297480274444555001184,
    'August Rupel',
    'august.rupel@aaaf.com',
    53,
    sysdate - 24,
    'Finance Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395284310852397962219603238240,
    230674380395272221594201815927856176480,
    'Salome Guisti',
    'salome.guisti@aaag.com',
    71,
    sysdate - 49,
    'Programmer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395285519778217576848777944416,
    230674380395268594816742972040332057952,
    'Lovie Ritacco',
    'lovie.ritacco@aaah.com',
    10,
    sysdate - 24,
    'Webmaster'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395286728704037191477952650592,
    230674380395273430520021430557030882656,
    'Chaya Greczkowski',
    'chaya.greczkowski@aaai.com',
    94,
    sysdate - 99,
    'Support Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395287937629856806107127356768,
    230674380395266176965103742781982645600,
    'Twila Coolbeth',
    'twila.coolbeth@aaaj.com',
    14,
    sysdate - 33,
    'Support Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395289146555676420736302062944,
    230674380395272221594201815927856176480,
    'Carlotta Achenbach',
    'carlotta.achenbach@aaak.com',
    38,
    sysdate - 12,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395290355481496035365476769120,
    230674380395275848371660659815380295008,
    'Jeraldine Audet',
    'jeraldine.audet@aaal.com',
    37,
    sysdate - 15,
    'Web Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395291564407315649994651475296,
    230674380395274639445841045186205588832,
    'August Arouri',
    'august.arouri@aaam.com',
    71,
    sysdate - 53,
    'Java Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395292773333135264623826181472,
    230674380395275848371660659815380295008,
    'Ward Stepney',
    'ward.stepney@aaan.com',
    22,
    sysdate - 46,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395293982258954879253000887648,
    230674380395266176965103742781982645600,
    'Ayana Barkhurst',
    'ayana.barkhurst@aaao.com',
    80,
    sysdate - 85,
    'Operations Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395295191184774493882175593824,
    230674380395269803742562586669506764128,
    'Luana Berends',
    'luana.berends@aaap.com',
    12,
    sysdate - 75,
    'Programmer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395296400110594108511350300000,
    230674380395274639445841045186205588832,
    'Lecia Alvino',
    'lecia.alvino@aaaq.com',
    63,
    sysdate - 88,
    'Usability Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395297609036413723140525006176,
    230674380395269803742562586669506764128,
    'Joleen Himmelmann',
    'joleen.himmelmann@aaar.com',
    23,
    sysdate - 91,
    'Sustaining Engineering'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395298817962233337769699712352,
    230674380395269803742562586669506764128,
    'Monty Kinnamon',
    'monty.kinnamon@aaas.com',
    40,
    sysdate - 4,
    'Quality Assurance Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395300026888052952398874418528,
    230674380395269803742562586669506764128,
    'Dania Grizzard',
    'dania.grizzard@aaat.com',
    83,
    sysdate - 81,
    'Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395301235813872567028049124704,
    230674380395269803742562586669506764128,
    'Inez Yamnitz',
    'inez.yamnitz@aaau.com',
    32,
    sysdate - 58,
    'President'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395302444739692181657223830880,
    230674380395272221594201815927856176480,
    'Fidel Creps',
    'fidel.creps@aaav.com',
    42,
    sysdate - 98,
    'Director'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395303653665511796286398537056,
    230674380395271012668382201298681470304,
    'Luis Pothoven',
    'luis.pothoven@aaaw.com',
    91,
    sysdate - 91,
    'Customer Advocate'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395304862591331410915573243232,
    230674380395267385890923357411157351776,
    'Bernardo Phoenix',
    'bernardo.phoenix@aaax.com',
    33,
    sysdate - 45,
    'Java Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395306071517151025544747949408,
    230674380395274639445841045186205588832,
    'Carolyne Centore',
    'carolyne.centore@aaay.com',
    61,
    sysdate - 31,
    'Finance Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395307280442970640173922655584,
    230674380395272221594201815927856176480,
    'Cornell Pratico',
    'cornell.pratico@aaaz.com',
    87,
    sysdate - 44,
    'Java Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395308489368790254803097361760,
    230674380395273430520021430557030882656,
    'Sam Rueb',
    'sam.rueb@aaa0.com',
    64,
    sysdate - 85,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395309698294609869432272067936,
    230674380395269803742562586669506764128,
    'Shakita Sablock',
    'shakita.sablock@aaa1.com',
    19,
    sysdate - 1,
    'Solustions Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395310907220429484061446774112,
    230674380395272221594201815927856176480,
    'Sandy Heffren',
    'sandy.heffren@aaa2.com',
    44,
    sysdate - 55,
    'Solustions Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395312116146249098690621480288,
    230674380395273430520021430557030882656,
    'Tressa Coppens',
    'tressa.coppens@aaa3.com',
    33,
    sysdate - 42,
    'Marketing Associate'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395313325072068713319796186464,
    230674380395268594816742972040332057952,
    'Shira Arocho',
    'shira.arocho@aaa4.com',
    67,
    sysdate - 24,
    'Consultant'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395314533997888327948970892640,
    230674380395271012668382201298681470304,
    'Carter Sacarello',
    'carter.sacarello@aaa5.com',
    18,
    sysdate - 74,
    'Consultant'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395315742923707942578145598816,
    230674380395272221594201815927856176480,
    'Linda Merida',
    'linda.merida@aaa6.com',
    85,
    sysdate - 10,
    'Software Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395316951849527557207320304992,
    230674380395271012668382201298681470304,
    'Winfred Sohn',
    'winfred.sohn@aaa7.com',
    46,
    sysdate - 14,
    'Cloud Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395318160775347171836495011168,
    230674380395272221594201815927856176480,
    'Nestor Caparros',
    'nestor.caparros@aaa8.com',
    50,
    sysdate - 27,
    'Usability Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395319369701166786465669717344,
    230674380395266176965103742781982645600,
    'Brooks Craker',
    'brooks.craker@aaa9.com',
    62,
    sysdate - 30,
    'Evengilist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395320578626986401094844423520,
    230674380395275848371660659815380295008,
    'Ruthann Nixa',
    'ruthann.nixa@aaba.com',
    30,
    sysdate - 24,
    'Executive Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395321787552806015724019129696,
    230674380395273430520021430557030882656,
    'Kenny Campobasso',
    'kenny.campobasso@aabb.com',
    43,
    sysdate - 37,
    'Programmer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395322996478625630353193835872,
    230674380395275848371660659815380295008,
    'Hildred Donnel',
    'hildred.donnel@aabc.com',
    86,
    sysdate - 36,
    'Webmaster'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395324205404445244982368542048,
    230674380395275848371660659815380295008,
    'Luther Ardinger',
    'luther.ardinger@aabd.com',
    95,
    sysdate - 99,
    'Sales Executive'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395325414330264859611543248224,
    230674380395275848371660659815380295008,
    'Rhoda Hasfjord',
    'rhoda.hasfjord@aabe.com',
    79,
    sysdate - 92,
    'Webmaster'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395326623256084474240717954400,
    230674380395267385890923357411157351776,
    'Cori Ablin',
    'cori.ablin@aabf.com',
    74,
    sysdate - 73,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395327832181904088869892660576,
    230674380395277057297480274444555001184,
    'Reinaldo Feltner',
    'reinaldo.feltner@aabg.com',
    60,
    sysdate - 9,
    'Business Operations'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395329041107723703499067366752,
    230674380395266176965103742781982645600,
    'Coralee Acerno',
    'coralee.acerno@aabh.com',
    15,
    sysdate - 69,
    'Programmer Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395330250033543318128242072928,
    230674380395277057297480274444555001184,
    'Katherine Tagg',
    'katherine.tagg@aabi.com',
    91,
    sysdate - 71,
    'HR Representitive'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395331458959362932757416779104,
    230674380395267385890923357411157351776,
    'Lenore Sullivan',
    'lenore.sullivan@aabj.com',
    8,
    sysdate - 47,
    'HR Representitive'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395332667885182547386591485280,
    230674380395269803742562586669506764128,
    'erda Sheer',
    'erda.sheer@aabk.com',
    54,
    sysdate - 73,
    'Usability Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395333876811002162015766191456,
    230674380395268594816742972040332057952,
    'Pete Chevis',
    'pete.chevis@aabl.com',
    73,
    sysdate - 64,
    'Support Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395335085736821776644940897632,
    230674380395273430520021430557030882656,
    'Joseph Wilke',
    'joseph.wilke@aabm.com',
    10,
    sysdate - 60,
    'Help Desk Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395336294662641391274115603808,
    230674380395277057297480274444555001184,
    'Nella Rupnick',
    'nella.rupnick@aabn.com',
    19,
    sysdate - 81,
    'Help Desk Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395337503588461005903290309984,
    230674380395277057297480274444555001184,
    'Azalee Goodwater',
    'azalee.goodwater@aabo.com',
    100,
    sysdate - 88,
    'Facilities Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395338712514280620532465016160,
    230674380395275848371660659815380295008,
    'Stefany Waninger',
    'stefany.waninger@aabp.com',
    1,
    sysdate - 16,
    'Systems Designer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395339921440100235161639722336,
    230674380395271012668382201298681470304,
    'Arron Waclawski',
    'arron.waclawski@aabq.com',
    76,
    sysdate - 18,
    'Director'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395341130365919849790814428512,
    230674380395275848371660659815380295008,
    'Boyd Rearden',
    'boyd.rearden@aabr.com',
    92,
    sysdate - 7,
    'Marketing Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395342339291739464419989134688,
    230674380395269803742562586669506764128,
    'Erasmo Riviera',
    'erasmo.riviera@aabs.com',
    94,
    sysdate - 58,
    'Sales Representative'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395343548217559079049163840864,
    230674380395266176965103742781982645600,
    'Ambrose Hiday',
    'ambrose.hiday@aabt.com',
    25,
    sysdate - 48,
    'Marketing Associate'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395344757143378693678338547040,
    230674380395267385890923357411157351776,
    'Horacio Rainbolt',
    'horacio.rainbolt@aabu.com',
    24,
    sysdate - 74,
    'Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395345966069198308307513253216,
    230674380395268594816742972040332057952,
    'Taylor Cauchon',
    'taylor.cauchon@aabv.com',
    35,
    sysdate - 69,
    'Help Desk Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395347174995017922936687959392,
    230674380395273430520021430557030882656,
    'Marc Domanski',
    'marc.domanski@aabw.com',
    97,
    sysdate - 31,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395348383920837537565862665568,
    230674380395266176965103742781982645600,
    'Kaylene Lusco',
    'kaylene.lusco@aabx.com',
    91,
    sysdate - 15,
    'HR Representitive'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395349592846657152195037371744,
    230674380395269803742562586669506764128,
    'Norris Michener',
    'norris.michener@aaby.com',
    63,
    sysdate - 56,
    'Manufacturing and Distribution'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395350801772476766824212077920,
    230674380395267385890923357411157351776,
    'Rob Kempt',
    'rob.kempt@aabz.com',
    16,
    sysdate - 89,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395352010698296381453386784096,
    230674380395273430520021430557030882656,
    'Elaine Moncure',
    'elaine.moncure@aab0.com',
    98,
    sysdate - 16,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395353219624115996082561490272,
    230674380395275848371660659815380295008,
    'Joshua Disano',
    'joshua.disano@aab1.com',
    87,
    sysdate - 72,
    'Project Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395354428549935610711736196448,
    230674380395266176965103742781982645600,
    'Lai Kurtich',
    'lai.kurtich@aab2.com',
    70,
    sysdate - 24,
    'Security Specialist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395355637475755225340910902624,
    230674380395275848371660659815380295008,
    'Lucas Summerill',
    'lucas.summerill@aab3.com',
    60,
    sysdate - 99,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395356846401574839970085608800,
    230674380395268594816742972040332057952,
    'Vincent Hibberd',
    'vincent.hibberd@aab4.com',
    46,
    sysdate - 39,
    'Marketing Associate'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395358055327394454599260314976,
    230674380395272221594201815927856176480,
    'Sharla Topper',
    'sharla.topper@aab5.com',
    60,
    sysdate - 7,
    'Program Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395359264253214069228435021152,
    230674380395267385890923357411157351776,
    'Andrew Schieferstein',
    'andrew.schieferstein@aab6.com',
    16,
    sysdate - 30,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395360473179033683857609727328,
    230674380395272221594201815927856176480,
    'Rey Wada',
    'rey.wada@aab7.com',
    58,
    sysdate - 47,
    'Systems Administrator'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395361682104853298486784433504,
    230674380395266176965103742781982645600,
    'Jonell Pecatoste',
    'jonell.pecatoste@aab8.com',
    13,
    sysdate - 21,
    'Web Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395362891030672913115959139680,
    230674380395272221594201815927856176480,
    'Kurtis Parham',
    'kurtis.parham@aab9.com',
    100,
    sysdate - 86,
    'Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395364099956492527745133845856,
    230674380395267385890923357411157351776,
    'Quinn Yerdon',
    'quinn.yerdon@aaca.com',
    39,
    sysdate - 40,
    'Project Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395365308882312142374308552032,
    230674380395267385890923357411157351776,
    'Meg Vetterkind',
    'meg.vetterkind@aacb.com',
    53,
    sysdate - 50,
    'Webmaster'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395366517808131757003483258208,
    230674380395272221594201815927856176480,
    'Alex Binette',
    'alex.binette@aacc.com',
    18,
    sysdate - 37,
    'System Operations'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395367726733951371632657964384,
    230674380395272221594201815927856176480,
    'Ali Brengle',
    'ali.brengle@aacd.com',
    50,
    sysdate - 87,
    'Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395368935659770986261832670560,
    230674380395271012668382201298681470304,
    'Jaimee Gammons',
    'jaimee.gammons@aace.com',
    89,
    sysdate - 42,
    'Marketing Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395370144585590600891007376736,
    230674380395266176965103742781982645600,
    'Alva Halajian',
    'alva.halajian@aacf.com',
    86,
    sysdate - 49,
    'Customer Advocate'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395371353511410215520182082912,
    230674380395269803742562586669506764128,
    'Latoria Siprasoeuth',
    'latoria.siprasoeuth@aacg.com',
    31,
    sysdate - 55,
    'Software Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395372562437229830149356789088,
    230674380395277057297480274444555001184,
    'Merlyn Summerford',
    'merlyn.summerford@aach.com',
    100,
    sysdate - 84,
    'Sales Executive'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395373771363049444778531495264,
    230674380395269803742562586669506764128,
    'Nelson Koschnitzki',
    'nelson.koschnitzki@aaci.com',
    75,
    sysdate - 99,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395374980288869059407706201440,
    230674380395273430520021430557030882656,
    'Adeline Iannotti',
    'adeline.iannotti@aacj.com',
    72,
    sysdate - 93,
    'User Experience Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395376189214688674036880907616,
    230674380395269803742562586669506764128,
    'Saul Mokry',
    'saul.mokry@aack.com',
    85,
    sysdate - 80,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395377398140508288666055613792,
    230674380395271012668382201298681470304,
    'Laveta Wida',
    'laveta.wida@aacl.com',
    6,
    sysdate - 43,
    'Application Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395378607066327903295230319968,
    230674380395271012668382201298681470304,
    'Dexter Petiet',
    'dexter.petiet@aacm.com',
    36,
    sysdate - 64,
    'Web Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395379815992147517924405026144,
    230674380395275848371660659815380295008,
    'Chet Morano',
    'chet.morano@aacn.com',
    29,
    sysdate - 41,
    'Systems Administrator'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395381024917967132553579732320,
    230674380395273430520021430557030882656,
    'Jannie Thibideau',
    'jannie.thibideau@aaco.com',
    9,
    sysdate - 39,
    'Sales Consultant'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395382233843786747182754438496,
    230674380395274639445841045186205588832,
    'Janey Fornell',
    'janey.fornell@aacp.com',
    62,
    sysdate - 14,
    'Java Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395383442769606361811929144672,
    230674380395267385890923357411157351776,
    'Gerda Bartha',
    'gerda.bartha@aacq.com',
    13,
    sysdate - 4,
    'Application Developer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395384651695425976441103850848,
    230674380395271012668382201298681470304,
    'Kristina Livshits',
    'kristina.livshits@aacr.com',
    51,
    sysdate - 86,
    'Data Architect'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395385860621245591070278557024,
    230674380395269803742562586669506764128,
    'Matilda Toedebusch',
    'matilda.toedebusch@aacs.com',
    30,
    sysdate - 99,
    'Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395387069547065205699453263200,
    230674380395275848371660659815380295008,
    'Ami Dardar',
    'ami.dardar@aact.com',
    57,
    sysdate - 21,
    'Marketing Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395388278472884820328627969376,
    230674380395271012668382201298681470304,
    'Desmond Lifschitz',
    'desmond.lifschitz@aacu.com',
    19,
    sysdate - 87,
    'Receptionist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395389487398704434957802675552,
    230674380395268594816742972040332057952,
    'Marco Slivka',
    'marco.slivka@aacv.com',
    43,
    sysdate - 7,
    'Sales Consultant'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395390696324524049586977381728,
    230674380395269803742562586669506764128,
    'Danica Riogas',
    'danica.riogas@aacw.com',
    65,
    sysdate - 89,
    'Manufacturing and Distribution'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395391905250343664216152087904,
    230674380395273430520021430557030882656,
    'Cathey Salen',
    'cathey.salen@aacx.com',
    29,
    sysdate - 65,
    'Marketing Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395393114176163278845326794080,
    230674380395269803742562586669506764128,
    'Tabetha Florentino',
    'tabetha.florentino@aacy.com',
    55,
    sysdate - 99,
    'Evengilist'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395394323101982893474501500256,
    230674380395277057297480274444555001184,
    'Daisy Liddicoat',
    'daisy.liddicoat@aacz.com',
    56,
    sysdate - 95,
    'Usability Engineer'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395395532027802508103676206432,
    230674380395269803742562586669506764128,
    'Jacklyn Niskala',
    'jacklyn.niskala@aac0.com',
    48,
    sysdate - 94,
    'Programmer Analyst'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395396740953622122732850912608,
    230674380395269803742562586669506764128,
    'Herb Tammen',
    'herb.tammen@aac1.com',
    80,
    sysdate - 15,
    'Facilities Manager'
);

insert into employees (
    id,
    department_id,
    name,
    email,
    cost_center,
    date_hired,
    job
) values (
    230674380395397949879441737362025618784,
    230674380395272221594201815927856176480,
    'Verlie Ashland',
    'verlie.ashland@aac2.com',
    48,
    sysdate - 46,
    'Application Developer'
);

commit;

-- create tables
create table demo_files (
    id                             number not null constraint demo_files_id_pk primary key,
    file_name                      varchar2(255) not null,
    file_type                      varchar2(4000),
    file_content                   blob
)
;

-- triggers
create or replace trigger demo_files_biu
    before insert or update 
    on demo_files
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end demo_files_biu;
/

create or replace function handle_apex_error (
    p_error in apex_error.t_error )
    return apex_error.t_error_result
is
  l_constraint_name VARCHAR2(128);
  l_result apex_error.t_error_result;
begin
 -- this is not complete error handling function
 -- purpose of this function is limited to showcase APEX_ERROR.EXTRACT_CONSTRAINT_NAME name
 -- refer documentation for detailed example on error handling function
 -- https://docs.oracle.com/en/database/oracle/application-express/20.1/aeapi/Example-of-an-Error-Handling-Function.html#GUID-2CD75881-1A59-4787-B04B-9AAEC14E1A82
 l_result := apex_error.init_error_result (
                    p_error => p_error );
 l_constraint_name := APEX_ERROR.EXTRACT_CONSTRAINT_NAME(p_error);
 -- constraint name and message is hardcoded here. Ideally constraint name and corresponding error messages should be stored in DB table
 l_result.message := CASE WHEN l_constraint_name = 'DEPARTMENTS_UK' THEN 'Department Name already exists. Please use a differnet name.' ELSE p_error.message END;
end handle_apex_error;
/