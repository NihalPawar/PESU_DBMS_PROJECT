DROP DATABASE person_identification;

CREATE DATABASE person_identification;

\c person_identification

create table person
(
aadhar_no NUMERIC(12,0),
name  varchar(30)  NOT NULL,
age  INT  NOT NULL,
PRIMARY KEY (aadhar_no)
);

create table Aadhar_card
(
Person_name varchar(30) NOT NULL,
aadhar_no NUMERIC(12,0),
Fathers_name varchar(30),
dob  DATE ,
PRIMARY KEY(aadhar_no),
Foreign key(aadhar_no)references person(aadhar_no) On DELETE cascade
);

create table insurance
(
aadhar_no NUMERIC(12,0) PRIMARY KEY,
person_name varchar(30),
insurance_type varchar(20)  NOT NULL,
policy_no NUMERIC(10,0) NOT NULL,
amt_insured  NUMERIC(10,0) NOT NULL,
maturity_date DATE,

foreign key(aadhar_no) references person(aadhar_no) on UPDATE cascade,
UNIQUE(policy_no)
);
create table property
(
aadhar_no NUMERIC(12,0),
person_name varchar(30),
reg_no varchar(12),
Area varchar(30),
property_cardno NUMERIC(7,0),
Nominees varchar(30),
House_tax_rs  NUMERIC(10,3),
due_date DATE,
foreign key (aadhar_no) references person(aadhar_no) on UPDATE cascade,
UNIQUE(reg_no,property_cardno,aadhar_no)
);

create table Bank_account 
(
	aadhar_no NUMERIC(12,0) PRIMARY KEY,
person_name varchar(30) NOT NULL,
Bank_Name varchar(30),
Branch varchar(20),
acc_type varchar(10),
acc_no NUMERIC(10,0),
specimen_sign varchar(10),
foreign key(aadhar_no) references person(aadhar_no) on UPDATE cascade,
UNIQUE(acc_no,specimen_sign)
);


create table master_details
(
aadhar_no NUMERIC (12,0),
name varchar (30) NOT NULL,
passport_no NUMERIC (6,0),
Dl_no NUMERIC (10,0),
ration_cardno varchar(12),
voter_idno NUMERIC(12,0),
PRIMARY KEY(aadhar_no),
FOREIGN KEY (aadhar_no) references person(aadhar_no) On DELETE cascade,
UNIQUE(passport_no,Dl_no,voter_idno,ration_cardno)
);


create table Passport
(
aadhar_no NUMERIC(12,0) PRIMARY KEY,
Person_name varchar (30) NOT NULL,
age INT NOT NULL,
Birth_place varchar(15),
pass_no NUMERIC(6,0), 
specimen_sign varchar(10),
issuing_authourity VARCHAR (30),
FOREIGN KEY (aadhar_no) references master_details(aadhar_no) On DELETE cascade,
UNIQUE(pass_no)
);




create table Driving_License
(
aadhar_no NUMERIC(12,0) PRIMARY KEY,
Person_name varchar (30) NOT NULL,
Dl_no NUMERIC(10,0),
valid_from DATE,
valid_till DATE,
Foreign key(aadhar_no) references master_details(aadhar_no) On DELETE cascade,
UNIQUE(Dl_no)
);


create table Ration_card
(
aadhar_no NUMERIC(12,0) PRIMARY KEY,
Person_name varchar (30) NOT NULL,
card_no varchar(12),
Fathers_name varchar(30),
age INT NOT NULL,
FOREIGN KEY(aadhar_no)references master_details(aadhar_no) On DELETE cascade,
UNIQUE(card_no)
);

create table Voter_ID
(

Person_name varchar (30) NOT NULL,
aadhar_no NUMERIC(12,0) PRIMARY KEY,
Father_or_Husband_name varchar (30),
idcard_no NUMERIC(12,0),
age INT NOT NULL,
FOREIGN KEY(aadhar_no)references master_details(aadhar_no) On DELETE cascade,
UNIQUE(idcard_no)
);




/*person*/

