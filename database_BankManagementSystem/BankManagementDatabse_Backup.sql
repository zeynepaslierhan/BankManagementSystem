PGDMP     7                    z            BankManagementSystem    10.20    10.20 8    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            .           1262    24578    BankManagementSystem    DATABASE     �   CREATE DATABASE "BankManagementSystem" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 &   DROP DATABASE "BankManagementSystem";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            /           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            0           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24625    accounts    TABLE     �   CREATE TABLE public.accounts (
    account_id bigint NOT NULL,
    customer_id integer,
    balance bigint,
    account_status character varying,
    account_type character varying,
    currency character varying
);
    DROP TABLE public.accounts;
       public         postgres    false    3            �            1259    24623    accounts_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_account_id_seq;
       public       postgres    false    201    3            1           0    0    accounts_account_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;
            public       postgres    false    200            �            1259    24614    branchs    TABLE     �   CREATE TABLE public.branchs (
    branch_id integer NOT NULL,
    branch_name character varying,
    branch_location character varying
);
    DROP TABLE public.branchs;
       public         postgres    false    3            �            1259    24612    branchs_branch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.branchs_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.branchs_branch_id_seq;
       public       postgres    false    3    199            2           0    0    branchs_branch_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.branchs_branch_id_seq OWNED BY public.branchs.branch_id;
            public       postgres    false    198            �            1259    24603 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    city character varying,
    pancard_no character varying
);
    DROP TABLE public.customers;
       public         postgres    false    3            �            1259    24601    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public       postgres    false    3    197            3           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
            public       postgres    false    196            �            1259    24647    loans    TABLE     �   CREATE TABLE public.loans (
    loan_id bigint NOT NULL,
    customer_id integer,
    branch_id integer,
    loan_amount bigint,
    date_issued date
);
    DROP TABLE public.loans;
       public         postgres    false    3            �            1259    24645    loans_loan_id_seq    SEQUENCE     z   CREATE SEQUENCE public.loans_loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.loans_loan_id_seq;
       public       postgres    false    3    205            4           0    0    loans_loan_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.loans_loan_id_seq OWNED BY public.loans.loan_id;
            public       postgres    false    204            �            1259    24636    transactions    TABLE     �   CREATE TABLE public.transactions (
    transaction_id bigint NOT NULL,
    transaction_type character varying,
    from_account_id bigint,
    to_account_id bigint,
    date_issued date,
    amount bigint,
    transaction_medium character varying
);
     DROP TABLE public.transactions;
       public         postgres    false    3            �            1259    24634    transactions_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.transactions_transaction_id_seq;
       public       postgres    false    203    3            5           0    0    transactions_transaction_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;
            public       postgres    false    202            �
           2604    24628    accounts account_id    DEFAULT     z   ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);
 B   ALTER TABLE public.accounts ALTER COLUMN account_id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    24617    branchs branch_id    DEFAULT     v   ALTER TABLE ONLY public.branchs ALTER COLUMN branch_id SET DEFAULT nextval('public.branchs_branch_id_seq'::regclass);
 @   ALTER TABLE public.branchs ALTER COLUMN branch_id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    24606    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    24650    loans loan_id    DEFAULT     n   ALTER TABLE ONLY public.loans ALTER COLUMN loan_id SET DEFAULT nextval('public.loans_loan_id_seq'::regclass);
 <   ALTER TABLE public.loans ALTER COLUMN loan_id DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    24639    transactions transaction_id    DEFAULT     �   ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);
 J   ALTER TABLE public.transactions ALTER COLUMN transaction_id DROP DEFAULT;
       public       postgres    false    203    202    203            $          0    24625    accounts 
   TABLE DATA               l   COPY public.accounts (account_id, customer_id, balance, account_status, account_type, currency) FROM stdin;
    public       postgres    false    201   f?       "          0    24614    branchs 
   TABLE DATA               J   COPY public.branchs (branch_id, branch_name, branch_location) FROM stdin;
    public       postgres    false    199   �?                  0    24603 	   customers 
   TABLE DATA               Y   COPY public.customers (customer_id, first_name, last_name, city, pancard_no) FROM stdin;
    public       postgres    false    197   �?       (          0    24647    loans 
   TABLE DATA               Z   COPY public.loans (loan_id, customer_id, branch_id, loan_amount, date_issued) FROM stdin;
    public       postgres    false    205   �?       &          0    24636    transactions 
   TABLE DATA               �   COPY public.transactions (transaction_id, transaction_type, from_account_id, to_account_id, date_issued, amount, transaction_medium) FROM stdin;
    public       postgres    false    203   �?       6           0    0    accounts_account_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_account_id_seq', 1, false);
            public       postgres    false    200            7           0    0    branchs_branch_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.branchs_branch_id_seq', 1, false);
            public       postgres    false    198            8           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);
            public       postgres    false    196            9           0    0    loans_loan_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.loans_loan_id_seq', 1, false);
            public       postgres    false    204            :           0    0    transactions_transaction_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 1, false);
            public       postgres    false    202            �
           2606    24633    accounts accounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         postgres    false    201            �
           2606    24622    branchs branchs_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (branch_id);
 >   ALTER TABLE ONLY public.branchs DROP CONSTRAINT branchs_pkey;
       public         postgres    false    199            �
           2606    24611    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public         postgres    false    197            �
           2606    24652    loans loans_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loan_id);
 :   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
       public         postgres    false    205            �
           2606    24644    transactions transactions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public         postgres    false    203            �
           1259    24682    accounts_account_id_idx    INDEX     R   CREATE INDEX accounts_account_id_idx ON public.accounts USING btree (account_id);
 +   DROP INDEX public.accounts_account_id_idx;
       public         postgres    false    201            �
           1259    24681    branchs_branch_id_idx    INDEX     N   CREATE INDEX branchs_branch_id_idx ON public.branchs USING btree (branch_id);
 )   DROP INDEX public.branchs_branch_id_idx;
       public         postgres    false    199            �
           1259    24678    customers_customer_id_idx    INDEX     V   CREATE INDEX customers_customer_id_idx ON public.customers USING btree (customer_id);
 -   DROP INDEX public.customers_customer_id_idx;
       public         postgres    false    197            �
           1259    24679    customers_first_name_idx    INDEX     T   CREATE INDEX customers_first_name_idx ON public.customers USING btree (first_name);
 ,   DROP INDEX public.customers_first_name_idx;
       public         postgres    false    197            �
           1259    24680    customers_last_name_idx    INDEX     R   CREATE INDEX customers_last_name_idx ON public.customers USING btree (last_name);
 +   DROP INDEX public.customers_last_name_idx;
       public         postgres    false    197            �
           1259    24683     transactions_from_account_id_idx    INDEX     d   CREATE INDEX transactions_from_account_id_idx ON public.transactions USING btree (from_account_id);
 4   DROP INDEX public.transactions_from_account_id_idx;
       public         postgres    false    203            �
           1259    24685 .   transactions_from_account_id_to_account_id_idx    INDEX     �   CREATE INDEX transactions_from_account_id_to_account_id_idx ON public.transactions USING btree (from_account_id, to_account_id);
 B   DROP INDEX public.transactions_from_account_id_to_account_id_idx;
       public         postgres    false    203    203            �
           1259    24684    transactions_to_account_id_idx    INDEX     `   CREATE INDEX transactions_to_account_id_idx ON public.transactions USING btree (to_account_id);
 2   DROP INDEX public.transactions_to_account_id_idx;
       public         postgres    false    203            �
           2606    24653 "   accounts accounts_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 L   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_customer_id_fkey;
       public       postgres    false    2707    201    197            �
           2606    24673    loans loans_branch_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branchs(branch_id);
 D   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_branch_id_fkey;
       public       postgres    false    205    2710    199            �
           2606    24668    loans loans_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 F   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_customer_id_fkey;
       public       postgres    false    2707    197    205            �
           2606    24658 .   transactions transactions_from_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_from_account_id_fkey FOREIGN KEY (from_account_id) REFERENCES public.accounts(account_id);
 X   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_from_account_id_fkey;
       public       postgres    false    201    2713    203            �
           2606    24663 ,   transactions transactions_to_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_to_account_id_fkey FOREIGN KEY (to_account_id) REFERENCES public.accounts(account_id);
 V   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_to_account_id_fkey;
       public       postgres    false    201    2713    203            $      x������ � �      "      x������ � �             x������ � �      (      x������ � �      &      x������ � �     