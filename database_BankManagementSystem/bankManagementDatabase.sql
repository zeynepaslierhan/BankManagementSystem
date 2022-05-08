PGDMP         9                z            project-test    14.2    14.2 4    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    16394    project-test    DATABASE     k   CREATE DATABASE "project-test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "project-test";
                postgres    false            �            1259    16395    accounts    TABLE     �   CREATE TABLE public.accounts (
    account_id bigint NOT NULL,
    customer_id integer,
    balance bigint,
    account_status character varying,
    account_type character varying,
    currency character varying
);
    DROP TABLE public.accounts;
       public         heap    postgres    false            �            1259    16400    accounts_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_account_id_seq;
       public          postgres    false    209            '           0    0    accounts_account_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;
          public          postgres    false    210            �            1259    16401    branchs    TABLE     �   CREATE TABLE public.branchs (
    branch_id integer NOT NULL,
    branch_name character varying,
    branch_location character varying
);
    DROP TABLE public.branchs;
       public         heap    postgres    false            �            1259    16406    branchs_branch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.branchs_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.branchs_branch_id_seq;
       public          postgres    false    211            (           0    0    branchs_branch_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.branchs_branch_id_seq OWNED BY public.branchs.branch_id;
          public          postgres    false    212            �            1259    16407 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    city character varying,
    pancard_no character varying
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16412    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    213            )           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    214            �            1259    16413    loans    TABLE     �   CREATE TABLE public.loans (
    loan_id bigint NOT NULL,
    customer_id integer,
    branch_id integer,
    loan_amount bigint,
    date_issued date
);
    DROP TABLE public.loans;
       public         heap    postgres    false            �            1259    16416    loans_loan_id_seq    SEQUENCE     z   CREATE SEQUENCE public.loans_loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.loans_loan_id_seq;
       public          postgres    false    215            *           0    0    loans_loan_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.loans_loan_id_seq OWNED BY public.loans.loan_id;
          public          postgres    false    216            �            1259    16417    transactions    TABLE     �   CREATE TABLE public.transactions (
    transaction_id bigint NOT NULL,
    transaction_type character varying,
    from_account_id bigint,
    to_account_id bigint,
    date_issued date,
    amount bigint,
    transaction_medium character varying
);
     DROP TABLE public.transactions;
       public         heap    postgres    false            �            1259    16422    transactions_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.transactions_transaction_id_seq;
       public          postgres    false    217            +           0    0    transactions_transaction_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;
          public          postgres    false    218            p           2604    16471    accounts account_id    DEFAULT     z   ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);
 B   ALTER TABLE public.accounts ALTER COLUMN account_id DROP DEFAULT;
       public          postgres    false    210    209            q           2604    16472    branchs branch_id    DEFAULT     v   ALTER TABLE ONLY public.branchs ALTER COLUMN branch_id SET DEFAULT nextval('public.branchs_branch_id_seq'::regclass);
 @   ALTER TABLE public.branchs ALTER COLUMN branch_id DROP DEFAULT;
       public          postgres    false    212    211            r           2604    16473    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    214    213            s           2604    16474    loans loan_id    DEFAULT     n   ALTER TABLE ONLY public.loans ALTER COLUMN loan_id SET DEFAULT nextval('public.loans_loan_id_seq'::regclass);
 <   ALTER TABLE public.loans ALTER COLUMN loan_id DROP DEFAULT;
       public          postgres    false    216    215            t           2604    16475    transactions transaction_id    DEFAULT     �   ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);
 J   ALTER TABLE public.transactions ALTER COLUMN transaction_id DROP DEFAULT;
       public          postgres    false    218    217                      0    16395    accounts 
   TABLE DATA           l   COPY public.accounts (account_id, customer_id, balance, account_status, account_type, currency) FROM stdin;
    public          postgres    false    209   �<                 0    16401    branchs 
   TABLE DATA           J   COPY public.branchs (branch_id, branch_name, branch_location) FROM stdin;
    public          postgres    false    211   =                 0    16407 	   customers 
   TABLE DATA           Y   COPY public.customers (customer_id, first_name, last_name, city, pancard_no) FROM stdin;
    public          postgres    false    213   +=                 0    16413    loans 
   TABLE DATA           Z   COPY public.loans (loan_id, customer_id, branch_id, loan_amount, date_issued) FROM stdin;
    public          postgres    false    215   H=                 0    16417    transactions 
   TABLE DATA           �   COPY public.transactions (transaction_id, transaction_type, from_account_id, to_account_id, date_issued, amount, transaction_medium) FROM stdin;
    public          postgres    false    217   e=       ,           0    0    accounts_account_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_account_id_seq', 1, false);
          public          postgres    false    210            -           0    0    branchs_branch_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.branchs_branch_id_seq', 1, false);
          public          postgres    false    212            .           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);
          public          postgres    false    214            /           0    0    loans_loan_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.loans_loan_id_seq', 1, false);
          public          postgres    false    216            0           0    0    transactions_transaction_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 1, false);
          public          postgres    false    218            w           2606    16429    accounts accounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    209            z           2606    16431    branchs branchs_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (branch_id);
 >   ALTER TABLE ONLY public.branchs DROP CONSTRAINT branchs_pkey;
       public            postgres    false    211                       2606    16433    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    213            �           2606    16435    loans loans_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loan_id);
 :   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
       public            postgres    false    215            �           2606    16437    transactions transactions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public            postgres    false    217            u           1259    16438    accounts_account_id_idx    INDEX     R   CREATE INDEX accounts_account_id_idx ON public.accounts USING btree (account_id);
 +   DROP INDEX public.accounts_account_id_idx;
       public            postgres    false    209            x           1259    16439    branchs_branch_id_idx    INDEX     N   CREATE INDEX branchs_branch_id_idx ON public.branchs USING btree (branch_id);
 )   DROP INDEX public.branchs_branch_id_idx;
       public            postgres    false    211            {           1259    16440    customers_customer_id_idx    INDEX     V   CREATE INDEX customers_customer_id_idx ON public.customers USING btree (customer_id);
 -   DROP INDEX public.customers_customer_id_idx;
       public            postgres    false    213            |           1259    16441    customers_first_name_idx    INDEX     T   CREATE INDEX customers_first_name_idx ON public.customers USING btree (first_name);
 ,   DROP INDEX public.customers_first_name_idx;
       public            postgres    false    213            }           1259    16442    customers_last_name_idx    INDEX     R   CREATE INDEX customers_last_name_idx ON public.customers USING btree (last_name);
 +   DROP INDEX public.customers_last_name_idx;
       public            postgres    false    213            �           1259    16443     transactions_from_account_id_idx    INDEX     d   CREATE INDEX transactions_from_account_id_idx ON public.transactions USING btree (from_account_id);
 4   DROP INDEX public.transactions_from_account_id_idx;
       public            postgres    false    217            �           1259    16444 .   transactions_from_account_id_to_account_id_idx    INDEX     �   CREATE INDEX transactions_from_account_id_to_account_id_idx ON public.transactions USING btree (from_account_id, to_account_id);
 B   DROP INDEX public.transactions_from_account_id_to_account_id_idx;
       public            postgres    false    217    217            �           1259    16445    transactions_to_account_id_idx    INDEX     `   CREATE INDEX transactions_to_account_id_idx ON public.transactions USING btree (to_account_id);
 2   DROP INDEX public.transactions_to_account_id_idx;
       public            postgres    false    217            �           2606    16446 "   accounts accounts_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 L   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_customer_id_fkey;
       public          postgres    false    3199    213    209            �           2606    16451    loans loans_branch_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branchs(branch_id);
 D   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_branch_id_fkey;
       public          postgres    false    211    215    3194            �           2606    16456    loans loans_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 F   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_customer_id_fkey;
       public          postgres    false    213    3199    215            �           2606    16461 .   transactions transactions_from_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_from_account_id_fkey FOREIGN KEY (from_account_id) REFERENCES public.accounts(account_id);
 X   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_from_account_id_fkey;
       public          postgres    false    3191    209    217            �           2606    16466 ,   transactions transactions_to_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_to_account_id_fkey FOREIGN KEY (to_account_id) REFERENCES public.accounts(account_id);
 V   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_to_account_id_fkey;
       public          postgres    false    3191    217    209                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     