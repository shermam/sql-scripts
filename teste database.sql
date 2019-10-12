create database teste;
go


use teste
go

create table Class
(
	id int identity primary key,
	name varchar(1000)
)

create table GroupReason
(
	id int identity primary key,
	idClass int foreign key references Class(id),
	name varchar(1000)
)

create table Reason
(
	id int identity primary key,
	name varchar(1000)
)

create table Associative
(
	idGroup int foreign key references GroupReason(id),
	idReason int foreign key references Reason(id),
	primary key (idGroup, idReason)
)

