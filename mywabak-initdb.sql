begin;


create schema if not exists wbk;


drop type if exists gender_t cascade;
create type gender_t as enum('Male', 'Female');


drop type if exists race_t cascade;
create type race_t as enum('Malay', 'Chinese', 'Indian', 'Others');


drop type if exists nationality_t cascade;
create type nationality_t as enum('Warganegara', 'Bukan Warganegara');


drop type if exists edu_lvl_t cascade;
create type edu_lvl_t as enum('Primary', 'Secondary', 'Tertiary');


drop type if exists comorbid_t cascade;
create type comorbid_t as enum('dm', 'hpt', 'obesity', 'asthma');


drop type if exists symptom_t cascade;
create type symptom_t as enum('', 'fever', 'cough', 'sore throat', 'runny nose',
				'anosmia', 'aguesia');
				
drop type if exists livedeadstat_t cascade;
create type livedeadstat_t as enum('alive', 'dead');		


drop type if exists state_t cascade;
create type state_t as enum(
	'Perlis',
        'Kedah',
        'Pulau Pinang',
        'Perak',
        'Selangor',
        'Kuala Lumpur',
        'Negeri Sembilan',
        'Melaka',
        'Johor',
        'Kelantan',
        'Terengganu',
        'Pahang',
        'Sabah',
        'Sarawak',
        'Pulau Labuan');
        

drop type if exists district_t cascade;
create type district_t as enum(
	'Maran',	
	'Kuantan',
	'Lipis',
	'Bera',
	'Bentong',
	'Cameron',
	'Jerantut',
	'Pekan',
	'Raub', 
	'Rompin',
	'Temerloh');
	
	
drop type if exists casetype_t cascade;
create type casetype_t as enum('Local', 'Import A', 'Import B', 'Import C');


drop type if exists samplingtype_t cascade;
create type samplingtype_t as enum('RTK-Ag', 'RTK-Ab', 'RT-PCR');


drop type if exists samplingres_t cascade;
create type samplingres_t as enum('Pending', 'Positive', 'Negative');


drop type if exists occupation_t cascade;
create type occupation_t as enum('', 'Doctor', 'Nurse', 'Driver', 'Self-employed');	
	       
        
drop type if exists role_t cascade;
create type role_t as enum('mo-pkd', 'mo', 'ikk', 'ik', 'ma', 'sn', 'mlt');        


drop table if exists wbk.people cascade;
create table wbk.people
  (
    ident text not null,
    name text not null,
    gender gender_t,
    dob date,
    nationality nationality_t,
    race race_t,
    tel text,
    address text, 
    state state_t, 
    district district_t,
    locality text,
    occupation text,
    isgovemp boolean default false,

    unique(ident)
  );
  
  
drop table if exists wbk.peopletemp cascade;
create table wbk.peopletemp
  (
    wbkcaseid serial references wbk.wbkcase(id),
    ident text not null,
    name text not null,
    gender gender_t,
    dob date,
    nationality nationality_t,
    race race_t,
    tel text,
    address text, 
    state state_t, 
    district district_t,
    locality text,
    occupation text,
    isgovemp boolean default false,

    unique(wbkcaseid, ident)
  );
  
  
drop table if exists wbk.ik cascade;
create table wbk.ik
  (
    ident text not null,
    name text not null,
    gender gender_t,
    dob date,
    nationality nationality_t,
    race race_t,
    tel text,
    address text, 
    state state_t, 
    district district_t,
    locality text,
    position text,
    organization text,
    unit text,

    unique(ident)
  ); 
  
  
drop table if exists wbk.cluster cascade;
create table wbk.cluster
  (
    id serial primary key,    
    name text not null,
    begindt date,
    enddt date,  
                  
    unique(name)
  );


drop table if exists wbk.wbkcase cascade;
create table wbk.wbkcase
  (
    id serial primary key,
    name text not null,
    begindt date not null, 
    enddt date,
    states state_t[],
    district district_t[],
    locality text[],
    description text,
    poscases text[],
    clusterid serial references wbk.cluster(id)  
  );


drop table if exists wbk.wbkcase_people cascade;
create table wbk.wbkcase_people
  (
    wbkcaseid serial references wbk.wbkcase(id),
    peopleident text,
    contactto text references wbk.people(ident),
    lastcontact date,
    symptoms symptom_t[],
    onset date,
    workloc text,
    remarks text,
    casetype casetype_t,
    caseorigin text,
    livedeadstat livedeadstat_t default 'alive',
    causeofdeath text,  
    assignedtoik text references wbk.ik(ident),
    hasbeenverified boolean default false,
    verifiedby text references wbk.ik(ident),
        
    unique(wbkcaseid, peopleident)
  );   
  
  
drop table if exists wbk.hso cascade;
create table wbk.hso
  (
    id serial primary key,
    peopleident text references wbk.people(ident),
    begindt date,
    enddt date,
    extension integer check(extension >= 0) default 0,
    address text,
    state state_t,
    district district_t,
    locality text   
  );


drop table if exists wbk.samplingloc cascade;
create table wbk.samplingloc
  (
    id serial primary key,
    name text not null,
    state state_t,
    district district_t,
    locality text  
  );  
  
  
drop table if exists wbk.lab cascade;
create table wbk.lab
  (
    id serial primary key,
    name text not null,
    address text,
    state state_t,
    district district_t,
    locality text  
  );    
  
  
drop table if exists wbk.sampling cascade;
create table wbk.sampling
  (
    wbkcaseid serial references wbk.wbkcase(id),
    peopleident text references wbk.people(ident),
    samplingdt date not null,
    samplingtype samplingtype_t not null,
    labid serial references wbk.lab(id),
    samplinglocid serial references wbk.samplingloc(id),
    issampletaken boolean,
    samplingres samplingres_t,
    ctval text           
  );  
     

drop table if exists wbk.admcenter cascade;
create table wbk.admcenter
  (
    id serial primary key,
    name text not null,
    state state_t,
    district district_t        
  );
  
  
drop table if exists wbk.admission cascade;
create table wbk.admission
  (
    peopleident text references wbk.people(ident),
    admcenterid serial references wbk.admcenter(id),
    admdt date not null,
    dischgdt date not null           
  );   
          

commit;
