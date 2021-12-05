CREATE TABLE AdminStaff(
    adminNo int,
    position varchar(255),
    startDate DATE,
    deptName varchar(255),
    fName varchar(255),
    lName varchar(255),
    salary int,
    PRIMARY KEY (adminNo)
);

CREATE TABLE Department(
    deptName varchar(255),
    instructorsAssiged int,
    studentsEnrolled int,
    PRIMARY KEY (deptName)
);
--removed instructor no as instructor already holds a reference to classNo
CREATE TABLE Classroom(
    classroomNo int,
    classroomQuantity int,
    --number of courses tought
    coursesTaught int,
    PRIMARY KEY (classroomNo)
);

--added reference to department
CREATE TABLE Instructor(
    instructorNo int,
    classroomNo int,
    deptName varchar(255),
    coursesTaught int,
    fName varchar(255),
    lName varchar(255),
    salary int,
    PRIMARY KEY (instructorNo),
    FOREIGN KEY (classroomNo) REFERENCES Classroom(classroomNo)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (deptName) REFERENCES Department(deptName)
    ON DELETE SET NULL ON UPDATE CASCADE  
);

CREATE TABLE Student(
    studentNo int,
    fName varchar(255),
    lName varchar(255),
    studentAge int,
    studentYear int,
    studentAverage int,
    creditsToDate int,
    numberOfClasses int,
    classroomNo int,
    instructorNo int,
    PRIMARY KEY (studentNo),
    FOREIGN KEY (classroomNo) REFERENCES Classroom(classroomNo)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (instructorNo) REFERENCES Instructor(instructorNo)
    ON DELETE SET NULL ON UPDATE CASCADE
);

--removed schedule
CREATE TABLE Schedule(
    scheduledToStudent int,
    coursesEnrolled int,
    totalStudentsEnrolled int,
    studentNo int,
    PRIMARY KEY (scheduledToStudent),
    FOREIGN KEY (studentNo) REFERENCES Student(studentNo)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Course(
    courseID int,
    courseName varchar(255),
    courseClassroom int,
    deptName varchar(255),
    courseYear int,
    instructorNo int,
    PRIMARY KEY (courseID),
    FOREIGN KEY (courseClassroom) REFERENCES Classroom(classroomNo)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (deptName) REFERENCES Department(deptName)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (instructorNo) REFERENCES Instructor(instructorNo)
    ON DELETE SET NULL ON UPDATE CASCADE
);
--changed timing name to section, added id
CREATE TABLE Section(
    sectionID int,
    courseID int,
    startDate DATE,
    endDate DATE,
    startTime TIME,
    endTime TIME,
    PRIMARY KEY (sectionID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
    ON DELETE CASCADE ON UPDATE CASCADE,
);
--enrollment now references a section 
CREATE TABLE Enrollment(
    studentNo int,
    sectionID int,
    dateEnrolled DATE,

    PRIMARY KEY (studentNo,sectionID),
    FOREIGN KEY (studentNo) REFERENCES Student(studentNo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sectionID) REFERENCES Section(sectionID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CourseEquipment(
    deviceNo int,
    deviceName varchar(255),
    courseAssigned int,
    studentNo int,
    dueDate DATE,
    PRIMARY KEY (deviceNo),
    FOREIGN KEY (courseAssigned) REFERENCES Course(courseID)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (studentNo) REFERENCES Student(studentNo)
    ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE Allotment(
    instructorNo int,
    classroomNo int,
    dateAssigned DATE,
    timeAssigned TIME,
    PRIMARY KEY (instructorNo,classroomNo),
    FOREIGN KEY (instructorNo) REFERENCES Instructor(instructorNo)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (classroomNo) REFERENCES Classroom(classroomNo)
    ON DELETE CASCADE ON UPDATE CASCADE
);