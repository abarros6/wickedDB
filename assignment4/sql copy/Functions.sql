--given student name find their info
SELECT* 
FROM student
WHERE fName=//given AND lName= //given;

--find the lowest salaried staff from each department
SELECT d.deptName, a.adminNo, min(a.salary), i.instructorNo, min(i.salary) 
FROM Department as d Right JOIN AdminStaff as a  RIGHT JOIN Instructor as i
GROUP BY d.deptName;

--given a student and a course find all students in the same section of that course with them
SELECT s.fName, s.lName 
FROM Enrollment e, Student s 

WHERE e.sectionID= (
    SELECT e.sectionID
    FROM Enrollment e, Section s 
    WHERE e.studentNo=//given AND S.courseID= //given
    )
  And e.studentNo = s.studentNo ;

--add a new student to the student relation
INSERT INTO Student
VALUES (//allgiven);
--note: the interface should have a selector list for calssroom number and instructor number to make sure they are valid

--increase the slaries of all instructors by a selected percest
UPDATE Instructor
SET salary = salary* //given%
WHERE deptName = given;










