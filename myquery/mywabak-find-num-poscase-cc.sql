select wbkcase.name, wbkcase.begindt, s1.numposcase, s2.resultdt, s3.numcc, 
  coalesce(s4.clustername, 'non-cluster') as clustername
  from wbk.wbkcase wbkcase
    left join lateral
    (select count(p.ident) as numposcase
       from wbk.wbkcase c
         join wbk.wbkcase_people cp
           on c.id = cp.wbkcaseid
         join wbk.people p
           on cp.peopleident = p.ident
         join wbk.sampling s
           on p.ident = s.peopleident
       where c.name = wbkcase.name
         and s.wbkcaseid = c.id
         and s.samplingres::text = 'Positive'
         and s.samplingtype::text = 'RT-PCR') s1 on true
    left join lateral
    (select s.resultdt as resultdt
       from wbk.wbkcase c
         join wbk.wbkcase_people cp
           on c.id = cp.wbkcaseid
         join wbk.people p
           on cp.peopleident = p.ident
         join wbk.sampling s
           on p.ident = s.peopleident
       where c.name = wbkcase.name
         and s.wbkcaseid = c.id
         and s.samplingres::text = 'Positive'
         and s.samplingtype::text = 'RT-PCR'
       order by resultdt desc
         limit 1) s2 on true
    left join lateral
    (select count(p.ident) as numcc
       from wbk.wbkcase c
         join wbk.wbkcase_people cp
           on c.id = cp.wbkcaseid
         join wbk.people p
           on cp.peopleident = p.ident
         left join wbk.sampling s
           on p.ident = s.peopleident
       where c.name = wbkcase.name
         and s.wbkcaseid = c.id
         -- The line immediately below excludes close contact
         -- whose PCR is positive.
         -- Hence, I commented it out.
         /*and (s.samplingres::text != 'Positive'
             or 
             (s.samplingres::text = 'Positive'
               and 
             s.samplingtype::text != 'RT-PCR'))*/
         and (select samplingres 
                from wbk.sampling
                where sampling.peopleident = cp.contactto
                  and sampling.samplingres::text = 'Positive'
                  and sampling.samplingtype::text = 'RT-PCR') is not null) s3 on true
    left join lateral
    (select c.name as clustername
       from wbk.cluster c
       where c.id = wbkcase.clusterid) s4 on true
    where state='Pahang'
      and district='Maran';
