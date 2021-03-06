PGDMP                         y           ETL Project    13.2    13.1     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16756    ETL Project    DATABASE     b   CREATE DATABASE "ETL Project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE "ETL Project";
                postgres    false            ?            1259    16772    covid    TABLE     ?   CREATE TABLE public.covid (
    year integer NOT NULL,
    cventine integer NOT NULL,
    cvemuni integer NOT NULL,
    tipacien character varying(30),
    ecoluci character varying(30),
    id integer NOT NULL,
    cmun integer NOT NULL
);
    DROP TABLE public.covid;
       public         heap    postgres    false            ?            1259    16757    crime    TABLE     ?   CREATE TABLE public.crime (
    year integer NOT NULL,
    cmun integer NOT NULL,
    mun character varying(30),
    total_robs integer NOT NULL
);
    DROP TABLE public.crime;
       public         heap    postgres    false            ?            1259    16762 
   population    TABLE     v   CREATE TABLE public.population (
    cmun integer NOT NULL,
    toptop integer NOT NULL,
    year integer NOT NULL
);
    DROP TABLE public.population;
       public         heap    postgres    false            ?          0    16772    covid 
   TABLE DATA           U   COPY public.covid (year, cventine, cvemuni, tipacien, ecoluci, id, cmun) FROM stdin;
    public          postgres    false    202   ?       ?          0    16757    crime 
   TABLE DATA           <   COPY public.crime (year, cmun, mun, total_robs) FROM stdin;
    public          postgres    false    200   ?       ?          0    16762 
   population 
   TABLE DATA           8   COPY public.population (cmun, toptop, year) FROM stdin;
    public          postgres    false    201          6           2606    16776    covid covid_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.covid
    ADD CONSTRAINT covid_pkey PRIMARY KEY (cmun);
 :   ALTER TABLE ONLY public.covid DROP CONSTRAINT covid_pkey;
       public            postgres    false    202            2           2606    16761    crime crime_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.crime
    ADD CONSTRAINT crime_pkey PRIMARY KEY (cmun);
 :   ALTER TABLE ONLY public.crime DROP CONSTRAINT crime_pkey;
       public            postgres    false    200            4           2606    16766    population population_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (cmun);
 D   ALTER TABLE ONLY public.population DROP CONSTRAINT population_pkey;
       public            postgres    false    201            8           2606    16777    covid covid_cmun_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.covid
    ADD CONSTRAINT covid_cmun_fkey FOREIGN KEY (cmun) REFERENCES public.population(cmun);
 ?   ALTER TABLE ONLY public.covid DROP CONSTRAINT covid_cmun_fkey;
       public          postgres    false    202    201    3124            7           2606    16767    population population_cmun_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_cmun_fkey FOREIGN KEY (cmun) REFERENCES public.crime(cmun);
 I   ALTER TABLE ONLY public.population DROP CONSTRAINT population_cmun_fkey;
       public          postgres    false    3122    200    201            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     