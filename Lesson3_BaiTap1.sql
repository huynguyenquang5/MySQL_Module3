select * from class;
select * from mark;
select * from student;
select * from subject;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
-- select * from student
-- where StudentName like '%h';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
-- select * from class
-- where month(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
-- select * from subject
-- where Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
-- update student
-- set
-- ClassID = 2
-- where
-- StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark.
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
-- select StudentName, subject.SubName, mark.Mark from Student
-- inner join mark on mark.StudentID = student.StudentID
-- inner join subject on mark.SubID = subject.SubID
-- order by mark.mark desc, student.StudentName asc;

