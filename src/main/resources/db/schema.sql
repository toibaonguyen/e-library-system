DROP DATABASE IF EXISTS e_library;
CREATE DATABASE e_library;

CREATE TABLE user_id(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    role ENUM('Member','Admin') NOT NULL,
    phone_number VARCHAR(15),
    status ENUM('Active','Inactive','Banned')
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Category(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Author(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(255),
    biography TEXT,
    photo_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Publisher(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    photo_url VARCHAR(255),
    biography TEXT,
    date_of_establishment DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Book(
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    published_year YEAR NOT NULL,
    quantity INT NOT NULL,
    available_copies INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Category(id),
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(id),
    CHECK(quantity>=0),
    CHECK(available_copies<=quantity)
);

CREATE TABLE BookImage(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    photo_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Book(id)
);

CREATE TABLE Review(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    CHECK(rating>0 AND rating<=5)
);

--Bang danh cho viec dat truoc sach
CREATE TABLE Reservation(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, -- Người dùng đặt sách
    book_id INT NOT NULL, -- Sách được đặt
    reservation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'ready', 'cancelled', 'completed') NOT NULL DEFAULT 'pending',
--    pending la da dat nhung sach chua co san
--    ready la da dat va san sang de muon
--    cancelled la nguoi dung hoac he thong da huy
--    completed la nguoi dung da muon sach
    due_date DATE, -- Hạn cuối giữ sách
)

CREATE TABLE BookBorrow(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATETIME NOT NULL,
    due_date DATETIME NOT NULL,
    return_date DATETIME,
    status ENUM('Borrowed', 'Returned', 'Late'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Fine(
    id INT AUTO_INCREMENT PRIMARY KEY,
    borrow_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    is_paid BOOLEAN NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (borrow_id) REFERENCES BookBorrow(id)
);

--Bang chuyen cho nhung thong so cua he thong
CREATE TABLE Setting (
    setting_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    value VARCHAR(255) NOT NULL,
    description TEXT
);
