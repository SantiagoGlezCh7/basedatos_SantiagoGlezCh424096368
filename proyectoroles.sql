toc.dat                                                                                             0000600 0004000 0002000 00000054057 15013157507 0014456 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                        }            car_company    17.3    17.3 G    p           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false         q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false         r           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false         s           1262    49424    car_company    DATABASE     ~   CREATE DATABASE car_company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE car_company;
                     postgres    false                     2615    49436    operaciones    SCHEMA        CREATE SCHEMA operaciones;
    DROP SCHEMA operaciones;
                     postgres    false         t           0    0    SCHEMA operaciones    ACL     �   GRANT USAGE ON SCHEMA operaciones TO director_general;
GRANT USAGE ON SCHEMA operaciones TO director_operaciones;
GRANT USAGE ON SCHEMA operaciones TO gerente_sucursal;
                        postgres    false    7                     2615    49435    ventas    SCHEMA        CREATE SCHEMA ventas;
    DROP SCHEMA ventas;
                     director_operaciones    false         u           0    0    SCHEMA ventas    ACL     �   GRANT USAGE ON SCHEMA ventas TO gerente_sucursal;
GRANT USAGE ON SCHEMA ventas TO vendedor;
GRANT USAGE ON SCHEMA ventas TO cliente;
                        director_operaciones    false    6         �            1259    62821 	   employees    TABLE     �   CREATE TABLE operaciones.employees (
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    "position" character varying(50) NOT NULL,
    hire_date date NOT NULL,
    salary numeric(10,2)
);
 "   DROP TABLE operaciones.employees;
       operaciones         heap r       admin_superuser     false    7         �            1259    62820    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE operaciones.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE operaciones.employees_employee_id_seq;
       operaciones               admin_superuser     false    226    7         v           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE operaciones.employees_employee_id_seq OWNED BY operaciones.employees.employee_id;
          operaciones               admin_superuser     false    225         �            1259    62841    inventory_parts    TABLE     �   CREATE TABLE operaciones.inventory_parts (
    part_id integer NOT NULL,
    quantity integer NOT NULL,
    cost numeric(10,2) NOT NULL
);
 (   DROP TABLE operaciones.inventory_parts;
       operaciones         heap r       postgres    false    7         �            1259    62828    parts    TABLE     �   CREATE TABLE operaciones.parts (
    part_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    supplier_id integer,
    price numeric(10,2) NOT NULL
);
    DROP TABLE operaciones.parts;
       operaciones         heap r       postgres    false    7         �            1259    62827    parts_part_id_seq    SEQUENCE     �   CREATE SEQUENCE operaciones.parts_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE operaciones.parts_part_id_seq;
       operaciones               postgres    false    7    228         w           0    0    parts_part_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE operaciones.parts_part_id_seq OWNED BY operaciones.parts.part_id;
          operaciones               postgres    false    227         �            1259    62876    service_records    TABLE     �   CREATE TABLE operaciones.service_records (
    service_id integer NOT NULL,
    car_id integer NOT NULL,
    employee_id integer NOT NULL,
    service_date date NOT NULL,
    description text,
    cost numeric(10,2) NOT NULL
);
 (   DROP TABLE operaciones.service_records;
       operaciones         heap r       postgres    false    7         �            1259    62875    service_records_service_id_seq    SEQUENCE     �   CREATE SEQUENCE operaciones.service_records_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE operaciones.service_records_service_id_seq;
       operaciones               postgres    false    233    7         x           0    0    service_records_service_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE operaciones.service_records_service_id_seq OWNED BY operaciones.service_records.service_id;
          operaciones               postgres    false    232         �            1259    62812 	   suppliers    TABLE     �   CREATE TABLE operaciones.suppliers (
    supplier_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contact_info text,
    product_type character varying(50)
);
 "   DROP TABLE operaciones.suppliers;
       operaciones         heap r       postgres    false    7         �            1259    62811    suppliers_supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE operaciones.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE operaciones.suppliers_supplier_id_seq;
       operaciones               postgres    false    7    224         y           0    0    suppliers_supplier_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE operaciones.suppliers_supplier_id_seq OWNED BY operaciones.suppliers.supplier_id;
          operaciones               postgres    false    223         �            1259    62798    cars    TABLE       CREATE TABLE ventas.cars (
    car_id integer NOT NULL,
    make character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    year integer NOT NULL,
    vin character varying(17) NOT NULL,
    color character varying(20),
    price numeric(10,2) NOT NULL
);
    DROP TABLE ventas.cars;
       ventas         heap r       postgres    false    6         �            1259    62797    cars_car_id_seq    SEQUENCE     �   CREATE SEQUENCE ventas.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE ventas.cars_car_id_seq;
       ventas               postgres    false    222    6         z           0    0    cars_car_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE ventas.cars_car_id_seq OWNED BY ventas.cars.car_id;
          ventas               postgres    false    221         �            1259    62789 	   customers    TABLE     �   CREATE TABLE ventas.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    phone character varying(20),
    address text
);
    DROP TABLE ventas.customers;
       ventas         heap r       postgres    false    6         �            1259    62788    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE ventas.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE ventas.customers_customer_id_seq;
       ventas               postgres    false    6    220         {           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE ventas.customers_customer_id_seq OWNED BY ventas.customers.customer_id;
          ventas               postgres    false    219         �            1259    62852    sales    TABLE     �   CREATE TABLE ventas.sales (
    sale_id integer NOT NULL,
    customer_id integer NOT NULL,
    car_id integer NOT NULL,
    employee_id integer NOT NULL,
    sale_date date NOT NULL,
    sale_price numeric(10,2) NOT NULL
);
    DROP TABLE ventas.sales;
       ventas         heap r       postgres    false    6         �            1259    62851    sales_sale_id_seq    SEQUENCE     �   CREATE SEQUENCE ventas.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE ventas.sales_sale_id_seq;
       ventas               postgres    false    6    231         |           0    0    sales_sale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE ventas.sales_sale_id_seq OWNED BY ventas.sales.sale_id;
          ventas               postgres    false    230         �           2604    62824    employees employee_id    DEFAULT     �   ALTER TABLE ONLY operaciones.employees ALTER COLUMN employee_id SET DEFAULT nextval('operaciones.employees_employee_id_seq'::regclass);
 I   ALTER TABLE operaciones.employees ALTER COLUMN employee_id DROP DEFAULT;
       operaciones               admin_superuser     false    226    225    226         �           2604    62831    parts part_id    DEFAULT     x   ALTER TABLE ONLY operaciones.parts ALTER COLUMN part_id SET DEFAULT nextval('operaciones.parts_part_id_seq'::regclass);
 A   ALTER TABLE operaciones.parts ALTER COLUMN part_id DROP DEFAULT;
       operaciones               postgres    false    227    228    228         �           2604    62879    service_records service_id    DEFAULT     �   ALTER TABLE ONLY operaciones.service_records ALTER COLUMN service_id SET DEFAULT nextval('operaciones.service_records_service_id_seq'::regclass);
 N   ALTER TABLE operaciones.service_records ALTER COLUMN service_id DROP DEFAULT;
       operaciones               postgres    false    232    233    233         �           2604    62815    suppliers supplier_id    DEFAULT     �   ALTER TABLE ONLY operaciones.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('operaciones.suppliers_supplier_id_seq'::regclass);
 I   ALTER TABLE operaciones.suppliers ALTER COLUMN supplier_id DROP DEFAULT;
       operaciones               postgres    false    224    223    224         �           2604    62801    cars car_id    DEFAULT     j   ALTER TABLE ONLY ventas.cars ALTER COLUMN car_id SET DEFAULT nextval('ventas.cars_car_id_seq'::regclass);
 :   ALTER TABLE ventas.cars ALTER COLUMN car_id DROP DEFAULT;
       ventas               postgres    false    221    222    222         �           2604    62792    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY ventas.customers ALTER COLUMN customer_id SET DEFAULT nextval('ventas.customers_customer_id_seq'::regclass);
 D   ALTER TABLE ventas.customers ALTER COLUMN customer_id DROP DEFAULT;
       ventas               postgres    false    220    219    220         �           2604    62855    sales sale_id    DEFAULT     n   ALTER TABLE ONLY ventas.sales ALTER COLUMN sale_id SET DEFAULT nextval('ventas.sales_sale_id_seq'::regclass);
 <   ALTER TABLE ventas.sales ALTER COLUMN sale_id DROP DEFAULT;
       ventas               postgres    false    231    230    231         f          0    62821 	   employees 
   TABLE DATA           Z   COPY operaciones.employees (employee_id, name, "position", hire_date, salary) FROM stdin;
    operaciones               admin_superuser     false    226       4966.dat i          0    62841    inventory_parts 
   TABLE DATA           G   COPY operaciones.inventory_parts (part_id, quantity, cost) FROM stdin;
    operaciones               postgres    false    229       4969.dat h          0    62828    parts 
   TABLE DATA           T   COPY operaciones.parts (part_id, name, description, supplier_id, price) FROM stdin;
    operaciones               postgres    false    228       4968.dat m          0    62876    service_records 
   TABLE DATA           p   COPY operaciones.service_records (service_id, car_id, employee_id, service_date, description, cost) FROM stdin;
    operaciones               postgres    false    233       4973.dat d          0    62812 	   suppliers 
   TABLE DATA           W   COPY operaciones.suppliers (supplier_id, name, contact_info, product_type) FROM stdin;
    operaciones               postgres    false    224       4964.dat b          0    62798    cars 
   TABLE DATA           L   COPY ventas.cars (car_id, make, model, year, vin, color, price) FROM stdin;
    ventas               postgres    false    222       4962.dat `          0    62789 	   customers 
   TABLE DATA           M   COPY ventas.customers (customer_id, name, email, phone, address) FROM stdin;
    ventas               postgres    false    220       4960.dat k          0    62852    sales 
   TABLE DATA           a   COPY ventas.sales (sale_id, customer_id, car_id, employee_id, sale_date, sale_price) FROM stdin;
    ventas               postgres    false    231       4971.dat }           0    0    employees_employee_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('operaciones.employees_employee_id_seq', 1, true);
          operaciones               admin_superuser     false    225         ~           0    0    parts_part_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('operaciones.parts_part_id_seq', 1, false);
          operaciones               postgres    false    227                    0    0    service_records_service_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('operaciones.service_records_service_id_seq', 1, false);
          operaciones               postgres    false    232         �           0    0    suppliers_supplier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('operaciones.suppliers_supplier_id_seq', 1, false);
          operaciones               postgres    false    223         �           0    0    cars_car_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('ventas.cars_car_id_seq', 3, true);
          ventas               postgres    false    221         �           0    0    customers_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('ventas.customers_customer_id_seq', 1, true);
          ventas               postgres    false    219         �           0    0    sales_sale_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('ventas.sales_sale_id_seq', 4, true);
          ventas               postgres    false    230         �           2606    62826    employees employees_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY operaciones.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 G   ALTER TABLE ONLY operaciones.employees DROP CONSTRAINT employees_pkey;
       operaciones                 admin_superuser     false    226         �           2606    62845 $   inventory_parts inventory_parts_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY operaciones.inventory_parts
    ADD CONSTRAINT inventory_parts_pkey PRIMARY KEY (part_id);
 S   ALTER TABLE ONLY operaciones.inventory_parts DROP CONSTRAINT inventory_parts_pkey;
       operaciones                 postgres    false    229         �           2606    62835    parts parts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY operaciones.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_id);
 ?   ALTER TABLE ONLY operaciones.parts DROP CONSTRAINT parts_pkey;
       operaciones                 postgres    false    228         �           2606    62883 $   service_records service_records_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_pkey PRIMARY KEY (service_id);
 S   ALTER TABLE ONLY operaciones.service_records DROP CONSTRAINT service_records_pkey;
       operaciones                 postgres    false    233         �           2606    62819    suppliers suppliers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY operaciones.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 G   ALTER TABLE ONLY operaciones.suppliers DROP CONSTRAINT suppliers_pkey;
       operaciones                 postgres    false    224         �           2606    62803    cars cars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY ventas.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);
 8   ALTER TABLE ONLY ventas.cars DROP CONSTRAINT cars_pkey;
       ventas                 postgres    false    222         �           2606    62805    cars cars_vin_key 
   CONSTRAINT     K   ALTER TABLE ONLY ventas.cars
    ADD CONSTRAINT cars_vin_key UNIQUE (vin);
 ;   ALTER TABLE ONLY ventas.cars DROP CONSTRAINT cars_vin_key;
       ventas                 postgres    false    222         �           2606    62796    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY ventas.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY ventas.customers DROP CONSTRAINT customers_pkey;
       ventas                 postgres    false    220         �           2606    62859    sales sales_car_id_key 
   CONSTRAINT     S   ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_car_id_key UNIQUE (car_id);
 @   ALTER TABLE ONLY ventas.sales DROP CONSTRAINT sales_car_id_key;
       ventas                 postgres    false    231         �           2606    62857    sales sales_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);
 :   ALTER TABLE ONLY ventas.sales DROP CONSTRAINT sales_pkey;
       ventas                 postgres    false    231         �           2606    62846 ,   inventory_parts inventory_parts_part_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY operaciones.inventory_parts
    ADD CONSTRAINT inventory_parts_part_id_fkey FOREIGN KEY (part_id) REFERENCES operaciones.parts(part_id);
 [   ALTER TABLE ONLY operaciones.inventory_parts DROP CONSTRAINT inventory_parts_part_id_fkey;
       operaciones               postgres    false    229    4798    228         �           2606    62836    parts parts_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY operaciones.parts
    ADD CONSTRAINT parts_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES operaciones.suppliers(supplier_id);
 K   ALTER TABLE ONLY operaciones.parts DROP CONSTRAINT parts_supplier_id_fkey;
       operaciones               postgres    false    228    4794    224         �           2606    62884 +   service_records service_records_car_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_car_id_fkey FOREIGN KEY (car_id) REFERENCES ventas.cars(car_id);
 Z   ALTER TABLE ONLY operaciones.service_records DROP CONSTRAINT service_records_car_id_fkey;
       operaciones               postgres    false    233    222    4790         �           2606    62889 0   service_records service_records_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES operaciones.employees(employee_id);
 _   ALTER TABLE ONLY operaciones.service_records DROP CONSTRAINT service_records_employee_id_fkey;
       operaciones               postgres    false    233    4796    226         �           2606    62865    sales sales_car_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_car_id_fkey FOREIGN KEY (car_id) REFERENCES ventas.cars(car_id);
 A   ALTER TABLE ONLY ventas.sales DROP CONSTRAINT sales_car_id_fkey;
       ventas               postgres    false    222    231    4790         �           2606    62860    sales sales_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES ventas.customers(customer_id);
 F   ALTER TABLE ONLY ventas.sales DROP CONSTRAINT sales_customer_id_fkey;
       ventas               postgres    false    220    231    4788         �           2606    62870    sales sales_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES operaciones.employees(employee_id);
 F   ALTER TABLE ONLY ventas.sales DROP CONSTRAINT sales_employee_id_fkey;
       ventas               postgres    false    226    231    4796         !           826    49438    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     V  ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT,REFERENCES ON TABLES TO director_general;
ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT ON TABLES TO director_operaciones;
ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT ON TABLES TO gerente_sucursal;
          operaciones               dueño    false    7                     826    49437    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ;  ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT REFERENCES ON TABLES TO "dueño";
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,DELETE,UPDATE ON TABLES TO director_operaciones;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,UPDATE ON TABLES TO gerente_sucursal;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,UPDATE ON TABLES TO vendedor;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT SELECT ON TABLES TO cliente;
          ventas               director_general    false    6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4966.dat                                                                                            0000600 0004000 0002000 00000000057 15013157507 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Ana Gómez	Vendedora	2025-01-15	3000.00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 4969.dat                                                                                            0000600 0004000 0002000 00000000005 15013157507 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4968.dat                                                                                            0000600 0004000 0002000 00000000005 15013157507 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4973.dat                                                                                            0000600 0004000 0002000 00000000005 15013157507 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4964.dat                                                                                            0000600 0004000 0002000 00000000005 15013157507 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4962.dat                                                                                            0000600 0004000 0002000 00000000073 15013157507 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Toyota	Corolla	2023	1HGCM82633A004352	Azul	25000.00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                     4960.dat                                                                                            0000600 0004000 0002000 00000000060 15013157507 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Juan Pérez	juan@example.com	555-1234	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                4971.dat                                                                                            0000600 0004000 0002000 00000000041 15013157507 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	1	1	1	2025-04-18	26000.00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000043260 15013157507 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE car_company;
--
-- Name: car_company; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE car_company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE car_company OWNER TO postgres;

\connect car_company

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: operaciones; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA operaciones;


ALTER SCHEMA operaciones OWNER TO postgres;

--
-- Name: ventas; Type: SCHEMA; Schema: -; Owner: director_operaciones
--

CREATE SCHEMA ventas;


ALTER SCHEMA ventas OWNER TO director_operaciones;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employees; Type: TABLE; Schema: operaciones; Owner: admin_superuser 
--

CREATE TABLE operaciones.employees (
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    "position" character varying(50) NOT NULL,
    hire_date date NOT NULL,
    salary numeric(10,2)
);


ALTER TABLE operaciones.employees OWNER TO "admin_superuser ";

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: admin_superuser 
--

CREATE SEQUENCE operaciones.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operaciones.employees_employee_id_seq OWNER TO "admin_superuser ";

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: admin_superuser 
--

ALTER SEQUENCE operaciones.employees_employee_id_seq OWNED BY operaciones.employees.employee_id;


--
-- Name: inventory_parts; Type: TABLE; Schema: operaciones; Owner: postgres
--

CREATE TABLE operaciones.inventory_parts (
    part_id integer NOT NULL,
    quantity integer NOT NULL,
    cost numeric(10,2) NOT NULL
);


ALTER TABLE operaciones.inventory_parts OWNER TO postgres;

--
-- Name: parts; Type: TABLE; Schema: operaciones; Owner: postgres
--

CREATE TABLE operaciones.parts (
    part_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    supplier_id integer,
    price numeric(10,2) NOT NULL
);


ALTER TABLE operaciones.parts OWNER TO postgres;

--
-- Name: parts_part_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: postgres
--

CREATE SEQUENCE operaciones.parts_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operaciones.parts_part_id_seq OWNER TO postgres;

--
-- Name: parts_part_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: postgres
--

ALTER SEQUENCE operaciones.parts_part_id_seq OWNED BY operaciones.parts.part_id;


--
-- Name: service_records; Type: TABLE; Schema: operaciones; Owner: postgres
--

CREATE TABLE operaciones.service_records (
    service_id integer NOT NULL,
    car_id integer NOT NULL,
    employee_id integer NOT NULL,
    service_date date NOT NULL,
    description text,
    cost numeric(10,2) NOT NULL
);


ALTER TABLE operaciones.service_records OWNER TO postgres;

--
-- Name: service_records_service_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: postgres
--

CREATE SEQUENCE operaciones.service_records_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operaciones.service_records_service_id_seq OWNER TO postgres;

--
-- Name: service_records_service_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: postgres
--

ALTER SEQUENCE operaciones.service_records_service_id_seq OWNED BY operaciones.service_records.service_id;


--
-- Name: suppliers; Type: TABLE; Schema: operaciones; Owner: postgres
--

CREATE TABLE operaciones.suppliers (
    supplier_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contact_info text,
    product_type character varying(50)
);


ALTER TABLE operaciones.suppliers OWNER TO postgres;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: postgres
--

CREATE SEQUENCE operaciones.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE operaciones.suppliers_supplier_id_seq OWNER TO postgres;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: postgres
--

ALTER SEQUENCE operaciones.suppliers_supplier_id_seq OWNED BY operaciones.suppliers.supplier_id;


--
-- Name: cars; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.cars (
    car_id integer NOT NULL,
    make character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    year integer NOT NULL,
    vin character varying(17) NOT NULL,
    color character varying(20),
    price numeric(10,2) NOT NULL
);


ALTER TABLE ventas.cars OWNER TO postgres;

--
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.cars_car_id_seq OWNER TO postgres;

--
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.cars_car_id_seq OWNED BY ventas.cars.car_id;


--
-- Name: customers; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    phone character varying(20),
    address text
);


ALTER TABLE ventas.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.customers_customer_id_seq OWNED BY ventas.customers.customer_id;


--
-- Name: sales; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.sales (
    sale_id integer NOT NULL,
    customer_id integer NOT NULL,
    car_id integer NOT NULL,
    employee_id integer NOT NULL,
    sale_date date NOT NULL,
    sale_price numeric(10,2) NOT NULL
);


ALTER TABLE ventas.sales OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.sales_sale_id_seq OWNER TO postgres;

--
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.sales_sale_id_seq OWNED BY ventas.sales.sale_id;


--
-- Name: employees employee_id; Type: DEFAULT; Schema: operaciones; Owner: admin_superuser 
--

ALTER TABLE ONLY operaciones.employees ALTER COLUMN employee_id SET DEFAULT nextval('operaciones.employees_employee_id_seq'::regclass);


--
-- Name: parts part_id; Type: DEFAULT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.parts ALTER COLUMN part_id SET DEFAULT nextval('operaciones.parts_part_id_seq'::regclass);


--
-- Name: service_records service_id; Type: DEFAULT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.service_records ALTER COLUMN service_id SET DEFAULT nextval('operaciones.service_records_service_id_seq'::regclass);


--
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('operaciones.suppliers_supplier_id_seq'::regclass);


--
-- Name: cars car_id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cars ALTER COLUMN car_id SET DEFAULT nextval('ventas.cars_car_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.customers ALTER COLUMN customer_id SET DEFAULT nextval('ventas.customers_customer_id_seq'::regclass);


--
-- Name: sales sale_id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales ALTER COLUMN sale_id SET DEFAULT nextval('ventas.sales_sale_id_seq'::regclass);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: operaciones; Owner: admin_superuser 
--

COPY operaciones.employees (employee_id, name, "position", hire_date, salary) FROM stdin;
\.
COPY operaciones.employees (employee_id, name, "position", hire_date, salary) FROM '$$PATH$$/4966.dat';

--
-- Data for Name: inventory_parts; Type: TABLE DATA; Schema: operaciones; Owner: postgres
--

COPY operaciones.inventory_parts (part_id, quantity, cost) FROM stdin;
\.
COPY operaciones.inventory_parts (part_id, quantity, cost) FROM '$$PATH$$/4969.dat';

--
-- Data for Name: parts; Type: TABLE DATA; Schema: operaciones; Owner: postgres
--

COPY operaciones.parts (part_id, name, description, supplier_id, price) FROM stdin;
\.
COPY operaciones.parts (part_id, name, description, supplier_id, price) FROM '$$PATH$$/4968.dat';

--
-- Data for Name: service_records; Type: TABLE DATA; Schema: operaciones; Owner: postgres
--

COPY operaciones.service_records (service_id, car_id, employee_id, service_date, description, cost) FROM stdin;
\.
COPY operaciones.service_records (service_id, car_id, employee_id, service_date, description, cost) FROM '$$PATH$$/4973.dat';

--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: operaciones; Owner: postgres
--

COPY operaciones.suppliers (supplier_id, name, contact_info, product_type) FROM stdin;
\.
COPY operaciones.suppliers (supplier_id, name, contact_info, product_type) FROM '$$PATH$$/4964.dat';

--
-- Data for Name: cars; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.cars (car_id, make, model, year, vin, color, price) FROM stdin;
\.
COPY ventas.cars (car_id, make, model, year, vin, color, price) FROM '$$PATH$$/4962.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.customers (customer_id, name, email, phone, address) FROM stdin;
\.
COPY ventas.customers (customer_id, name, email, phone, address) FROM '$$PATH$$/4960.dat';

--
-- Data for Name: sales; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.sales (sale_id, customer_id, car_id, employee_id, sale_date, sale_price) FROM stdin;
\.
COPY ventas.sales (sale_id, customer_id, car_id, employee_id, sale_date, sale_price) FROM '$$PATH$$/4971.dat';

--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: admin_superuser 
--

SELECT pg_catalog.setval('operaciones.employees_employee_id_seq', 1, true);


--
-- Name: parts_part_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: postgres
--

SELECT pg_catalog.setval('operaciones.parts_part_id_seq', 1, false);


--
-- Name: service_records_service_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: postgres
--

SELECT pg_catalog.setval('operaciones.service_records_service_id_seq', 1, false);


--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: postgres
--

SELECT pg_catalog.setval('operaciones.suppliers_supplier_id_seq', 1, false);


--
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.cars_car_id_seq', 3, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.customers_customer_id_seq', 1, true);


--
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.sales_sale_id_seq', 4, true);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: admin_superuser 
--

ALTER TABLE ONLY operaciones.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: inventory_parts inventory_parts_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.inventory_parts
    ADD CONSTRAINT inventory_parts_pkey PRIMARY KEY (part_id);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_id);


--
-- Name: service_records service_records_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_pkey PRIMARY KEY (service_id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);


--
-- Name: cars cars_vin_key; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cars
    ADD CONSTRAINT cars_vin_key UNIQUE (vin);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: sales sales_car_id_key; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_car_id_key UNIQUE (car_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- Name: inventory_parts inventory_parts_part_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.inventory_parts
    ADD CONSTRAINT inventory_parts_part_id_fkey FOREIGN KEY (part_id) REFERENCES operaciones.parts(part_id);


--
-- Name: parts parts_supplier_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.parts
    ADD CONSTRAINT parts_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES operaciones.suppliers(supplier_id);


--
-- Name: service_records service_records_car_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_car_id_fkey FOREIGN KEY (car_id) REFERENCES ventas.cars(car_id);


--
-- Name: service_records service_records_employee_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: postgres
--

ALTER TABLE ONLY operaciones.service_records
    ADD CONSTRAINT service_records_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES operaciones.employees(employee_id);


--
-- Name: sales sales_car_id_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_car_id_fkey FOREIGN KEY (car_id) REFERENCES ventas.cars(car_id);


--
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES ventas.customers(customer_id);


--
-- Name: sales sales_employee_id_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.sales
    ADD CONSTRAINT sales_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES operaciones.employees(employee_id);


--
-- Name: SCHEMA operaciones; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA operaciones TO director_general;
GRANT USAGE ON SCHEMA operaciones TO director_operaciones;
GRANT USAGE ON SCHEMA operaciones TO gerente_sucursal;


--
-- Name: SCHEMA ventas; Type: ACL; Schema: -; Owner: director_operaciones
--

GRANT USAGE ON SCHEMA ventas TO gerente_sucursal;
GRANT USAGE ON SCHEMA ventas TO vendedor;
GRANT USAGE ON SCHEMA ventas TO cliente;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: operaciones; Owner: dueño
--

ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT,REFERENCES ON TABLES TO director_general;
ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT ON TABLES TO director_operaciones;
ALTER DEFAULT PRIVILEGES FOR ROLE "dueño" IN SCHEMA operaciones GRANT SELECT ON TABLES TO gerente_sucursal;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: ventas; Owner: director_general
--

ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT REFERENCES ON TABLES TO "dueño";
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,DELETE,UPDATE ON TABLES TO director_operaciones;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,UPDATE ON TABLES TO gerente_sucursal;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT INSERT,UPDATE ON TABLES TO vendedor;
ALTER DEFAULT PRIVILEGES FOR ROLE director_general IN SCHEMA ventas GRANT SELECT ON TABLES TO cliente;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                