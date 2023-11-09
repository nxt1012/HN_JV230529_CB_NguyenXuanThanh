# Tạo cơ sở dữ liệu
drop schema if exists QUANLYDIEMTHI;
create schema QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table STUDENT
(
    studentId   varchar(4) primary key not null,
    studentName varchar(100)           not null,
    birthday    date                   not null,
    gender      bit(1)                 not null,
    address     text                   not null,
    phoneNumber varchar(45) unique
);

create table SUBJECT
(
    subjectId   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);

create table MARK
(
    subjectId varchar(4) not null,
    constraint fk_sbid_mark foreign key (subjectId) references SUBJECT (subjectId),
    studentId varchar(4) not null,
    constraint fk_stid_mark foreign key (studentId) references STUDENT (studentId),
    point     float
);

insert into STUDENT
values ('S001', 'Nguyễn Thế Anh', '1999/1/11', 1, 'Hà Nội', 984678082),
       ('S002', 'Đặng Bảo Trâm', '1998/12/22', 0, 'Lào Cai', 904982654),
       ('S003', 'Trần Hà Phương', '2000/5/5', 0, 'Nghệ An', 947645363),
       ('S004', 'Đỗ Tiến Mạnh', '1999/3/26', 1, 'Hà Nội', 983665353),
       ('S005', 'Phạm Duy Nhất', '1998/10/4', 1, 'Tuyên Quang', 978242678),
       ('S006', 'Mai Văn Thái', '2002/6/22', 1, 'Nam Định', 982654268),
       ('S007', 'Giang Gia Hân', '1996/11/10', 0, 'Phú Thọ', 982364753),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999/1/22', 0, 'Hà Nam', 927867453),
       ('S009', 'Nguyễn Tiến Đạt', '1998/8/7', 1, 'Tuyên Quang', 989274673),
       ('S010', 'Nguyễn Thiều Quang', '2000/9/18', 1, 'Hà Nội', 984378291);

insert into SUBJECT
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

insert into MARK
values ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),

       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),

       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),

       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),

       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),

       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),

       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),

       ('MH01', 'S008', 10),
       ('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 6),
       ('MH05', 'S008', 9.5),

       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),

       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);

# Sửa tên sinh viên có mã 'S004' thành 'Đỗ Đức Mạnh'
update STUDENT
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';

# Sửa tên và hệ số mông học có mã 'MH05' thành 'Ngoại Ngữ' và hệ số là 1
update SUBJECT
set subjectName = 'Ngoại ngữ'
where subjectId = 'MH05';

update SUBJECT
set priority = 1
where subjectId = 'MH05';

# Cập nhật lại điểm của học sinh có mã 'S009' thành (MH01: 8.5, MH02: 7, MH03: 5.5, MH04: 6, MH05: 9)
update MARK
set point = 8.5
where subjectId = 'MH01'
  and studentId = 'S009';
update MARK
set point = 7
where subjectId = 'MH02'
  and studentId = 'S009';
update MARK
set point = 5.5
where subjectId = 'MH03'
  and studentId = 'S009';
update MARK
set point = 6
where subjectId = 'MH04'
  and studentId = 'S009';
update MARK
set point = 9
where subjectId = 'MH05'
  and studentId = 'S009';

# Xóa toàn bộ thông tin của học sinh có mã 'S010' bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT
delete
from MARK
where studentId = 'S010';
delete
from STUDENT
where studentId = 'S010';

# Lấy ra tất cả thông tin của sinh viên trong bảng STUDENT
select *
from STUDENT;

# Hiển thị tên và mã môn học của những môn có hệ số bằng 1
select subjectName as 'Tên môn học', subjectId as 'Mã môn học'
from SUBJECT
where priority = 1;

# Hiển thị thông tin học sinh bao gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh), giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả các học sinh
select studentId                                       as 'Mã học sinh',
       studentName                                     as 'Tên học sinh',
       (timestampdiff(YEAR, birthday, current_date))   as 'Tuổi',
       (case when gender = 0 then 'Nữ' else 'Nam' end) as 'Giới tính',
       address                                         as 'Quê quán'
from STUDENT;