insert into person values(548550008125,'Naman Mishra',21);
insert into person values(396244635778,'Ramesh',40);
insert into person values(852956248268,'Nihal Shetty',25);
insert into person values(123456789876,'Nikhil M',18);
insert into person values(758946213654,'Neha Garg',15);
insert into person values(489657894561,'Nihali Ramesh',25);
insert into person values(894561237854,'Thakur Parmesh',26);
insert into person values(145654231234,'Manjunath Lokur',27);
insert into person values(852924248268,'Basavaraj Badranavvar',36);
insert into person values(345231456234,'B.S Chanbasappa',57);
insert into person values(867546354311,'B.R ambedkar',75);
insert into person values(987564534243,'Subhash Chandra',34);
insert into person values(498498454564,'Neha B',12);
insert into person values(264478979794,'Vivek yaligar',23);
insert into person values(887874446451,'Sham kumar',28);
insert into person values(854857045840,'Kamlesh Yadav',29);
insert into person values(523253625362,'Manoj KA',26);
insert into person values(450439850301,'Sharad kumar',22);
insert into person values(283782738228,'Mutturaj',78);
insert into person values(984189489498,'Channa Bankapur',43);
insert into person values(565648303979,'Kaipa Sandhya',65);
insert into person values(748734085095,'Preet kanwal',55);
insert into person values(654657657564,'Lavanya ramkumar',18);
insert into person values(347309570957,'Shashank bongale',33);
insert into person values(487456754836,'Kiran hombal',21);
insert into person values(607960978609,'Suresh Komal',26);
insert into person values(485798750500,'Umesh SM',42);
insert into person values(586005705676,'Usha KL',53);
insert into person values(476547865768,'Chinnari Mutta',59);
insert into person values(286060946059,'Vinay Kumar',87);

/*Aadhar*/
insert into Aadhar_card values('Naman Mishra',548550008125,'Ramdas Mishra','1997-06-03');
insert into Aadhar_card values('Ramesh',396244635778,'Manjunath','1978-06-20');
insert into Aadhar_card values('Nihal Shetty',852956248268,'Chandradara Shetty','1993-10-04');
insert into Aadhar_card values('Nikhil M',123456789876,'Anirudh','2000-10-12');
insert into Aadhar_card values('Neha Garg',758946213654,'Bharath Kumar','2003-05-19');
insert into Aadhar_card values('Nihali Ramesh',489657894561,'Nanjappa Ramesh','1993-04-29');
insert into Aadhar_card values('Thakur Parmesh',894561237854,'Mayank Thakur','1992-02-27');
insert into Aadhar_card values('Manjunath Lokur',145654231234,'Naveen Lokur','1991-01-15');
insert into Aadhar_card values('Basavaraj Badranavvar',852924248268,'Chinnappa','1982-10-25');
insert into Aadhar_card values('B.S Chanbasappa',345231456234,'Basapparaj','1961-12-21');
insert into Aadhar_card values('B.R ambedkar',867546354311,'Jamshedji Tata','1943-03-02');
insert into Aadhar_card values('Subhash Chandra',987564534243,'Chandra Kumar','1984-01-10');
insert into Aadhar_card values('Neha B',498498454564,'Varun M','2006-09-16');
insert into Aadhar_card values('Vivek yaligar',264478979794,'Mithun yaligar','1995-02-19');
insert into Aadhar_card values('Sham kumar',887874446451,'Ramkumar','1990-04-20');
insert into Aadhar_card values('Kamlesh Yadav',854857045840,'Parmesh Yadav','1989-06-10');
insert into Aadhar_card values('Manoj KA',523253625362,'Omkar KB','1992-03-04');
insert into Aadhar_card values('Sharad kumar',450439850301,'Indra Kumar','1996-07-17');
insert into Aadhar_card values('Mutturaj',283782738228,'Ramesh Arvind','1940-11-01');
insert into Aadhar_card values('Channa Bankapur',984189489498,'Vadiraj Bankapur','1975-09-22');
insert into Aadhar_card values('Kaipa Sandhya',565648303979,'Sundar Pichai','1953-06-15');
insert into Aadhar_card values('Preet kanwal',748734085095,'Eeshwar kanwal','1963-05-01');
insert into Aadhar_card values('Lavanya ramkumar',654657657564,'Shashank ramkumar','2000-01-26');
insert into Aadhar_card values('Shashank bongale',347309570957,'Yash bongale','1985-05-07');
insert into Aadhar_card values('Kiran hombal',487456754836,'Yadurappa','1997-03-14');
insert into Aadhar_card values('Suresh Komal',607960978609,'Ashok komal','1992-10-03');
insert into Aadhar_card values('Umesh SM',485798750500,'Robin Uttappa','1976-06-25');
insert into Aadhar_card values('Usha KL',586005705676,'Mahadevappa','1965-04-13');
insert into Aadhar_card values('Chinnari Mutta',476547865768,'Vijay Ragvendra','1959-02-02');
insert into Aadhar_card values('Vinay Kumar',286060946059,'Suresh kumar','1931-04-05');

