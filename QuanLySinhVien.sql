create database quanlysinhvien;
use quanlysinhvien;
create table class(
classID int not null auto_increment primary key,
className varchar(60) not  null,
startDate datetime not null,
status bit
);

create table student(
studentID int not null auto_increment primary key,
studentName varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classID int not null,
foreign key (classid) references class (classid)
);
create table subject(
subid int not null auto_increment primary key,
subName varchar(30) not null,
creadit tinyint not null default 1 check (creadit >= 1),
status bit default 1
);
create table mark(
markid int not null auto_increment primary key,
subid int not null,
studentid int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
unique (subid,studentid),
foreign key (subid) references subject (subid),
foreign key (studentid) references student (studentid)
);



INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO Class
VALUES (4, 'A4', '2012-11-22', 1);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Creadit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

-- Hi???n th??? t???t c??? c??c sinh vi??n c?? t??n b???t ?????u b???ng k?? t??? ???h???
select * from student where studentName like 'H%';

-- Hi???n th??? c??c th??ng tin l???p h???c c?? th???i gian b???t ?????u v??o th??ng 12.
select * from class where startDate like '%-12-%';

-- Hi???n th??? t???t c??? c??c th??ng tin m??n h???c c?? credit trong kho???ng t??? 3-5.
select * from subject where creadit between 3 and 5;

-- Thay ?????i m?? l???p(ClassID) c???a sinh vi??n c?? t??n ???Hung??? l?? 2.
update student set classID = '2' where (studentID = '1');

-- Hi???n th??? c??c th??ng tin: StudentName, SubName, Mark. D??? li???u s???p x???p theo ??i???m thi (mark) gi???m d???n. n???u tr??ng s???p theo t??n t??ng d???n.
select studentName , SubName , Mark from ((student inner join subject on student.studentID = subject.subid )
inner join mark on subject.subid = mark.markid )  order by mark desc;


