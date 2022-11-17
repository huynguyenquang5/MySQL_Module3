use lesson3_thuchanh1;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * from subject
where credit = (select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT subid, mark from mark
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
--  xếp hạng theo thứ tự điểm giảm dần

select student.*, avg(mark) as avgmark from student
join mark on student.studentid = mark.studentid
group by student.studentid, studentname
having avg(mark) >= all (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