/*insurance*/
insert into insurance values(548550008125,'Naman Mishra','Life insurance',1243789201,130000,'2019-03-15');
insert into insurance values(396244635778,'Ramesh','Vehicle insurance',1265894221,354320,'2020-05-29');
insert into insurance values(852956248268,'Nihal Shetty','Health insurance',1759854521,50000,'2018-04-06');
insert into insurance values(489657894561,'Nihali Ramesh','Home insurance',5632146256,55420,'2025-05-01');
insert into insurance values(894561237854,'Thakur Parmesh','Life insurance',9865432564,879566,'2018-10-25');
insert into insurance values(852924248268,'Basavaraj Badranavvar','Health insurance',1254698763,30565,'2028-11-12');
insert into insurance values(345231456234,'B.S Chanbasappa','Home insurance',7856985624,78964,'2022-12-12');
insert into insurance values(867546354311,'B.R ambedkar','Health insurance',8654826525,1025648,'2025-03-07');
insert into insurance values(498498454564,'Neha B','Travel insurance',1265489469,79256,'2018-01-26');
insert into insurance values(264478979794,'Vivek yaligar','Health insurance',4365925463,68966,'2019-01-01');
insert into insurance values(523253625362,'Manoj KA','Life insurance',3692262958,78800,'2027-10-06');
insert into insurance values(450439850301,'Sharad kumar','Health insurance',5843352559,462315,'2020-11-09');
insert into insurance values(283782738228,'Mutturaj','Travel insurance',8498536651,56480,'2018-06-03');
insert into insurance values(984189489498,'Channa Bankapur','Home insurance',8932656365,102350,'2021-09-17');
insert into insurance values(565648303979,'Kaipa Sandhya','Health insurance',7986556326,462824,'2019-10-10');
insert into insurance values(347309570957,'Shashank bongale','Health insurance',4213659756,58625,'2023-06-19');
insert into insurance values(487456754836,'Kiran hombal','Vehicle insurance',7954689542,85185,'2018-07-20');
insert into insurance values(607960978609,'Suresh Komal','Home insurance',8953481005,104568,'2019-09-23');
insert into insurance values(586005705676,'Usha KL','Home insurance',7901469552,57586,'2028-12-25');
insert into insurance values(286060946059,'Vinay Kumar','Health insurance',7954362565,575110,'2018-04-19');


