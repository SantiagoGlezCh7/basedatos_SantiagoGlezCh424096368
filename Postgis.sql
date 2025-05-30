PGDMP  5    
                }            postgis_35_sample    17.3    17.3 1    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            d           1262    57616    postgis_35_sample    DATABASE     �   CREATE DATABASE postgis_35_sample WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 !   DROP DATABASE postgis_35_sample;
                     postgres    false            e           0    0    postgis_35_sample    DATABASE PROPERTIES     \   ALTER DATABASE postgis_35_sample SET search_path TO '$user', 'public', 'topology', 'tiger';
                          postgres    false                        2615    60017    tiger    SCHEMA        CREATE SCHEMA tiger;
    DROP SCHEMA tiger;
                     postgres    false                        2615    60273 
   tiger_data    SCHEMA        CREATE SCHEMA tiger_data;
    DROP SCHEMA tiger_data;
                     postgres    false                        2615    59606    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
                     postgres    false            f           0    0    SCHEMA topology    COMMENT     9   COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
                        postgres    false    20                        3079    59776    address_standardizer 	   EXTENSION     H   CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;
 %   DROP EXTENSION address_standardizer;
                        false            g           0    0    EXTENSION address_standardizer    COMMENT     �   COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';
                             false    6                        3079    59784    address_standardizer_data_us 	   EXTENSION     P   CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;
 -   DROP EXTENSION address_standardizer_data_us;
                        false            h           0    0 &   EXTENSION address_standardizer_data_us    COMMENT     `   COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';
                             false    7                        3079    60005    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                        false            i           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                             false    12                        3079    60417    h3 	   EXTENSION     6   CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;
    DROP EXTENSION h3;
                        false            j           0    0    EXTENSION h3    COMMENT     9   COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';
                             false    14                        3079    57617    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                        false            k           0    0    EXTENSION postgis    COMMENT     ^   COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
                             false    2                        3079    58697    postgis_raster 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;
    DROP EXTENSION postgis_raster;
                        false    2            l           0    0    EXTENSION postgis_raster    COMMENT     M   COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';
                             false    3                        3079    60533 
   h3_postgis 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;
    DROP EXTENSION h3_postgis;
                        false    3    14    2            m           0    0    EXTENSION h3_postgis    COMMENT     =   COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';
                             false    15                        3079    59999    ogr_fdw 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;
    DROP EXTENSION ogr_fdw;
                        false            n           0    0    EXTENSION ogr_fdw    COMMENT     L   COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';
                             false    11                        3079    59254 	   pgrouting 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;
    DROP EXTENSION pgrouting;
                        false    2            o           0    0    EXTENSION pgrouting    COMMENT     9   COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';
                             false    4            	            3079    59893 
   pointcloud 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;
    DROP EXTENSION pointcloud;
                        false            p           0    0    EXTENSION pointcloud    COMMENT     G   COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';
                             false    9            
            3079    59988    pointcloud_postgis 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;
 #   DROP EXTENSION pointcloud_postgis;
                        false    9    2            q           0    0    EXTENSION pointcloud_postgis    COMMENT     n   COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';
                             false    10                        3079    59831    postgis_sfcgal 	   EXTENSION     B   CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;
    DROP EXTENSION postgis_sfcgal;
                        false    2            r           0    0    EXTENSION postgis_sfcgal    COMMENT     C   COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';
                             false    8                        3079    60018    postgis_tiger_geocoder 	   EXTENSION     I   CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
 '   DROP EXTENSION postgis_tiger_geocoder;
                        false    21    2    12            s           0    0     EXTENSION postgis_tiger_geocoder    COMMENT     ^   COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
                             false    13                        3079    59607    postgis_topology 	   EXTENSION     F   CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
 !   DROP EXTENSION postgis_topology;
                        false    20    2            t           0    0    EXTENSION postgis_topology    COMMENT     Y   COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
                             false    5            .          0    59895    pointcloud_formats 
   TABLE DATA           @   COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
    public               postgres    false    262   �*       '          0    57939    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public               postgres    false    235   �*       -          0    59800    us_gaz 
   TABLE DATA           J   COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    public               postgres    false    259   �*       +          0    59786    us_lex 
   TABLE DATA           J   COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    public               postgres    false    257   �*       ,          0    59812    us_rules 
   TABLE DATA           7   COPY public.us_rules (id, rule, is_custom) FROM stdin;
    public               postgres    false    261   +       /          0    60024    geocode_settings 
   TABLE DATA           T   COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
    tiger               postgres    false    265   /+       0          0    60356    pagc_gaz 
   TABLE DATA           K   COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger               postgres    false    310   L+       1          0    60366    pagc_lex 
   TABLE DATA           K   COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
    tiger               postgres    false    312   i+       2          0    60376 
   pagc_rules 
   TABLE DATA           8   COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
    tiger               postgres    false    314   �+       )          0    59609    topology 
   TABLE DATA           G   COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
    topology               postgres    false    250   �+       *          0    59621    layer 
   TABLE DATA           �   COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology               postgres    false    251   �+       u           0    0    topology_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);
          topology               postgres    false    249            .      x������ � �      '      x������ � �      -      x������ � �      +      x������ � �      ,      x������ � �      /      x������ � �      0      x������ � �      1      x������ � �      2      x������ � �      )      x������ � �      *      x������ � �     