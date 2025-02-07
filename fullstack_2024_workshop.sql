PGDMP                  
    |            fullstack_2024_workshop    17.2    17.2 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    17277    fullstack_2024_workshop    DATABASE     �   CREATE DATABASE fullstack_2024_workshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Thai_Thailand.874';
 '   DROP DATABASE fullstack_2024_workshop;
                     postgres    false            �            1259    17520    BillSale    TABLE     )  CREATE TABLE public."BillSale" (
    id integer NOT NULL,
    "customerName" text NOT NULL,
    "customerPhone" text NOT NULL,
    "customerAddress" text NOT NULL,
    "payDate" timestamp(3) without time zone NOT NULL,
    "payTime" text NOT NULL,
    status text DEFAULT 'wait'::text NOT NULL
);
    DROP TABLE public."BillSale";
       public         heap r       postgres    false            �            1259    17530    BillSaleDetail    TABLE     �   CREATE TABLE public."BillSaleDetail" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "billSaleId" integer NOT NULL,
    cost integer NOT NULL,
    price integer NOT NULL
);
 $   DROP TABLE public."BillSaleDetail";
       public         heap r       postgres    false            �            1259    17529    BillSaleDetail_id_seq    SEQUENCE     �   CREATE SEQUENCE public."BillSaleDetail_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."BillSaleDetail_id_seq";
       public               postgres    false    225                        0    0    BillSaleDetail_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."BillSaleDetail_id_seq" OWNED BY public."BillSaleDetail".id;
          public               postgres    false    224            �            1259    17519    BillSale_id_seq    SEQUENCE     �   CREATE SEQUENCE public."BillSale_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."BillSale_id_seq";
       public               postgres    false    223            !           0    0    BillSale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."BillSale_id_seq" OWNED BY public."BillSale".id;
          public               postgres    false    222            �            1259    17346    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    cost integer NOT NULL,
    price integer NOT NULL,
    img text NOT NULL,
    status text DEFAULT 'use'::text NOT NULL
);
    DROP TABLE public."Product";
       public         heap r       postgres    false            �            1259    17345    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public               postgres    false    221            "           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public               postgres    false    220            �            1259    17292    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    name text NOT NULL,
    "user" text NOT NULL,
    pass text NOT NULL,
    status text DEFAULT 'use'::text NOT NULL
);
    DROP TABLE public."User";
       public         heap r       postgres    false            �            1259    17291    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public               postgres    false    219            #           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public               postgres    false    218            �            1259    17280    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap r       postgres    false            p           2604    17523    BillSale id    DEFAULT     n   ALTER TABLE ONLY public."BillSale" ALTER COLUMN id SET DEFAULT nextval('public."BillSale_id_seq"'::regclass);
 <   ALTER TABLE public."BillSale" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            r           2604    17533    BillSaleDetail id    DEFAULT     z   ALTER TABLE ONLY public."BillSaleDetail" ALTER COLUMN id SET DEFAULT nextval('public."BillSaleDetail_id_seq"'::regclass);
 B   ALTER TABLE public."BillSaleDetail" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            n           2604    17349 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            l           2604    17295    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218    219                      0    17520    BillSale 
   TABLE DATA           z   COPY public."BillSale" (id, "customerName", "customerPhone", "customerAddress", "payDate", "payTime", status) FROM stdin;
    public               postgres    false    223   '-                 0    17530    BillSaleDetail 
   TABLE DATA           V   COPY public."BillSaleDetail" (id, "productId", "billSaleId", cost, price) FROM stdin;
    public               postgres    false    225   �-                 0    17346    Product 
   TABLE DATA           G   COPY public."Product" (id, name, cost, price, img, status) FROM stdin;
    public               postgres    false    221   .                 0    17292    User 
   TABLE DATA           @   COPY public."User" (id, name, "user", pass, status) FROM stdin;
    public               postgres    false    219   �.                 0    17280    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public               postgres    false    217    /       $           0    0    BillSaleDetail_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."BillSaleDetail_id_seq"', 9, true);
          public               postgres    false    224            %           0    0    BillSale_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."BillSale_id_seq"', 6, true);
          public               postgres    false    222            &           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 22, true);
          public               postgres    false    220            '           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public               postgres    false    218            }           2606    17535 "   BillSaleDetail BillSaleDetail_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."BillSaleDetail"
    ADD CONSTRAINT "BillSaleDetail_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."BillSaleDetail" DROP CONSTRAINT "BillSaleDetail_pkey";
       public                 postgres    false    225            {           2606    17528    BillSale BillSale_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."BillSale"
    ADD CONSTRAINT "BillSale_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."BillSale" DROP CONSTRAINT "BillSale_pkey";
       public                 postgres    false    223            y           2606    17353    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public                 postgres    false    221            v           2606    17300    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public                 postgres    false    219            t           2606    17288 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public                 postgres    false    217            w           1259    17738    User_user_key    INDEX     K   CREATE UNIQUE INDEX "User_user_key" ON public."User" USING btree ("user");
 #   DROP INDEX public."User_user_key";
       public                 postgres    false    219            ~           2606    17541 -   BillSaleDetail BillSaleDetail_billSaleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BillSaleDetail"
    ADD CONSTRAINT "BillSaleDetail_billSaleId_fkey" FOREIGN KEY ("billSaleId") REFERENCES public."BillSale"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 [   ALTER TABLE ONLY public."BillSaleDetail" DROP CONSTRAINT "BillSaleDetail_billSaleId_fkey";
       public               postgres    false    4731    223    225                       2606    17536 ,   BillSaleDetail BillSaleDetail_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."BillSaleDetail"
    ADD CONSTRAINT "BillSaleDetail_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public."BillSaleDetail" DROP CONSTRAINT "BillSaleDetail_productId_fkey";
       public               postgres    false    225    4729    221               y   x�u̻�0E�xUHڏրkqh�N\��-��E7[
����;/xѹ����b�����w;s'��x Y��KD�4t��m@�d���yz�ps���N�TN�HN9q�9�erG�ݝ[
!�\mK�         Z   x�-�Q�0B��0���[���c`���X���L�e4�h"�(��J�hԮ��
�ѷ���a��ٛ��.����K��"��         �   x�u�;�0��?��	��y5waA��1@%����9 {{�����9C��E�^i����w?��հx�{e*l`4̊����S�	�A+8��R�'��B�B�q���R3��,�tD��XYhe���^Y���(
}����17�%"C8���p,�I�C���x�t��M�Ź��F]���ӹ��]������f            x�3��J�KUHL����D&K�S�b���� �i
.         '  x�m��n#&������
�a��}��,�)U�m[}��$m�m$�@#�-� .s�,D��<��@�4'W9 J��:u�E.¬�,<��U�N�@g�٢�UѰj��F�T�rB=5<V!���[�juԆ��K���x��ی�����񥀰Z�	�h�Nu�f���i��F���!ے�t�ֱ�>{��r�};X6hJ�6�h8�@O���\�7�˩�QLX�ê�4?������|��i�p���{!aǱ�MW1"*d�J�1J�����F��X��B��$i���+I]Sq@�CRV�t��BO�NHǝ�8��@��􆳓�\_�`��t�΄�VgO�Q�*����n�h�"H��P�ԜdFpUꤼ�l /�}�C���l�;���3�}\�� �u���\��e��t+���?r>��������`�s��r^���O����
|R��j�p&jXK�S�y��>���[,��`�&�y�!.1�ix�_����e΄6wJ
�+7�?��g;�&l�5�7������z}�/_�|mC"�8ߏ�)�     