/*Bank_account*/
insert into Bank_account values(396244635778,'Ramesh','Karnataka Bank','Hebbal','Savings',1210425268,'Ramesh');
insert into Bank_account values(347309570957,'Shashank bongale','SBI Bank','MG Road','Current',1240685978,'Bongale');
insert into Bank_account values(283782738228,'Mutturaj','Vijaya Bank','Bringham Road','Current',1256786265,'Raj');
insert into Bank_account values(476547865768,'Chinnari Mutta','Indian Bank','Bannergatta Road','Savings',1423556256,'Chinna');
insert into Bank_account values(286060946059,'Vinay Kumar','HDFC Bank','MG Road','Current',1214636569,'Vinay');
insert into Bank_account values(523253625362,'Manoj KA','SBI Bank','Sanjay nagar','Savings',1246796566,'Manoj');
insert into Bank_account values(852924248268,'Basavaraj Badranavvar','Axis Bank','Nelmangala','Savings',1234825166,'Basavaraj');
insert into Bank_account values(748734085095,'Preet kanwal','Karnataka Bank','Sahakarnagar','Savings',1265863135,'Preet');
insert into Bank_account values(548550008125,'Naman Mishra','HDFC Bank','Yelankha','Savings',1246275266,'Mishra');
insert into Bank_account values(854857045840,'Kamlesh Yadav','Punjab National Bank','Anandnagar','Current',1240462656,'Kamlesh');
insert into Bank_account values(607960978609,'Suresh Komal','SBI Bank','Vijaynagar','Savings',1240735678,'Suresh');
insert into Bank_account values(487456754836,'Kiran hombal','Indian Bank','Brigade Road','Savings',1224863216,'Kiran');
insert into Bank_account values(984189489498,'Channa Bankapur','Vijaya Bank','Bringham Road','Current',1240892353,'Channa');
insert into Bank_account values(345231456234,'B.S Chanbasappa','Union Bank','Banashankari','Savings',1246397256,'BSC');
insert into Bank_account values(894561237854,'Thakur Parmesh','Canara Bank','Sahakarnagar','Current',1279546236,'Parmesh');
insert into Bank_account values(123456789876,'Nikhil M','Union Bank','Rajajinagar','Current',1279563646,'Nikhil');
insert into Bank_account values(586005705676,'Usha KL','Punjab National Bank','Hebbal','Savings',1236457525,'Usha');
insert into Bank_account values(852956248268,'Nihal Shetty','SBI Bank','Sanjaynagar','Current',1271225354,'Nihal');
insert into Bank_account values(867546354311,'B.R ambedkar','HDFC Bank','Dasarahalli','Savings',1240212008,'ambedkar');
insert into Bank_account values(565648303979,'Kaipa Sandhya','Indian Bank','Yelankha','Current',1240043058,'Sandhya');

/*property*/
insert into Property values(548550008125,'Naman Mishra','KAR101PLOT01','Jaynagar',4589283,NULL,522485.2,'2020-02-12');
insert into Property values(396244635778,'Ramesh','KAR101PLOT22','Kalasipalya',1287564,'Gundappa Rao',125847.2,'2020-05-04');
insert into Property values(894561237854,'Thakur Parmesh','KAR101PLOT15','Vidyaranyapura',4539861,'Thakur Sarvalesh',254002.34,'2022-04-21');
insert into Property values(487456754836,'Kiran hombal','KAR101PLOT45','Sahakarnagar',9864533,NULL,325782.24,'2023-05-04');
insert into Property values(987564534243,'Subhash Chandra','KAR101PLOT28','Chamarajpet',7960665,'Vikram Chandra',967515.00,'2021-08-10');
insert into Property values(887874446451,'Sham kumar','KAR101PLOT36','Hebbal',9879685,NULL,235783.2,'2018-05-12');
insert into Property values(887874446451,'Sham kumar','KAR101PLOT22','Yelankha',5630415,NULL,52792.35,'2025-07-10');
insert into Property values(476547865768,'Chinnari Mutta','KAR101PLOT56','Rajajinagar',1200673,'Vijay Hunsur',469251.35,'2030-02-27');
insert into Property values(852924248268,'Basavaraj Badranavvar','KAR101PLOT12','Amruta layout',4653206,'Channakeshwar',632150.47,'2023-10-08');
insert into Property values(286060946059,'Vinay Kumar','KAR101PLOT69','Yelankha',9638705,'Ramesh Kumar',105620.1,'2019-09-14');
insert into Property values(854857045840,'Kamlesh Yadav','KAR101PLOT24','Mahadevpura',8315350,NULL,54985.21,'2025-12-17');
insert into Property values(748734085095,'Preet kanwal','KAR101PLOT53','Rajajinagar',1507643,'Arjun kanwal',89753.69,'2023-11-03');
insert into Property values(748734085095,'Preet kanwal','KAR101PLOT99','Jaynagar',1634205,'Ramesh kanwal',225439.69,'2030-10-23');
insert into Property values(748734085095,'Preet kanwal','KAR101PLOT85','Sahakarnagar',7622462,'Ramesh kanwal',225752.69,'2030-12-14');
insert into Property values(485798750500,'Umesh SM','KAR101PLOT78','Yelankha',4268954,'Ramdev SM',245896.00,'2035-12-04');
insert into Property values(450439850301,'Sharad kumar','KAR101PLOT13','Chandra layout',9431020,NULL,125684.2,'2046-10-03');
insert into Property values(852956248268,'Nihal Shetty','KAR101PLOT09','Jaynagar',7638421,NULL,348659.65,'2025-03-24');
insert into Property values(283782738228,'Mutturaj','KAR101PLOT63','Ramnagar',9843560,'Harshit',782556.2,'2039-02-09');
insert into Property values(283782738228,'Mutturaj','KAR101PLOT42','Dwarkanagara',4538623,'Ram',42569.2,'2024-10-09');
insert into Property values(586005705676,'Usha KL','KAR101PLOT02','Bidadi',7626046,'Ramya krishna',145368.2,'2021-03-10');






