use KungFuClub;
select * from student;

ALTER table student
add stu_address_province varchar(10);

ALTER table student
add stu_address_city varchar(20);

ALTER table student
add stu_address_postcode varchar(10);

ALTER table student
add stu_address_street varchar(40);

alter table student 
modify stu_address_street varchar(40) after stu_address;

alter table student 
modify stu_address_city varchar(20) after stu_address_street;

alter table student 
modify stu_address_province varchar(10) after stu_address_city;

alter table student 
modify stu_address_postcode varchar(10) after stu_address_province;



insert into student (`stu_address_province`, `stu_address_city`,
`stu_address_postcode`,`stu_address_street` )
select student where stu_num=1;

update student 
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 2T1',
stu_address_street='99 Rankin Ave.' where stu_num=1;
update student 
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 1T2',
stu_address_street='445 Randolph Ave.' where stu_num=2;
update student
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 1T3',
stu_address_street='446 Randolph Ave.' where stu_num=3;
 update student
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 1T4',
stu_address_street='447 Randolph Ave.' where stu_num=4;
 update student
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 1T5',
stu_address_street='448 Randolph Ave.' where stu_num=5;
update student
set stu_address_province = 'ON',stu_address_city='windsor',stu_address_postcode='N9B 1T6',
stu_address_street='460 Randolph Ave.' where stu_num=6;
update student
set stu_address_province = 'ON',stu_address_city='london',stu_address_postcode='L6T 1T6',
stu_address_street='461 Marvis Ave.' where stu_num=7;
update student
set stu_address_province = 'ON',stu_address_city='london',stu_address_postcode='L6T 1T8',
stu_address_street='463 Marvis Ave.' where stu_num=8;
update student
set stu_address_province = 'ON',stu_address_city='london',stu_address_postcode='L6T 1T5',
stu_address_street='465 Marvis Ave.' where stu_num=9;
update student
set stu_address_province = 'ON',stu_address_city='Toronto',stu_address_postcode='M6A 2T9',
stu_address_street='461 Dufferin Ave.' where stu_num=10;
update student
set stu_address_province = 'ON',stu_address_city='Toronto',stu_address_postcode='M6A 2T8',
stu_address_street='460 Dufferin Ave.' where stu_num=11;
update student
set stu_address_province = 'ON',stu_address_city='Toronto',stu_address_postcode='M6A 2T4',
stu_address_street='450 Dufferin Ave.' where stu_num=12;
update student
set stu_address_province = 'ON',stu_address_city='Toronto',stu_address_postcode='M6A 1T5',
stu_address_street='432 Dufferin Ave.' where stu_num=13;
update student
set stu_address_province = 'ON',stu_address_city='Toronto',stu_address_postcode='M6A 3T6',
stu_address_street='455 Dufferin Ave.' where stu_num=14;
update student
set stu_address_province = 'QC',stu_address_city='Montreal',stu_address_postcode='Q6A 1C2',
stu_address_street='350 Racette Ave.' where stu_num=15;
update student
set stu_address_province = 'QC',stu_address_city='Montreal',stu_address_postcode='Q6A 2C3',
stu_address_street='340 Racette Ave.' where stu_num=25;



