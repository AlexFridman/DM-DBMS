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
  
INSERT INTO goods (good_id, good_name)
 SELECT 100, 'Телевизор' FROM dual UNION ALL 
 SELECT 101, 'Монитор' FROM dual UNION ALL 
 SELECT 200, 'Модуль памяти' FROM dual UNION ALL 
 SELECT 230, 'Флеш-память' FROM dual UNION ALL 
 SELECT 300, 'Материнская плата' FROM dual UNION ALL 
 SELECT 400, 'Видеокарта' FROM dual UNION ALL 
 SELECT 500, 'HD' FROM dual UNION ALL 
 SELECT 510, 'CD-ROM' FROM dual UNION ALL 
 SELECT 600, 'Корпус' FROM dual UNION ALL 
 SELECT 700, 'Принтер' FROM dual UNION ALL 
 SELECT 850, 'Источник БП' FROM dual UNION ALL 
 SELECT 940, 'Модем' FROM dual;
 
CREATE TABLE order_status
  (
    status_id   INT CONSTRAINT pk_order_status PRIMARY KEY,
    status_name VARCHAR2(40) NOT NULL
  );

INSERT INTO order_status (status_id, status_name)
 SELECT 1, 'Оформлен' FROM dual UNION ALL 
 SELECT 2, 'Оплачен' FROM dual UNION ALL 
 SELECT 3, 'Отгружен' FROM dual;
 
CREATE TABLE employees
  (
    employee_id       INT CONSTRAINT pk_employees PRIMARY KEY,
    employee_name     VARCHAR2(30),
    phone             VARCHAR2(30),
    employee_position VARCHAR2(30)
  );
  
INSERT INTO employees (employee_id, employee_name, employee_position, phone)
 SELECT 1, 'Вышинский Л.С.', 'Менеджер', '211-11-77' FROM dual UNION ALL 
 SELECT 2, 'Соболевская Ж.Д.', 'Кладовщик', '211-12-19' FROM dual UNION ALL 
 SELECT 3, 'Ружанская О.Л.', 'Менеджер', '211-11-79' FROM dual UNION ALL 
 SELECT 4, 'Котова Д.О.', 'Кладовщик', '211-12-20' FROM dual UNION ALL 
 SELECT 5, 'Трубова И.Л.', 'Менеджер', '211-11-76' FROM dual;
 
CREATE TABLE stocks
  (
    stock_id INT CONSTRAINT pk_stocks PRIMARY KEY,
    good_id  INT,
    price    INT,
    spec     VARCHAR2(30),
    residue  INT,
    place int
  );
  
  
INSERT INTO stocks (stock_id, good_id, spec, price, residue, place)
 SELECT 1, 100, 'Горизонт 700', 250, 110, 1 FROM dual UNION ALL 
 SELECT 2, 100, 'Горизонт 800', 300, 94, 1 FROM dual UNION ALL 
 SELECT 3, 101, 'Viewsonic 16', 180, 90, 2 FROM dual UNION ALL 
 SELECT 4, 101, 'LG 16', 160, 210, 2 FROM dual UNION ALL 
 SELECT 5, 101, 'Samsung 16', 215, 138, 2 FROM dual UNION ALL 
 SELECT 6, 101, 'Viewsonic 17', 200, 0, 2 FROM dual UNION ALL 
 SELECT 7, 101, 'LG 19', 260, 120, 3 FROM dual UNION ALL 
 SELECT 8, 500, 'HP 3,5gb', 160, 20, 13 FROM dual UNION ALL 
 SELECT 9, 500, 'HP 6gb', 180, 200, 13 FROM dual UNION ALL 
 SELECT 10, 500, 'HP 10gb', 210, 120, 13 FROM dual UNION ALL 
 SELECT 11, 500, 'LG 5gb', 150, 120, 14 FROM dual UNION ALL 
 SELECT 12, 700, 'Canon L111E', 150, 120, 33 FROM dual UNION ALL 
 SELECT 13, 700, 'Canon L112E', 160, 100, 33 FROM dual UNION ALL 
 SELECT 14, 700, 'HP 800M', 100, 50, 34 FROM dual UNION ALL 
 SELECT 15, 700, 'HP 1000L', 130, 200, 34 FROM dual UNION ALL 
 SELECT 16, 700, 'HP 1100L', 160, 100, 34 FROM dual UNION ALL 
 SELECT 17, 100, 'Sony 80', 300, 100, 1 FROM dual;
 
