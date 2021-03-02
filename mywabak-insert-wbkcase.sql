begin;  
          
          
insert into wbk.wbkcase(name, begindt, enddt, states, district, locality,
			description, poscases, clusterid)
  values ('bandarjengka-2021-02-01-hospjengka', '2021-02-01', '2021-02-11', 
	'{"Pahang"}', '{"maran"}', '{"bandar jengka"}', 'description 1',
	 '{"880601105149"}',
	1),
  
  
          ('rantauperintis-2021-02-02-birthdayparty', '2021-02-02', '2021-02-12', 
	'{"Pahang"}', '{"maran"}', '{"rantau perintis"}', 'description 2',
	'{"880601105150"}',
	2),
          
          
          ('jengka20-2021-02-03-tadikacaliph', '2021-02-03', '2021-02-13',  
	'{"Pahang"}', '{"maran"}', '{"jengka 20"}', 'description 3', '{"880601105151"}',
	3);   	                
          
          
commit;






























