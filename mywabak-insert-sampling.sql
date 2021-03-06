begin;  
          
          
insert into wbk.sampling(wbkcaseid, peopleident, samplingdt, samplingtype, 
	labid, samplinglocid, issampletaken, samplingres, ctval)
  values (1, '880601108888', '2021-02-01', 'RT-PCR', 1, 1, 'yes',
	'Positive', '22'),
	  (1, '880601105149', '2021-02-02', 'RT-PCR', 1, 1, 'yes',
	'Negative', '25'),    
          (1, '880601105150', '2021-02-03', 'RTK-Ag', 2, 2, 'yes',
        'Pending', '15'),                    
          (1, '880601105151', '2021-02-04', 'RTK-Ab', 3, 3, 'yes', 
        'Positive', '32');   	                
                    
commit;
