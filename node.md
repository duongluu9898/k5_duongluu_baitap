# database  '12345678' password
- cơ sở dữ liệu giống như 1 kho lưu trữ: phi qua hệ và quan hệ 

# ngôn ngữ truy vấn SQL: quan hệ
- thao tác với database

# hệ quản trị cơ sở dữ liệu: là 1 phần mềm giúp lưu trữ dữ liệu và thực thi các câu lệnh truy vấn: postgrespl,...(DBMS)
- khác nhau giữa các DBMS là: kiểu dữ liệu và khả năng lưu trữ , khả năng mở rộng
- pageadmin là database tool, gần như chạy trên tất cả các hệ quản trị dữ liệu, kết nối với DBMS thông qua giao diện đồ họa giúp dễ dàng thao tác hơn

# cấu trúc server:
server>
database1, database 2, database 3 >
table1, table2, table3....(nơi lưu trữ thông tin)>
field1, field2,....(là các thông tin trong table)>
record1, record2...(dữ liệu của các trường, các dòng)
- cấu tạo 1 trường điển hình: ID, name, email, status, created_at, updated_at
==> bản ghi là 1 dòng dữ liệu

## dùng postgresql
- tạo 1 database: chuột phải databases>create>database: đặt tên f8_fullstack_k5
definition> encoding: UTF-8 để hỗ trợ tiếng việt
- tạo 1 table: chuột phải table>create>table: name=users(thường là số nhiều)
TRONG column:
+ id
+ data type:

name: 50
email: 100
password: 100
 
# kiểu dữ liệu: kiểu thông thường

- nhóm number:
+ integer: số nguyên
+ smallint: số nguyên nhưng phạm vi nhỏ hơn
+ bigint: số nguyên nhưng phạm vi lớn hơn
+ double: số thực

- nhóm string:
+ char: ký tự cố định
+ varchar: dạng chuỗi biến đổi: độ dài tùy ý; character varying
+ text: chuỗi dài (phụ thuộc vào cơ sở dữ liệu)


- nhóm boolean: true-false: 0-1

- nhóm datetime: 
+ timestamp with timezone: muốn thay đổi giờ khi server thay đổi múi giờ
+ timestamp without timezone: k muốn thay đổi giờ khi server thay đổi múi giờ
+ data: ngày tháng năm

## dùng query tool: có thể bấm property: chuột phải table để sửa table
chuột phải table chọn query tool để thực hiện truy vấn, view/edit date để xem hoặc sửa data

1. INSERT DATA: thêm
INSERT INTO users(id, name, email,password, status, created_at, updated_at)
VALUES(7, 'User 7', 'user@gmail.com',MD5('123456'), true, NOW(), NOW())

dạng: INSERT INTO table(id, name,....) VALUES(7, duong luu,....)
(thêm tại bảng ... giá trị ...)
==> dùng nháy đơn
==> MD5: MÃ hóa password

2. UPDATE: sửa
UPDATE users SET name='User 3 - update', email = 'user2-update@gmail.com', updated_at=NOW()
WHERE id=2
dạng: UPDATE table SET name='User-update' ..... WHERE id=3
(update tại bảng sửa ... tại khóa_chính=...)

3. DELETE: XÓA
DELETE FROM users WHERE id =2
Dạng: (delele from bảng_nào tại khóa_chính=2)

4. LISTING: TRUY VẤN
- truy vấn cả bảng:
SELECT * FROM users; // chọn tất cả trong bảng users

- truy vấn từng cột:
SELECT id, name AS fullname, email, status FROM users;
// dùng AS nếu muốn đổi tên cột: name AS fullname
NOTE: AS chỉ đổi trong truy vấn

- truy vấn dữ liệu tại id=3:
SELECT id, name AS fullname, email, status FROM users WHERE id=3;

5. ORDER BY: SẮP XẾP
- mặc định là tăng dần
- thêm DESC để giảm dần
SELECT * FROM users ORDER BY id DESC
SELECT * FROM users ORDER BY id
SELECT * FROM users ORDER BY name DESC,id DESC (ưu tiên săp xếp name trước, nếu name bị trùng mới chuyển qua sắp xếp id)

6. LIMIT: GIỚI HẠN
SELECT * FROM users LIMIT 4 (chỉ hiển thị 4)

7. OFFSET: BỎ ĐI MẤY CÁI: mặc định là 0: GIỚi HẠN
SELECT * FROM users OFFSET 4 (BỎ hiển thị 4)

8. JOIN



# TOÁN TỬ
=, >, <,>=, <=, !=,
(<>) ==> toán tử khác
AND, OR, NOT
IN: có trong hay không
BETWEEN: lấy cả đầu và đuôi: vd giữa 1 và 3: lấy cả 1,2,3 
IS NULL, IS NOT NULL: có phải null hay không
EXISTS: có tồn tại hay không.
LIKE: dùng để tìm kiếm, thêm %% để chỉ cần có chứa từ khóa đó là tìm được, có phân biệt hoa thường
ILIKE: tương tự nhưng k phân biệt hoa thường

