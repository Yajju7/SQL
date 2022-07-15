PGDMP                          z            EMPLOYEE     14.4 (Ubuntu 14.4-1.pgdg20.04+1)     14.4 (Ubuntu 14.4-1.pgdg20.04+1)      +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16390    EMPLOYEE    DATABASE     Y   CREATE DATABASE "EMPLOYEE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_IN';
    DROP DATABASE "EMPLOYEE";
                postgres    false            �            1259    16397 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40) DEFAULT NULL::character varying,
    region_id integer NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16428    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16460 
   dependents    TABLE     �   CREATE TABLE public.dependents (
    dependent_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    relationship character varying(25) NOT NULL,
    employee_id integer NOT NULL
);
    DROP TABLE public.dependents;
       public         heap    postgres    false            �            1259    16438 	   employees    TABLE     �  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20) DEFAULT NULL::character varying,
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20) DEFAULT NULL::character varying,
    hire_date date NOT NULL,
    job_id integer NOT NULL,
    salary numeric(8,2) NOT NULL,
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16421    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id integer NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(8,2) DEFAULT NULL::numeric,
    max_salary numeric(8,2) DEFAULT NULL::numeric
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    16408 	   locations    TABLE     n  CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40) DEFAULT NULL::character varying,
    postal_code character varying(12) DEFAULT NULL::character varying,
    city character varying(30) NOT NULL,
    state_province character varying(25) DEFAULT NULL::character varying,
    country_id character(2) NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16391    regions    TABLE     �   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25) DEFAULT NULL::character varying
);
    DROP TABLE public.regions;
       public         heap    postgres    false            #          0    16397 	   countries 
   TABLE DATA           H   COPY public.countries (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    210   �)       &          0    16428    departments 
   TABLE DATA           R   COPY public.departments (department_id, department_name, location_id) FROM stdin;
    public          postgres    false    213   V*       (          0    16460 
   dependents 
   TABLE DATA           d   COPY public.dependents (dependent_id, first_name, last_name, relationship, employee_id) FROM stdin;
    public          postgres    false    215   �*       '          0    16438 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) FROM stdin;
    public          postgres    false    214   �,       %          0    16421    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    212   �1       $          0    16408 	   locations 
   TABLE DATA           o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public          postgres    false    211   H3       "          0    16391    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    209   �4       �           2606    16402    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    210            �           2606    16432    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    213            �           2606    16464    dependents dependents_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dependents
    ADD CONSTRAINT dependents_pkey PRIMARY KEY (dependent_id);
 D   ALTER TABLE ONLY public.dependents DROP CONSTRAINT dependents_pkey;
       public            postgres    false    215            �           2606    16444    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    214            �           2606    16427    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    212            �           2606    16415    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    211            �           2606    16396    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    209            �           2606    16403 "   countries countries_region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_region_id_fkey;
       public          postgres    false    3203    209    210            �           2606    16433 (   departments departments_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_location_id_fkey;
       public          postgres    false    3207    211    213            �           2606    16465 &   dependents dependents_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dependents
    ADD CONSTRAINT dependents_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.dependents DROP CONSTRAINT dependents_employee_id_fkey;
       public          postgres    false    3213    215    214            �           2606    16450 &   employees employees_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_department_id_fkey;
       public          postgres    false    3211    214    213            �           2606    16445    employees employees_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_job_id_fkey;
       public          postgres    false    214    3209    212            �           2606    16455 #   employees employees_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_manager_id_fkey;
       public          postgres    false    214    214    3213            �           2606    16416 #   locations locations_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_country_id_fkey;
       public          postgres    false    210    211    3205            #   �   x�-�M
�0���=���֟�
JQA�s����D������������R!	ʛ�¶�Nq�ք���{�ώk���Q!��+(7�Mrv^�f���/�_	�A�s�G���'�U���(	�1gB���t0*E�v�\P�[�yF������p_!~�.5?      &   �   x�=N��0�O��/0Apd��`b�ѥ�Fn,������bt<�#��{r�ä��2�㨦�	��5+��;�g&Y
�c���l������K���l+�q�@&�⊛%�	;Oq"�h�M�d�`�6:z��̰#���a�F�!��r]
!>v�6�      (   �  x�E�͎�0��ç��b���f7H�E��@�c��PE
d;E����|4?���`/A|<���j�o`�)Y|w�ol���B�AE�|��%�jA%���%	;���QRa���źm9edh�����^�l�C&�fxL\���2X�߸�[���,����F�R;N�sݐ)�#��w��-��5ƒ1�!)b��\����q�A$$�v�d&x;��������xw*6`3���[��
���X�Ѝ^J2S<$ip7���}Ef��|���}6��1sܫ���$䋙bFf�e<`é�zq�u�OC���L���%k�\IX��LJ�kQ��6ƜMEv��f�d׌I�)�������fd+�䢚6�4�qޜ��NÏ�$���]�3l��|nY�53�7�G���C׉�7T���Ԛ^ꃤ<��Ҥ��嫏�1Φ��+�O��|      '     x�u��n�8��'O�0!R����/i�E�m�@o��˴W���O�3��H�,� �|�!gFF�g�mK�]�bU��?������fI�L�T�H�,'��|e3������ ���g2���Zg�j3/KӐc%VA��ճHϘ�H�=S��PE��7��o.�qT��baߔX� j u<��LƓ���A1na�ܹM� s����u$���рh�ё�(9���nn�C�ڎ�x-,�O����ԟ]R��=0���Z����*G�xq�O�=R)BL�10���+�j:s���G�b{�'�c�Y��6�����כƺ�-X�:�)d�'S{d�H5F�Ÿ��.\�;��u���_۟�̢�/)��:�T��FN]ek��l�Ie%��!4����gʈ>oJG�J��+1�j�����`�Kҧvm���2Mc��R�ANR�5�@��T�[��Ƹ��6kÑbg�wĎw&�I`�����x���zW��u��R���bu�u�+�/X	^��of[��{ZX'�^�&�L���@��Í�����U��^�
�V16�)ZL���L�趴��ޚja��Bܱ8A��ET%LTzL��Z���o�*�R�Bt^� &����X��]��tY�w͆���(��-6K��Ӳ1Mӕ���w�z���ؖV�!�Ǎ��G����*��u�}���j[Z%�X�Y�2��?{�gg4�S0%�/̚>6n��R��r��z2����U�B��wev�5:$mY�U/��qO�w����\��1�q������z)���&�Xe�ǚ�cjF�����j���uU�#��;��	~*韺/NH�:���I
ݷ]�⾇Z�1$b���ȟ�)�S ����i:g��U���5,�m7��8��Q9ӕG��m�-:�_�|9��gcZN��|E��#�m;@�E}ԓ�d;���i]Uk�+�f��A��A��i?���q�r�c�O�}h�<h��w?�8O�Ԉ�ݚƔ���ly)�^8�w#���E��/NyZNGKqp�c���ޞ><�|O@^�W��ܷ����r2}��U�(�?K�n��k���� ��W5O1%�` V�̹��%.]�YX�#���:�wLо�|R�s��0a�Q(:���E���,�g�ӊ s8<�B�Z��ؠŶ,�ڋ��r|��¥��Aq�� �Х�V�з��2�-;9���@��^��9�ih��[�rY�6tC����IrTDC�
�ڳE�QF?+�U�g�)(�d5I��Q�1�)S������Mr�      %   [  x���An�0EדS��v�,i+�.�Uݸ�ǉ��^������l͛����`�]�YYֽ��� ��	����!�0��ݒ��r�dci�b�m*mu�9��ڒY���Q4@8��S��(_=J��I8E�Z�M���=L��{R�;���J�e���K_IKV��{W�֟��=}��:E����(��ɪ�Xf�QXH�W�ˑȱ3�_W��㭔�]�ߨ����.W�d{4y2��L ��S�����%�5b� ]�KQ�#:�b���n���.�*c�| B(�%C�SX�?�_op��Rtҋ<��2u�e�o*p6���S�nHQu�ҩ��[��(�~ ���      $   �  x��Q�n�0<���P"-J��v[ ~�E�A��ZbEU�2�h'�����V�����<(�<��Bl�t��5��o�UJ��	��<���'P�L�C�{J6!Nb�/��!$�9"���X�~�H^T�y!�#vv�3�4�)y?pr�)ЕP3A�h^���ba�����b��@	��"Ss�Z��2&w��I�� �@/�׌�S���[kK)���8���N4�`�����F���f/���,�����h]�5 ��:��!!�ԙ,g���ށ�X�fi�чha��0� %��r�lAs�V��J)]kU�r+{���z7��5쏟��#/���,�
� ��e���4۱ԝG1qC6A���
g�~ʒk`GM�^���F#��D�/$����|me��$�[y�˲���K      "   4   x�32�t�p�22�t�t�22�t	r�qL9}]�<��b���� ��
     