CREATE TABLE account(
	account_id SERIAL,
	name VARCHAR(30) NOT NULL,
	balance INTEGER NOT NULL
);

INSERT INTO account(name,balance) VALUES('Adam',100),('Bob',100),('Linda',100);

SELECT * FROM accounts;

ALTER TABLE account RENAME TO accounts;

BEGIN;

UPDATE accounts
SET balance =balance - 50
WHERE name='Bob';

ROLLBACK;

COMMIT;

---SAVEPOINT 

SELECT * FROM accounts;

BEGIN;

UPDATE accounts
SET balance = balance + 50 WHERE name='Adam';

SAVEPOINT first_savepoint;

UPDATE accounts
SET balance = balance + 50 WHERE name='Adam';

SAVEPOINT second_savepoint;
UPDATE accounts
SET balance = balance - 50 WHERE name='Adam'; 

ROLLBACK TO second_savepoint;

COMMIT;

SELECT * FROM accounts;






