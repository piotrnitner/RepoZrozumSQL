--utworzenie nowego schematu expense_tracker
CREATE SCHEMA expense_tracker;

--utworzenie tabeli bank_account_owner
CREATE TABLE expense_tracker.bank_account_owner
	(id_ba_own INTEGER PRIMARY KEY
	,owner_name VARCHAR(50) NOT NULL
	,user_login INTEGER NOT NULL
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,is_common_account BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE IF EXISTS expense_tracker.bank_account_owner;

--utworzenie tabeli transactions
CREATE TABLE expense_tracker.transactions
	(id_transaction INTEGER PRIMARY KEY
	,id_trans_ba INTEGER
	,id_trans_cat INTEGER
	,id_trans_subcat INTEGER
	,id_trans_type INTEGER
	,id_user INTEGER
	,transaction_date DATE DEFAULT CURRENT_DATE
	,transaction_value NUMERIC (9,2)
	,transaction_description TEXT
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.transactions;

--utworzenie tabeli transaction_category
CREATE TABLE expense_tracker.transaction_category
	(id_trans_cat INTEGER PRIMARY KEY
	,category_name VARCHAR(50) NOT NULL
	,category_description VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.transaction_category;

--utworzenie tabeli transaction_subcategory
CREATE TABLE expense_tracker.transaction_subcategory
	(id_trans_subcat INTEGER PRIMARY KEY
	,id_trans_cat INTEGER
	,subcategory_name VARCHAR(50) NOT NULL
	,subcategory_description VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.transaction_subcategory;

--utworzenie tabeli users
CREATE TABLE expense_tracker.users
	(id_user INTEGER NOT NULL
	,user_login VARCHAR(25) NOT NULL
	,user_name VARCHAR(50) NOT NULL
	,user_password VARCHAR(100) NOT NULL
	,password_salt VARCHAR(50) NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.users

--utworzenie tabeli bank_account_types
CREATE TABLE expense_tracker.bank_account_types
	(id_ba_typ INTEGER PRIMARY KEY
	,ba_type VARCHAR(50) NOT NULL
	,ba_desc VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,is_common_account BOOLEAN DEFAULT FALSE NOT NULL
	,id_ba_own INTEGER
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.bank_account_types

--utworzenie tabeli transaction_bank_accounts
CREATE TABLE expense_tracker.transaction_bank_accounts
	(id_trans_ba INTEGER PRIMARY KEY
	,id_ba_own INTEGER
	,id_ba_typ INTEGER
	,bank_account_name VARCHAR (100)
	,bank_account_description VARCHAR (200)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.transaction_bank_accounts

--utworzenie tabeli transaction_type
CREATE TABLE expense_tracker.transaction_type
	(id_trans_type INTEGER PRIMARY KEY
	,transaction_type_name VARCHAR (25)
	,transaction_type_desc VARCHAR (100)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
--DROP TABLE expense_tracker.transaction_type