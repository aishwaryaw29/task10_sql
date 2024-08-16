create table employee(
	emp_id int primary key,
	name varchar,
	job_code varchar,
	job varchar,
	postal_code int,
	state varchar
)

copy employee from 'E:\ARC\SQL\day17\employee_dataset.csv' delimiter ',' csv header

select * from employee

--- 1NF
-- In this case, the original table seems to be in 1NF because all columns contain atomic values and has a primary key.


---2NF

create table job as (select distinct job_code , job from employee)  

select * from job

create table state as (select distinct postal_code, state from employee)

select * from state

create table emp_nf2 as (select distinct emp_id,name, job_code, postal_code from employee)

select * from emp_nf2

select distinct *  from emp_nf2 as emp
inner join job as j
on emp.job_code = j.job_code
inner join state as s
on emp.postal_code = s.postal_code



---3NF

--In this case, the job and address tables are already normalized and there are no transitive dependencies in the emp_nf2 table


