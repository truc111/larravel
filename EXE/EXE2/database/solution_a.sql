-- solution_a.sql - Truy vấn người dùng

-- 1. Lấy danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY name ASC;

-- 2. Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY name ASC LIMIT 7;

-- 3. Lấy danh sách người dùng theo thứ tự tên theo Alphabet (A->Z), trong đó tên người dùng có chữ 'a'
SELECT * FROM users WHERE name LIKE '%a%' ORDER BY name ASC;

-- 4. Lấy danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ 'm'
SELECT * FROM users WHERE name LIKE 'm%';

-- 5. Lấy danh sách người dùng trong đó tên người dùng kết thúc bằng chữ 'i'
SELECT * FROM users WHERE name LIKE '%i';

-- 6. Lấy danh sách người dùng có email là Gmail
SELECT * FROM users WHERE email LIKE '%@gmail.com';

-- 7. Lấy danh sách người dùng có email là Gmail và tên bắt đầu bằng chữ 'm'
SELECT * FROM users WHERE email LIKE '%@gmail.com' AND name LIKE 'm%';

-- 8. Lấy danh sách người dùng có email là Gmail, tên chứa chữ 'a' và dài hơn 5 ký tự
SELECT * FROM users WHERE email LIKE '%@gmail.com' AND name LIKE '%a%' AND LENGTH(name) > 5;

-- 9. Lấy danh sách người dùng có chữ 'a', độ dài từ 5-9 ký tự, email không chứa 'yahoo.com'
SELECT * FROM users WHERE name LIKE '%a%' AND LENGTH(name) BETWEEN 5 AND 9 AND email NOT LIKE '%@yahoo.com';

-- 10. Lấy danh sách người dùng có chữ 'a', độ dài không thuộc 5-9 ký tự, email là Gmail
SELECT * FROM users WHERE name LIKE '%a%' AND (LENGTH(name) < 5 OR LENGTH(name) > 9) AND email LIKE '%@gmail.com';
