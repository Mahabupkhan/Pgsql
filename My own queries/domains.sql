--Domain creation
-- Domain is a custom user defained data type with some constraints

--Creating Domain

CREATE DOMAIN addr VARCHAR(100) NOT NULL;


--How to use domain

CREATE TABLE address(
	id serial primary key,
	address addr
); -- When we use our custom domain(data type) all the constraints will be added to this

drop domain addr;
drop table address;

--From chatgpt
What You Can Do with ALTER DOMAIN:
Add Constraints:

Add a CHECK Constraint: You can add a CHECK constraint to a domain.
sql
Copy code
ALTER DOMAIN domain_name
ADD CONSTRAINT constraint_name CHECK (condition);
Example:
sql
Copy code
ALTER DOMAIN addr
ADD CONSTRAINT addr_check CHECK (VALUE <> '');
Drop Constraints:

Drop a Constraint: You can drop a specific constraint from a domain using its name.
sql
Copy code
ALTER DOMAIN domain_name
DROP CONSTRAINT constraint_name;
Example:
sql
Copy code
ALTER DOMAIN addr
DROP CONSTRAINT addr_check;
Rename a Domain:

Rename the Domain: You can rename a domain using the RENAME TO clause.
sql
Copy code
ALTER DOMAIN old_domain_name
RENAME TO new_domain_name;
Example:
sql
Copy code
ALTER DOMAIN addr
RENAME TO address;
Set Domain Properties:

Set a Default Value: You can set a default value for a domain.
sql
Copy code
ALTER DOMAIN domain_name
SET DEFAULT default_value;
Example:
sql
Copy code
ALTER DOMAIN addr
SET DEFAULT 'Unknown';
Remove Default Values:

Drop the Default Value: You can remove the default value for a domain.
sql
Copy code
ALTER DOMAIN domain_name
DROP DEFAULT;
Example:
sql
Copy code
ALTER DOMAIN addr
DROP DEFAULT;
What You Cannot Do with ALTER DOMAIN:
Change the Base Data Type:

You cannot change the base data type of a domain after it has been created. To change the data type, you must drop and recreate the domain or create a new domain with the desired type.
Add NOT NULL Constraints:

You cannot directly add a NOT NULL constraint to a domain using ALTER DOMAIN. NOT NULL constraints are typically applied directly to columns.
Modify Existing Constraints:

You cannot directly modify existing constraints (e.g., changing the condition of a CHECK constraint). To modify a constraint, you generally need to drop it and then re-add it with the new conditions.
Change Domain Attributes:

You cannot directly change attributes related to the domain's data type characteristics beyond what is allowed through constraints and defaults.
Summary:
What You Can Do: Add and drop CHECK constraints, rename domains, and set or drop default values.
What You Cannot Do: Change the base data type, add NOT NULL constraints directly, modify existing constraints without dropping and re-adding them, or alter data type characteristics.
For operations beyond these capabilities, you would typically need to recreate the domain or use other mechanisms to ensure data integrity and consistency.