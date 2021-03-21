begin;  
          
          
insert into wbk.sampling(wbkcaseid, peopleident, samplingdt, 
        resultdt, samplingtype, labid, samplinglocid, 
        issampletaken, samplingres, ctval)
  values (1, '880601108888', '2021-02-01', '2021-02-03', 'RT-PCR', 1, 1, 'yes',
	'Positive', '22'),
	  (1, '880601105149', '2021-02-02', '2021-02-04', 'RT-PCR', 1, 1, 'yes',
	'Negative', '25'),    
          (1, '880601105150', '2021-02-03', '2021-02-05', 'RTK-Ag', 2, 2, 'yes',
        'Pending', '15'),                    
          (1, '880601105151', '2021-02-04', '2021-02-06', 'RTK-Ab', 3, 3, 'yes', 
        'Positive', '32'),
          (1, '880601105152', '2021-02-05', '2021-02-07', 'RT-PCR', 3, 3, 'yes', 
        'Positive', '32');   	                
                    
commit;
