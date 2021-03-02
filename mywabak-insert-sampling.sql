begin;  
          
          
insert into wbk.sampling(wbkcaseid, peopleident, samplingdt, samplingtype, 
	labid, samplinglocid, issampletaken, samplingres, ctval)
  values (1, '880601105149', '2021-02-01', 'rtpcr', 1, 1, 'yes',
	'positive', '22'),    
          (2, '880601105150', '2021-02-02', 'rtkag', 2, 2, 'yes',
        'positive', '15'),                    
          (3, '880601105151', '2021-02-03', 'rtkab', 3, 3, 'yes', 
        'negative', '32');   	                
                    
commit;
