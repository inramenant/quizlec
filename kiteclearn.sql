PGDMP      ;                }         
   kiteclearn    17.2    17.2 ?    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16650 
   kiteclearn    DATABASE     �   CREATE DATABASE kiteclearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE kiteclearn;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16814    answer_options    TABLE     �   CREATE TABLE public.answer_options (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    option_text text NOT NULL,
    is_correct boolean DEFAULT false,
    order_index integer DEFAULT 0
);
 "   DROP TABLE public.answer_options;
       public         heap r       postgres    false    4            �            1259    16813    answer_options_id_seq    SEQUENCE     �   ALTER TABLE public.answer_options ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.answer_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    228            �            1259    16765    lecture_media    TABLE     �   CREATE TABLE public.lecture_media (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    media_type character varying(20) NOT NULL,
    content text NOT NULL,
    order_index integer DEFAULT 0
);
 !   DROP TABLE public.lecture_media;
       public         heap r       postgres    false    4            �            1259    16806    lecture_media_id_seq    SEQUENCE     �   ALTER TABLE public.lecture_media ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lecture_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    221            �            1259    16751    lectures    TABLE     &  CREATE TABLE public.lectures (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    created_by bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.lectures;
       public         heap r       postgres    false    4            �            1259    16750    lectures_id_seq    SEQUENCE     �   ALTER TABLE public.lectures ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lectures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    220            �            1259    16797 	   questions    TABLE     �   CREATE TABLE public.questions (
    id bigint NOT NULL,
    test_id bigint NOT NULL,
    question_text text NOT NULL,
    question_type character varying(50) DEFAULT 'SINGLE_CHOICE'::character varying,
    order_index integer DEFAULT 0
);
    DROP TABLE public.questions;
       public         heap r       postgres    false    4            �            1259    16796    questions_id_seq    SEQUENCE     �   ALTER TABLE public.questions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    224            �            1259    16846    submission_answers    TABLE     �   CREATE TABLE public.submission_answers (
    id bigint NOT NULL,
    submission_id bigint NOT NULL,
    question_id bigint NOT NULL,
    selected_option_id bigint
);
 &   DROP TABLE public.submission_answers;
       public         heap r       postgres    false    4            �            1259    16830    test_submissions    TABLE     �   CREATE TABLE public.test_submissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    test_id bigint NOT NULL,
    submitted_at time without time zone DEFAULT CURRENT_TIMESTAMP,
    score integer
);
 $   DROP TABLE public.test_submissions;
       public         heap r       postgres    false    4            �            1259    16829    test_submissions_id_seq    SEQUENCE     �   ALTER TABLE public.test_submissions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    230            �            1259    16778    tests    TABLE     #  CREATE TABLE public.tests (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    created_by bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.tests;
       public         heap r       postgres    false    4            �            1259    16807    tests_id_seq    SEQUENCE     �   ALTER TABLE public.tests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    4    222            �            1259    16924    user_activation    TABLE     �   CREATE TABLE public.user_activation (
    id bigint NOT NULL,
    uuid text NOT NULL,
    user_id bigint NOT NULL,
    activated boolean DEFAULT false
);
 #   DROP TABLE public.user_activation;
       public         heap r       postgres    false    4            �            1259    16739 	   user_data    TABLE     u  CREATE TABLE public.user_data (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.user_data;
       public         heap r       postgres    false    4            �            1259    16738    users_id_seq    SEQUENCE     �   ALTER TABLE public.user_data ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218    4            y          0    16814    answer_options 
   TABLE DATA           _   COPY public.answer_options (id, question_id, option_text, is_correct, order_index) FROM stdin;
    public               postgres    false    228   �P       r          0    16765    lecture_media 
   TABLE DATA           Y   COPY public.lecture_media (id, lecture_id, media_type, content, order_index) FROM stdin;
    public               postgres    false    221   �P       q          0    16751    lectures 
   TABLE DATA           ^   COPY public.lectures (id, title, description, created_by, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �P       u          0    16797 	   questions 
   TABLE DATA           [   COPY public.questions (id, test_id, question_text, question_type, order_index) FROM stdin;
    public               postgres    false    224   �P       |          0    16846    submission_answers 
   TABLE DATA           `   COPY public.submission_answers (id, submission_id, question_id, selected_option_id) FROM stdin;
    public               postgres    false    231   Q       {          0    16830    test_submissions 
   TABLE DATA           U   COPY public.test_submissions (id, user_id, test_id, submitted_at, score) FROM stdin;
    public               postgres    false    230   #Q       s          0    16778    tests 
   TABLE DATA           [   COPY public.tests (id, title, description, created_by, created_at, updated_at) FROM stdin;
    public               postgres    false    222   @Q       }          0    16924    user_activation 
   TABLE DATA           G   COPY public.user_activation (id, uuid, user_id, activated) FROM stdin;
    public               postgres    false    232   ]Q       o          0    16739 	   user_data 
   TABLE DATA           `   COPY public.user_data (id, username, email, password, role, created_at, updated_at) FROM stdin;
    public               postgres    false    218   zQ       �           0    0    answer_options_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.answer_options_id_seq', 1, false);
          public               postgres    false    227            �           0    0    lecture_media_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.lecture_media_id_seq', 1, false);
          public               postgres    false    225            �           0    0    lectures_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.lectures_id_seq', 1, false);
          public               postgres    false    219            �           0    0    questions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.questions_id_seq', 1, false);
          public               postgres    false    223            �           0    0    test_submissions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.test_submissions_id_seq', 1, false);
          public               postgres    false    229            �           0    0    tests_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tests_id_seq', 1, false);
          public               postgres    false    226            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public               postgres    false    217            �           2606    16822 "   answer_options answer_options_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.answer_options
    ADD CONSTRAINT answer_options_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.answer_options DROP CONSTRAINT answer_options_pkey;
       public                 postgres    false    228            �           2606    16747    user_data email_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT email_unique UNIQUE (email);
 @   ALTER TABLE ONLY public.user_data DROP CONSTRAINT email_unique;
       public                 postgres    false    218            �           2606    16772     lecture_media lecture_media_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.lecture_media
    ADD CONSTRAINT lecture_media_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.lecture_media DROP CONSTRAINT lecture_media_pkey;
       public                 postgres    false    221            �           2606    16755    lectures lectures_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.lectures DROP CONSTRAINT lectures_pkey;
       public                 postgres    false    220            �           2606    16805    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public                 postgres    false    224            �           2606    16850 *   submission_answers submission_answers_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.submission_answers
    ADD CONSTRAINT submission_answers_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.submission_answers DROP CONSTRAINT submission_answers_pkey;
       public                 postgres    false    231            �           2606    16835 &   test_submissions test_submissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.test_submissions
    ADD CONSTRAINT test_submissions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.test_submissions DROP CONSTRAINT test_submissions_pkey;
       public                 postgres    false    230            �           2606    16786    tests tests_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
       public                 postgres    false    222            �           2606    16931 $   user_activation user_activation_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_activation
    ADD CONSTRAINT user_activation_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_activation DROP CONSTRAINT user_activation_pkey;
       public                 postgres    false    232            �           2606    16745    user_data username_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT username_unique UNIQUE (username);
 C   ALTER TABLE ONLY public.user_data DROP CONSTRAINT username_unique;
       public                 postgres    false    218            �           2606    16743    user_data users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.user_data DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            �           1259    16868    lecture_media_lecture_id_index    INDEX     ~   CREATE INDEX lecture_media_lecture_id_index ON public.lecture_media USING btree (lecture_id) WITH (deduplicate_items='true');
 2   DROP INDEX public.lecture_media_lecture_id_index;
       public                 postgres    false    221            �           1259    16866    lectures_created_by_index    INDEX     t   CREATE INDEX lectures_created_by_index ON public.lectures USING btree (created_by) WITH (deduplicate_items='true');
 -   DROP INDEX public.lectures_created_by_index;
       public                 postgres    false    220            �           1259    16867    tests_created_by_index    INDEX     n   CREATE INDEX tests_created_by_index ON public.tests USING btree (created_by) WITH (deduplicate_items='true');
 *   DROP INDEX public.tests_created_by_index;
       public                 postgres    false    222            �           2606    16874    tests created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT created_by_fkey FOREIGN KEY (created_by) REFERENCES public.user_data(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 ?   ALTER TABLE ONLY public.tests DROP CONSTRAINT created_by_fkey;
       public               postgres    false    218    222    4798            �           2606    16879    lectures created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT created_by_fkey FOREIGN KEY (created_by) REFERENCES public.user_data(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 B   ALTER TABLE ONLY public.lectures DROP CONSTRAINT created_by_fkey;
       public               postgres    false    220    218    4798            �           2606    16889    lecture_media lecture_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lecture_media
    ADD CONSTRAINT lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.lectures(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.lecture_media DROP CONSTRAINT lecture_id_fkey;
       public               postgres    false    221    4801    220            �           2606    16899    answer_options question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.answer_options
    ADD CONSTRAINT question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 I   ALTER TABLE ONLY public.answer_options DROP CONSTRAINT question_id_fkey;
       public               postgres    false    224    4809    228            �           2606    16914 #   submission_answers question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.submission_answers
    ADD CONSTRAINT question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.submission_answers DROP CONSTRAINT question_id_fkey;
       public               postgres    false    4809    231    224            �           2606    16919 *   submission_answers selected_option_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.submission_answers
    ADD CONSTRAINT selected_option_id_fkey FOREIGN KEY (selected_option_id) REFERENCES public.answer_options(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 T   ALTER TABLE ONLY public.submission_answers DROP CONSTRAINT selected_option_id_fkey;
       public               postgres    false    4811    228    231            �           2606    16909 %   submission_answers submission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.submission_answers
    ADD CONSTRAINT submission_id_fkey FOREIGN KEY (submission_id) REFERENCES public.test_submissions(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.submission_answers DROP CONSTRAINT submission_id_fkey;
       public               postgres    false    230    4813    231            �           2606    16894    questions test_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.questions DROP CONSTRAINT test_id_fkey;
       public               postgres    false    224    4807    222            �           2606    16904    test_submissions test_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.test_submissions
    ADD CONSTRAINT test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.test_submissions DROP CONSTRAINT test_id_fkey;
       public               postgres    false    222    230    4807            �           2606    16932    user_activation user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_activation
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.user_data(id) ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.user_activation DROP CONSTRAINT user_id;
       public               postgres    false    218    232    4798            �           2606    16884    test_submissions user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.test_submissions
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_data(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 G   ALTER TABLE ONLY public.test_submissions DROP CONSTRAINT user_id_fkey;
       public               postgres    false    218    230    4798            y      x������ � �      r      x������ � �      q      x������ � �      u      x������ � �      |      x������ � �      {      x������ � �      s      x������ � �      }      x������ � �      o   Q   x�3�,I-.A'b�8��Lu�uLM�L-�L�L,��,L������Cnbf�^Q)��^K+#c=KKcK<R\1z\\\ �#G     