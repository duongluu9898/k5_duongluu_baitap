PGDMP      .                |            f8_fullstack_k5    15.7    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    f8_fullstack_k5    DATABASE     �   CREATE DATABASE f8_fullstack_k5 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE f8_fullstack_k5;
                postgres    false            �            1259    16399    phong    TABLE       CREATE TABLE public.phong (
    ma_phong character varying NOT NULL,
    loai_phong character varying,
    so_khach_toi_da integer,
    gia_phong_1_gio integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.phong;
       public         heap    postgres    false            �          0    16399    phong 
   TABLE DATA           o   COPY public.phong (ma_phong, loai_phong, so_khach_toi_da, gia_phong_1_gio, created_at, updated_at) FROM stdin;
    public          postgres    false    214   )       g           2606    16407    phong phong_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.phong
    ADD CONSTRAINT phong_pkey PRIMARY KEY (ma_phong);
 :   ALTER TABLE ONLY public.phong DROP CONSTRAINT phong_pkey;
       public            postgres    false    214            �   a   x�0000���O�T0�42�4��#]s]#CC+c+##=Kcs#Kms��\@��&�rZP�Dc��F�����T1�b�1�ה����� �)@�     