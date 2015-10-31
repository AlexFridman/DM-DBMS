-- 1.1
SELECT ORGANISATION_ID ,
  TAX_NUMBER ,
  ORGANISATION_NAME ,
  BOSS ,
  ADDRESS ,
  PHONE
FROM ORGANISATIONS;
-- 1.2
SELECT TAX_NUMBER ,
  ORGANISATION_NAME ,
  BOSS
FROM ORGANISATIONS
ORDER BY ORGANISATION_NAME;
-- 1.3
SELECT ORGANISATION_ID ,
  TAX_NUMBER ,
  ORGANISATION_NAME ,
  BOSS ,
  ADDRESS ,
  PHONE
FROM ORGANISATIONS
WHERE ORGANISATION_NAME = 'ООО "Гранит"';
-- 1.4
SELECT ORGANISATION_ID ,
  TAX_NUMBER ,
  ORGANISATION_NAME ,
  BOSS ,
  ADDRESS ,
  PHONE
FROM ORGANISATIONS
WHERE UPPER(ORGANISATION_NAME) LIKE 'ООО%';
-- 1.5
SELECT PRICE ,
  SPEC ,
  RESIDUE
FROM STOCKS
WHERE GOOD_ID = 101
AND RESIDUE    > 100;
-- 1.6
SELECT PRICE ,
  SPEC ,
  RESIDUE
FROM STOCKS
WHERE GOOD_ID = 500
ORDER BY PRICE DESC;
-- 2.1
SELECT orders.ORDER_ID,
  orders.INVOICE_NUMBER,
  orders.ORDER_DATE,
  orders.TOTAL_AMOUNT
FROM orders
JOIN EMPLOYEES
ON orders.EMPLOYEE_ID         = EMPLOYEES.EMPLOYEE_ID
WHERE EMPLOYEES.EMPLOYEE_NAME = 'Ружанская О.Л.'
AND orders.ORDER_DATE BETWEEN TO_DATE ('2010/02/01', 'yyyy/mm/dd') AND TO_DATE ('2010/02/28', 'yyyy/mm/dd');
-- 2.2
SELECT GOODS.GOOD_NAME,
  STOCKS.SPEC,
  STOCKS.RESIDUE
FROM STOCKS
JOIN GOODS
ON STOCKS.GOOD_ID     = GOODS.GOOD_ID
WHERE GOODS.GOOD_NAME = 'Монитор';
-- 2.3
SELECT GOODS.GOOD_NAME,
  STOCKS.SPEC,
  STOCKS.RESIDUE,
  ARRIVE_STOCKS.ARRIVE_DATE
FROM STOCKS
JOIN GOODS
ON STOCKS.GOOD_ID = GOODS.GOOD_ID
JOIN ARRIVE_STOCKS
ON STOCKS.STOCK_ID    = ARRIVE_STOCKS.STOCK_ID
WHERE GOODS.GOOD_NAME = 'Монитор'
ORDER BY STOCKS.SPEC,
  ARRIVE_STOCKS.ARRIVE_DATE;
-- 2.4
SELECT GOODS.GOOD_NAME,
  STOCKS.SPEC,
  ARRIVE_STOCKS.ARRIVE_DATE,
  STOCKS.RESIDUE,
  ORGANISATIONS.ORGANISATION_NAME
FROM STOCKS
JOIN GOODS
ON STOCKS.GOOD_ID = GOODS.GOOD_ID
JOIN ARRIVE_STOCKS
ON STOCKS.STOCK_ID = ARRIVE_STOCKS.STOCK_ID
JOIN SUPPLIERS
ON SUPPLIERS.MANAGER_SUPPLIER_ID = ARRIVE_STOCKS.MANAGER_SUPPLIER_ID
JOIN ORGANISATIONS
ON SUPPLIERS.ORGANISATION_ID        = ORGANISATIONS.ORGANISATION_ID
WHERE GOODS.GOOD_NAME               = 'Телевизор'
AND ORGANISATIONS.ORGANISATION_NAME = 'УП "Белкантон"';
-- 2.5
SELECT GOODS.GOOD_NAME,
  COUNT(*) as "COUNT"
FROM ORDERS
JOIN GOODS_ORDERS
ON ORDERS.ORDER_ID = GOODS_ORDERS.ORDER_ID
JOIN STOCKS
ON STOCKS.STOCK_ID = GOODS_ORDERS.STOCK_ID
JOIN GOODS
ON STOCKS.GOOD_ID     = GOODS.GOOD_ID
WHERE ORDERS.ORDER_ID = 13
GROUP BY GOODS.GOOD_NAME;
-- 2.6
SELECT CLIENTS.MANAGER_CLIENT_ID,
  ORDERS.ORDER_ID
FROM CLIENTS
JOIN ORDERS
ON ORDERS.MANAGER_CLIENT_ID = CLIENTS.MANAGER_CLIENT_ID
ORDER BY CLIENTS.MANAGER_CLIENT_ID;
-- 2.7
SELECT MANAGER_CLIENT_ID,
  ORDER_ID
FROM ORDERS
ORDER BY MANAGER_CLIENT_ID;
-- 2.8
SELECT GOOD_ID,
  GOOD_NAME
FROM goods
WHERE NOT EXISTS
  (SELECT STOCKS.GOOD_ID FROM STOCKS WHERE STOCKS.GOOD_ID = goods.GOOD_ID
  );