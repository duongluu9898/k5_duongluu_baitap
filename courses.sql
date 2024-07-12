-- Table: public.courses

-- DROP TABLE IF EXISTS public.courses;
-- TẠO BẢNG COURSE:

CREATE TABLE IF NOT EXISTS public.courses
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price double precision,
    description text COLLATE pg_catalog."default",
    content text COLLATE pg_catalog."default" NOT NULL,
    teacher_id integer NOT NULL,
    active integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT courses_pkey PRIMARY KEY (id),
    CONSTRAINT courses_teacher_id_foreign FOREIGN KEY (teacher_id)
        REFERENCES public.teachers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.courses
    OWNER to postgres;


-- THÊM THÔNG TIN BẢNG COURSES:
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(1, 'NODE', 3, '', 'NODE01', 1, 30);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(2, 'NEXT', 4, '', 'NEXT01', 1, 2);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(3, 'HTML', 23, '', 'HTL01', 2, 4);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(4, 'CSS', 5, '', 'NODE01', 2, 5);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(5, 'REACT', 12, '', 'REACT01', 3, 32);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(6, 'JAVA', 24, '', 'JAVA01', 3, 20);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(7, 'PYTHON', 45, '', 'PYTHON01', 3, 100);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(8, 'PHP', 343, '', 'PHP01', 2, 323);
INSERT INTO courses(id, name, price, description, content, teacher_id, active)
VALUES(9, 'RUBY', 444, '', 'RUBY01', 1, 304);

-- UPDATE NAME, PRICE
UPDATE courses SET name='node_update', price=3.1
WHERE id=1;
UPDATE courses SET name='react_update', price=4
WHERE id=2;
UPDATE courses SET name='python_update', price=5
WHERE id=3;
UPDATE courses SET name='html_update', price=6
WHERE id=4;
UPDATE courses SET name='css_update', price=7
WHERE id=5;
UPDATE courses SET name='react_update', price=8
WHERE id=6;
UPDATE courses SET name='reactjs_update', price=9
WHERE id=7;
UPDATE courses SET name='nextjs_update', price=10
WHERE id=8;
UPDATE courses SET name='express_update', price=11
WHERE id=9;

-- HIỂN THỊ DANH SÁCH GIẢNG VIÊN, DANH SÁCH KHÓA HỌC
SELECT courses.*, teachers.name AS teacher_name
FROM teachers 
FULL JOIN courses 
ON courses.teacher_id=teachers.id;


