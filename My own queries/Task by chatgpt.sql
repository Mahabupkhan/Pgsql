 CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    industry VARCHAR(100),
    headquarters VARCHAR(255)
);
CREATE TABLE stocks (
    stock_id INT PRIMARY KEY,
    company_id INT NOT NULL,
    ticker_symbol VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    market_cap DECIMAL(15, 2),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);
CREATE TABLE traders (
    trader_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    trader_id INT NOT NULL,
    account_balance DECIMAL(15, 2) NOT NULL DEFAULT 0,
    FOREIGN KEY (trader_id) REFERENCES traders(trader_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    trader_id INT NOT NULL,
    stock_id INT NOT NULL,
    account_id INT NOT NULL,
    transaction_type VARCHAR(4) CHECK (transaction_type IN ('BUY', 'SELL')),
    quantity INT NOT NULL,
    transaction_price DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (trader_id) REFERENCES traders(trader_id),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO companies (company_id, company_name, industry, headquarters) VALUES
(1, 'Tech Innovators', 'Technology', 'San Francisco'),
(2, 'Health Co', 'Healthcare', 'New York'),
(3, 'Eco Energy', 'Energy', 'Austin'),
(4, 'Green Power', 'Energy', 'Denver'),
(5, 'Global Finance', 'Financial', 'London'),
(6, 'Alpha Tech', 'Technology', 'Berlin'),
(7, 'Blue Biotech', 'Biotechnology', 'Boston'),
(8, 'Clean Fuels', 'Energy', 'Houston'),
(9, 'AutoWorld', 'Automotive', 'Detroit'),
(10, 'NextGen Computing', 'Technology', 'San Jose'),
(11, 'Smart Healthcare', 'Healthcare', 'Los Angeles'),
(12, 'Aero Dynamics', 'Aerospace', 'Seattle'),
(13, 'Cyber Innovations', 'Technology', 'Austin'),
(14, 'Vega Foods', 'Consumer Goods', 'Chicago'),
(15, 'Oceanic Shipping', 'Logistics', 'Miami'),
(16, 'Sunrise Pharmaceuticals', 'Pharmaceuticals', 'New Jersey'),
(17, 'Big Data Systems', 'Technology', 'Boston'),
(18, 'Healthy Living', 'Healthcare', 'Dallas'),
(19, 'Innovative Ventures', 'Venture Capital', 'San Francisco'),
(20, 'Nuclear Dynamics', 'Energy', 'Dallas'),
(21, 'Financial Wizards', 'Financial', 'Chicago'),
(22, 'SpaceXploration', 'Aerospace', 'Houston'),
(23, 'Electric Mobility', 'Automotive', 'Los Angeles'),
(24, 'Smart Farming', 'Agriculture', 'Sacramento'),
(25, 'Quantum Computing Corp', 'Technology', 'San Francisco'),
(26, 'AI Industries', 'Technology', 'Boston'),
(27, 'Healthcare Plus', 'Healthcare', 'San Diego'),
(28, 'Sustainable Growth', 'Energy', 'Denver'),
(29, 'Maritime Solutions', 'Logistics', 'New York'),
(30, 'Biopharma Innovations', 'Pharmaceuticals', 'Boston');


INSERT INTO stocks (stock_id, company_id, ticker_symbol, price, market_cap) VALUES
(1, 1, 'TCHI', 150.75, 5000000000),
(2, 2, 'HLTH', 98.50, 3000000000),
(3, 3, 'ECOE', 45.30, 1500000000),
(4, 4, 'GRPW', 55.75, 1000000000),
(5, 5, 'GLFI', 150.15, 20000000000),
(6, 6, 'ALPH', 120.90, 7000000000),
(7, 7, 'BBIO', 145.10, 2500000000),
(8, 8, 'CLFU', 75.80, 1800000000),
(9, 9, 'AUTO', 230.90, 14000000000),
(10, 10, 'NGCP', 210.35, 10000000000),
(11, 11, 'SHC', 88.50, 2300000000),
(12, 12, 'ADYN', 115.65, 6500000000),
(13, 13, 'CYIN', 180.30, 8000000000),
(14, 14, 'VGFD', 60.25, 1500000000),
(15, 15, 'OSHP', 90.75, 3500000000),
(16, 16, 'SRPH', 110.40, 9000000000),
(17, 17, 'BDSY', 165.20, 5500000000),
(18, 18, 'HLIV', 95.15, 2800000000),
(19, 19, 'INVN', 85.10, 3200000000),
(20, 20, 'NCDY', 65.75, 2000000000),
(21, 21, 'FWZD', 115.30, 2700000000),
(22, 22, 'SPXP', 150.90, 12000000000),
(23, 23, 'ELMB', 180.75, 4500000000),
(24, 24, 'SFAR', 55.60, 1000000000),
(25, 25, 'QCCP', 220.50, 9500000000),
(26, 26, 'AIIN', 135.45, 6000000000),
(27, 27, 'HPLS', 145.30, 4000000000),
(28, 28, 'SNRG', 135.75, 2000000000),
(29, 29, 'MARS', 125.90, 3000000000),
(30, 30, 'BIOP', 190.25, 5000000000);



INSERT INTO traders (trader_id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
(3, 'Robert', 'Johnson', 'robert.johnson@example.com', '456-789-1234'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '789-123-4567'),
(5, 'Michael', 'Miller', 'michael.miller@example.com', '321-654-9870'),
(6, 'Sophia', 'Garcia', 'sophia.garcia@example.com', '654-987-3210'),
(7, 'David', 'Martinez', 'david.martinez@example.com', '987-321-6540'),
(8, 'Sarah', 'Brown', 'sarah.brown@example.com', '456-123-7890'),
(9, 'James', 'Taylor', 'james.taylor@example.com', '123-654-7890'),
(10, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '654-321-1230'),
(11, 'William', 'Moore', 'william.moore@example.com', '987-654-4560'),
(12, 'Mia', 'Anderson', 'mia.anderson@example.com', '456-987-1230'),
(13, 'Daniel', 'Thomas', 'daniel.thomas@example.com', '123-789-4560'),
(14, 'Isabella', 'Hernandez', 'isabella.hernandez@example.com', '789-456-1230'),
(15, 'Matthew', 'Lopez', 'matthew.lopez@example.com', '987-123-6540'),
(16, 'Ava', 'Martin', 'ava.martin@example.com', '321-456-7890'),
(17, 'Ethan', 'Lee', 'ethan.lee@example.com', '456-321-6540'),
(18, 'Abigail', 'White', 'abigail.white@example.com', '654-987-1230'),
(19, 'Benjamin', 'Clark', 'benjamin.clark@example.com', '123-789-6540'),
(20, 'Liam', 'Rodriguez', 'liam.rodriguez@example.com', '987-456-3210'),
(21, 'Charlotte', 'Lewis', 'charlotte.lewis@example.com', '654-789-1230'),
(22, 'Elijah', 'Walker', 'elijah.walker@example.com', '456-123-9870'),
(23, 'Amelia', 'Hall', 'amelia.hall@example.com', '789-654-1230'),
(24, 'Noah', 'Allen', 'noah.allen@example.com', '321-987-6540'),
(25, 'Emma', 'Young', 'emma.young@example.com', '123-456-9870'),
(26, 'Lucas', 'King', 'lucas.king@example.com', '654-321-4560'),
(27, 'Grace', 'Wright', 'grace.wright@example.com', '789-987-1230'),
(28, 'Mason', 'Scott', 'mason.scott@example.com', '456-654-7890'),
(29, 'Sophia', 'Torres', 'sophia.torres@example.com', '987-321-9870'),
(30, 'Oliver', 'Nguyen', 'oliver.nguyen@example.com', '321-654-3210');


INSERT INTO accounts (account_id, trader_id, account_balance) VALUES
(1, 1, 10000.00),
(2, 2, 5000.00),
(3, 3, 7500.00),
(4, 4, 12000.00),
(5, 5, 2000.00),
(6, 6, 15000.00),
(7, 7, 3000.00),
(8, 8, 9000.00),
(9, 9, 7000.00),
(10, 10, 8500.00),
(11, 11, 18000.00),
(12, 12, 1000.00),
(13, 13, 6000.00),
(14, 14, 14000.00),
(15, 15, 9500.00),
(16, 16, 21000.00),
(17, 17, 4500.00),
(18, 18, 32000.00),
(19, 19, 28000.00),
(20, 20, 17000.00),
(21, 21, 12500.00),
(22, 22, 50000.00),
(23, 23, 4000.00),
(24, 24, 11000.00),
(25, 25, 85000.00),
(26, 26, 3700.00),
(27, 27, 20000.00),
(28, 28, 15500.00),
(29, 29, 78000.00),
(30, 30, 2200.00);


INSERT INTO transactions (transaction_id, trader_id, stock_id, account_id, transaction_type, quantity, transaction_price) VALUES
(1, 1, 1, 1, 'BUY', 50, 150.75),
(2, 2, 2, 2, 'BUY', 100, 98.50),
(3, 3, 3, 3, 'SELL', 200, 45.30),
(4, 4, 4, 4, 'BUY', 150, 55.75),
(5, 5, 5, 5, 'SELL', 75, 150.15),
(6, 6, 6, 6, 'BUY', 30, 120.90),
(7, 7, 7, 7, 'SELL', 60, 145.10),
(8, 8, 8, 8, 'BUY', 100, 75.80),
(9, 9, 9, 9, 'SELL', 200, 230.90),
(10, 10, 10, 10, 'BUY', 120, 210.35),
(11, 11, 11, 11, 'SELL', 80, 88.50),
(12, 12, 12, 12, 'BUY', 70, 115.65),
(13, 13, 13, 13, 'SELL', 60, 180.30),
(14, 14, 14, 14, 'BUY', 100, 60.25),
(15, 15, 15, 15, 'SELL', 130, 90.75),
(16, 16, 16, 16, 'BUY', 150, 110.40),
(17, 17, 17, 17, 'SELL', 90, 165.20),
(18, 18, 18, 18, 'BUY', 50, 95.15),
(19, 19, 19, 19, 'SELL', 30, 85.10),
(20, 20, 20, 20, 'BUY', 200, 65.75),
(21, 21, 21, 21, 'SELL', 140, 115.30),
(22, 22, 22, 22, 'BUY', 50, 150.90),
(23, 23, 23, 23, 'SELL', 90, 180.75),
(24, 24, 24, 24, 'BUY', 200, 55.60),
(25, 25, 25, 25, 'SELL', 100, 220.50),
(26, 26, 26, 26, 'BUY', 50, 135.45),
(27, 27, 27, 27, 'SELL', 60, 145.30),
(28, 28, 28, 28, 'BUY', 100, 135.75),
(29, 29, 29, 29, 'SELL', 70, 125.90),
(30, 30, 30, 30, 'BUY', 60, 190.25);



--ccompanies that I have more 5 billion market cap
SELECT 
	stocks.company_id,
	companies.company_name,
	market_cap
FROM stocks
JOIN companies ON stocks.company_id = companies.company_id
WHERE market_cap >= 5000000000
;

--Find the average transaction price for 'BUY' transactions for each stock. List the stock IDs, ticker symbols, and average prices.

SELECT 
s.stock_id,
s.ticker_symbol,
avg(s.price)
FROM transactions t
JOIN stocks s ON s.stock_id = t.stock_id
WHERE transaction_type = 'BUY'
GROUP BY s.stock_id,s.ticker_symbol


--Retrieve the 5 most recent transactions (by date) for a given stock ID (e.g., stock_id = 3).
--Include the transaction ID, trader ID, transaction type, quantity, and transaction date.
SELECT
transaction_id, trader_id, transaction_type, quantity,transaction_date
FROM transactions
ORDER BY transaction_date
LIMIT 5


--Find all stocks that have had more than 3 transactions. List the stock ID, ticker symbol, and the number of transactions.

-- Add multiple transactions for stock_id = 1
INSERT INTO transactions (transaction_id, trader_id, stock_id, account_id, transaction_type, quantity, transaction_price) VALUES
(1, 1, 1, 1, 'BUY', 50, 150.75),
(2, 2, 1, 2, 'SELL', 30, 155.00),
(3, 3, 1, 3, 'BUY', 70, 152.30),
(4, 4, 1, 4, 'SELL', 40, 160.00),
(5, 5, 1, 5, 'BUY', 90, 153.75);

-- Add multiple transactions for stock_id = 2
INSERT INTO transactions (transaction_id, trader_id, stock_id, account_id, transaction_type, quantity, transaction_price) VALUES
(6, 6, 2, 6, 'BUY', 100, 98.50),
(7, 7, 2, 7, 'SELL', 50, 100.00),
(8, 8, 2, 8, 'BUY', 60, 95.00),
(9, 9, 2, 9, 'SELL', 40, 99.00);

-- Add multiple transactions for stock_id = 3
INSERT INTO transactions (transaction_id, trader_id, stock_id, account_id, transaction_type, quantity, transaction_price) VALUES
(10, 10, 3, 10, 'BUY', 200, 45.30),
(11, 11, 3, 11, 'SELL', 100, 47.00),
(12, 12, 3, 12, 'BUY', 150, 46.50),
(13, 13, 3, 13, 'SELL', 50, 48.00);

-- Add multiple transactions for stock_id = 4
INSERT INTO transactions (transaction_id, trader_id, stock_id, account_id, transaction_type, quantity, transaction_price) VALUES
(14, 14, 4, 14, 'BUY', 150, 55.75),
(15, 15, 4, 15, 'SELL', 50, 57.00),
(16, 16, 4, 16, 'BUY', 100, 56.00),
(17, 17, 4, 17, 'SELL', 30, 58.00),
(18, 18, 4, 18, 'BUY', 80, 55.00);

































