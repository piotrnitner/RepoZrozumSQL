--utworzenie nowego schematu expense_tracker
CREATE SCHEMA expense_tracker;

--utworzenie tabeli bank_account_owner
CREATE TABLE IF NOT EXISTS expense_tracker.bank_account_owner
	(id_ba_own INTEGER
	,owner_name VARCHAR(50) NOT NULL
	,user_login INTEGER NOT NULL
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,is_common_account BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_bank_account_owner PRIMARY KEY (id_ba_own)
	);
--DROP TABLE IF EXISTS expense_tracker.bank_account_owner;

--utworzenie tabeli transactions
CREATE TABLE IF NOT EXISTS expense_tracker.transactions
	(id_transaction INTEGER
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
	,CONSTRAINT pk_transactions PRIMARY KEY (id_transaction)
	);
--DROP TABLE IF EXISTS expense_tracker.transactions;

--utworzenie tabeli transaction_category
CREATE TABLE IF NOT EXISTS expense_tracker.transaction_category
	(id_trans_cat INTEGER
	,category_name VARCHAR(50) NOT NULL
	,category_description VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_transaction_category PRIMARY KEY (id_trans_cat)
	);
--DROP TABLE IF EXISTS expense_tracker.transaction_category;

--utworzenie tabeli transaction_subcategory
CREATE TABLE IF NOT EXISTS expense_tracker.transaction_subcategory
	(id_trans_subcat INTEGER
	,id_trans_cat INTEGER
	,subcategory_name VARCHAR(50) NOT NULL
	,subcategory_description VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_transaction_subcategory PRIMARY KEY (id_trans_subcat)
	);
--DROP TABLE expense_tracker.transaction_subcategory;

--utworzenie tabeli users
CREATE TABLE IF NOT EXISTS expense_tracker.users
	(id_user INTEGER NOT NULL
	,user_login VARCHAR(25) NOT NULL
	,user_name VARCHAR(50) NOT NULL
	,user_password VARCHAR(100) NOT NULL
	,password_salt VARCHAR(50) NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_users PRIMARY KEY (id_user)
	);
--DROP TABLE IF EXISTS expense_tracker.users;

--utworzenie tabeli bank_account_types
CREATE TABLE IF NOT EXISTS expense_tracker.bank_account_types
	(id_ba_typ INTEGER
	,ba_type VARCHAR(50) NOT NULL
	,ba_desc VARCHAR (250)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,is_common_account BOOLEAN DEFAULT FALSE NOT NULL
	,id_ba_own INTEGER
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_bank_account_types PRIMARY KEY (id_ba_typ)
	);
--DROP TABLE IF EXISTS expense_tracker.bank_account_types;

--utworzenie tabeli transaction_bank_accounts
CREATE TABLE IF NOT EXISTS expense_tracker.transaction_bank_accounts
	(id_trans_ba INTEGER
	,id_ba_own INTEGER
	,id_ba_typ INTEGER
	,bank_account_name VARCHAR (100)
	,bank_account_description VARCHAR (200)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_transaction_bank_accounts PRIMARY KEY (id_trans_ba)
	);
--DROP TABLE IF EXISTS expense_tracker.transaction_bank_accounts;

--utworzenie tabeli transaction_type
CREATE TABLE IF NOT EXISTS expense_tracker.transaction_type
	(id_trans_type INTEGER
	,transaction_type_name VARCHAR (25)
	,transaction_type_desc VARCHAR (100)
	,active BOOLEAN DEFAULT FALSE NOT NULL
	,insert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	,CONSTRAINT pk_transaction_type PRIMARY KEY (id_trans_type)
	);
--DROP TABLE IF EXISTS expense_tracker.transaction_type;