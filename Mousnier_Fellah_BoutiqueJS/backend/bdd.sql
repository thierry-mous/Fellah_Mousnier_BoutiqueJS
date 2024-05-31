CREATE TABLE `Team` (
                        id_team INT PRIMARY KEY,
                        city VARCHAR(100) NOT NULL,
                        description TEXT,
                        image VARCHAR(255),
                        name VARCHAR(100) NOT NULL
);

CREATE TABLE `Sizes` (
                         id_size INT PRIMARY KEY,
                         name VARCHAR(10)
);

CREATE TABLE `Color` (
                         id_color INT PRIMARY KEY,
                         name VARCHAR(50) NOT NULL
);

CREATE TABLE `Gender` (
                          id_gender INT PRIMARY KEY,
                          name VARCHAR(10) NOT NULL
);


CREATE TABLE `Jersey` (
                          id_jersey INT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL,
                          details TEXT,
                          description TEXT,
                          image VARCHAR(255),
                          color INT,
                          gender INT,
                          id_team INT,
                          id_reduction INT,
                          id_size INT,
                          FOREIGN KEY (color) REFERENCES `Color`(id_color),
                          FOREIGN KEY (gender) REFERENCES `Gender`(id_gender),
                          FOREIGN KEY (id_team) REFERENCES `Team`(id_team),
                          FOREIGN KEY (id_reduction) REFERENCES `Reduction`(id_reduction),
                          FOREIGN KEY (id_size) REFERENCES `Sizes`(id_size)
);

CREATE TABLE `Stock` (
                         id_stock INT AUTO_INCREMENT PRIMARY KEY,
                         id_jersey INT,
                         id_size INT,
                         stock INT NOT NULL,
                         FOREIGN KEY (id_jersey) REFERENCES `Jersey`(id_jersey),
                         FOREIGN KEY (id_size) REFERENCES `Sizes`(id_size)
);

CREATE TABLE `Order` (
                         id_order INT AUTO_INCREMENT PRIMARY KEY,
                         date DATETIME NOT NULL,
                         status VARCHAR(50) NOT NULL,
                         total_price DECIMAL(10, 2) NOT NULL,
                         shipping_address TEXT NOT NULL,
                         payment_method VARCHAR(50) NOT NULL
);

CREATE TABLE `Reduction` (
                             id_reduction INT AUTO_INCREMENT PRIMARY KEY,
                             name VARCHAR(100) NOT NULL,
                             description TEXT,
                             discount DECIMAL(5, 2) NOT NULL,
                             start_date DATE NOT NULL,
                             end_date DATE NOT NULL
);




INSERT INTO `Team` (id_team, city, description, image, name)
VALUES
    (1, 'Boston', 'Boston Red Sox Baseball Team', 'boston-logo.png', 'Boston Red Sox'),
    (2, 'Houston', 'Houston Astros Baseball Team', 'houston-logo.png', 'Houston Astros'),
    (3, 'New York', 'New York Yankees Baseball Team', 'yankees-logo.png', 'New York Yankees'),
    (4, 'Philadelphia', 'Philadelphia Phillies Baseball Team', 'phillies-logo.png', 'Philadelphia Phillies'),
    (5, 'New York', 'New York Mets Baseball Team', 'mets-logo.png', 'New York Mets'),
    (6, 'San Diego', 'San Diego Padres Baseball Team', 'padres-logo.png', 'San Diego Padres');


INSERT INTO `Sizes` (id_size, name) VALUES
   (1, 'S'),
   (2, 'M'),
   (3, 'L'),
   (4, 'XL');


INSERT INTO `Color` (id_color, name) VALUES
   (1, 'White'),
   (2, 'Black'),
   (3, 'Red'),
   (4, 'Blue'),
   (5, 'Grey'),
   (6, 'Yellow'),
   (7, 'Orange'),
   (8, 'Purple'),
   (9, 'Brown');


