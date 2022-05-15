PGDMP         )                z            project    14.2    14.2 G    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    16983    project    DATABASE     d   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE project;
                postgres    false            �            1255    17076    delete_calisanlar(bigint)    FUNCTION       CREATE FUNCTION public.delete_calisanlar(_tc bigint) RETURNS integer
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
 4   DROP FUNCTION public.delete_calisanlar(_tc bigint);
       public          postgres    false            �            1255    16985    delete_hesaplar(integer)    FUNCTION     H  CREATE FUNCTION public.delete_hesaplar(_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      delete from hesaplar
      where id = _id AND hesaplar.bakiye=0 OR hesaplar.bakiye IS NULL;
      if found then -- deleted successfully
        return 1;
      else
        return 0;
      end if;
    end
    $$;
 3   DROP FUNCTION public.delete_hesaplar(_id integer);
       public          postgres    false            �            1255    16986    delete_kreditalep(integer)    FUNCTION       CREATE FUNCTION public.delete_kreditalep(_id integer) RETURNS integer
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
       public          postgres    false            �            1255    17077    delete_musteriler(bigint)    FUNCTION     �   CREATE FUNCTION public.delete_musteriler(_tc bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
     begin
	 delete from musteriler
	 where tc = _tc;
	 if found then --deleted successfully
	  return 1;
	 else
	  return 0;
	 end if;
	end
    $$;
 4   DROP FUNCTION public.delete_musteriler(_tc bigint);
       public          postgres    false            �            1255    17080    delete_tumhesaplar(bigint)    FUNCTION     V  CREATE FUNCTION public.delete_tumhesaplar(_uye_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      delete from hesaplar
      where uye_id = _uye_id AND hesaplar.bakiye=0 OR hesaplar.bakiye IS NULL;
      if found then -- deleted successfully
        return 1;
      else
        return 0;
      end if;
    end
    $$;
 9   DROP FUNCTION public.delete_tumhesaplar(_uye_id bigint);
       public          postgres    false            �            1255    16988 �   insert_calisanlar(integer, character varying, character varying, character varying, character varying, bigint, bigint, character varying)    FUNCTION     "  CREATE FUNCTION public.insert_calisanlar("_kullanıcı_kodu" integer, _isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _sifre character varying) RETURNS integer
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
       public          postgres    false            �            1255    17097 `   insert_hesaplar(bigint, integer, integer, double precision, character varying, integer, integer)    FUNCTION     1  CREATE FUNCTION public.insert_hesaplar(_uye_id bigint, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying, _onay integer, _durum integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      insert into hesaplar(uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim, onay, durum)
      values(_uye_id, _hesap_tur_id, _yatirim_fon_id, _bakiye, _hesap_isim, _onay, _durum);
      if found then -- inserted successfully
        return 1;
      else 
        return 0;
      end if;
    end
    $$;
 �   DROP FUNCTION public.insert_hesaplar(_uye_id bigint, _hesap_tur_id integer, _yatirim_fon_id integer, _bakiye double precision, _hesap_isim character varying, _onay integer, _durum integer);
       public          postgres    false            �            1255    17128 k   insert_islem(character varying, bigint, bigint, double precision, double precision, double precision, date)    FUNCTION     ;  CREATE FUNCTION public.insert_islem(_islem character varying, _kaynak_tc bigint, _hedef_tc bigint, _tutar double precision, _kaynak_bakiye double precision, _hedef_bakiye double precision, _tarih date) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      insert into islem(islem, kaynak_tc , hedef_tc, tutar, kaynak_bakiye, hedef_bakiye, tarih)
      values(_islem, _kaynak_tc, _hedef_tc, _tutar, _kaynak_bakiye, _hedef_bakiye, _tarih);
      if found then -- inserted successfully
        return 1;
      else 
        return 0;
      end if;
    end
    
$$;
 �   DROP FUNCTION public.insert_islem(_islem character varying, _kaynak_tc bigint, _hedef_tc bigint, _tutar double precision, _kaynak_bakiye double precision, _hedef_bakiye double precision, _tarih date);
       public          postgres    false            �            1255    17121 >   insert_kredi_talep(bigint, double precision, integer, integer)    FUNCTION     �  CREATE FUNCTION public.insert_kredi_talep(_tc bigint, _talep_miktar double precision, _kredi_tur_id integer, _onay integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    begin
      insert into kredi_talep(tc, talep_miktar, kredi_tur_id, onay)
      values(_tc, _talep_miktar, _kredi_tur_id, _onay);
      if found then -- inserted successfully
        return 1;
      else 
        return 0;
      end if;
    end
    
$$;
 {   DROP FUNCTION public.insert_kredi_talep(_tc bigint, _talep_miktar double precision, _kredi_tur_id integer, _onay integer);
       public          postgres    false            �            1255    16990 �   insert_musteriler(character varying, character varying, character varying, character varying, bigint, bigint, bigint, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying) RETURNS integer
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
       public          postgres    false            �            1255    16991 8   insert_yatirim_fonu(character varying, double precision)    FUNCTION     2  CREATE FUNCTION public.insert_yatirim_fonu(_para_turu character varying, _kur double precision) RETURNS integer
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
       public          postgres    false            �            1255    16992 >   login_bankacalışanları(integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION public."login_bankacalışanları"(_tc integer, _sifre character varying, "_kullanıcıkodu" integer) RETURNS integer
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
       public          postgres    false            �            1255    16993 +   login_müşteri(integer, character varying)    FUNCTION     9  CREATE FUNCTION public."login_müşteri"(_tc integer, _sifre character varying) RETURNS integer
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
       public          postgres    false            �            1255    17100 +   update_durumhesap(bigint, integer, integer)    FUNCTION     9  CREATE FUNCTION public.update_durumhesap(_tc bigint, _durum integer, _id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update hesaplar
 set 
  durum=_durum
 where id = _id AND uye_id = _tc;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 Q   DROP FUNCTION public.update_durumhesap(_tc bigint, _durum integer, _id integer);
       public          postgres    false                        1255    17130 =   update_kredi_tur(integer, double precision, double precision)    FUNCTION     H  CREATE FUNCTION public.update_kredi_tur(_id integer, _vade double precision, _faiz double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update kredi_tur
 set 
  vade=_vade,
  faiz=_faiz
 where id = _id;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 d   DROP FUNCTION public.update_kredi_tur(_id integer, _vade double precision, _faiz double precision);
       public          postgres    false            �            1255    16994 "   update_kreditalep(bigint, integer)    FUNCTION       CREATE FUNCTION public.update_kreditalep(_tc bigint, _onay integer) RETURNS integer
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
       public          postgres    false            �            1255    16995 �   update_musteriler(character varying, character varying, character varying, character varying, bigint, bigint, bigint, character varying)    FUNCTION       CREATE FUNCTION public.update_musteriler(_isim character varying, _soyisim character varying, _adres character varying, _email character varying, _telefon bigint, _tc bigint, _temsilci_id bigint, _sifre character varying) RETURNS integer
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
       public          postgres    false            �            1255    16996 !   update_onayhesap(bigint, integer)    FUNCTION       CREATE FUNCTION public.update_onayhesap(_tc bigint, _onay integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update hesaplar
 set 
  onay=_onay
 where uye_id = _tc;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 B   DROP FUNCTION public.update_onayhesap(_tc bigint, _onay integer);
       public          postgres    false            �            1255    17099 -   update_yatirimfonu(integer, double precision)    FUNCTION     $  CREATE FUNCTION public.update_yatirimfonu(_id integer, _kur double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$

 begin
  update yatirim_fonu
 set 
  kur=_kur
 where id = _id;
 if found then --updated successfully
  return 1;
 else --updated fail
  return 0;
 end if;
 end
 
$$;
 M   DROP FUNCTION public.update_yatirimfonu(_id integer, _kur double precision);
       public          postgres    false            �            1259    16997    banka_uyeleri    TABLE     �   CREATE TABLE public.banka_uyeleri (
    "kullanıcı_kodu" integer NOT NULL,
    uye_isim character varying NOT NULL,
    maas double precision NOT NULL
);
 !   DROP TABLE public.banka_uyeleri;
       public         heap    postgres    false            �            1259    17002 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE     �   ALTER TABLE public.banka_uyeleri ALTER COLUMN "kullanıcı_kodu" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."banka_uyeleri_kullanıcı_kodu_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    209            �            1259    17003 
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
       public         heap    postgres    false            �            1259    17008    calisanlar_id_seq    SEQUENCE     �   ALTER TABLE public.calisanlar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calisanlar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    211            �            1259    17009 	   hesap_tur    TABLE     _   CREATE TABLE public.hesap_tur (
    id integer NOT NULL,
    tur character varying NOT NULL
);
    DROP TABLE public.hesap_tur;
       public         heap    postgres    false            �            1259    17015    hesaplar    TABLE       CREATE TABLE public.hesaplar (
    id integer NOT NULL,
    uye_id bigint NOT NULL,
    hesap_tur_id integer NOT NULL,
    yatirim_fon_id integer NOT NULL,
    bakiye double precision,
    hesap_isim character varying NOT NULL,
    onay integer NOT NULL,
    durum integer NOT NULL
);
    DROP TABLE public.hesaplar;
       public         heap    postgres    false            �            1259    17020    hesaplar_id_seq    SEQUENCE     �   ALTER TABLE public.hesaplar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hesaplar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    214            �            1259    17021    islem    TABLE     %  CREATE TABLE public.islem (
    islem_no integer NOT NULL,
    islem character varying NOT NULL,
    kaynak_tc bigint NOT NULL,
    hedef_tc bigint NOT NULL,
    tutar double precision NOT NULL,
    kaynak_bakiye double precision,
    hedef_bakiye double precision,
    tarih date NOT NULL
);
    DROP TABLE public.islem;
       public         heap    postgres    false            �            1259    17026    islem_islem_no_seq    SEQUENCE     �   ALTER TABLE public.islem ALTER COLUMN islem_no ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.islem_islem_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    216            �            1259    17027    kredi_talep    TABLE     �   CREATE TABLE public.kredi_talep (
    kredi_id integer NOT NULL,
    tc bigint NOT NULL,
    talep_miktar double precision NOT NULL,
    kredi_tur_id integer NOT NULL,
    onay integer NOT NULL
);
    DROP TABLE public.kredi_talep;
       public         heap    postgres    false            �            1259    17030    kredi_talep_kredi_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_talep ALTER COLUMN kredi_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_talep_kredi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    218            �            1259    17031 	   kredi_tur    TABLE     �   CREATE TABLE public.kredi_tur (
    id integer NOT NULL,
    tur character varying NOT NULL,
    vade double precision NOT NULL,
    faiz double precision NOT NULL
);
    DROP TABLE public.kredi_tur;
       public         heap    postgres    false            �            1259    17036    kredi_tur_id_seq    SEQUENCE     �   ALTER TABLE public.kredi_tur ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kredi_tur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    220            �            1259    17037 
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
       public         heap    postgres    false            �            1259    17042    musteriler_id_seq    SEQUENCE     �   ALTER TABLE public.musteriler ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.musteriler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    222            �            1259    17043    sistem    TABLE     j   CREATE TABLE public.sistem (
    tarih date NOT NULL,
    id integer NOT NULL,
    tc integer NOT NULL
);
    DROP TABLE public.sistem;
       public         heap    postgres    false            �            1259    17046    yatirim_fonu    TABLE     �   CREATE TABLE public.yatirim_fonu (
    id integer NOT NULL,
    para_turu character varying NOT NULL,
    kur double precision NOT NULL
);
     DROP TABLE public.yatirim_fonu;
       public         heap    postgres    false            �            1259    17051    yatirim_fonu_id_seq    SEQUENCE     �   ALTER TABLE public.yatirim_fonu ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.yatirim_fonu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            public          postgres    false    225            =          0    16997    banka_uyeleri 
   TABLE DATA           K   COPY public.banka_uyeleri ("kullanıcı_kodu", uye_isim, maas) FROM stdin;
    public          postgres    false    209   um       ?          0    17003 
   calisanlar 
   TABLE DATA           m   COPY public.calisanlar (id, "kullanıcı_kodu", isim, soyisim, adres, email, telefon, tc, sifre) FROM stdin;
    public          postgres    false    211   �m       A          0    17009 	   hesap_tur 
   TABLE DATA           ,   COPY public.hesap_tur (id, tur) FROM stdin;
    public          postgres    false    213   n       B          0    17015    hesaplar 
   TABLE DATA           m   COPY public.hesaplar (id, uye_id, hesap_tur_id, yatirim_fon_id, bakiye, hesap_isim, onay, durum) FROM stdin;
    public          postgres    false    214   On       D          0    17021    islem 
   TABLE DATA           p   COPY public.islem (islem_no, islem, kaynak_tc, hedef_tc, tutar, kaynak_bakiye, hedef_bakiye, tarih) FROM stdin;
    public          postgres    false    216   �n       F          0    17027    kredi_talep 
   TABLE DATA           U   COPY public.kredi_talep (kredi_id, tc, talep_miktar, kredi_tur_id, onay) FROM stdin;
    public          postgres    false    218   o       H          0    17031 	   kredi_tur 
   TABLE DATA           8   COPY public.kredi_tur (id, tur, vade, faiz) FROM stdin;
    public          postgres    false    220   5o       J          0    17037 
   musteriler 
   TABLE DATA           f   COPY public.musteriler (id, isim, soyisim, adres, email, telefon, tc, temsilci_id, sifre) FROM stdin;
    public          postgres    false    222   Ro       L          0    17043    sistem 
   TABLE DATA           /   COPY public.sistem (tarih, id, tc) FROM stdin;
    public          postgres    false    224   �o       M          0    17046    yatirim_fonu 
   TABLE DATA           :   COPY public.yatirim_fonu (id, para_turu, kur) FROM stdin;
    public          postgres    false    225   �o       U           0    0 "   banka_uyeleri_kullanıcı_kodu_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."banka_uyeleri_kullanıcı_kodu_seq"', 1, false);
          public          postgres    false    210            V           0    0    calisanlar_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.calisanlar_id_seq', 2, true);
          public          postgres    false    212            W           0    0    hesaplar_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.hesaplar_id_seq', 1, true);
          public          postgres    false    215            X           0    0    islem_islem_no_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.islem_islem_no_seq', 7, true);
          public          postgres    false    217            Y           0    0    kredi_talep_kredi_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.kredi_talep_kredi_id_seq', 1, false);
          public          postgres    false    219            Z           0    0    kredi_tur_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kredi_tur_id_seq', 1, false);
          public          postgres    false    221            [           0    0    musteriler_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.musteriler_id_seq', 3, true);
          public          postgres    false    223            \           0    0    yatirim_fonu_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.yatirim_fonu_id_seq', 2, true);
          public          postgres    false    226            �           2606    17053    hesaplar accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hesaplar
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.hesaplar DROP CONSTRAINT accounts_pkey;
       public            postgres    false    214            �           2606    17055    banka_uyeleri bank_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.banka_uyeleri
    ADD CONSTRAINT bank_pkey PRIMARY KEY ("kullanıcı_kodu");
 A   ALTER TABLE ONLY public.banka_uyeleri DROP CONSTRAINT bank_pkey;
       public            postgres    false    209            �           2606    17057    musteriler customers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT customers_pkey;
       public            postgres    false    222            �           2606    17059    hesap_tur hesap_tur_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hesap_tur
    ADD CONSTRAINT hesap_tur_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.hesap_tur DROP CONSTRAINT hesap_tur_pkey;
       public            postgres    false    213            �           2606    17061    islem islem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.islem
    ADD CONSTRAINT islem_pkey PRIMARY KEY (islem_no);
 :   ALTER TABLE ONLY public.islem DROP CONSTRAINT islem_pkey;
       public            postgres    false    216            �           2606    17063    kredi_tur kredi_islem_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.kredi_tur
    ADD CONSTRAINT kredi_islem_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.kredi_tur DROP CONSTRAINT kredi_islem_pkey;
       public            postgres    false    220            �           2606    17065    kredi_talep kredi_talep_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kredi_talep
    ADD CONSTRAINT kredi_talep_pkey PRIMARY KEY (kredi_id);
 F   ALTER TABLE ONLY public.kredi_talep DROP CONSTRAINT kredi_talep_pkey;
       public            postgres    false    218            �           2606    17067    sistem sistem_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sistem
    ADD CONSTRAINT sistem_pkey PRIMARY KEY (tarih);
 <   ALTER TABLE ONLY public.sistem DROP CONSTRAINT sistem_pkey;
       public            postgres    false    224            �           2606    17069    musteriler tc_unique 
   CONSTRAINT     M   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT tc_unique UNIQUE (tc);
 >   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT tc_unique;
       public            postgres    false    222            �           2606    17071    calisanlar tc_unique2 
   CONSTRAINT     N   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT tc_unique2 UNIQUE (tc);
 ?   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT tc_unique2;
       public            postgres    false    211            �           2606    17073    calisanlar workers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT workers_pkey;
       public            postgres    false    211            �           2606    17075    yatirim_fonu yat_fon_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.yatirim_fonu
    ADD CONSTRAINT yat_fon_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.yatirim_fonu DROP CONSTRAINT yat_fon_pkey;
       public            postgres    false    225            =      x������ � �      ?   n   x�3�4�tK-�H,��.=:�31�(�؈3=713�L�%��r�������r��������p$��rM	N-JO��RT1�b�1vc�LP�115����� .�(      A   /   x�3���/�M��2��.JM��2�t9��,��˘�)1/;�+F��� ��      B   *   x�3�4463�47�0�4�4�b����DNN�=... {�{      D      x�����@D�*h k��sP�S�F"A2�P�pc>N�:d2�I���0�`D0Q	!kK]+"���eG%S�I����۴L���~=��9�ŽO��>�%s35-Ӷ�����~��[�~:�?^B_�cI0      F      x������ � �      H      x������ � �      J   q   x�3��H�J,���?��31�(�ؐ35713��!D�%��r�����s��Y��[�Yq����eM8����R����H4�Ȅ���$�	4n��	v3c���� �\F�      L      x������ � �      M   "   x�3�L��I,�44�2�L--��44����� Y1�     