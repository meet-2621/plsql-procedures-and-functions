--1.
CREATE TABLE emp (
  eno   NUMBER PRIMARY KEY,
  ename VARCHAR2(50),
  bp    NUMBER,
  da    NUMBER,
  hra   NUMBER,
  total NUMBER
);
INSERT INTO emp VALUES (101, 'Manmeet', 20000, 5000, 3000, NULL);
INSERT INTO emp VALUES (102, 'Aman', 25000, 7000, 4000, NULL);
INSERT INTO emp VALUES (103, 'Simran', 18000, 4000, 2500, NULL);

COMMIT;
CREATE OR REPLACE PROCEDURE calc_total(
    p_eno IN emp.eno%TYPE,
    p_total OUT NUMBER
) AS
    v_bp   emp.bp%TYPE;
    v_da   emp.da%TYPE;
    v_hra  emp.hra%TYPE;
BEGIN
    -- Fetch employee details
    SELECT bp, da, hra
    INTO v_bp, v_da, v_hra
    FROM emp
    WHERE eno = p_eno;

    -- Calculate total
    p_total := v_bp + v_da + v_hra;

    -- Update total column in table
    UPDATE emp
    SET total = p_total
    WHERE eno = p_eno;

    COMMIT;
END;
/
DECLARE
  v_total NUMBER;
BEGIN
  calc_total(101, v_total);
  DBMS_OUTPUT.PUT_LINE('Total Salary of Employee 101 = ' || v_total);
END;
/
SELECT * FROM emp;

--2.
SET SERVEROUTPUT ON;
DECLARE
  -- Declare variables first
  num NUMBER := 5;
  result NUMBER;

  -- Then declare the local function
  FUNCTION find_factorial(n NUMBER) RETURN NUMBER IS
    fact NUMBER := 1;
    i NUMBER;
  BEGIN
    FOR i IN 1..n LOOP
      fact := fact * i;
    END LOOP;
    RETURN fact;
  END find_factorial;

BEGIN
  -- Main execution block
  result := find_factorial(num);
  DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is ' || result);
END;
/
--3.
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE check_number_status (n IN NUMBER) IS
BEGIN
  IF n > 0 THEN
    DBMS_OUTPUT.PUT_LINE('The number ' || n || ' is Positive.');
  ELSIF n < 0 THEN
    DBMS_OUTPUT.PUT_LINE('The number ' || n || ' is Negative.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The number is Zero.');
  END IF;
END;
/

BEGIN
  check_number_status(10);   -- Positive
  check_number_status(-5);   -- Negative
  check_number_status(0);    -- Zero
END;
/
--4.
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION find_sum(n NUMBER)
RETURN NUMBER
IS
    total NUMBER := 0;
BEGIN
    FOR i IN 1..n LOOP
        total := total + i;
    END LOOP;

    RETURN total;
END;
/

DECLARE
    num NUMBER := 10;
    result NUMBER;
BEGIN
    result := find_sum(num);
    DBMS_OUTPUT.PUT_LINE('Sum of numbers from 1 to ' || num || ' is: ' || result);
END;
/

--5.
CREATE OR REPLACE PROCEDURE sum_of_average(
    n1 IN NUMBER,
    n2 IN NUMBER,
    result OUT NUMBER
) IS
    total NUMBER := 0;
    cnt NUMBER := 0;       -- ✅ changed variable name from count → cnt
    avg_val NUMBER := 0;
BEGIN
    FOR i IN n1..n2 LOOP
        total := total + i;
        cnt := cnt + 1;
    END LOOP;

    avg_val := total / cnt;
    result := avg_val;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 1;
    b NUMBER := 5;
    res NUMBER;
BEGIN
    sum_of_average(a, b, res);
    DBMS_OUTPUT.PUT_LINE('The average of numbers from ' || a || ' to ' || b || ' is: ' || res);
END;
/

--6.
SET SERVEROUTPUT ON;

DECLARE
    -- Variable declarations must come first
    str VARCHAR2(50) := 'Hello World';

    -- Recursive procedure declaration
    PROCEDURE display_msg(msg IN VARCHAR2, n IN NUMBER) IS
    BEGIN
        IF n > 0 THEN
            DBMS_OUTPUT.PUT_LINE(msg);
            display_msg(msg, n - 1); -- Recursive call
        END IF;
    END;
BEGIN
    -- Call the recursive procedure
    display_msg(str, 10);
END;
/

--here are the PL/SQL solutions for Q7–Q10 using the given table structure:
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE student';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN  -- ignore "table does not exist"
            RAISE;
        END IF;
END;
/

-- Table creation
CREATE TABLE student (
    rollno NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    sub_id NUMBER,
    mark1 NUMBER,
    mark2 NUMBER,
    mark3 NUMBER
);

-- Sample data
INSERT INTO student VALUES (1, 'John', 101, 78, 85, 90);
INSERT INTO student VALUES (2, 'Alice', 102, 88, 79, 92);
COMMIT;

--7. 
--Task: Accept rollno, calculate total of three marks, send to main block.
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE p1 (
    p_rollno IN student.rollno%TYPE,
    p_total OUT NUMBER
) AS
    m1 NUMBER;
    m2 NUMBER;
    m3 NUMBER;
BEGIN
    SELECT mark1, mark2, mark3 INTO m1, m2, m3
    FROM student
    WHERE rollno = p_rollno;

    p_total := m1 + m2 + m3;
END;
/

DECLARE
    total NUMBER;
BEGIN
    p1(1, total);
    DBMS_OUTPUT.PUT_LINE('Total Marks: ' || total);
END;
/

--8.
SET SERVEROUTPUT ON;

DECLARE
    total NUMBER;
    avg_marks NUMBER;

    FUNCTION fun2(p_rollno student.rollno%TYPE) RETURN NUMBER IS
        t NUMBER;
    BEGIN
        p1(p_rollno, t);
        RETURN (t / 3);
    END;
BEGIN
    avg_marks := fun2(1);
    DBMS_OUTPUT.PUT_LINE('Average Marks: ' || avg_marks);
END;
/

--9.
CREATE OR REPLACE FUNCTION fun3(p_rollno student.rollno%TYPE)
RETURN NUMBER IS
    m1 NUMBER;
    m2 NUMBER;
    m3 NUMBER;
    highest NUMBER;
BEGIN
    SELECT mark1, mark2, mark3 INTO m1, m2, m3
    FROM student
    WHERE rollno = p_rollno;

    highest := GREATEST(m1, m2, m3);
    RETURN highest;
END;
/
DECLARE
    high NUMBER;
BEGIN
    high := fun3(1);
    DBMS_OUTPUT.PUT_LINE('Highest Marks: ' || high);
END;
/

--10.
SET SERVEROUTPUT ON;

DECLARE
    total NUMBER;

    PROCEDURE p2(p_rollno student.rollno%TYPE) IS
        m1 NUMBER;
        m2 NUMBER;
        m3 NUMBER;
        t NUMBER;
    BEGIN
        p1(p_rollno, t);

        SELECT mark1, mark2, mark3 INTO m1, m2, m3
        FROM student
        WHERE rollno = p_rollno;

        DBMS_OUTPUT.PUT_LINE('Marks: ' || m1 || ', ' || m2 || ', ' || m3);
        DBMS_OUTPUT.PUT_LINE('Total Marks: ' || t);
    END;
BEGIN
    p2(1);
END;
/
