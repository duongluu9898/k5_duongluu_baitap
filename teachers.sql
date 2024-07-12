-- BẢNG TEACHER:
-- Table: public.teachers

-- DROP TABLE IF EXISTS public.teachers;

CREATE TABLE IF NOT EXISTS public.teachers
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    bio text COLLATE pg_catalog."default",
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT teachers_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.teachers
    OWNER to postgres;


-- THÊM THÔNG TIN BẢNG TEACHER:
INSERT INTO teachers(id, bio, name)
VALUES(1, 'age 23, male', 'Tran Van A');
INSERT INTO teachers(id, bio, name)
VALUES(2, 'age 24, female', 'Tran Van B');
INSERT INTO teachers(id, bio, name)
VALUES(3, 'age 25, male', 'Tran Van C')

-- UPDATE BIO
UPDATE teachers SET bio='age 50, male, tall'
WHERE id=1;
UPDATE teachers SET bio='age 51, male, short'
WHERE id=2;
UPDATE teachers SET bio='age 52, female, medium'
WHERE id=3;

