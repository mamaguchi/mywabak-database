begin;  
          
          
insert into wbk.wbkcase(name, begindt, enddt, state, district, localities,
			description, poscases, clusterid, assignedStaffs)
  values ('bandarjengka-2021-02-01-hospjengka', '2021-02-01', '2021-02-11', 
	'Pahang', 'Maran', '{"Bandar Jengka"}', 'description 1',
	 '{"880601105149"}', 1, '{"880601101111", "880601102222", "880601103333", "880601104444", "880601105555", "880601106666"}'),
  
  
          ('rantauperintis-2021-02-02-birthdayparty', '2021-02-02', '2021-02-12', 
	'Pahang', 'Maran', '{"Rantau Perintis"}', 'description 2',
	'{"880601105150"}', 2, null),
          
          
          ('jengka20-2021-02-03-tadikacaliph', '2021-02-03', '2021-02-13',  
	'Pahang', 'Maran', '{"Jengka 20"}', 'description 3', '{"880601105151"}',
	3, null),
	
	  ('Not a cluster case', '2021-02-03', '2021-02-13',  
	'Pahang', 'Maran', '{"Jengka 2"}', 'description 4', '{"880601105151"}',
	null, null);   	                
          
          
commit;






























