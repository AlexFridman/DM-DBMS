DROP TABLE goods CASCADE CONSTRAINTS;
DROP TABLE order_status CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE stocks CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE clients CASCADE CONSTRAINTS;
DROP TABLE organisations CASCADE CONSTRAINTS;
DROP TABLE suppliers CASCADE CONSTRAINTS;
DROP TABLE arrive_stocks CASCADE CONSTRAINTS;
DROP TABLE goods_orders CASCADE CONSTRAINTS;
CREATE TABLE goods
  (
    good_id   INT CONSTRAINT pk_goods PRIMARY KEY,
    good_name VARCHAR2(40) NOT NULL
  );
CREATE TABLE order_status
  (
    status_id   INT CONSTRAINT pk_order_status PRIMARY KEY,
    status_name VARCHAR2(40) NOT NULL
  );
CREATE TABLE employees
  (
    employee_id       INT CONSTRAINT pk_employees PRIMARY KEY,
    employee_name     VARCHAR2(30),
    phone             VARCHAR2(30),
    employee_position VARCHAR2(30)
  );
CREATE TABLE stocks
  (
    stock_id INT CONSTRAINT pk_stocks PRIMARY KEY,
    good_id  INT,
    price    INT,
    spec     VARCHAR2(30),
    residue  INT
  );
CREATE TABLE orders
  (
    order_id          INT CONSTRAINT pk_orders PRIMARY KEY,
    invoice_number    INT,
    order_date        DATE,
    total_amount      INT,
    shipment_date     DATE,
    comments          VARCHAR2(30),
    manager_client_id INT,
    status_id         INT,
    employee_id       INT
  );
CREATE TABLE clients
  (
    manager_client_id INT CONSTRAINT pk_clients PRIMARY KEY,
    manager_name      VARCHAR2(30),
    phone             VARCHAR2(30),
    fax               VARCHAR2(30),
    organisation_id   INT
  );
CREATE TABLE organisations
  (
    organisation_id   INT CONSTRAINT pk_organisations PRIMARY KEY,
    tax_number        INT,
    organisation_name VARCHAR2(30),
    boss              VARCHAR2(30),
    address           VARCHAR2(30),
    phone             VARCHAR2(30)
  );
CREATE TABLE suppliers
  (
    manager_supplier_id INT CONSTRAINT pk_suppliers PRIMARY KEY,
    supplier_manager    VARCHAR2(30),
    phone               VARCHAR2(30),
    fax                 VARCHAR2(30),
    organisation_id     INT
  );
CREATE TABLE arrive_stocks
  (
    stock_id            INT,
    arrive_date         DATE,
    manager_supplier_id INT,
    invoice_number      INT,
    amount              INT,
    price               INT,
    inspector           VARCHAR2(30),
    CONSTRAINT pk_arrive_stocks PRIMARY KEY (stock_id, arrive_date)
  );
CREATE TABLE goods_orders
  (
    order_id INT,
    stock_id INT,
    amount   INT,
    price    INT,
    CONSTRAINT pk_goods_orders PRIMARY KEY (order_id, stock_id)
  );
ALTER TABLE orders ADD CONSTRAINT fk_orders_order_status FOREIGN KEY (status_id) REFERENCES order_status(status_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_clients FOREIGN KEY (manager_client_id) REFERENCES clients(manager_client_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE clients ADD CONSTRAINT fk_clients_organsations FOREIGN KEY (organisation_id) REFERENCES organisations(organisation_id);
ALTER TABLE suppliers ADD CONSTRAINT fk_suppliers_organsations FOREIGN KEY (organisation_id) REFERENCES organisations(organisation_id);
ALTER TABLE arrive_stocks ADD CONSTRAINT fk_arrive_stocks_suppliers FOREIGN KEY (manager_supplier_id) REFERENCES suppliers(manager_supplier_id);
ALTER TABLE arrive_stocks ADD CONSTRAINT fk_arrive_stocks_stocks FOREIGN KEY (stock_id) REFERENCES stocks(stock_id);
ALTER TABLE stocks ADD CONSTRAINT fk_stocks_goods FOREIGN KEY (good_id) REFERENCES goods(good_id);
ALTER TABLE goods_orders ADD CONSTRAINT fk_goods_orders_stocks FOREIGN KEY (stock_id) REFERENCES stocks(stock_id);
ALTER TABLE goods_orders ADD CONSTRAINT fk_goods_orders_orders FOREIGN KEY (order_id) REFERENCES orders(order_id);
-- 1.1 --
INSERT
INTO organisations
  (
    ORGANISATION_ID,
    ORGANISATION_NAME
  )
  VALUES
  (
    1,
    'Belvest'
  );
-- 1.2 --
UPDATE ORGANISATIONS
SET boss               ='Smirnov'
WHERE ORGANISATION_NAME='Belvest';
-- 1.3 --
INSERT INTO goods
  (good_id, good_name
  ) VALUES
  (1, 'sapogi'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (1,1,5
  );
-- 1.4 --
INSERT ALL
INTO organisations
  (
    ORGANISATION_ID,
    ORGANISATION_NAME
  )
  VALUES
  (
    2,
    'Postavshik'
  )
INTO organisations
  (
    ORGANISATION_ID,
    ORGANISATION_NAME
  )
  VALUES
  (
    3,
    'Klient'
  )
SELECT * FROM dual;
INSERT INTO suppliers
  (manager_supplier_id, organisation_id
  ) VALUES
  (1,2
  );
INSERT INTO clients
  (manager_client_id, organisation_id
  ) VALUES
  (1,3
  );
-- 1.5 --
INSERT INTO orders
  (ORDER_ID
  ) VALUES
  (1
  );
INSERT INTO goods_orders
  (AMOUNT,ORDER_ID,STOCK_ID
  ) VALUES
  (5,1,1
  );
-- 1.6
DELETE FROM goods_orders;
-- 1.7
-- fill goods and stock table
INSERT
INTO goods
  (
    good_id,
    good_name
  )
  VALUES
  (
    2,
    'tovar1'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (2,2,5
  );
-------------------------------
INSERT
INTO goods
  (
    good_id,
    good_name
  )
  VALUES
  (
    3,
    'tovar2'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (3,3,5
  );
-------------------------------
INSERT
INTO goods
  (
    good_id,
    good_name
  )
  VALUES
  (
    4,
    'tovar3'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (4,4,5
  );
-------------------------------
INSERT
INTO goods
  (
    good_id,
    good_name
  )
  VALUES
  (
    5,
    'tovar4'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (5,5,5
  );
-- fill order table --
INSERT ALL
INTO orders
  (
    ORDER_ID
  )
  VALUES
  (
    2
  )
INTO orders
  (
    ORDER_ID
  )
  VALUES
  (
    3
  )
INTO orders
  (
    ORDER_ID
  )
  VALUES
  (
    4
  )
SELECT * FROM dual;
-- fill goods_orders table
-- order 1
INSERT ALL
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    2,2
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    2,3
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    2,4
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    2,5
  )
SELECT * FROM dual;
-- order 3
INSERT ALL
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    3,2
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    3,3
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    3,4
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    3,5
  )
SELECT * FROM dual;
-- order 3
INSERT ALL
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    4,2
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    4,3
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    4,4
  )
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    4,5
  )
SELECT * FROM dual;