CREATE TABLE orders
  (
    order_id          INT CONSTRAINT pk_orders PRIMARY KEY,
    invoice_number    VARCHAR2(10),
    order_date        DATE,
    total_amount      INT,
    shipment_date     DATE,
    comments          VARCHAR2(30),
    manager_client_id INT,
    status_id         INT,
    employee_id       INT
  );
  
INSERT INTO orders (order_id, manager_client_id, employee_id, invoice_number, order_date, total_amount, status_id, shipment_date, comments)
 SELECT 1, 1, 1, 'X000100', to_date('2010-01-14', 'YYYY-MM-DD'), 4000, 3, to_date('2010-01-20', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 2, 2, 1, 'X000103', to_date('2010-01-14', 'YYYY-MM-DD'), 3470, 3, to_date('2010-01-19', 'YYYY-MM-DD'), 'Оплата налич.' FROM dual UNION ALL 
 SELECT 3, 1, 3, 'X000320', to_date('2010-03-24', 'YYYY-MM-DD'), 6000, 3, to_date('2010-03-29', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 4, 4, 3, 'X000109', to_date('2010-01-24', 'YYYY-MM-DD'), 2300, 3, to_date('2004-02-11', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 5, 5, 1, 'X000309', to_date('2010-03-14', 'YYYY-MM-DD'), 2300, 3, to_date('2010-02-02', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 6, 3, 3, 'X000209', to_date('2010-02-04', 'YYYY-MM-DD'), 6900, 3, to_date('2010-03-24', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 7, 4, 1, 'X000212', to_date('2010-02-06', 'YYYY-MM-DD'), 2000, 3, to_date('2010-02-14', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 8, 6, 3, 'X000220', to_date('2010-02-12', 'YYYY-MM-DD'), 3400, 3, to_date('2010-02-18', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 9, 7, 1, 'X000224', to_date('2010-02-14', 'YYYY-MM-DD'), 2000, 3, to_date('2010-02-19', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 10, 4, 1, 'X000224', to_date('2010-02-24', 'YYYY-MM-DD'), 6200, 3, to_date('2010-03-03', 'YYYY-MM-DD'), NULL FROM dual UNION ALL 
 SELECT 11, 6, 1, NULL, to_date('2010-03-20', 'YYYY-MM-DD'), 5350, 2, NULL, NULL FROM dual UNION ALL 
 SELECT 12, 3, 5, NULL, to_date('2010-04-05', 'YYYY-MM-DD'), 3300, 1, NULL, NULL FROM dual UNION ALL 
 SELECT 13, 2, 3, NULL, to_date('2010-04-02', 'YYYY-MM-DD'), 2100, 1, NULL, NULL FROM dual;
 
CREATE TABLE clients
  (
    manager_client_id INT CONSTRAINT pk_clients PRIMARY KEY,
    manager_name      VARCHAR2(30),
    phone             VARCHAR2(30),
    fax               VARCHAR2(30),
    organisation_id   INT
  );
  
INSERT INTO clients (manager_client_id, organisation_id, manager_name, phone, fax)
 SELECT 1, 1, 'Скорый И.С.', '222-30-17', '222-30-17' FROM dual UNION ALL 
 SELECT 2, 6, 'Сафронов Н.С.', '234-30-12', '232-50-17' FROM dual UNION ALL 
 SELECT 3, 1, 'Боровой А.С.', '251-46-87', '251-46-87' FROM dual UNION ALL 
 SELECT 4, 3, 'Алексеев О.В.', '211-26-17', '211-26-17' FROM dual UNION ALL 
 SELECT 5, 3, 'Макаров Д.С.', '221-06-07', '221-32-17' FROM dual UNION ALL 
 SELECT 6, 1, 'Коновалов Р.Л.', '222-30-17', '222-30-17' FROM dual UNION ALL 
 SELECT 7, 4, 'Хвостов А.Ж.', '255-30-97', NULL FROM dual UNION ALL 
 SELECT 8, 6, 'Круг Л.Л.', '213-16-87', '213-16-87' FROM dual;
 
CREATE TABLE organisations
  (
    organisation_id   INT CONSTRAINT pk_organisations PRIMARY KEY,
    tax_number        INT,
    organisation_name VARCHAR2(50),
    boss              VARCHAR2(30),
    address           VARCHAR2(100),
    phone             VARCHAR2(15)
  );
  
INSERT INTO organisations (organisation_id, tax_number, organisation_name, boss, phone, address)
 SELECT 1, '100128881', 'ООО "Винт"', 'Иванов И.И.', '222-30-17', 'г.Минск, ул. Бровки, 21' FROM dual UNION ALL 
 SELECT 2, '102023442', 'ЗАО "Белинвестторг"', 'Хорошев Х.И.', '221-06-07', 'г.Могилев, ул. Котовского, 12' FROM dual UNION ALL 
 SELECT 3, '100023390', 'ООО "Ветразь"', 'Бронштейн Я.И.', '234-30-10', 'г.Минск, пр.Скорины, 108, офис 12а' FROM dual UNION ALL 
 SELECT 4, '101100111', 'РУП "Трансгаз"', 'Петров П.И.', '605-32-17', 'г.Минск, ул. Беды, 11' FROM dual UNION ALL 
 SELECT 5, '100303122', 'ТУП "Белоптторг"', 'Сачек А.П.', '205-30-97', 'г.Брест, ул. Индустриальная, 20а' FROM dual UNION ALL 
 SELECT 6, '101002008', 'ООО "Гранит"', 'Серов И.Г.', '605-40-34', 'г.Гродно, ул. Солнечная, 1' FROM dual UNION ALL 
 SELECT 7, '101033300', 'УП "Белкантон"', 'Котелков И.И.', '330-60-43', 'г.Гродно, ул. Победы, 1' FROM dual;
 
CREATE TABLE suppliers
  (
    manager_supplier_id INT CONSTRAINT pk_suppliers PRIMARY KEY,
    supplier_manager    VARCHAR2(30),
    phone               VARCHAR2(30),
    fax                 VARCHAR2(30),
    organisation_id     INT
  );
  
INSERT INTO suppliers (manager_supplier_id, organisation_id, supplier_manager, phone, fax)
 SELECT 1, 2, 'Лушкин В.И.', '221-06-07', NULL FROM dual UNION ALL 
 SELECT 2, 5, 'Громов О.Ф.', '234-30-12', '232-50-17' FROM dual UNION ALL 
 SELECT 3, 7, 'Бронштейн А.С.', '251-46-87', '251-46-87' FROM dual UNION ALL 
 SELECT 4, 2, 'Коновалов Р.Л.', '330-60-43', NULL FROM dual UNION ALL 
 SELECT 5, 5, 'Петров П.Л.', '205-30-97', NULL FROM dual;
 
CREATE TABLE arrive_stocks
  (
    stock_id            INT,
    arrive_date         DATE,
    manager_supplier_id INT,
    invoice_number      VARCHAR2(10),
    amount              INT,
    price               INT,
    inspector           VARCHAR2(30),
    CONSTRAINT pk_arrive_stocks PRIMARY KEY (stock_id, arrive_date)
  );
  
INSERT INTO arrive_stocks (stock_id, arrive_date, manager_supplier_id, invoice_number, amount, price, inspector)
 SELECT 1, to_date('2010-01-03', 'YYYY-MM-DD'), 1, 'Z000100', 94, 200, 2 FROM dual UNION ALL 
 SELECT 1, to_date('2010-02-12', 'YYYY-MM-DD'), 1, 'Z001201', 30, 200, 2 FROM dual UNION ALL 
 SELECT 2, to_date('2010-01-03', 'YYYY-MM-DD'), 1, 'Z000100', 114, 350, 2 FROM dual UNION ALL 
 SELECT 3, to_date('2010-01-05', 'YYYY-MM-DD'), 2, 'Q002350', 60, 140, 2 FROM dual UNION ALL 
 SELECT 3, to_date('2010-02-15', 'YYYY-MM-DD'), 2, 'Q002521', 50, 140, 2 FROM dual UNION ALL 
 SELECT 4, to_date('2010-01-03', 'YYYY-MM-DD'), 3, 'W043333', 240, 110, 4 FROM dual UNION ALL 
 SELECT 4, to_date('2010-03-08', 'YYYY-MM-DD'), 3, 'W043656', 100, 110, 4 FROM dual UNION ALL 
 SELECT 5, to_date('2010-01-03', 'YYYY-MM-DD'), 3, 'W043333', 168, 175, 4 FROM dual UNION ALL 
 SELECT 6, to_date('2010-01-03', 'YYYY-MM-DD'), 3, 'W043333', 20, 140, 4 FROM dual UNION ALL 
 SELECT 7, to_date('2010-01-03', 'YYYY-MM-DD'), 3, 'W043333', 100, 210, 4 FROM dual UNION ALL 
 SELECT 7, to_date('2010-03-05', 'YYYY-MM-DD'), 3, 'Q011999', 30, 210, 4 FROM dual UNION ALL 
 SELECT 8, to_date('2010-01-12', 'YYYY-MM-DD'), 4, 'S110099', 20, 120, 2 FROM dual UNION ALL 
 SELECT 9, to_date('2010-01-12', 'YYYY-MM-DD'), 4, 'S110099', 200, 135, 2 FROM dual UNION ALL 
 SELECT 10, to_date('2010-01-12', 'YYYY-MM-DD'), 4, 'S110099', 130, 175, 2 FROM dual UNION ALL 
 SELECT 11, to_date('2010-01-12', 'YYYY-MM-DD'), 4, 'S110099', 120, 110, 2 FROM dual UNION ALL 
 SELECT 12, to_date('2010-01-12', 'YYYY-MM-DD'), 2, 'Q012222', 101, 110, 4 FROM dual UNION ALL 
 SELECT 12, to_date('2010-02-22', 'YYYY-MM-DD'), 2, 'Q014221', 50, 110, 4 FROM dual UNION ALL 
 SELECT 13, to_date('2010-01-12', 'YYYY-MM-DD'), 2, 'Q012222', 65, 115, 4 FROM dual UNION ALL 
 SELECT 13, to_date('2010-02-22', 'YYYY-MM-DD'), 2, 'Q014221', 50, 115, 4 FROM dual UNION ALL 
 SELECT 14, to_date('2010-01-12', 'YYYY-MM-DD'), 1, 'Z001055', 100, 75, 2 FROM dual UNION ALL 
 SELECT 15, to_date('2010-01-12', 'YYYY-MM-DD'), 1, 'Z001055', 210, 95, 2 FROM dual UNION ALL 
 SELECT 16, to_date('2010-01-12', 'YYYY-MM-DD'), 1, 'Z001055', 122, 110, 2 FROM dual UNION ALL 
 SELECT 17, to_date('2010-01-15', 'YYYY-MM-DD'), 3, 'W043678', 30, 250, 4 FROM dual UNION ALL 
 SELECT 17, to_date('2010-03-05', 'YYYY-MM-DD'), 3, 'W044735', 100, 250, 4 FROM dual;
 
CREATE TABLE goods_orders
  (
    order_id INT,
    stock_id INT,
    amount   INT,
    price    INT,
    CONSTRAINT pk_goods_orders PRIMARY KEY (order_id, stock_id)
  );
  
INSERT INTO goods_orders (order_id, stock_id, amount, price)
 SELECT 1, 1, 4, 250 FROM dual UNION ALL 
 SELECT 1, 2, 10, 300 FROM dual UNION ALL 
 SELECT 2, 6, 20, 200 FROM dual UNION ALL 
 SELECT 2, 12, 1, 150 FROM dual UNION ALL 
 SELECT 2, 14, 10, 100 FROM dual UNION ALL 
 SELECT 2, 16, 2, 160 FROM dual UNION ALL 
 SELECT 3, 2, 10, 300 FROM dual UNION ALL 
 SELECT 3, 17, 10, 300 FROM dual UNION ALL 
 SELECT 4, 12, 10, 150 FROM dual UNION ALL 
 SELECT 4, 13, 5, 160 FROM dual UNION ALL 
 SELECT 5, 14, 20, 100 FROM dual UNION ALL 
 SELECT 5, 15, 10, 130 FROM dual UNION ALL 
 SELECT 5, 16, 10, 160 FROM dual UNION ALL 
 SELECT 6, 5, 20, 215 FROM dual UNION ALL 
 SELECT 6, 7, 10, 260 FROM dual UNION ALL 
 SELECT 7, 14, 20, 100 FROM dual UNION ALL 
 SELECT 8, 3, 10, 180 FROM dual UNION ALL 
 SELECT 8, 4, 10, 160 FROM dual UNION ALL 
 SELECT 9, 17, 20, 100 FROM dual UNION ALL 
 SELECT 10, 12, 20, 150 FROM dual UNION ALL 
 SELECT 10, 13, 10, 160 FROM dual UNION ALL 
 SELECT 10, 16, 10, 160 FROM dual UNION ALL 
 SELECT 11, 4, 20, 160 FROM dual UNION ALL 
 SELECT 11, 5, 10, 250 FROM dual UNION ALL 
 SELECT 12, 10, 10, 210 FROM dual UNION ALL 
 SELECT 13, 1, 10, 250 FROM dual UNION ALL 
 SELECT 13, 3, 10, 180 FROM dual;
 
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