#!/bin/bash

psql -h localhost -d kkm -f mywabak-initdb.sql
psql -h localhost -d kkm -f mywabak-insert-people.sql
psql -h localhost -d kkm -f mywabak-insert-staff.sql
psql -h localhost -d kkm -f mywabak-insert-cluster.sql
psql -h localhost -d kkm -f mywabak-insert-wbkcase.sql
psql -h localhost -d kkm -f mywabak-insert-wbkcase_people.sql
psql -h localhost -d kkm -f mywabak-insert-hso.sql
psql -h localhost -d kkm -f mywabak-insert-samplingloc.sql
psql -h localhost -d kkm -f mywabak-insert-lab.sql
psql -h localhost -d kkm -f mywabak-insert-sampling.sql
psql -h localhost -d kkm -f mywabak-insert-admcenter.sql
psql -h localhost -d kkm -f mywabak-insert-admission.sql
