PGDMP         #            	    v            liftit    11.0    11.0 I    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            Y           1262    16393    liftit    DATABASE     �   CREATE DATABASE liftit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE liftit;
             postgres    false            �            1259    16418 	   trademark    TABLE     Y   CREATE TABLE public.trademark (
    id bigint NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.trademark;
       public         postgres    false            �            1259    16416    trademark_id_seq    SEQUENCE     y   CREATE SEQUENCE public.trademark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.trademark_id_seq;
       public       postgres    false    201            Z           0    0    trademark_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.trademark_id_seq OWNED BY public.trademark.id;
            public       postgres    false    200            �            1259    16407    type_bodywork    TABLE     ]   CREATE TABLE public.type_bodywork (
    id bigint NOT NULL,
    description text NOT NULL
);
 !   DROP TABLE public.type_bodywork;
       public         postgres    false            �            1259    16405    type_bodywork_id_seq    SEQUENCE     }   CREATE SEQUENCE public.type_bodywork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.type_bodywork_id_seq;
       public       postgres    false    199            [           0    0    type_bodywork_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.type_bodywork_id_seq OWNED BY public.type_bodywork.id;
            public       postgres    false    198            �            1259    16429 	   type_user    TABLE     Y   CREATE TABLE public.type_user (
    id bigint NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.type_user;
       public         postgres    false            �            1259    16427    type_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.type_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.type_user_id_seq;
       public       postgres    false    203            \           0    0    type_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.type_user_id_seq OWNED BY public.type_user.id;
            public       postgres    false    202            �            1259    16396    type_vehicle    TABLE     \   CREATE TABLE public.type_vehicle (
    id bigint NOT NULL,
    description text NOT NULL
);
     DROP TABLE public.type_vehicle;
       public         postgres    false            �            1259    16394    type_vehicle_id_seq    SEQUENCE     |   CREATE SEQUENCE public.type_vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.type_vehicle_id_seq;
       public       postgres    false    197            ]           0    0    type_vehicle_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.type_vehicle_id_seq OWNED BY public.type_vehicle.id;
            public       postgres    false    196            �            1259    16442    users_li    TABLE     �   CREATE TABLE public.users_li (
    id bigint NOT NULL,
    last_name text NOT NULL,
    full_name text NOT NULL,
    identification text NOT NULL,
    ident_file bytea,
    type_user bigint NOT NULL
);
    DROP TABLE public.users_li;
       public         postgres    false            �            1259    16438    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public       postgres    false    206            ^           0    0    user_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.user_id_seq OWNED BY public.users_li.id;
            public       postgres    false    204            �            1259    16440    user_type_user_seq    SEQUENCE     {   CREATE SEQUENCE public.user_type_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_type_user_seq;
       public       postgres    false    206            _           0    0    user_type_user_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.user_type_user_seq OWNED BY public.users_li.type_user;
            public       postgres    false    205            �            1259    16515 
   vehicle_li    TABLE     �   CREATE TABLE public.vehicle_li (
    id bigint NOT NULL,
    plate character varying(6) NOT NULL,
    type_vehicle bigint NOT NULL,
    type_bodywork bigint NOT NULL,
    trademark bigint NOT NULL,
    id_user bigint NOT NULL
);
    DROP TABLE public.vehicle_li;
       public         postgres    false            �            1259    16505    vehicle_li_id_seq    SEQUENCE     z   CREATE SEQUENCE public.vehicle_li_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.vehicle_li_id_seq;
       public       postgres    false    212            `           0    0    vehicle_li_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.vehicle_li_id_seq OWNED BY public.vehicle_li.id;
            public       postgres    false    207            �            1259    16513    vehicle_li_id_user_seq    SEQUENCE        CREATE SEQUENCE public.vehicle_li_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.vehicle_li_id_user_seq;
       public       postgres    false    212            a           0    0    vehicle_li_id_user_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.vehicle_li_id_user_seq OWNED BY public.vehicle_li.id_user;
            public       postgres    false    211            �            1259    16511    vehicle_li_trademark_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_li_trademark_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.vehicle_li_trademark_seq;
       public       postgres    false    212            b           0    0    vehicle_li_trademark_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.vehicle_li_trademark_seq OWNED BY public.vehicle_li.trademark;
            public       postgres    false    210            �            1259    16509    vehicle_li_type_bodywork_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_li_type_bodywork_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.vehicle_li_type_bodywork_seq;
       public       postgres    false    212            c           0    0    vehicle_li_type_bodywork_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.vehicle_li_type_bodywork_seq OWNED BY public.vehicle_li.type_bodywork;
            public       postgres    false    209            �            1259    16507    vehicle_li_type_vehicle_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_li_type_vehicle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.vehicle_li_type_vehicle_seq;
       public       postgres    false    212            d           0    0    vehicle_li_type_vehicle_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.vehicle_li_type_vehicle_seq OWNED BY public.vehicle_li.type_vehicle;
            public       postgres    false    208            �
           2604    16421    trademark id    DEFAULT     l   ALTER TABLE ONLY public.trademark ALTER COLUMN id SET DEFAULT nextval('public.trademark_id_seq'::regclass);
 ;   ALTER TABLE public.trademark ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    16410    type_bodywork id    DEFAULT     t   ALTER TABLE ONLY public.type_bodywork ALTER COLUMN id SET DEFAULT nextval('public.type_bodywork_id_seq'::regclass);
 ?   ALTER TABLE public.type_bodywork ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    16432    type_user id    DEFAULT     l   ALTER TABLE ONLY public.type_user ALTER COLUMN id SET DEFAULT nextval('public.type_user_id_seq'::regclass);
 ;   ALTER TABLE public.type_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    16399    type_vehicle id    DEFAULT     r   ALTER TABLE ONLY public.type_vehicle ALTER COLUMN id SET DEFAULT nextval('public.type_vehicle_id_seq'::regclass);
 >   ALTER TABLE public.type_vehicle ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16445    users_li id    DEFAULT     f   ALTER TABLE ONLY public.users_li ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 :   ALTER TABLE public.users_li ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    206    206            �
           2604    16446    users_li type_user    DEFAULT     t   ALTER TABLE ONLY public.users_li ALTER COLUMN type_user SET DEFAULT nextval('public.user_type_user_seq'::regclass);
 A   ALTER TABLE public.users_li ALTER COLUMN type_user DROP DEFAULT;
       public       postgres    false    205    206    206            �
           2604    16518    vehicle_li id    DEFAULT     n   ALTER TABLE ONLY public.vehicle_li ALTER COLUMN id SET DEFAULT nextval('public.vehicle_li_id_seq'::regclass);
 <   ALTER TABLE public.vehicle_li ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    207    212            �
           2604    16519    vehicle_li type_vehicle    DEFAULT     �   ALTER TABLE ONLY public.vehicle_li ALTER COLUMN type_vehicle SET DEFAULT nextval('public.vehicle_li_type_vehicle_seq'::regclass);
 F   ALTER TABLE public.vehicle_li ALTER COLUMN type_vehicle DROP DEFAULT;
       public       postgres    false    208    212    212            �
           2604    16520    vehicle_li type_bodywork    DEFAULT     �   ALTER TABLE ONLY public.vehicle_li ALTER COLUMN type_bodywork SET DEFAULT nextval('public.vehicle_li_type_bodywork_seq'::regclass);
 G   ALTER TABLE public.vehicle_li ALTER COLUMN type_bodywork DROP DEFAULT;
       public       postgres    false    209    212    212            �
           2604    16521    vehicle_li trademark    DEFAULT     |   ALTER TABLE ONLY public.vehicle_li ALTER COLUMN trademark SET DEFAULT nextval('public.vehicle_li_trademark_seq'::regclass);
 C   ALTER TABLE public.vehicle_li ALTER COLUMN trademark DROP DEFAULT;
       public       postgres    false    212    210    212            �
           2604    16522    vehicle_li id_user    DEFAULT     x   ALTER TABLE ONLY public.vehicle_li ALTER COLUMN id_user SET DEFAULT nextval('public.vehicle_li_id_user_seq'::regclass);
 A   ALTER TABLE public.vehicle_li ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    211    212    212            H          0    16418 	   trademark 
   TABLE DATA               4   COPY public.trademark (id, description) FROM stdin;
    public       postgres    false    201   �N       F          0    16407    type_bodywork 
   TABLE DATA               8   COPY public.type_bodywork (id, description) FROM stdin;
    public       postgres    false    199   �N       J          0    16429 	   type_user 
   TABLE DATA               4   COPY public.type_user (id, description) FROM stdin;
    public       postgres    false    203   �O       D          0    16396    type_vehicle 
   TABLE DATA               7   COPY public.type_vehicle (id, description) FROM stdin;
    public       postgres    false    197   �O       M          0    16442    users_li 
   TABLE DATA               c   COPY public.users_li (id, last_name, full_name, identification, ident_file, type_user) FROM stdin;
    public       postgres    false    206   oP       S          0    16515 
   vehicle_li 
   TABLE DATA               `   COPY public.vehicle_li (id, plate, type_vehicle, type_bodywork, trademark, id_user) FROM stdin;
    public       postgres    false    212   �P       e           0    0    trademark_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.trademark_id_seq', 16, true);
            public       postgres    false    200            f           0    0    type_bodywork_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.type_bodywork_id_seq', 25, true);
            public       postgres    false    198            g           0    0    type_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.type_user_id_seq', 2, true);
            public       postgres    false    202            h           0    0    type_vehicle_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.type_vehicle_id_seq', 19, true);
            public       postgres    false    196            i           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 10, true);
            public       postgres    false    204            j           0    0    user_type_user_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_type_user_seq', 1, false);
            public       postgres    false    205            k           0    0    vehicle_li_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.vehicle_li_id_seq', 19, true);
            public       postgres    false    207            l           0    0    vehicle_li_id_user_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.vehicle_li_id_user_seq', 1, false);
            public       postgres    false    211            m           0    0    vehicle_li_trademark_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.vehicle_li_trademark_seq', 1, false);
            public       postgres    false    210            n           0    0    vehicle_li_type_bodywork_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.vehicle_li_type_bodywork_seq', 1, false);
            public       postgres    false    209            o           0    0    vehicle_li_type_vehicle_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.vehicle_li_type_vehicle_seq', 1, false);
            public       postgres    false    208            �
           2606    16426    trademark trademark_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.trademark
    ADD CONSTRAINT trademark_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.trademark DROP CONSTRAINT trademark_pkey;
       public         postgres    false    201            �
           2606    16415     type_bodywork type_bodywork_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.type_bodywork
    ADD CONSTRAINT type_bodywork_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.type_bodywork DROP CONSTRAINT type_bodywork_pkey;
       public         postgres    false    199            �
           2606    16437    type_user type_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.type_user
    ADD CONSTRAINT type_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.type_user DROP CONSTRAINT type_user_pkey;
       public         postgres    false    203            �
           2606    16404    type_vehicle type_vehicle_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.type_vehicle
    ADD CONSTRAINT type_vehicle_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.type_vehicle DROP CONSTRAINT type_vehicle_pkey;
       public         postgres    false    197            �
           2606    16451    users_li user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users_li
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.users_li DROP CONSTRAINT user_pkey;
       public         postgres    false    206            �
           2606    24586 $   users_li users_li_identification_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.users_li
    ADD CONSTRAINT users_li_identification_key UNIQUE (identification);
 N   ALTER TABLE ONLY public.users_li DROP CONSTRAINT users_li_identification_key;
       public         postgres    false    206            �
           2606    16524    vehicle_li vehicle_li_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT vehicle_li_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT vehicle_li_pkey;
       public         postgres    false    212            �
           2606    24588    vehicle_li vehicle_li_plate_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT vehicle_li_plate_key UNIQUE (plate);
 I   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT vehicle_li_plate_key;
       public         postgres    false    212            �
           2606    16530    vehicle_li bodywork    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT bodywork FOREIGN KEY (type_bodywork) REFERENCES public.type_bodywork(id);
 =   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT bodywork;
       public       postgres    false    199    2744    212            �
           2606    16535    vehicle_li trademark    FK CONSTRAINT     y   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT trademark FOREIGN KEY (trademark) REFERENCES public.trademark(id);
 >   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT trademark;
       public       postgres    false    2746    201    212            �
           2606    16452    users_li type_user    FK CONSTRAINT     w   ALTER TABLE ONLY public.users_li
    ADD CONSTRAINT type_user FOREIGN KEY (type_user) REFERENCES public.type_user(id);
 <   ALTER TABLE ONLY public.users_li DROP CONSTRAINT type_user;
       public       postgres    false    206    2748    203            �
           2606    16546    vehicle_li user_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT user_id FOREIGN KEY (id_user) REFERENCES public.users_li(id);
 <   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT user_id;
       public       postgres    false    2750    212    206            �
           2606    16525    vehicle_li vehicle    FK CONSTRAINT     }   ALTER TABLE ONLY public.vehicle_li
    ADD CONSTRAINT vehicle FOREIGN KEY (type_vehicle) REFERENCES public.type_vehicle(id);
 <   ALTER TABLE ONLY public.vehicle_li DROP CONSTRAINT vehicle;
       public       postgres    false    197    2742    212            H   7   x�3�t�H-+��I-�2���)��2�J�K,�)�24	e�'���q��qqq ~�      F   �   x���n�@�띇�8��&J�B �4kg��wa9x�(�_,甫�o��~�v�U��vK��S:��Y�w�����|�bA��s�gƒ*�L�&Q�4Ǌv��#�XӋ�5#LF4�y���iwK�8B9�]�M�0��U"6><������ZS��b��,����H���YX���QN�d�1| � GDEK      J   '   x�3�(�/�L-I,���2�t��K)M.�/����� �s	q      D      x�U�;�0�}��@��[�)�#*�������?Bi��hݹ�Ґ�S8����Q�$���y]b]�H>��r��*S�M�K#��+�*����q��[*�qg������14VMf�ܹ�a���c��:0}      M   9   x���tO,J>�6Q!(53/�ӧ4�X�-5'� ����������Ē3Əӈ+F��� �4l      S   I   x��;�0�z}�%?�L���
Y��8h�z4D��a���k-����[��)J0��6ǜSU��i�!"=Z>     