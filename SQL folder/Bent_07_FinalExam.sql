/*
    Name: <Roshane Bent>
    CSCI250: Databases
    Final Exam
*/

--------------------------------------------------------------------------------
/*				                  Question 1           		  		          */
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION BENT_05_monthlyPayment(principle NUMERIC(10,2),interest NUMERIC(10,6), years INTEGER)
RETURNS NUMERIC(10,2)
LANGUAGE plpgsql
AS
$$
    DECLARE i NUMERIC = interest/12;
    DECLARE n INTEGER = Years*12;
    DECLARE A NUMERIC (10,2) = -principle*(i+(i/(POWER((1+i),n))-1));
  BEGIN
      RETURN A;
  END;
 $$

  SELECT 'Your monthly payment is',BENT_05_monthlyPayment(250000.00, 0.04125, 30);


--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------
	
    SELECT Name
    FROM student NATURAL LEFT OUTER JOIN takes
    WHERE course_id IS NULL;
	
--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------

    CREATE OR REPLACE FUNCTION BENT_07_homeDepotTriggerFunction()
        RETURNS TRIGGER
        LANGUAGE PLPGSQL
        AS
        $$	
            BEGIN
				DELETE FROM rewardees
				WHERE account_id = OLD.account_id;
			 RETURN OLD;
            END;
        $$;
		
	CREATE TRIGGER BENT_07_homeDepotTrigger
	AFTER DELETE ON reward_accounts
	FOR EACH ROW 
	EXECUTE PROCEDURE BENT_07_homeDepotTriggerFunction();
	
	SELECT *
	FROM reward_accounts
	
	SELECT *
	FROM rewardees
	
	DELETE FROM reward_accounts
	WHERE account_id = 142375689

