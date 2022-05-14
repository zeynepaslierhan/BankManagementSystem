PGDMP         (                z            project    14.2    14.2 ;    G           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            J           1262    16754    project    DATABASE     d   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE project;
                postgres    false            �            1255    16875 �   insert_calisanlar(integer, character varying, character varying, character varying, character varying, integer, integer, character varying)    FUNCTION     $  CREATE FUNCTION public.insert_calisanlar("_kullanıcı_kodu" integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _sifre character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	insert into calisanlar(kullanıcı_kodu, isim, soyisim, adres, email, telefon, tc, sifre)
	values(_kullanıcı_kodu, _isim, _soyisim, _adres, _email, _telefon, _tc, _sifre);
	if found then -- inserted successfully
		return 1;
	else 
		return 0;
	end if;
end
$$;
 �   DROP FUNCTION public.insert_calisanlar("_kullanıcı_kodu" integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _sifre character varying);
       public          postgres    false            �            1255    16876 b   insert_hesaplar(integer, integer, integer, double precision, character varying, character varying)    FUNCTION     
  CREATE FUNCTION public.insert_hesaplar(_uye_id integer, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying, _hesap_tur_isim character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	insert into hesaplar(uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim, hesap_tur_isim)
	values(_uye_id, _hesap_tur_id, _yatirim_fon_id, _bakiye, _hesap_isim, _hesap_tur_isim);
	if found then -- inserted successfully
		return 1;
	else 
		return 0;
	end if;
end
$$;
 �   DROP FUNCTION public.insert_hesaplar(_uye_id integer, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying, _hesap_tur_isim character varying);
       public          postgres    false            �            1255    16866 �   insert_musteriler(character varying, character varying, character varying, character varying, integer, integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _temsilci_id integer, _sifre character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
 	insert into musteriler(isim, soyisim, adres, email, telefon, tc, temsilci_id, sifre)
	values(_isim, _soyisim, _adres, _email, _telefon, _tc, _temsilci_id, _sifre);
	if found then
		return 1;
	else 
		return 0;
	end if;
end
$$;
 �   DROP FUNCTION public.insert_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _temsilci_id integer, _sifre character varying);
       public          postgres    false            �            1255    16877 8   insert_yatirim_fonu(character varying, double precision)    FUNCTION     2  CREATE FUNCTION public.insert_yatirim_fonu(_para_turu character varying, _kur double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	insert into yatirim_fonu(para_turu, kur)
	values(_para_turu, _kur);
	if found then -- inserted successfully
		return 1;
	else 
		return 0;
	end if;
end
$$;
 _   DROP FUNCTION public.insert_yatirim_fonu(_para_turu character varying, _kur double precision);
       public          postgres    false            �            1255    16879 �   update_musteriler(integer, character varying, character varying, character varying, character varying, integer, integer, integer, character varying)    FUNCTION     M  CREATE FUNCTION public.update_musteriler(_id integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _temsilci_id integer, _sifre character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	update musteriler
	set
		isim = _isim,
		soyisim = _soyisim,
		adres = _adres,
		email = _email,
		telefon = _telefon,
		tc = _tc,
		temsilci_id = _temsilci_id,
		sifre = _sifre
	where id = _id;
	if found then --updated successfully
		return 1;
	else -- update failed
		return 0;
	end if;
end
$$;
 �   DROP FUNCTION public.update_musteriler(_id integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon integer, _tc integer, _temsilci_id integer, _sifre character varying);
       public          postgres    false            �            1259    16755    banka_uyeleri    TABLE     �   CREATE TABLE public.banka_uyeleri (
    "kullanıcı_kodu" integer NOT NULL,
    uye_isim character varying NOT NULL,
    maas double precision NOT NULL
);
 !   DROP TABLE public.banka_uyeleri;
       public         heap    postgres    false            �            1259    16760 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE     �   ALTER TABLE public.banka_uyeleri ALTER COLUMN "kullanıcı_kodu" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."banka_uyeleri_kullanıcı_kodu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    211            �            1259    16761 
   calisanlar    TABLE     [  CREATE TABLE public.calisanlar (
    id integer NOT NULL,
    "kullanıcı_kodu" integer NOT NULL,
    isim character varying NOT NULL,
    soyisim character varying NOT NULL,
    adres character varying NOT NULL,
    email character varying NOT NULL,
    telefon integer NOT NULL,
    tc integer NOT NULL,
    sifre character varying NOT NULL
);
    DROP TABLE public.calisanlar;
       public         heap    postgres    false            �            1259    16766    calisanlar_id_seq    SEQUENCE     �   ALTER TABLE public.calisanlar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calisanlar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    213            �            1259    16767 	   hesap_tur    TABLE     _   CREATE TABLE public.hesap_tur (
    id integer NOT NULL,
    tur character varying NOT NULL
);
    DROP TABLE public.hesap_tur;
       public         heap    postgres    false            �            1259    16772    hesap_tur_id_seq    SEQUENCE     �   ALTER TABLE public.hesap_tur ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hesap_tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    215            �            1259    16773    hesaplar    TABLE       CREATE TABLE public.hesaplar (
    id integer NOT NULL,
    uye_id integer NOT NULL,
    hesap_tur_id integer NOT NULL,
    yatirim_fon_id integer NOT NULL,
    bakiye double precision,
    hesap_isim character varying NOT NULL,
    hesap_tur_isim character varying NOT NULL
);
    DROP TABLE public.hesaplar;
       public         heap    postgres    false            �            1259    16778    hesaplar_id_seq    SEQUENCE     �   ALTER TABLE public.hesaplar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hesaplar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    217            �            1259    16779    islem    TABLE     L  CREATE TABLE public.islem (
    islem_no integer NOT NULL,
    islem character varying NOT NULL,
    kaynak_hesap_id integer NOT NULL,
    hedef_hesap_id integer NOT NULL,
    tutar double precision NOT NULL,
    kaynak_bakiye double precision,
    hedef_bakiye double precision,
    tarih_saat timestamp with time zone NOT NULL
);
    DROP TABLE public.islem;
       public         heap    postgres    false            �            1259    16784    islem_islem_no_seq    SEQUENCE     �   ALTER TABLE public.islem ALTER COLUMN islem_no ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.islem_islem_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    219            �            1259    16785    kredi_talep    TABLE     �   CREATE TABLE public.kredi_talep (
    kredi_id integer NOT NULL,
    uye_id integer NOT NULL,
    talep_miktar double precision NOT NULL,
    onay character varying NOT NULL,
    kredi_tur_id integer NOT NULL
);
    DROP TABLE public.kredi_talep;
       public         heap    postgres    false            �            1259    16790    kredi_talep_kredi_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_talep ALTER COLUMN kredi_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_talep_kredi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    221            �            1259    16791 	   kredi_tur    TABLE     �   CREATE TABLE public.kredi_tur (
    id integer NOT NULL,
    tur character varying NOT NULL,
    vade double precision NOT NULL,
    faiz double precision NOT NULL
);
    DROP TABLE public.kredi_tur;
       public         heap    postgres    false            �            1259    16796    kredi_tur_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_tur ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    223            �            1259    16797 
   musteriler    TABLE     T  CREATE TABLE public.musteriler (
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
    DROP TABLE public.musteriler;
       public         heap    postgres    false            �            1259    16802    musteriler_id_seq    SEQUENCE     �   ALTER TABLE public.musteriler ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.musteriler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    225            �            1259    16803    sistem    TABLE     j   CREATE TABLE public.sistem (
    tarih date NOT NULL,
    id integer NOT NULL,
    tc integer NOT NULL
);
    DROP TABLE public.sistem;
       public         heap    postgres    false            �            1259    16806    yatirim_fonu    TABLE     �   CREATE TABLE public.yatirim_fonu (
    id integer NOT NULL,
    para_turu character varying NOT NULL,
    kur double precision NOT NULL
);
     DROP TABLE public.yatirim_fonu;
       public         heap    postgres    false            �            1259    16811    yatirim_fonu_id_seq    SEQUENCE     �   ALTER TABLE public.yatirim_fonu ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.yatirim_fonu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    228            2          0    16755    banka_uyeleri 
   TABLE DATA           K   COPY public.banka_uyeleri ("kullanıcı_kodu", uye_isim, maas) FROM stdin;
    public          postgres    false    211   P       4          0    16761 
   calisanlar 
   TABLE DATA           m   COPY public.calisanlar (id, "kullanıcı_kodu", isim, soyisim, adres, email, telefon, tc, sifre) FROM stdin;
    public          postgres    false    213   3P       6          0    16767 	   hesap_tur 
   TABLE DATA           ,   COPY public.hesap_tur (id, tur) FROM stdin;
    public          postgres    false    215   �P       8          0    16773    hesaplar 
   TABLE DATA           p   COPY public.hesaplar (id, uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim, hesap_tur_isim) FROM stdin;
    public          postgres    false    217   �P       :          0    16779    islem 
   TABLE DATA           �   COPY public.islem (islem_no, islem, kaynak_hesap_id, hedef_hesap_id, tutar, kaynak_bakiye, hedef_bakiye, tarih_saat) FROM stdin;
    public          postgres    false    219   	Q       <          0    16785    kredi_talep 
   TABLE DATA           Y   COPY public.kredi_talep (kredi_id, uye_id, talep_miktar, onay, kredi_tur_id) FROM stdin;
    public          postgres    false    221   gQ       >          0    16791 	   kredi_tur 
   TABLE DATA           8   COPY public.kredi_tur (id, tur, vade, faiz) FROM stdin;
    public          postgres    false    223   �Q       @          0    16797 
   musteriler 
   TABLE DATA           f   COPY public.musteriler (id, isim, soyisim, adres, email, telefon, tc, temsilci_id, sifre) FROM stdin;
    public          postgres    false    225   �Q       B          0    16803    sistem 
   TABLE DATA           /   COPY public.sistem (tarih, id, tc) FROM stdin;
    public          postgres    false    227   9R       C          0    16806    yatirim_fonu 
   TABLE DATA           :   COPY public.yatirim_fonu (id, para_turu, kur) FROM stdin;
    public          postgres    false    228   VR       K           0    0 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."banka_uyeleri_kullanıcı_kodu_seq"', 1, false);
          public          postgres    false    212            L           0    0    calisanlar_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.calisanlar_id_seq', 6, true);
          public          postgres    false    214            M           0    0    hesap_tur_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.hesap_tur_id_seq', 1, false);
          public          postgres    false    216            N           0    0    hesaplar_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.hesaplar_id_seq', 2, true);
          public          postgres    false    218            O           0    0    islem_islem_no_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.islem_islem_no_seq', 3, true);
          public          postgres    false    220            P           0    0    kredi_talep_kredi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.kredi_talep_kredi_id_seq', 1, false);
          public          postgres    false    222            Q           0    0    kredi_tur_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kredi_tur_id_seq', 1, false);
          public          postgres    false    224            R           0    0    musteriler_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.musteriler_id_seq', 23, true);
          public          postgres    false    226            S           0    0    yatirim_fonu_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.yatirim_fonu_id_seq', 1, false);
          public          postgres    false    229            �           2606    16813    hesaplar accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hesaplar
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.hesaplar DROP CONSTRAINT accounts_pkey;
       public            postgres    false    217            �           2606    16815    banka_uyeleri bank_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.banka_uyeleri
    ADD CONSTRAINT bank_pkey PRIMARY KEY ("kullanıcı_kodu");
 A   ALTER TABLE ONLY public.banka_uyeleri DROP CONSTRAINT bank_pkey;
       public            postgres    false    211            �           2606    16817    musteriler customers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT customers_pkey;
       public            postgres    false    225            �           2606    16819    hesap_tur hesap_tur_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hesap_tur
    ADD CONSTRAINT hesap_tur_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.hesap_tur DROP CONSTRAINT hesap_tur_pkey;
       public            postgres    false    215            �           2606    16821    islem islem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.islem
    ADD CONSTRAINT islem_pkey PRIMARY KEY (islem_no);
 :   ALTER TABLE ONLY public.islem DROP CONSTRAINT islem_pkey;
       public            postgres    false    219            �           2606    16823    kredi_tur kredi_islem_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.kredi_tur
    ADD CONSTRAINT kredi_islem_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.kredi_tur DROP CONSTRAINT kredi_islem_pkey;
       public            postgres    false    223            �           2606    16825    kredi_talep kredi_talep_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kredi_talep
    ADD CONSTRAINT kredi_talep_pkey PRIMARY KEY (kredi_id);
 F   ALTER TABLE ONLY public.kredi_talep DROP CONSTRAINT kredi_talep_pkey;
       public            postgres    false    221            �           2606    16827    sistem sistem_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sistem
    ADD CONSTRAINT sistem_pkey PRIMARY KEY (tarih);
 <   ALTER TABLE ONLY public.sistem DROP CONSTRAINT sistem_pkey;
       public            postgres    false    227            �           2606    16872    musteriler tc_unique 
   CONSTRAINT     M   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT tc_unique UNIQUE (tc);
 >   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT tc_unique;
       public            postgres    false    225            �           2606    16874    calisanlar tc_unique2 
   CONSTRAINT     N   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT tc_unique2 UNIQUE (tc);
 ?   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT tc_unique2;
       public            postgres    false    213            �           2606    16829    calisanlar workers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT workers_pkey;
       public            postgres    false    213            �           2606    16831    yatirim_fonu yat_fon_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.yatirim_fonu
    ADD CONSTRAINT yat_fon_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.yatirim_fonu DROP CONSTRAINT yat_fon_pkey;
       public            postgres    false    228            2      x������ � �      4   g   x�3�4��M�I��<ܞX������@�����������ijbjjljj�ihdD�&f���@�p�n��1��d��Q�0!�33t3LI6��Մ=... ��a�      6      x������ � �      8   2   x�3�4B#NC��Լ��Ē̢�\N(��1J�DpFr��qqq o�s      :   N   x�uʱ�0D��<=
:�@�$���@��������wDгp-���|i����ޙ�_�.U�y������df'���      <      x������ � �      >      x������ � �      @   �   x�34��H�J,���?���29�SA�!#�$713G/9?���������ԌHA�!gayjayy*��ehA�A&&&X�$� 333L���1h��)�$�d���1F1ǈs��́��dL�AFP�,������ �4��      B      x������ � �      C      x������ � �     