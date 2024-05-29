-- Table Team
CREATE TABLE `Team` (
                        id_team INT AUTO_INCREMENT PRIMARY KEY,
                        city VARCHAR(100) NOT NULL,
                        description TEXT,
                        image VARCHAR(255),
                        name VARCHAR(100) NOT NULL
);

CREATE TABLE Sizes (
                       id_size INT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(10)
);


CREATE TABLE `Color` (
                         id_color INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(50) NOT NULL
);

CREATE TABLE Stock (
                       id_stock INT PRIMARY KEY AUTO_INCREMENT,
                       id_jersey INT,
                       id_size INT,
                       stock INT NOT NULL,
                       FOREIGN KEY (id_jersey) REFERENCES Jersey(id_jersey),
                       FOREIGN KEY (id_size) REFERENCES Sizes(id_size)
);



CREATE TABLE `Jersey` (

    id_jersey INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    details TEXT,
    description TEXT,
    image VARCHAR(255),
    color VARCHAR(50),
    gender VARCHAR(10),
    id_team INT,
    id_reduction INT,
    id_size INT,
    FOREIGN KEY (id_team) REFERENCES `Team`(id_team),
    FOREIGN KEY (id_reduction) REFERENCES `Reduction`(id_reduction),
    FOREIGN KEY (id_size) REFERENCES `Sizes`(id_size)
);




-- Table Reduction
CREATE TABLE `Reduction` (
                             id_reduction INT AUTO_INCREMENT PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             description TEXT,
                             discount DECIMAL(5, 2) NOT NULL,
                             start_date DATE NOT NULL,
                             end_date DATE NOT NULL
);


-- Table Order
CREATE TABLE `Order` (
                         id_order INT AUTO_INCREMENT PRIMARY KEY,
                         date DATETIME NOT NULL,
                         status VARCHAR(50) NOT NULL,
                         total_price DECIMAL(10, 2) NOT NULL,
                         shipping_address TEXT NOT NULL,
                         payment_method VARCHAR(50) NOT NULL
);





-- Table Team
INSERT INTO `Team` (city, description, image, name)
VALUES ('Boston', 'Boston Red Sox Baseball Team', 'boston-logo.png', 'Boston Red Sox');

INSERT INTO `Team` (city, description, image, name)
VALUES ('Houston', 'Houston Astros Baseball Team', 'houston-logo.png', 'Houston Astros');

INSERT INTO `Team` (city, description, image, name)
VALUES ('New York', 'New York Yankees Baseball Team', 'yankees-logo.png', 'New York Yankees');

INSERT INTO `Team` (city, description, image, name)
VALUES ('Philadelphia', 'Philadelphia Phillies Baseball Team', 'phillies-logo.png', 'Philadelphia Phillies');

INSERT INTO `Team` (city, description, image, name)
VALUES ('New York', 'New York Mets Baseball Team', 'mets-logo.png', 'New York Mets');

INSERT INTO `Team` (city, description, image, name)
VALUES ('San Diego', 'San Diego Padres Baseball Team', 'padres-logo.png', 'San Diego Padres');



-- Table Size
INSERT INTO `Sizes` (name) VALUES ('S'), ('M'), ('L'), ('XL');

-- Table Color
INSERT INTO `Color` (name) VALUES ('White'), ('Black'), ('Red'), ('Blue'), ('Green'), ('Yellow'), ('Orange'), ('Purple'), ('Pink');

-- Table Stock
INSERT INTO Stock (id_jersey, id_size, stock)
VALUES (1, 1, 30), -- 30 articles de taille S
       (1, 2, 40), -- 40 articles de taille M
       (1, 3, 20), -- 20 articles de taille L
       (1, 4, 12) -- 12 articles de taille XL


