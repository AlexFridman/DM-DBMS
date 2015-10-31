-- 3.1
SELECT COUNT(*) FROM ORDERS;
-- 3.2
SELECT SUM(GOODS_ORDERS.AMOUNT),
  SUM(GOODS_ORDERS.PRICE * GOODS_ORDERS.AMOUNT)
FROM ORDERS
JOIN GOODS_ORDERS
ON ORDERS.ORDER_ID    = GOODS_ORDERS.ORDER_ID
WHERE ORDERS.ORDER_ID = 5;
-- 3.3
SELECT NVL(SUM(ARRIVE_STOCKS.AMOUNT),0)
FROM SUPPLIERS
JOIN ARRIVE_STOCKS
ON SUPPLIERS.MANAGER_SUPPLIER_ID = ARRIVE_STOCKS.MANAGER_SUPPLIER_ID
JOIN STOCKS
ON STOCKS.STOCK_ID                  = ARRIVE_STOCKS.STOCK_ID
WHERE SUPPLIERS.MANAGER_SUPPLIER_ID = 3
AND STOCKS.GOOD_ID                  = 4;
-- 3.4
SELECT SUPPLIERS.MANAGER_SUPPLIER_ID,
  SUM(ARRIVE_STOCKS.Price)
FROM SUPPLIERS
JOIN ARRIVE_STOCKS
ON SUPPLIERS.MANAGER_SUPPLIER_ID = ARRIVE_STOCKS.MANAGER_SUPPLIER_ID
WHERE ARRIVE_STOCKS.ARRIVE_DATE BETWEEN TO_DATE ('2010/02/01', 'yyyy/mm/dd') AND TO_DATE ('2014/02/28', 'yyyy/mm/dd')
GROUP BY SUPPLIERS.MANAGER_SUPPLIER_ID;
-- 3.5
SELECT COUNT (*)
FROM
  (SELECT 1
  FROM STOCKS
  JOIN GOODS
  ON STOCKS.GOOD_ID     = GOODS.GOOD_ID
  WHERE GOODS.GOOD_NAME = 'Монитор'
  AND STOCKS.RESIDUE    > 0
  GROUP BY STOCKS.SPEC
  );
-- 3.6
SELECT EMPLOYEES.EMPLOYEE_ID,
  COUNT(*)
FROM EMPLOYEES
JOIN ORDERS
ON ORDERS.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID
WHERE ORDERS.ORDER_DATE BETWEEN TO_DATE ('2009/12/31', 'yyyy/mm/dd') AND TO_DATE ('2011/01/01', 'yyyy/mm/dd')
GROUP BY EMPLOYEES.EMPLOYEE_ID;

SELECT COUNT(*)
FROM ORDERS
WHERE ORDERS.ORDER_DATE BETWEEN TO_DATE ('2009/12/31', 'yyyy/mm/dd') AND TO_DATE ('2011/01/01', 'yyyy/mm/dd')
AND EMPLOYEE_ID IS NOT NULL;
-- 3.7
SELECT CLIENTS.MANAGER_NAME,
  COUNT(*)
FROM CLIENTS
JOIN ORDERS
ON ORDERS.MANAGER_CLIENT_ID = CLIENTS.MANAGER_CLIENT_ID
GROUP BY CLIENTS.MANAGER_NAME
ORDER BY CLIENTS.MANAGER_NAME;
-- 3.8
SELECT goods.GOOD_NAME
FROM stocks
JOIN goods
ON stocks.GOOD_ID = goods.GOOD_ID
GROUP BY goods.GOOD_NAME
HAVING SUM(stocks.RESIDUE) < 500;
-- 3.9
SELECT CLIENTS.MANAGER_CLIENT_ID
FROM CLIENTS
JOIN ORDERS
ON ORDERS.MANAGER_CLIENT_ID = CLIENTS.MANAGER_CLIENT_ID
GROUP BY CLIENTS.MANAGER_CLIENT_ID
HAVING SUM(ORDERS.TOTAL_AMOUNT) > 10000;