TIP: ví dụ:
SELECT * FROM users WHERE id > 2
(chọn id lớn hơn 2)

SELECT * FROM users WHERE id > 2 AND id < 4
SELECT * FROM users WHERE password is null
SELECT * FROM users WHERE id IN(1,2,3)
SELECT * FROM users WHERE id NOT IN(1,2,3)
SELECT * FROM users WHERE id BETWEEN 3 AND 5
SELECT * FROM users WHERE name ILIKE '%user 1%'
SELECT * FROM users WHERE name ILIKE '%user 11%' or email ILIKE '%user 2%'


thứ tự chạy:
1. SELECT
2. FROM
2.5 JOIN
3. WHERE
4. GROUP BY
5. HAVING
6. ORDER BY
7. LIMIT / OFFSET

# các loại quan hệ: áp dụng từ 2 bản trở lên
## quan hệ 1-1:
- 1 trường bản này quan hệ với 1 trường bản khác: 
VD: 1 user có 1 số cccd

## quan hệ 1-n:
- 1 bản ghi bảng này liên kết với 1 hoặc nhiều bản ghi của bảng khác
VD: 1 user có thể có nhiều bài viết
NOTE: khi xét trường hợp ngược lại thì là quan hệ thuộc về 

## quan hệ n-n:
- 1 bản ghi bảng này có thể liên kết với nhiều bản ghi của bảng khác và ngoặc lại
VD: 1 tác giả có thể có nhiều cuốn sách, 1 cuốn sách có thể thuộc nhiều tác giả

LƯU Ý: 
- trong quan hệ database để liên kết được thông qua các trường có tên khóa ngoại:(foreign key)
- các khóa ngoại này được tham chiếu tới khóa chính của bảng cần liên kết
- với quan hệ n-n ==> phải có bảng trung gian
VD: 
Tables books: id, name, price
Tables authors: id, name, address
table author_book: author_id, book_id ==> books.id, author_id ==> authors.id (gọi là throw table- liên kết)

==> dbdiagram để thiết kế

## tạo bảng phones với user_id là khóa ngoại: phải cùng kiểu dữ liệu với trường trong bảng cần liên kết - là id trong users
(để mặc định created_at và updated_at là NOW())
- tạo khóa ngoại: vào constrains>foreign key> đặt tên: phones_user_id_foreign
- trong column: chọn local column là trường mà chọn là khóa ngoại: user_id
- reference: chọn tên bảng muốn liên kết: users
- referencing: chọn tên trường muốn liên kết: id
==> chọn Add để thêm
- trong action: là hành động khi tác động tới 1 bảng thì bảng kia sẽ ra sao:
+ no-action, restrict là k thay đổi
+ cascade: là cùng thay đổi
+ set-null
+ set default: theo giá trị set up sẵn

## NỐI BẢNG: CÓ 4 HÌNH THỨC
1. INNER JOIN: trả về những thằng giao với nhau: khóa ngoại liên kết tới cái nào thì trả về cái đó
SELECT users.*, phones.value AS phone_number
FROM users 
INNER JOIN phones 
ON users.id=phones.user_id

NOTE: 
- users.* lấy các cột của bảng users
- phones.value AS phone_number: đổi tên phone sang phone_number, thêm cột phone_number bên users
- users.id=phones.user_id: điều kiện join là id=user_id

TIP: chuyển sang LEFT JOIN nếu muốn vẫn hiển thị dữ liệu không giao với bảng kia
(ưu tiên hiển thị bên trái, RIGHT JOIN ưu tiên hiển thị bên phải)

2. LEFT JOIN: trước join là bên trái
3. RIGHT JOIN: sau join là bên phải, sau ON là điều kiện
4. FULL JOIN

TIP: tìm teache có name là C
SELECT courses.*, teachers.name AS teacher_name
FROM teachers 
INNER JOIN courses 
ON courses.teacher_id=teachers.id
WHERE LOWER(teachers.name) LIKE LOWER('%C%')

# HÀM TỔNG HỢP: COUNT, SUM, AVG, MAX, MIN
1. COUNT: ĐẾM SỐ hàng, số bản ghi (thường đếm theo id)
Ví dụ:
SELECT count(id) FROM users;
(đếm số id trong bảng users)

SELECT count(id) FROM users GROUP BY status;
(nhóm các status và trả về số id đếm được)


2. AVG: TRUNG BÌNH CỘNG
3. SUM: LẤY TỔNG
4. MAX: LỚN NHẤT
5. MIN: NHỎ NHẤT

==> khi dùng hàm tổng hợp thì kết hợp với mệnh đề GROUP BY, 
==> lọc dữ liệu theo mệnh đề GROUP BY, dùng mệnh đề HAVING (HAVING chức năng giống WHERE)
(having để filter theo group)



# xóa truncate
- truncate: xóa thông thường, gặp khóa ngoại sẽ chặn luôn
- truncate cascade: tất cả những gì liên quan thì tự động xóa
- truncate restart identity: có các id tự động tăng thì reset về 0

# thiết lập id tự động tăng
edit > constrain > iden > inden (chọn always)