INSERT INTO `Gender` (id_gender, name) VALUES
   (1, 'Mens'),
   (2, 'Womens');


INSERT INTO `Jersey` (id_jersey, name, price, details, description, image, color, gender, id_team, id_reduction, id_size)
VALUES
    (1, 'Houston Astros Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the Houston Astros home jersey for men', 'Official home jersey replica for the Houston Astros', 'astro-jersey-men1.png',
     1, 1,
     (SELECT id_team FROM `Team` WHERE name='Houston Astros'),
     NULL, NULL),

    (2, 'Houston Astros Nike Official Replica Alternate Home Jersey Mens', 139.99, 'Alternate Replica of the Houston Astros home', 'Alternate Replica of the Houston Astros home', 'astro-jersey-men2.png',
     7, 1,
     (SELECT id_team FROM `Team` WHERE name='Houston Astros'),
     NULL, NULL),

    (3, 'Houston Astros Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the Houston Astros home', 'Official home jersey replica for the Houston Astros', 'astro-jersey-women1.png',
    1,2,
    (SELECT id_team FROM `Team` WHERE name='Houston Astros'),
        NULL, NULL),

    (4, 'Houston Astros Nike Official Replica Alternate Home Jersey Womens', 139.99, 'Alternate Replica of the Houston Astros home', 'Alternate Replica of the Houston Astros home', 'astro-jersey-women2.png',
    4,2,
     (SELECT id_team FROM `Team` WHERE name='Houston Astros'),
     NULL, NULL),

    (5, 'Boston Red Sox Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the Boston Red Sox home', 'Official home jersey replica for the Boston Red Sox', 'boston-jersey-men1.png',
     3,1,
     (SELECT id_team FROM `Team` WHERE name='Boston Red Sox'),
     NULL, NULL),

    (6, 'Boston Red Sox Nike Official Replica Alternate Home Jersey Mens', 139.99, 'Alternate Replica of the Boston Red Sox home', 'Alternate Replica of the Boston Red Sox home', 'boston-jersey-men2.png',
     5,1,
     (SELECT id_team FROM `Team` WHERE name='Boston Red Sox'),
     NULL, NULL),

    (7, 'Boston Red Sox Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the Boston Red Sox home', 'Official home jersey replica for the Boston Red Sox', 'boston-jersey-women1.png',
     3,2,
     (SELECT id_team FROM `Team` WHERE name='Boston Red Sox'),
     NULL, NULL),

    (8, 'Boston Red Sox Nike Official Replica Alternate Home Jersey Womens', 119.99, 'Replica of the Boston Red Sox home', 'Official home jersey replica for the Boston Red Sox', 'boston-jersey-women2.png',
    6,2,
         (SELECT id_team FROM `Team` WHERE name='Boston Red Sox'),
     NULL, NULL),

    (9, 'New York Mets Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the New York Mets home', 'Official home jersey replica for the New York Mets', 'mets-jersey-men1.png',
    4,1,
         (SELECT id_team FROM `Team` WHERE name='New York Mets'),
    NULL, NULL),

    (10, 'New York Mets Nike Official Replica Alternate Home Jersey Mens', 119.99, 'Replica of the New York Mets home', 'Official home jersey replica for the New York Mets', 'mets-jersey-men2.png',
     5,1,
            (SELECT id_team FROM `Team` WHERE name='New York Mets'),
     NULL,NULL),

    (11, 'New York Mets Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the New York Mets home', 'Official home jersey replica for the New York Mets', 'mets-jersey-women1.png',
     1,2,
            (SELECT id_team FROM `Team` WHERE name='New York Mets'),
     NULL,NULL),

    (12, 'New York Mets Nike Official Replica Alternate Home Jersey Womens', 119.99, 'Replica of the New York Mets home', 'Official home jersey replica for the New York Mets', 'mets-jersey-women2.png',
     2,2,
            (SELECT id_team FROM `Team` WHERE name='New York Mets'),
     NULL,NULL),

    (13, 'San Diego Padres Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the San Diego Padres home', 'Official home jersey replica for the San Diego Padres', 'padres-jersey-men1.png',
     9,1,
            (SELECT id_team FROM `Team` WHERE name='San Diego Padres'),
     NULL,NULL),

    (14, 'San Diego Padres Nike Official Replica Alternate Home Jersey Mens', 119.99, 'Replica of the San Diego Padres home', 'Official home jersey replica for the San Diego Padres', 'padres-jersey-men2.png',
        1,1,
                (SELECT id_team FROM `Team` WHERE name='San Diego Padres'),
        NULL,NULL),

    (15, 'San Diego Padres Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the San Diego Padres home', 'Official home jersey replica for the San Diego Padres', 'padres-jersey-women1.png',
        9,2,
                   (SELECT id_team FROM `Team` WHERE name='San Diego Padres'),
        NULL,NULL),

    (16, 'San Diego Padres Nike Official Replica Alternate Home Jersey Womens', 119.99, 'Replica of the San Diego Padres home', 'Official home jersey replica for the San Diego Padres', 'padres-jersey-women2.png',
     9,2,
                   (SELECT id_team FROM `Team` WHERE name='San Diego Padres'),
        NULL,NULL),

    (17, 'Philadelphia Phillies Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the Philadelphia Phillies home', 'Official home jersey replica for the Philadelphia Phillies', 'phillies-jersey-men1.png',
     1,1,
                   (SELECT id_team FROM `Team` WHERE name='Philadelphia Phillies'),
        NULL,NULL),

    (18, 'Philadelphia Phillies Nike Official Replica Alternate Home Jersey Mens', 119.99, 'Replica of the Philadelphia Phillies home', 'Official home jersey replica for the Philadelphia Phillies', 'phillies-jersey-men2.png',
     4,1,
         (SELECT id_team FROM `Team` WHERE name='Philadelphia Phillies'),
     NULL,NULL),

    (19, 'Philadelphia Phillies Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the Philadelphia Phillies home', 'Official home jersey replica for the Philadelphia Phillies', 'phillies-jersey-women1.png',
     1,2,
            (SELECT id_team FROM `Team` WHERE name='Philadelphia Phillies'),
        NULL,NULL),

    (20, 'New York Yankees Nike Official Replica Home Jersey Mens', 119.99, 'Replica of the New York Yankees', 'Official home jersey replica for the New York Yankees', 'yankees-jersey-men1.png',
     4,1,
            (SELECT id_team FROM `Team` WHERE name='New York Yankees'),
        NULL,NULL),

    (21, 'New York Yankees Nike Official Replica Alternate Home Jersey Mens', 119.99, 'Replica of the New York Yankees', 'Official home jersey replica for the New York Yankees', 'yankees-jersey-men2.png',
     5,1,
            (SELECT id_team FROM `Team` WHERE name='New York Yankees'),
        NULL,NULL),

    (22, 'New York Yankees Nike Official Replica Home Jersey Womens', 119.99, 'Replica of the New York Yankees', 'Official home jersey replica for the New York Yankees', 'yankees-jersey-women1.png',
        4,2,
                (SELECT id_team FROM `Team` WHERE name='New York Yankees'),
            NULL,NULL),

    (23, 'New York Yankees Nike Official Replica Alternate Home Jersey Womens', 119.99, 'Replica of the New York Yankees', 'Official home jersey replica for the New York Yankees', 'yankees-jersey-women2.png',
     1,2,
                   (SELECT id_team FROM `Team` WHERE name='New York Yankees'),
                NULL,NULL);


