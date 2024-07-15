-- TẠO BẢNG CUSTOMERS
CREATE TABLE IF NOT EXISTS public.customers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    phone integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT customers_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;

-- TẠO BẢNG PRODUCTS
CREATE TABLE IF NOT EXISTS public.products
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default",
    code integer,
    price integer DEFAULT 0,
    "number" integer,
    status boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT products_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.products
    OWNER to postgres;

-- INSERT CUSTOMERS
INSERT INTO customers(name, email, phone)
VALUES
('Khach hang 1', 'khachhang1@gmail.com', 012345678),
('khach hang 2', 'khachhang2@gmail.com', 0987765432),
('khach hang 3', 'khachhang3@gmail.com', 09437843),
('khach hang 4', 'khachhang4@gmail.com', 03236372)

-- INSERT PRODUCTS
INSERT INTO products(name, code, price, number, status)
VALUES
('tu lanh', 001, 32000, 1, true),
('ti vi', 302, 20000, 1, true),
('may giat', 403, 100000, 1, true),
('xoong', 219, 5000, 2, false)

-- products_customers
INSERT INTO products_customers(customer_id, product_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 3),
(3, 2),
(4, 4)

-- XEM DANH SÁCH ĐƠN HÀNG
SELECT customers.name, email, phone,
COUNT(customer_id) AS number_product,
SUM(products.price) AS SUM_price,
status,
products_customers.created_at
FROM customers
INNER JOIN products_customers
ON customers.id = products_customers.customer_id
INNER JOIN products
ON products.id = products_customers.product_id
GROUP BY customers.name, email, phone,
status, products_customers.created_at

-- XEM CHI TIẾT ĐƠN HÀNG
SELECT customers.name, email, phone, products.name AS product_name,
products.code AS code_products, products.price AS price_product,
products.status AS status_product,
products_customers.created_at,
products_customers.updated_at
FROM customers
INNER JOIN products_customers
ON customers.id = products_customers.customer_id
INNER JOIN products
ON products.id = products_customers.product_id
















