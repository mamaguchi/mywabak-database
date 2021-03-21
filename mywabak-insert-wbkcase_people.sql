begin;  
          
          
insert into wbk.wbkcase_people(wbkcaseid, peopleident, contactto, lastcontact, symptoms,
 		onset, workloc, remarks, casetype, livedeadstat,
 		assignedtoik, hasbeenverified)
  values (1, '880601105149', '880601108888', '2021-01-15', '{"fever"}',
	'2021-01-30', 'hospital', 'remarks 1', 'Local', 'alive',
	'880601101111', false),
  
  
          (1, '880601105150', '880601108888', '2021-01-15', '{"cough"}',
	'2021-01-30', 'kedai', 'remarks 1', 'Import A', 'alive',
	'880601102222', false),
          
          
          (1, '880601105151', '880601108888',  '2021-01-15', '{"runny nose"}',
	'2021-01-30', 'sekolah', 'remarks 2', 'Import B', 'alive',
	'880601102222', false),
	
	  (1, '880601105152', '880601108888',  '2021-01-15', '{"anosmia"}',
	'2021-01-30', 'kolej', 'remarks 3', 'Import B', 'alive',
	'880601102222', false);   
	
insert into wbk.wbkcase_people(wbkcaseid, peopleident, lastcontact, symptoms,
 		onset, workloc, remarks, casetype, livedeadstat,
 		assignedtoik, hasbeenverified)
  values (1, '880601108888', '2021-01-15', '{"fever"}', '2021-01-30', 
  	'hospital', 'remarks 1', 'Local', 'alive',
  	'880601101111', false);		                
          
          
commit;






