/*other_details*/
insert into master_details values(548550008125,'Naman Mishra',124659,8965758454,'PRATC1245',425678429856);
insert into master_details values(396244635778,'Ramesh',457824,NULL,'PRACT4659',999653168496);
insert into master_details values(852956248268,'Nihal Shetty',NULL,1256895476,'PRACT7956',659816565196);
insert into master_details values(123456789876,'Nikhil M',100268,5321904560,'PRACT3561',NULL);
insert into master_details values(758946213654,'Neha Garg',654635,NULL,'PRACT1056',NULL);
insert into master_details values(489657894561,'Nihali Ramesh',NULL,NULL,'PRACT4506',386138516518);
insert into master_details values(894561237854,'Thakur Parmesh',795569,NULL,'PRACT7804',356789223569);
insert into master_details values(145654231234,'Manjunath Lokur',NULL,NULL,'PRACT6502',965163198661);
insert into master_details values(852924248268,'Basavaraj Badranavvar',NULL,3698365056,'PRACT7845',213202160565);
insert into master_details values(345231456234,'B.S Chanbasappa',NULL,NULL,'PRACT4136',874665196633);
insert into master_details values(867546354311,'B.R ambedkar',354966,NULL,'PRACT6890',646321638890);
insert into master_details values(987564534243,'Subhash Chandra',186323,NULL,'PRACT9604',466305610616);
insert into master_details values(498498454564,'Neha B',NULL,NULL,'PRACT7825',NULL);
insert into master_details values(264478979794,'Vivek yaligar',NULL,9788465006,'PRACT6543',163030351602);
insert into master_details values(887874446451,'Sham kumar',NULL,NULL,'PRACT9860',798653100636);
insert into master_details values(854857045840,'Kamlesh Yadav',562657,3213616533,'PRACT4038',206059855690);
insert into master_details values(523253625362,'Manoj KA',NULL,9866516566,'PRACT7805',259896320659);
insert into master_details values(450439850301,'Sharad kumar',NULL,NULL,'PRACT6304',989976546164);
insert into master_details values(283782738228,'Mutturaj',236548,NULL,'PRACT6490',123654960606);
insert into master_details values(984189489498,'Channa Bankapur',678625,1230653650,'PRACT7809',986563219498);
insert into master_details values(565648303979,'Kaipa Sandhya',NULL,6498652322,'PRACT1210',456065302899);
insert into master_details values(748734085095,'Preet kanwal',636879,NULL,'PRACT7862',560795262022);
insert into master_details values(654657657564,'Lavanya ramkumar',NULL,NULL,'PRACT7802',NULL);
insert into master_details values(347309570957,'Shashank bongale',324896,3100369682,'PRACT4512',216500668466);
insert into master_details values(487456754836,'Kiran hombal',658432,4896526533,'PRACT3806',215845218655);
insert into master_details values(607960978609,'Suresh Komal',NULL,NULL,'PRACT1276',549638965896);
insert into master_details values(485798750500,'Umesh SM',NULL,NULL,'PRACT4586',984632036065);
insert into master_details values(586005705676,'Usha KL',789865,NULL,'PRACT7810',968431804150);
insert into master_details values(476547865768,'Chinnari Mutta',NULL,9856406206,'PRACT7930',815440035439);
insert into master_details values(286060946059,'Vinay Kumar',124693,NULL,'PRACT1260',210792069653);


