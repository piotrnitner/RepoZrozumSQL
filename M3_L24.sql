--utworzenie schematu training
CREATE SCHEMA training;

--zmiana nazwy schematu
ALTER SCHEMA training RENAME TO training_zs;

--utworzenie tabeli products wed�ug instrukcji, najpierw kolumny i typy, potem inne cechy
CREATE TABLE training_zs.products
	(id INTEGER
	,production_qty NUMERIC (10,2)
	,products_name VARCHAR(100)
	,product_code VARCHAR(10)
	,description TEXT
	,manufacturing_date DATE
	);

--dodanie klucza g��wnego
ALTER TABLE training_zs.products ADD PRIMARY KEY (id);

--usuni�cie tabeli training_zs
--DROP TABLE IF EXISTS training_zs.products;

--utworzenie nowej tabeli sales wed�ug opisu
CREATE TABLE training_zs.sales
	(id INTEGER PRIMARY KEY
	,sales_date TIMESTAMP NOT NULL
	,sales_amount NUMERIC (10,2)
	,product_id INTEGER
	,added_by TEXT DEFAULT 'admin'
	,CONSTRAINT sales_over_1k CHECK (sales_amount > 1000)
	);

--utworzenie powi�zania pomiedzy tabelami sales i products
--utworzenie w pierwszym kroku klucza dla tabeli products
ALTER TABLE training_zs.products ADD PRIMARY KEY (id);
ALTER TABLE training_zs.sales ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id)
REFERENCES training_zs.products (id) ON DELETE CASCADE;

--usuni�cie schematu
DROP SCHEMA training_zs CASCADE;	
