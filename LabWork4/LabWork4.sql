DELETE FROM ORGANISATIONS;
DELETE FROM goods;
DELETE FROM stocks;
DELETE FROM suppliers;
DELETE FROM clients;
DELETE FROM goods_orders;
-- 1.1
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
-- 1.2
UPDATE ORGANISATIONS
SET boss               ='Smirnov'
WHERE ORGANISATION_NAME='Belvest';
-- 1.3
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
-- 1.4
INSERT
INTO organisations
  (
    ORGANISATION_ID,
    ORGANISATION_NAME
  )
  VALUES
  (
    2,
    'Postavshik'
  );
INSERT INTO suppliers
  (manager_supplier_id, organisation_id
  ) VALUES
  (1,2
  );
INSERT
INTO organisations
  (
    ORGANISATION_ID,
    ORGANISATION_NAME
  )
  VALUES
  (
    3,
    'Klient'
  );
INSERT INTO clients
  (manager_client_id, organisation_id
  ) VALUES
  (1,3
  );
-- 1.5
INSERT INTO goods_orders
  (AMOUNT,ORDER_ID,STOCK_ID
  ) VALUES
  (5,1,1
  );
INSERT INTO orders
  (ORDER_ID
  ) VALUES
  (1
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
INSERT INTO goods
  (good_id, good_name
  ) VALUES
  (3, 'tovar2'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (3,3,5
  );
INSERT INTO goods
  (good_id, good_name
  ) VALUES
  (4, 'tovar3'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (4,4,5
  );
INSERT INTO goods
  (good_id, good_name
  ) VALUES
  (5, 'tovar4'
  );
INSERT INTO stocks
  (STOCK_ID, good_id, residue
  ) VALUES
  (5,5,5
  );
-- fill order table
INSERT INTO orders
  (ORDER_ID
  ) VALUES
  (2
  );
INSERT INTO orders
  (ORDER_ID
  ) VALUES
  (3
  );
INSERT INTO orders
  (ORDER_ID
  ) VALUES
  (4
  );
-- fill goods_orders table
-- order 1
INSERT
INTO goods_orders
  (
    ORDER_ID,
    STOCK_ID
  )
  VALUES
  (
    2,2
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (2,3
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (2,4
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (2,5
  );
-- order 3
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (3,2
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (3,3
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (3,4
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (3,5
  );
-- order 3
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (4,2
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (4,3
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (4,4
  );
INSERT INTO goods_orders
  (ORDER_ID,STOCK_ID
  ) VALUES
  (4,5
  ); 