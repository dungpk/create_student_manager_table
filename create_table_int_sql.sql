create database quanlysinhvien;
use quanlysinhvien;
create table class(
	classID int not null auto_increment PRIMARY  key,
    classname varchar(60) not null,
    startdate datetime not null,
    status bit
);

create table student(
	studentID int not null auto_increment primary key,
    studentName varchar(30) not null,
    address varchar(50),
    Phone varchar(20),
    status bit,
    classID int not null,
    foreign key(classID) references class(classID)
);

create table subject(
	subID int 				not null auto_increment primary key,
    subname varchar(30) 	not  null ,
    credit tinyint 			not null default 1 check (credit >=1),
    status bit 				default 1
);

create table mark
(
	markID int  			not null auto_increment primary key,
    subID int 				not null,
    studentID int 			not null,
	mark float 				default 0 check (mark between 0 and 100),
    examTimes tinyint 		default 1,
    unique (subid,studentID),
    foreign key  (subid) 	references subject (subid),
    foreign key (studentID) references student(studentID)
);
