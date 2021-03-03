begin;  
          
          
insert into wbk.sampling(wbkcaseid, peopleident, samplingdt, samplingtype, 
	labid, samplinglocid, issampletaken, samplingres, ctval)
  values (1, '880601108888', '2021-02-01', 'rtpcr', 1, 1, 'yes',
	'positive', '22'),
	  (1, '880601105149', '2021-02-02', 'rtpcr', 1, 1, 'yes',
	'negative', '25'),    
          (1, '880601105150', '2021-02-03', 'rtkag', 2, 2, 'yes',
        'pending', '15'),                    
          (1, '880601105151', '2021-02-04', 'rtkab', 3, 3, 'yes', 
        'positive', '32');   	                
                    
commit;