/*passport*/
insert into Passport values(548550008125,'Naman Mishra',21,'Jaipur',124659,'naman','Ramegowda');
insert into Passport values(396244635778,'Ramesh',40,'Davangere',457824,'ramesh','Kalyan');
insert into Passport values(984189489498,'Channa Bankapur',43,'Davangere',678625,'channa','Krishnamurthy');
insert into Passport values(894561237854,'Thakur Parmesh',26,'Bihar',795569,'Parmesh','Nanjegowda');
insert into Passport values(565648303979,'Kaipa Sandhya',65,'Hassan',356985,'Sandhya','Kalyan');
insert into Passport values(283782738228,'Mutturaj',78,'Mangaluru',236548,'raj','Gurumurthy');
insert into Passport values(854857045840,'Kamlesh Yadav',29,'Nagpur',562657,'kamlesh','Nanjegowda');
insert into Passport values(347309570957,'Shashank bongale',33,'Davangere',324896,'bongale','Ramesh');
insert into Passport values(487456754836,'Kiran hombal',21,'Darwad',658432,'kiran','Punithkumar');
insert into Passport values(286060946059,'Vinay Kumar',87,'Shivmoga',124693,'vinay','kalyangowda');
insert into Passport values(867546354311,'B.R ambedkar',75,'Indore',354966,'ambedkar','Indrajit');
insert into Passport values(586005705676,'Usha KL',53,'Kolar',789865,'usha','Nandagopal');
insert into Passport values(758946213654,'Neha Garg',15,'Nagpur',654635,'neha','Kamal');
insert into Passport values(987564534243,'Subhash Chandra',34,'Hassan',186323,'Subhash','Hallappa');
insert into Passport values(748734085095,'Preet kanwal',55,'Mysore',636879,'preet','Manoj');
insert into Passport values(450439850301,'Sharad kumar',22,'Calicut',963555,'neha','Ramegowda');
insert into Passport values(123456789876,'Nikhil M',18,'Shivmoga',100268,'nikhil','Hallappa');


/*Driving license*/
insert into Driving_License values(548550008125,'Naman Mishra',8965758454,'2018-06-05','2030-05-29');
insert into Driving_License values(852956248268,'Nihal Shetty',1256895476,'2015-07-02','2030-07-24');	
insert into Driving_License values(523253625362,'Manoj KA',9866516566,'2017-10-11','2032-11-12');	
insert into Driving_License values(887874446451,'Sham kumar',6596989478,'2010-02-25','2028-06-13');	
insert into Driving_License values(854857045840,'Kamlesh Yadav',3213616533,'2008-01-09','2030-05-21');	
insert into Driving_License values(984189489498,'Channa Bankapur',1230653650,'2005-03-17','2025-11-15');	
insert into Driving_License values(487456754836,'Kiran hombal',4896526533,'2016-12-05','2035-04-14');	
insert into Driving_License values(476547865768,'Chinnari Mutta',9856406206,'2000-07-28','2022-12-18');	
insert into Driving_License values(264478979794,'Vivek yaligar',9788465006,'2013-04-19','2028-09-16');	
insert into Driving_License values(852924248268,'Basavaraj Badranavvar',3698365056,'2009-05-21','2035-10-14');	
insert into Driving_License values(123456789876,'Nikhil M',5321904560,'2018-07-05','2042-10-20');	
insert into Driving_License values(565648303979,'Kaipa Sandhya',6498652322,'2004-10-03','2019-04-24');	
insert into Driving_License values(347309570957,'Shashank bongale',3100369682,'2012-07-01','2025-09-17');	


