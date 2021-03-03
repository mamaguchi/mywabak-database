begin;  
          
          
insert into wbk.wbkcase_people(wbkcaseid, peopleident, contactto, lastcontact, symptoms,
 		onset, workloc, remarks, casetype, livedeadstat)
  values (1, '880601105149', '880601108888', '2021-01-15', '{"fever"}',
	'2021-01-30', 'hospital', 'remarks 1', 'local', 'alive'),
  
  
          (1, '880601105150', '880601108888', '2021-01-15', '{"cough"}',
	'2021-01-30', 'kedai', 'remarks 2', 'importa', 'alive'),
          
          
          (1, '880601105151', '880601108888',  '2021-01-15', '{"runny nose"}',
	'2021-01-30', 'sekolah', 'remarks 3', 'importb', 'alive');   
	
insert into wbk.wbkcase_people(wbkcaseid, peopleident, lastcontact, symptoms,
 		onset, workloc, remarks, casetype, livedeadstat)
  values (1, '880601108888', '2021-01-15', '{"fever"}',
	'2021-01-30', 'hospital', 'remarks 1','local','alive');		                
          
          
commit;






























