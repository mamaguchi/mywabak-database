begin;  
          
          
insert into wbk.people(ident, name, gender, dob, nationality, race,
          tel, address, state, district, locality, occupation, isgovemp)
  values ('880601108888', 'Luffy', 'Male', date '1988-06-01', 'Warganegara', 
          'Chinese', '0163184120', 'Maran, Pahang', 
          'Pahang', 'Maran', 'Jengka 2', 'Doctor', 'yes'),
          ('880601109999', 'Zoro', 'Male', date '1988-06-01', 'Warganegara', 
          'Chinese', '0163184120', 'Maran, Pahang', 
          'Pahang', 'Maran', 'Jengka 2', 'Doctor', 'yes'),
  	  ('880601105149', 'Chow Hsien Lung', 'Male', date '1988-06-01', 'Warganegara', 
          'Chinese', '0163184120', 'Maran, Pahang', 
          'Pahang', 'Maran', 'Jengka 2', 'Doctor', 'yes'),
          ('880601105150', 'person two', 'Male', date '1988-06-02', 'Warganegara', 
          'Malay', '0163184120', 'Maran, Pahang', 
          'Pahang', 'Maran', 'Jengka 3', 'Driver', 'no'),
          ('880601105151', 'person three', 'Female', date '1988-06-03', 'Warganegara', 
          'Indian', '0163184120', 'Maran, Pahang', 
          'Pahang', 'Maran', 'Jengka 4', 'Nurse', 'yes');   	                
          
          
commit;






























