PGDMP     *    2    
            z            bankManagement    14.2    14.2 C    M           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            N           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            O           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            P           1262    41379    bankManagement    DATABASE     t   CREATE DATABASE "bankManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "bankManagement";
                postgres    false            �            1255    41468    delete_calisanlar(integer)    FUNCTION     �   CREATE FUNCTION public.delete_calisanlar(_tc integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	delete from calisanlar
	where tc = _tc;
	if found then -- deleted successfully
		return 1;
	else
		return 0;
	end if;
end
$$;
 5   DROP FUNCTION public.delete_calisanlar(_tc integer);
       public          postgres    false            �            1255    41381    delete_hesaplar(integer)    FUNCTION     �   CREATE FUNCTION public.delete_hesaplar(_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	delete from hesaplar
	where id = _id;
	if found then -- deleted successfully
		return 1;
	else
		return 0;
	end if;
end
$$;
 3   DROP FUNCTION public.delete_hesaplar(_id integer);
       public          postgres    false            �            1255    41478    delete_kreditalep(integer)    FUNCTION       CREATE FUNCTION public.delete_kreditalep(_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      delete from kredi_talep
      where id = _id;
      if found then -- deleted successfully
        return 1;
      else
        return 0;
      end if;
    end
    
$$;
 5   DROP FUNCTION public.delete_kreditalep(_id integer);
       public          postgres    false            �            1255    41471    delete_musteriler(integer)    FUNCTION       CREATE FUNCTION public.delete_musteriler(_tc integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      delete from musteriler
      where tc = _tc;
      if found then -- deleted successfully
        return 1;
      else
        return 0;
      end if;
    end
    $$;
 5   DROP FUNCTION public.delete_musteriler(_tc integer);
       public          postgres    false            �            1255    41382 �   insert_calisanlar(integer, character varying, character varying, character varying, character varying, bigint, bigint, character varying)    FUNCTION     "  CREATE FUNCTION public.insert_calisanlar("_kullanıcı_kodu" integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _sifre character varying) RETURNS integer
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
 �   DROP FUNCTION public.insert_calisanlar("_kullanıcı_kodu" integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _sifre character varying);
       public          postgres    false            �            1255    41480 X   insert_hesaplar(integer, integer, integer, integer, double precision, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_hesaplar(_uye_id integer, _onay integer, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	insert into hesaplar(uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim,onay)
	values(_uye_id, _hesap_tur_id, _yatirim_fon_id, _bakiye, _hesap_isim,_onay);
	if found then -- inserted successfully
		return 1;
	else 
		return 0;
	end if;
end
$$;
 �   DROP FUNCTION public.insert_hesaplar(_uye_id integer, _onay integer, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying);
       public          postgres    false            �            1255    41384 �   insert_musteriler(character varying, character varying, character varying, character varying, bigint, bigint, bigint, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying) RETURNS integer
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
 �   DROP FUNCTION public.insert_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying);
       public          postgres    false            �            1255    41385 8   insert_yatirim_fonu(character varying, double precision)    FUNCTION     2  CREATE FUNCTION public.insert_yatirim_fonu(_para_turu character varying, _kur double precision) RETURNS integer
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
       public          postgres    false            �            1255    41473 >   login_bankacalışanları(integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION public."login_bankacalışanları"(_tc integer, _sifre character varying, "_kullanıcıkodu" integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
   begin
   if(select count(*) from calisanlar where tc=_tc and sifre=_sifre and kullanıcı_kodu=_kullanıcıKodu) > 0 then 
     return 1; -- sistemde var oldupunu gösterir
   else 
     return 0;
   end if;
   end
   $$;
 u   DROP FUNCTION public."login_bankacalışanları"(_tc integer, _sifre character varying, "_kullanıcıkodu" integer);
       public          postgres    false            �            1255    41472 +   login_müşteri(integer, character varying)    FUNCTION     9  CREATE FUNCTION public."login_müşteri"(_tc integer, _sifre character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
   begin
   if(select count(*) from musteriler where tc=_tc and sifre=_sifre) > 0 then 
     return 1; -- sistemde var oldupunu gösterir
   else 
     return 0;
   end if;
  end
   $$;
 O   DROP FUNCTION public."login_müşteri"(_tc integer, _sifre character varying);
       public          postgres    false            �            1255    41482 "   update_kreditalep(bigint, integer)    FUNCTION       CREATE FUNCTION public.update_kreditalep(_tc bigint, _onay integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update kredi_talep
 set 
  onay=_onay
 where tc = _tc;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 C   DROP FUNCTION public.update_kreditalep(_tc bigint, _onay integer);
       public          postgres    false            �            1255    41483 �   update_musteriler(character varying, character varying, character varying, character varying, bigint, bigint, bigint, character varying)    FUNCTION       CREATE FUNCTION public.update_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying) RETURNS integer
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
  sifre = _sifre
 where tc = _tc;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 �   DROP FUNCTION public.update_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying);
       public          postgres    false            �            1255    41481 !   update_onayhesap(bigint, integer)    FUNCTION       CREATE FUNCTION public.update_onayhesap(_tc bigint, _onay integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update hesaplar
 set 
  onay=_onay
 where tc = _tc;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 B   DROP FUNCTION public.update_onayhesap(_tc bigint, _onay integer);
       public          postgres    false            �            1259    41387    banka_uyeleri    TABLE     �   CREATE TABLE public.banka_uyeleri (
    "kullanıcı_kodu" integer NOT NULL,
    uye_isim character varying NOT NULL,
    maas double precision NOT NULL
);
 !   DROP TABLE public.banka_uyeleri;
       public         heap    postgres    false            �            1259    41392 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE     �   ALTER TABLE public.banka_uyeleri ALTER COLUMN "kullanıcı_kodu" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."banka_uyeleri_kullanıcı_kodu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    209            �            1259    41393 
   calisanlar    TABLE     Y  CREATE TABLE public.calisanlar (
    id integer NOT NULL,
    "kullanıcı_kodu" integer NOT NULL,
    isim character varying NOT NULL,
    soyisim character varying NOT NULL,
    adres character varying NOT NULL,
    email character varying NOT NULL,
    telefon bigint NOT NULL,
    tc bigint NOT NULL,
    sifre character varying NOT NULL
);
    DROP TABLE public.calisanlar;
       public         heap    postgres    false            �            1259    41398    calisanlar_id_seq    SEQUENCE     �   ALTER TABLE public.calisanlar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calisanlar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    211            �            1259    41399 	   hesap_tur    TABLE     _   CREATE TABLE public.hesap_tur (
    id integer NOT NULL,
    tur character varying NOT NULL
);
    DROP TABLE public.hesap_tur;
       public         heap    postgres    false            �            1259    41404    hesap_tur_id_seq    SEQUENCE     �   ALTER TABLE public.hesap_tur ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hesap_tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    213            �            1259    41405    hesaplar    TABLE     �   CREATE TABLE public.hesaplar (
    id integer NOT NULL,
    uye_id integer NOT NULL,
    hesap_tur_id integer NOT NULL,
    yatirim_fon_id integer NOT NULL,
    bakiye double precision,
    hesap_isim character varying NOT NULL,
    onay integer
);
    DROP TABLE public.hesaplar;
       public         heap    postgres    false            �            1259    41410    hesaplar_id_seq    SEQUENCE     �   ALTER TABLE public.hesaplar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hesaplar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    215            �            1259    41411    islem    TABLE     L  CREATE TABLE public.islem (
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
       public         heap    postgres    false            �            1259    41416    islem_islem_no_seq    SEQUENCE     �   ALTER TABLE public.islem ALTER COLUMN islem_no ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.islem_islem_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    217            �            1259    41417    kredi_talep    TABLE     �   CREATE TABLE public.kredi_talep (
    kredi_id integer NOT NULL,
    uye_id integer NOT NULL,
    talep_miktar double precision NOT NULL,
    kredi_tur_id integer NOT NULL,
    onay integer NOT NULL
);
    DROP TABLE public.kredi_talep;
       public         heap    postgres    false            �            1259    41422    kredi_talep_kredi_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_talep ALTER COLUMN kredi_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_talep_kredi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    219            �            1259    41423 	   kredi_tur    TABLE     �   CREATE TABLE public.kredi_tur (
    id integer NOT NULL,
    tur character varying NOT NULL,
    vade double precision NOT NULL,
    faiz double precision NOT NULL
);
    DROP TABLE public.kredi_tur;
       public         heap    postgres    false            �            1259    41428    kredi_tur_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_tur ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    221            �            1259    41429 
   musteriler    TABLE     Q  CREATE TABLE public.musteriler (
    id integer NOT NULL,
    isim character varying NOT NULL,
    soyisim character varying NOT NULL,
    adres character varying NOT NULL,
    email character varying NOT NULL,
    telefon bigint NOT NULL,
    tc bigint NOT NULL,
    temsilci_id bigint NOT NULL,
    sifre character varying NOT NULL
);
    DROP TABLE public.musteriler;
       public         heap    postgres    false            �            1259    41434    musteriler_id_seq    SEQUENCE     �   ALTER TABLE public.musteriler ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.musteriler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    223            �            1259    41435    sistem    TABLE     j   CREATE TABLE public.sistem (
    tarih date NOT NULL,
    id integer NOT NULL,
    tc integer NOT NULL
);
    DROP TABLE public.sistem;
       public         heap    postgres    false            �            1259    41438    yatirim_fonu    TABLE     �   CREATE TABLE public.yatirim_fonu (
    id integer NOT NULL,
    para_turu character varying NOT NULL,
    kur double precision NOT NULL
);
     DROP TABLE public.yatirim_fonu;
       public         heap    postgres    false            �            1259    41443    yatirim_fonu_id_seq    SEQUENCE     �   ALTER TABLE public.yatirim_fonu ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.yatirim_fonu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    226            8          0    41387    banka_uyeleri 
   TABLE DATA           K   COPY public.banka_uyeleri ("kullanıcı_kodu", uye_isim, maas) FROM stdin;
    public          postgres    false    209   n_       :          0    41393 
   calisanlar 
   TABLE DATA           m   COPY public.calisanlar (id, "kullanıcı_kodu", isim, soyisim, adres, email, telefon, tc, sifre) FROM stdin;
    public          postgres    false    211   �_       <          0    41399 	   hesap_tur 
   TABLE DATA           ,   COPY public.hesap_tur (id, tur) FROM stdin;
    public          postgres    false    213   �_       >          0    41405    hesaplar 
   TABLE DATA           f   COPY public.hesaplar (id, uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim, onay) FROM stdin;
    public          postgres    false    215   �_       @          0    41411    islem 
   TABLE DATA           �   COPY public.islem (islem_no, islem, kaynak_hesap_id, hedef_hesap_id, tutar, kaynak_bakiye, hedef_bakiye, tarih_saat) FROM stdin;
    public          postgres    false    217   `       B          0    41417    kredi_talep 
   TABLE DATA           Y   COPY public.kredi_talep (kredi_id, uye_id, talep_miktar, kredi_tur_id, onay) FROM stdin;
    public          postgres    false    219   d`       D          0    41423 	   kredi_tur 
   TABLE DATA           8   COPY public.kredi_tur (id, tur, vade, faiz) FROM stdin;
    public          postgres    false    221   �`       F          0    41429 
   musteriler 
   TABLE DATA           f   COPY public.musteriler (id, isim, soyisim, adres, email, telefon, tc, temsilci_id, sifre) FROM stdin;
    public          postgres    false    223   �`       H          0    41435    sistem 
   TABLE DATA           /   COPY public.sistem (tarih, id, tc) FROM stdin;
    public          postgres    false    225   �`       I          0    41438    yatirim_fonu 
   TABLE DATA           :   COPY public.yatirim_fonu (id, para_turu, kur) FROM stdin;
    public          postgres    false    226   �`       Q           0    0 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."banka_uyeleri_kullanıcı_kodu_seq"', 1, false);
          public          postgres    false    210            R           0    0    calisanlar_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.calisanlar_id_seq', 1, false);
          public          postgres    false    212            S           0    0    hesap_tur_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.hesap_tur_id_seq', 1, false);
          public          postgres    false    214            T           0    0    hesaplar_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.hesaplar_id_seq', 2, true);
          public          postgres    false    216            U           0    0    islem_islem_no_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.islem_islem_no_seq', 3, true);
          public          postgres    false    218            V           0    0    kredi_talep_kredi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.kredi_talep_kredi_id_seq', 1, false);
          public          postgres    false    220            W           0    0    kredi_tur_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kredi_tur_id_seq', 1, false);
          public          postgres    false    222            X           0    0    musteriler_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.musteriler_id_seq', 1, false);
          public          postgres    false    224            Y           0    0    yatirim_fonu_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.yatirim_fonu_id_seq', 1, false);
          public          postgres    false    227            �           2606    41445    hesaplar accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hesaplar
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.hesaplar DROP CONSTRAINT accounts_pkey;
       public            postgres    false    215            �           2606    41447    banka_uyeleri bank_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.banka_uyeleri
    ADD CONSTRAINT bank_pkey PRIMARY KEY ("kullanıcı_kodu");
 A   ALTER TABLE ONLY public.banka_uyeleri DROP CONSTRAINT bank_pkey;
       public            postgres    false    209            �           2606    41449    musteriler customers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT customers_pkey;
       public            postgres    false    223            �           2606    41451    hesap_tur hesap_tur_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hesap_tur
    ADD CONSTRAINT hesap_tur_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.hesap_tur DROP CONSTRAINT hesap_tur_pkey;
       public            postgres    false    213            �           2606    41453    islem islem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.islem
    ADD CONSTRAINT islem_pkey PRIMARY KEY (islem_no);
 :   ALTER TABLE ONLY public.islem DROP CONSTRAINT islem_pkey;
       public            postgres    false    217            �           2606    41455    kredi_tur kredi_islem_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.kredi_tur
    ADD CONSTRAINT kredi_islem_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.kredi_tur DROP CONSTRAINT kredi_islem_pkey;
       public            postgres    false    221            �           2606    41457    kredi_talep kredi_talep_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kredi_talep
    ADD CONSTRAINT kredi_talep_pkey PRIMARY KEY (kredi_id);
 F   ALTER TABLE ONLY public.kredi_talep DROP CONSTRAINT kredi_talep_pkey;
       public            postgres    false    219            �           2606    41459    sistem sistem_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sistem
    ADD CONSTRAINT sistem_pkey PRIMARY KEY (tarih);
 <   ALTER TABLE ONLY public.sistem DROP CONSTRAINT sistem_pkey;
       public            postgres    false    225            �           2606    41461    musteriler tc_unique 
   CONSTRAINT     M   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT tc_unique UNIQUE (tc);
 >   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT tc_unique;
       public            postgres    false    223            �           2606    41463    calisanlar tc_unique2 
   CONSTRAINT     N   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT tc_unique2 UNIQUE (tc);
 ?   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT tc_unique2;
       public            postgres    false    211            �           2606    41465    calisanlar workers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT workers_pkey;
       public            postgres    false    211            �           2606    41467    yatirim_fonu yat_fon_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.yatirim_fonu
    ADD CONSTRAINT yat_fon_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.yatirim_fonu DROP CONSTRAINT yat_fon_pkey;
       public            postgres    false    226            8      x������ � �      :      x������ � �      <      x������ � �      >   1   x�3�4B#NC��Լ��Ē̢�\�?.��9P�,����� @
o      @   N   x�uʱ�0D��<=
:�@�$���@��������wDгp-���|i����ޙ�_�.U�y������df'���      B      x������ � �      D      x������ � �      F      x������ � �      H      x������ � �      I      x������ � �     