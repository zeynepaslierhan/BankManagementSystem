PGDMP                         z            project-test    14.2    14.2 "    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    16394    project-test    DATABASE     k   CREATE DATABASE "project-test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "project-test";
                postgres    false            �            1259    16600    acc_tur    TABLE     ^   CREATE TABLE public.acc_tur (
    tur_id integer NOT NULL,
    hesap_isim integer NOT NULL
);
    DROP TABLE public.acc_tur;
       public         heap    postgres    false            �            1259    16595    accounts    TABLE     �   CREATE TABLE public.accounts (
    id integer NOT NULL,
    uye_id integer NOT NULL,
    hesap_tur integer NOT NULL,
    para_tur integer NOT NULL,
    bakiye double precision
);
    DROP TABLE public.accounts;
       public         heap    postgres    false            �            1259    16573    bank    TABLE     o   CREATE TABLE public.bank (
    "kullanıcı_kodu" integer NOT NULL,
    uye_isim character varying NOT NULL
);
    DROP TABLE public.bank;
       public         heap    postgres    false            �            1259    16588 	   customers    TABLE     S  CREATE TABLE public.customers (
    id integer NOT NULL,
    isim character varying NOT NULL,
    soyisim character varying NOT NULL,
    adres character varying NOT NULL,
    email character varying NOT NULL,
    telefon integer NOT NULL,
    tc integer NOT NULL,
    temsilci_id integer NOT NULL,
    sifre character varying NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16612    islem    TABLE     !  CREATE TABLE public.islem (
    islem_no integer NOT NULL,
    islem character varying NOT NULL,
    kaynak double precision,
    hedef double precision,
    tutar double precision NOT NULL,
    kaynak_bakiye double precision,
    hedef_bakiye double precision,
    tarih date NOT NULL
);
    DROP TABLE public.islem;
       public         heap    postgres    false            �            1259    16631    kredi_islem    TABLE     �   CREATE TABLE public.kredi_islem (
    id integer NOT NULL,
    kredi_tur character varying NOT NULL,
    vade double precision NOT NULL,
    faiz double precision NOT NULL
);
    DROP TABLE public.kredi_islem;
       public         heap    postgres    false            �            1259    16624    kredi_talep    TABLE     �   CREATE TABLE public.kredi_talep (
    kredi_id integer NOT NULL,
    uye_id integer NOT NULL,
    talep_miktar double precision NOT NULL,
    onay character varying NOT NULL
);
    DROP TABLE public.kredi_talep;
       public         heap    postgres    false            �            1259    16619    sistem    TABLE     j   CREATE TABLE public.sistem (
    tarih date NOT NULL,
    id integer NOT NULL,
    tc integer NOT NULL
);
    DROP TABLE public.sistem;
       public         heap    postgres    false            �            1259    16581    workers    TABLE     |  CREATE TABLE public.workers (
    id integer NOT NULL,
    "kullanıcı_kodu" integer NOT NULL,
    isim character varying NOT NULL,
    soyisim character varying NOT NULL,
    adres character varying NOT NULL,
    email character varying NOT NULL,
    telefon integer NOT NULL,
    tc integer NOT NULL,
    maas double precision NOT NULL,
    sifre character varying NOT NULL
);
    DROP TABLE public.workers;
       public         heap    postgres    false            �            1259    16605    yat_fon    TABLE     �   CREATE TABLE public.yat_fon (
    para_id integer NOT NULL,
    para_isim character varying NOT NULL,
    kur double precision NOT NULL
);
    DROP TABLE public.yat_fon;
       public         heap    postgres    false            "          0    16600    acc_tur 
   TABLE DATA           5   COPY public.acc_tur (tur_id, hesap_isim) FROM stdin;
    public          postgres    false    213   �%       !          0    16595    accounts 
   TABLE DATA           K   COPY public.accounts (id, uye_id, hesap_tur, para_tur, bakiye) FROM stdin;
    public          postgres    false    212   �%                 0    16573    bank 
   TABLE DATA           <   COPY public.bank ("kullanıcı_kodu", uye_isim) FROM stdin;
    public          postgres    false    209   �%                  0    16588 	   customers 
   TABLE DATA           e   COPY public.customers (id, isim, soyisim, adres, email, telefon, tc, temsilci_id, sifre) FROM stdin;
    public          postgres    false    211   �%       $          0    16612    islem 
   TABLE DATA           j   COPY public.islem (islem_no, islem, kaynak, hedef, tutar, kaynak_bakiye, hedef_bakiye, tarih) FROM stdin;
    public          postgres    false    215   &       '          0    16631    kredi_islem 
   TABLE DATA           @   COPY public.kredi_islem (id, kredi_tur, vade, faiz) FROM stdin;
    public          postgres    false    218   3&       &          0    16624    kredi_talep 
   TABLE DATA           K   COPY public.kredi_talep (kredi_id, uye_id, talep_miktar, onay) FROM stdin;
    public          postgres    false    217   P&       %          0    16619    sistem 
   TABLE DATA           /   COPY public.sistem (tarih, id, tc) FROM stdin;
    public          postgres    false    216   m&                 0    16581    workers 
   TABLE DATA           p   COPY public.workers (id, "kullanıcı_kodu", isim, soyisim, adres, email, telefon, tc, maas, sifre) FROM stdin;
    public          postgres    false    210   �&       #          0    16605    yat_fon 
   TABLE DATA           :   COPY public.yat_fon (para_id, para_isim, kur) FROM stdin;
    public          postgres    false    214   �&       �           2606    16604    acc_tur acc_tur_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.acc_tur
    ADD CONSTRAINT acc_tur_pkey PRIMARY KEY (tur_id);
 >   ALTER TABLE ONLY public.acc_tur DROP CONSTRAINT acc_tur_pkey;
       public            postgres    false    213            �           2606    16599    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    212            �           2606    16579    bank bank_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY ("kullanıcı_kodu");
 8   ALTER TABLE ONLY public.bank DROP CONSTRAINT bank_pkey;
       public            postgres    false    209            �           2606    16594    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    211            �           2606    16618    islem islem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.islem
    ADD CONSTRAINT islem_pkey PRIMARY KEY (islem_no);
 :   ALTER TABLE ONLY public.islem DROP CONSTRAINT islem_pkey;
       public            postgres    false    215            �           2606    16637    kredi_islem kredi_islem_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kredi_islem
    ADD CONSTRAINT kredi_islem_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.kredi_islem DROP CONSTRAINT kredi_islem_pkey;
       public            postgres    false    218            �           2606    16630    kredi_talep kredi_talep_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kredi_talep
    ADD CONSTRAINT kredi_talep_pkey PRIMARY KEY (kredi_id);
 F   ALTER TABLE ONLY public.kredi_talep DROP CONSTRAINT kredi_talep_pkey;
       public            postgres    false    217            �           2606    16623    sistem sistem_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sistem
    ADD CONSTRAINT sistem_pkey PRIMARY KEY (tarih);
 <   ALTER TABLE ONLY public.sistem DROP CONSTRAINT sistem_pkey;
       public            postgres    false    216            �           2606    16587    workers workers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_pkey;
       public            postgres    false    210            �           2606    16611    yat_fon yat_fon_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.yat_fon
    ADD CONSTRAINT yat_fon_pkey PRIMARY KEY (para_id);
 >   ALTER TABLE ONLY public.yat_fon DROP CONSTRAINT yat_fon_pkey;
       public            postgres    false    214            "      x������ � �      !      x������ � �            x������ � �             x������ � �      $      x������ � �      '      x������ � �      &      x������ � �      %      x������ � �            x������ � �      #      x������ � �     