INSERT INTO `Stock` (id_jersey, id_size, stock)
VALUES
    (1, (SELECT id_size FROM `Sizes` WHERE name='S'), 30),
    (1, (SELECT id_size FROM `Sizes` WHERE name='M'), 40),
    (1, (SELECT id_size FROM `Sizes` WHERE name='L'), 20),
    (1, (SELECT id_size FROM `Sizes` WHERE name='XL'), 12),

    (2, (SELECT id_size FROM `Sizes` WHERE name='S'), 25),
    (2, (SELECT id_size FROM `Sizes` WHERE name='M'), 35),
    (2, (SELECT id_size FROM `Sizes` WHERE name='L'), 15),
    (2, (SELECT id_size FROM `Sizes` WHERE name='XL'), 10),

    (3, (SELECT id_size FROM `Sizes` WHERE name='S'), 20),
    (3, (SELECT id_size FROM `Sizes` WHERE name='M'), 30),
    (3, (SELECT id_size FROM `Sizes` WHERE name='L'), 25),
    (3, (SELECT id_size FROM `Sizes` WHERE name='XL'), 5),

    (4, (SELECT id_size FROM `Sizes` WHERE name='S'), 10),
    (4, (SELECT id_size FROM `Sizes` WHERE name='M'), 20),
    (4, (SELECT id_size FROM `Sizes` WHERE name='L'), 30),
    (4, (SELECT id_size FROM `Sizes` WHERE name='XL'), 15),

    (5, (SELECT id_size FROM `Sizes` WHERE name='S'), 12),
    (5, (SELECT id_size FROM `Sizes` WHERE name='M'), 18),
    (5, (SELECT id_size FROM `Sizes` WHERE name='L'), 24),
    (5, (SELECT id_size FROM `Sizes` WHERE name='XL'), 6),

    (6, (SELECT id_size FROM `Sizes` WHERE name='S'), 14),
    (6, (SELECT id_size FROM `Sizes` WHERE name='M'), 22),
    (6, (SELECT id_size FROM `Sizes` WHERE name='L'), 28),
    (6, (SELECT id_size FROM `Sizes` WHERE name='XL'), 7),

    (7, (SELECT id_size FROM `Sizes` WHERE name='S'), 16),
    (7, (SELECT id_size FROM `Sizes` WHERE name='M'), 24),
    (7, (SELECT id_size FROM `Sizes` WHERE name='L'), 32),
    (7, (SELECT id_size FROM `Sizes` WHERE name='XL'), 8),

    (8, (SELECT id_size FROM `Sizes` WHERE name='S'), 18),
    (8, (SELECT id_size FROM `Sizes` WHERE name='M'), 26),
    (8, (SELECT id_size FROM `Sizes` WHERE name='L'), 34),
    (8, (SELECT id_size FROM `Sizes` WHERE name='XL'), 9),

    (9, (SELECT id_size FROM `Sizes` WHERE name='S'), 20),
    (9, (SELECT id_size FROM `Sizes` WHERE name='M'), 28),
    (9, (SELECT id_size FROM `Sizes` WHERE name='L'), 36),
    (9, (SELECT id_size FROM `Sizes` WHERE name='XL'), 10),

    (10, (SELECT id_size FROM `Sizes` WHERE name='S'), 22),
    (10, (SELECT id_size FROM `Sizes` WHERE name='M'), 30),
    (10, (SELECT id_size FROM `Sizes` WHERE name='L'), 38),
    (10, (SELECT id_size FROM `Sizes` WHERE name='XL'), 11),

    (11, (SELECT id_size FROM `Sizes` WHERE name='S'), 24),
    (11, (SELECT id_size FROM `Sizes` WHERE name='M'), 32),
    (11, (SELECT id_size FROM `Sizes` WHERE name='L'), 40),
    (11, (SELECT id_size FROM `Sizes` WHERE name='XL'), 12),

    (12, (SELECT id_size FROM `Sizes` WHERE name='S'), 26),
    (12, (SELECT id_size FROM `Sizes` WHERE name='M'), 34),
    (12, (SELECT id_size FROM `Sizes` WHERE name='L'), 42),
    (12, (SELECT id_size FROM `Sizes` WHERE name='XL'), 13),

    (13, (SELECT id_size FROM `Sizes` WHERE name='S'), 28),
    (13, (SELECT id_size FROM `Sizes` WHERE name='M'), 36),
    (13, (SELECT id_size FROM `Sizes` WHERE name='L'), 44),
    (13, (SELECT id_size FROM `Sizes` WHERE name='XL'), 14),

    (14, (SELECT id_size FROM `Sizes` WHERE name='S'), 30),
    (14, (SELECT id_size FROM `Sizes` WHERE name='M'), 38),
    (14, (SELECT id_size FROM `Sizes` WHERE name='L'), 46),
    (14, (SELECT id_size FROM `Sizes` WHERE name='XL'), 15),

    (15, (SELECT id_size FROM `Sizes` WHERE name='S'), 32),
    (15, (SELECT id_size FROM `Sizes` WHERE name='M'), 40),
    (15, (SELECT id_size FROM `Sizes` WHERE name='L'), 48),
    (15, (SELECT id_size FROM `Sizes` WHERE name='XL'), 16),

    (16, (SELECT id_size FROM `Sizes` WHERE name='S'), 34),
    (16, (SELECT id_size FROM `Sizes` WHERE name='M'), 42),
    (16, (SELECT id_size FROM `Sizes` WHERE name='L'), 50),
    (16, (SELECT id_size FROM `Sizes` WHERE name='XL'), 17),

    (17, (SELECT id_size FROM `Sizes` WHERE name='S'), 36),
    (17, (SELECT id_size FROM `Sizes` WHERE name='M'), 44),
    (17, (SELECT id_size FROM `Sizes` WHERE name='L'), 52),
    (17, (SELECT id_size FROM `Sizes` WHERE name='XL'), 18),

    (18, (SELECT id_size FROM `Sizes` WHERE name='S'), 38),
    (18, (SELECT id_size FROM `Sizes` WHERE name='M'), 46),
    (18, (SELECT id_size FROM `Sizes` WHERE name='L'), 54),
    (18, (SELECT id_size FROM `Sizes` WHERE name='XL'), 19),

    (19, (SELECT id_size FROM `Sizes` WHERE name='S'), 40),
    (19, (SELECT id_size FROM `Sizes` WHERE name='M'), 48),
    (19, (SELECT id_size FROM `Sizes` WHERE name='L'), 56),
    (19, (SELECT id_size FROM `Sizes` WHERE name='XL'), 20),

    (20, (SELECT id_size FROM `Sizes` WHERE name='S'), 42),
    (20, (SELECT id_size FROM `Sizes` WHERE name='M'), 50),
    (20, (SELECT id_size FROM `Sizes` WHERE name='L'), 58),
    (20, (SELECT id_size FROM `Sizes` WHERE name='XL'), 21),

    (21, (SELECT id_size FROM `Sizes` WHERE name='S'), 44),
    (21, (SELECT id_size FROM `Sizes` WHERE name='M'), 52),
    (21, (SELECT id_size FROM `Sizes` WHERE name='L'), 60),
    (21, (SELECT id_size FROM `Sizes` WHERE name='XL'), 22),

    (22, (SELECT id_size FROM `Sizes` WHERE name='S'), 46),
    (22, (SELECT id_size FROM `Sizes` WHERE name='M'), 54),
    (22, (SELECT id_size FROM `Sizes` WHERE name='L'), 62),
    (22, (SELECT id_size FROM `Sizes` WHERE name='XL'), 23),

    (23, (SELECT id_size FROM `Sizes` WHERE name='S'), 48),
    (23, (SELECT id_size FROM `Sizes` WHERE name='M'), 56),
    (23, (SELECT id_size FROM `Sizes` WHERE name='L'), 64),
    (23, (SELECT id_size FROM `Sizes` WHERE name='XL'), 24);