/*Ration card*/
insert into Ration_card values(548550008125,'Naman Mishra','PRATC1245','Ramdas Mishra',25);
insert into Ration_card values(396244635778,'Ramesh','PRACT4659','Manjunath',40);
insert into Ration_card values(852956248268,'Nihal Shetty','PRACT7956','Chandradara Shetty',25);
insert into Ration_card values(123456789876,'Nikhil M','PRACT3561','Anirudh',18);
insert into Ration_card values(758946213654,'Neha Garg','PRACT1056','Bharath Kumar',15);
insert into Ration_card values(489657894561,'Nihali Ramesh','PRACT4506','Nanjappa Ramesh',25);
insert into Ration_card values(894561237854,'Thakur Parmesh','PRACT7804','Mayank Thakur',26);
insert into Ration_card values(145654231234,'Manjunath Lokur','PRACT6502','Naveen Lokur',27);
insert into Ration_card values(852924248268,'Basavaraj Badranavvar','PRACT7845','Chinnappa',36);
insert into Ration_card values(345231456234,'B.S Chanbasappa','PRACT4136','Basapparaj',57);
insert into Ration_card values(867546354311,'B.R ambedkar','PRACT6890','Jamshedji Tata',75);
insert into Ration_card values(987564534243,'Subhash Chandra','PRACT9604','Chandra Kumar',34);
insert into Ration_card values(498498454564,'Neha B','PRACT7825','Varun M',12);
insert into Ration_card values(264478979794,'Vivek yaligar','PRACT6543','Mithun yaligar',23);
insert into Ration_card values(887874446451,'Sham kumar','PRACT9860','Ramkumar',28);
insert into Ration_card values(854857045840,'Kamlesh Yadav','PRACT4038','Parmesh Yadav',29);
insert into Ration_card values(523253625362,'Manoj KA','PRACT7805','Omkar KB',26);
insert into Ration_card values(450439850301,'Sharad kumar','PRACT6304','Indra Kumar',22);
insert into Ration_card values(283782738228,'Mutturaj','PRACT6490','Ramesh Arvind',78);
insert into Ration_card values(984189489498,'Channa Bankapur','PRACT7809','Vadiraj Bankapur',43);
insert into Ration_card values(565648303979,'Kaipa Sandhya','PRACT1210','Sundar Pichai',65);
insert into Ration_card values(748734085095,'Preet kanwal','PRACT7862','Eeshwar kanwal',55);
insert into Ration_card values(654657657564,'Lavanya ramkumar','PRACT7802','Shashank ramkumar',18);
insert into Ration_card values(347309570957,'Shashank bongale','PRACT4512','Yash bongale',33);
insert into Ration_card values(487456754836,'Kiran hombal','PRACT3806','Yadurappa',21);
insert into Ration_card values(607960978609,'Suresh Komal','PRACT1276','Ashok komal',26);
insert into Ration_card values(485798750500,'Umesh SM','PRACT4586','Robin Uttappa',42);
insert into Ration_card values(586005705676,'Usha KL','PRACT7810','Mahadevappa',53);
insert into Ration_card values(476547865768,'Chinnari Mutta','PRACT7930','Vijay Ragvendra',59);
insert into Ration_card values(286060946059,'Vinay Kumar','PRACT1260','Suresh kumar',87);


