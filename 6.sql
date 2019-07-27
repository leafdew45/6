drop database db_profile;

create database db_profile;

use db_profile;

create table cities (
	id int AUTO_INCREMENT,
	name varchar(30) ,
	constraint pk_cities primary key (id)
);



create table users (
	id int AUTO_INCREMENT,
	full_name varchar(30) ,
	date_of_birth date ,
	place_of_birth int,
	phone_number varchar(30) ,
	address text ,
	last_education ENUM ('sd','smp','sma','s1'),
	religion ENUM ('islam','kristen','katholik'),
	constraint pk_users primary key (id),
	constraint fk_placeofbirth foreign key (place_of_birth)
		references cities (id)
);

create table hobbies (
	id int AUTO_INCREMENT ,
	name varchar(30),
	constraint pk_cities primary key (id)
);

create table user_hobbies (
	biodata_id int,
	hobby_id int,
	constraint pk_BiodataHobby primary key (biodata_id,hobby_id),
	constraint fk_biodata foreign key (biodata_id)
		references users (id),
	constraint fk_hobby foreign key (hobby_id)
		references hobbies (id)
); 


insert into cities (name) values 
	('jakarta'),
	('bandung');


insert into users (full_name, date_of_birth, place_of_birth, phone_number, address, last_education, religion) values
	('Lucinta','1992/07/12',1,08111,'jakarta','s1','kristen'),
	('satrio','2001/07/21',2,08222,'bandung','sma','islam'),
	('syahrini','1989/01/01',1,08333,'jakarta','s1','islam');

insert into hobbies (name) values 
	('renang'),
	('mancing'),
	('game'),
	('gibah'),
	('programming');

insert into  user_hobbies values 
	(1,1),
	(1,3),
	(2,4),
	(2,5);

create view vw_coba as 
	select users.id, users.full_name, users.place_of_birth as user_place_of_birth_id, cities.name, users.date_of_birth, users.phone_number, users.last_education, users.religion 
	from cities, users
	where cities.id = users.place_of_birth  ;
	