# Hiển thị thông tin bao gồm: tên học sinh, tên môn học, điểm thi của tất cả các học sinh của môn Toán và sắp xếp theo điểm giảm dần
select STUDENT.studentName as 'Tên học sinh', SUBJECT.subjectName as 'Tên môn học', MARK.point as 'Điểm'
from STUDENT
         join MARK on STUDENT.studentId = MARK.studentId
         join SUBJECT on MARK.subjectId = SUBJECT.subjectId
where SUBJECT.subjectId = 'MH01'
order by MARK.point desc;

# Thống kê số lượng học sinh theo giới tính ở trong bảng (gồm 2 cột: Giới tính và Số lượng)
select (case when gender = 0 then 'Nữ' else 'Nam' end) as 'Giới tính', count(*) as 'Số lượng'
from STUDENT
group by gender;

# Tính tổng điểm và điểm trung bình các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán), bảng gồm mã học sinh, tên học sinh, tổng điểm và điểm trung bình
select STUDENT.studentId                                                     as 'Mã học sinh',
       STUDENT.studentName                                                   as 'Tên học sinh',
       sum(MARK.point * SUBJECT.priority)                                    as 'Tổng điểm',
       format(sum(MARK.point * SUBJECT.priority) / sum(SUBJECT.priority), 2) as 'Điểm trung bình'
from STUDENT
         join MARK on STUDENT.studentId = MARK.studentId
         join SUBJECT on MARK.subjectId = SUBJECT.subjectId
group by STUDENT.studentId;

# Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm: mã học sinh, tên học sinh, giới tính, quê quán
create view STUDENT_VIEW as
select studentId                                       as 'Mã học sinh',
       studentName                                     as 'Tên học sinh',
       (case when gender = 0 then 'Nữ' else 'Nam' end) as 'Giới tính',
       address                                         as 'Quê quán'
from STUDENT;

# Test STUDENT_VIEW
# select * from STUDENT_VIEW;

# Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin học sinh gồm: mã học sinh, tên học sinh, điểm trung bình các môn học
create view AVERAGE_MARK_VIEW as
select STUDENT.studentId                                                     as 'Mã học sinh',
       STUDENT.studentName                                                   as 'Tên học sinh',
       format(sum(MARK.point * SUBJECT.priority) / sum(SUBJECT.priority), 2) as 'Điểm trung bình'
from STUDENT
         join MARK on STUDENT.studentId = MARK.studentId
         join SUBJECT on MARK.subjectId = SUBJECT.subjectId
group by STUDENT.studentId;
# Test AVERAGE_MARK_VIEW
# select * from AVERAGE_MARK_VIEW;
# Đánh Index cho trường 'phoneNumber' của bảng STUDENT
create index idx_phoneNumber on STUDENT (phoneNumber);

# Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó
delimiter //
create procedure PROC_INSERTSTUDENT(in sId varchar(4), in sName varchar(100), in bd date, in gen bit(1), in addr text,
                                    in phone varchar(45))
begin
    insert into STUDENT
    values (sId, sName, bd, gen, addr, phone);
end;
//
delimiter ;
# test PROC_INSERTSTUDENT
# call PROC_INSERTSTUDENT ('S099', 'Nguyễn Minh Phương', '2009/09/09', 0, 'Hà Nội', 123456789);

# Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học
delimiter //
create procedure PROC_UPDATESUBJECT(in sId varchar(4), in sName varchar(45))
begin
    update SUBJECT
    set subjectName = sName
    where subjectId = sId;
end;
//
delimiter ;
# test PROC_UPDATESUBJECT
# call PROC_UPDATESUBJECT('MH01', 'Toán cao cấp');

# Tạo PROC_DELETEMARK dùng để xóa toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa
delimiter //
create procedure PROC_DELETEMARK(in sId varchar(4), out deletedRow int)
begin
    select count(*) into deletedRow from MARK where studentId = sId;
    delete from MARK where studentId = sId;
end; //
delimiter ;
# test PROC_DELETEMARK
call PROC_DELETEMARK( 'S002', @deletedRowsCount);
select @deletedRowsCount as 'Số bản ghi đã xóa'