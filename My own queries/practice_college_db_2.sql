 SELECT * FROM students;


CREATE OR REPLACE FUNCTION fn_students_group_by_gender() RETURNS table(
	_gender char(1),
	counts bigint
) AS
$$
	BEGIN
	RETURN QUERY
	SELECT gender,COUNT(student_id) FROM students GROUP BY gender;
	END;
$$ LANGUAGE plpgsql;
SELECT * FROM fn_students_group_by_gender();

SELECT * FROM instructors;

SELECT * FROM courses;

SELECT * FROM course_instructors;

SELECT * FROM enrollments;

SELECT * FROM students;


-- Displaying all the enrollments details with foreign key in enrollments table
CREATE OR REPLACE FUNCTION fn_enrollments_displaying_all_the_details_with_fr_key()
RETURNS TABLE
(
	en_roll_ment_id INT,
	student_name TEXT,
	course_namee character varying(100)
)
AS
$$
	BEGIN

	RETURN QUERY
	SELECT enrollment_id,
		   first_name ||' '||last_name AS full_name,
		   course_name
		   FROM enrollments
	JOIN courses ON enrollments.course_id = courses.course_id
	JOIN students ON enrollments.student_id = students.student_id;
		   

	END;

$$LANGUAGE plpgsql;
DROP FUNCTION fn_enrollments_displaying_all_the_details_with_fr_key();
SELECT * FROM fn_enrollments_displaying_all_the_details_with_fr_key();


--No of students enrolled in each courses with course name
CREATE OR REPLACE FUNCTION fn_enrollments_no_of_stud_enrolled_in_each_courses()
RETURNS TABLE
(
	course__id integer,
	course__name varchar,
	no_of_students_enrolled bigint
)
AS
$$
	BEGIN
		RETURN QUERY
		SELECT enrollments.course_id,
		course_name,
		count(student_id)
		FROM enrollments
		JOIN courses ON enrollments.course_id = courses.course_id
		GROUP BY enrollments.course_id,courses.course_id
		ORDER BY course_id;
	END;

$$LANGUAGE PLPGSQL;
drop function fn_enrollments_no_of_stud_enrolled_in_each_courses();
SELECT * FROM fn_enrollments_no_of_stud_enrolled_in_each_courses();

SELECT * FROM instructors;

SELECT * FROM courses;

SELECT * FROM course_instructors;

SELECT * FROM enrollments;

SELECT * FROM students;


CREATE OR REPLACE FUNCTION fn_enrollments_maximum_ranked_student_in_each_course()
RETURNS TABLE(
	
	SELECT student_id ,course_id CID FROM enrollments e
	WHERE grade =(
	SELECT min(grade) mingrade FROM enrollments e2
	WHERE e2.course_id = e.course_id
	) ORDER BY course_id
	
	
) AS
$$

$$LANGUAGE PLPGSQL;


SELECT courses.course_id,courses.course_name,students.student_id,students.first_name ||' '||students.last_name AS "student name", min(grade) FROM enrollments 
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id 
HAVING min(grade) IN (
SELECT min(grade) FROM enrollments GROUP BY course_id

)
GROUP BY courses.course_id,students.student_id ORDER BY courses.course_id;


SELECT 
    c.course_id,
    c.course_name,
    s.student_id,
    s.first_name || ' ' || s.last_name AS "student name",
    e.grade
FROM 
    enrollments e
JOIN 
    students s ON e.student_id = s.student_id
JOIN 
    courses c ON e.course_id = c.course_id
WHERE 
    e.grade = (
        SELECT 
            MIN(grade)
        FROM 
            enrollments e2
        WHERE 
            e2.course_id = e.course_id
    )
ORDER BY 
    c.course_id;




SELECT * from COURSE_INSTRUCTORS;

SELECT * from INSTRUCTORS;








