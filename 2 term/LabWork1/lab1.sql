-- 1
CREATE TABLE my_table
  ( id NUMBER, val NUMBER
  );

 -- 2 
BEGIN
  DBMS_RANDOM.initialize(val => 0);
  FOR i IN 1..10000
  LOOP
    INSERT INTO my_table
      (id,val
      ) VALUES
      (i,dbms_random.random
      );
  END LOOP;
  DBMS_RANDOM.terminate;
END;

-- 3
create or replace PROCEDURE MY_TABLE_PARITY
IS
  even NUMBER;
  odd  NUMBER;
BEGIN
  SELECT COUNT(val) INTO even FROM my_table WHERE MOD(val,2) = 0;
  SELECT COUNT(val) INTO even FROM my_table WHERE MOD(val,2) = 1;
  IF even > odd THEN
    SYS.DBMS_OUTPUT.PUT_LINE('EVEN');
  ELSIF odd < even THEN
    SYS.DBMS_OUTPUT.PUT_LINE('ODD');
  ELSE
    SYS.DBMS_OUTPUT.PUT_LINE('EQUAL');
  END IF;
END MY_TABLE_PARITY;

-- 4
CREATE OR REPLACE FUNCTION GEN_INS_STMT(
    id    NUMBER,
    value NUMBER)
  RETURN VARCHAR2
AS
BEGIN
  RETURN 'insert into my_table (id, value) values (' || TO_CHAR(id) || ', ' || TO_CHAR(value) || ');';
END GEN_INS_STMT;

-- 5 -- INSERT
create or replace PROCEDURE INSERT_MY_TABLE 
(
  VAL IN NUMBER 
) AS 
BEGIN
  insert into my_table (id,val) values ((select max(id) from my_table) + 1, val);
END INSERT_MY_TABLE;

-- 5 -- DELETE
create or replace PROCEDURE DELETE_MY_TABLE(
    ID IN NUMBER )
AS
BEGIN
  DELETE FROM my_table WHERE my_table.id = id;
END DELETE_MY_TABLE;

-- 6 -- UPDATE
create or replace PROCEDURE UPDATE_MY_TABLE(
    ID  IN NUMBER ,
    VAL IN NUMBER )
AS
BEGIN
  UPDATE my_table SET my_table.val = val WHERE my_table.id = id;
END UPDATE_MY_TABLE;