/*Voter id*/
insert into Voter_ID values('Naman Mishra',548550008125,'Ramdas Mishra',425678429856,21);
insert into Voter_ID values('Ramesh',396244635778,'Manjunath',999653168496,40);
insert into Voter_ID values('Nihal Shetty',852956248268,'Chandradara Shetty',659816565196,25);
insert into Voter_ID values('Nihali Ramesh',489657894561,'Nanjappa Ramesh',386138516518,25);
insert into Voter_ID values('Thakur Parmesh',894561237854,'Mayank Thakur',356789223569,26);
insert into Voter_ID values('Manjunath Lokur',145654231234,'Naveen Lokur',965163198661,27);
insert into Voter_ID values('Basavaraj Badranavvar',852924248268,'Chinnappa',213202160565,36);
insert into Voter_ID values('B.S Chanbasappa',345231456234,'Basapparaj',874665196633,57);
insert into Voter_ID values('B.R ambedkar',867546354311,'Jamshedji Tata',646321638890,75);
insert into Voter_ID values('Subhash Chandra',987564534243,'Chandra Kumar',466305610616,34);
insert into Voter_ID values('Vivek yaligar',264478979794,'Mithun yaligar',163030351602,23);
insert into Voter_ID values('Sham kumar',887874446451,'Ramkumar',798653100636,28);
insert into Voter_ID values('Kamlesh Yadav',854857045840,'Parmesh Yadav',206059855690,29);
insert into Voter_ID values('Manoj KA',523253625362,'Omkar KB',259896320659,26);
insert into Voter_ID values('Sharad kumar',450439850301,'Indra Kumar',989976546164,22);
insert into Voter_ID values('Mutturaj',283782738228,'Ramesh Arvind',123654960606,78);
insert into Voter_ID values('Channa Bankapur',984189489498,'Vadiraj Bankapur',986563219498,43);
insert into Voter_ID values('Kaipa Sandhya',565648303979,'Sundar Pichai',456065302899,65);
insert into Voter_ID values('Usha KL',586005705676,'Mahadevappa',968431804150,53);
insert into Voter_ID values('Preet kanwal',748734085095,'Eeshwar kanwal',560795262022,55);
insert into Voter_ID values('Shashank bongale',347309570957,'Yash bongale',216500668466,33);
insert into Voter_ID values('Kiran hombal',487456754836,'Yadurappa',215845218655,21);
insert into Voter_ID values('Suresh Komal',607960978609,'Ashok komal',549638965896,26);
insert into Voter_ID values('Umesh SM',485798750500,'Robin Uttappa',984632036065,42);
insert into Voter_ID values('Chinnari Mutta',476547865768,'Vijay Ragvendra',815440035439,59);
insert into Voter_ID values('Vinay Kumar',286060946059,'Suresh kumar',210792069653,87);





/*1 View Details of a person */
select * from person natural join master_details where aadhar_no=854857045840;
select Fathers_name from Aadhar_card where aadhar_no=854857045840;
select property.Area from person natural join property where aadhar_no=854857045840;
select insurance.insurance_type,insurance.policy_no,insurance.amt_insured from person natural join insurance where aadhar_no=854857045840;
select Bank_account.Bank_Name,Bank_account.Branch,Bank_account.acc_type,Bank_account.acc_no from person natural join Bank_account where aadhar_no=854857045840;



/*2 person with no voter id*/
select person.name,person.age from person natural join master_details where age<19 and master_details.voter_idno is NULL;



/*3 person with Driving licence but not passport*/
select person.name from person natural join master_details m where  m.Dl_no
 in (select m1.Dl_no from person natural join master_details m1 where m1.passport_no is null) ;



/*4 fetching details on insurance type,no.of persons and avg amt_insured from relation insurance*/

select insurance_type,count(*) AS No_of_persons ,avg(i.amt_insured) AS Avg_amt_insured from insurance i group by insurance_type ; 


/*5 details of person whose age >50*/
select person.name,person.age,property.area AS owns_property_in_area , Bank_account.Bank_Name,Bank_account.acc_no,insurance.insurance_type,insurance.amt_insured
 from (((person natural join property) natural join Bank_account )natural join insurance) where age>50;

/*6 list accnt details of a person who never claimed an insurance*/
select Bank_account.person_name,Bank_Name,acc_type from (Bank_account left outer join insurance i on Bank_account.aadhar_no=i.aadhar_no) where i.policy_no is null ;

/*7 list the person name and aadhar_no who has all the required details*/

select person.name,aadhar_no from ((((person natural join master_details)natural join property) natural join Bank_account )natural join insurance) 
where Dl_no is not null and 
	passport_no is not null and 
	voter_idno is not null and
	acc_no is not null and 
	policy_no is not null and 
	reg_no is not null;


/*8 list the person names who owns more than one property*/

select person_name,count(*) AS no_of_properties_owned from property group by person_name having count(*)>1;

/*9 list the persons and plot no who dont have any nominees and house_tax is greater than 100000 */

select person_name,reg_no AS plot_no from property where property.Nominees is null and House_tax_rs >100000;


