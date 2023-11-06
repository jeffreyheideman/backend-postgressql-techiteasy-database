DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS television_wall_mounts;
DROP TABLE IF EXISTS remote_controllers CASCADE;
DROP TABLE IF EXISTS televisions;
DROP TABLE IF EXISTS ci_modules;
DROP TABLE IF EXISTS wall_mounts;




CREATE TABLE users
(
	userId INT GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(255),
	password VARCHAR(255)
);


CREATE TABLE remote_controllers
(
	id INT GENERATED ALWAYS AS IDENTITY,
	compatible_with VARCHAR(255),
	battery_type VARCHAR(255),
	price INT,
	PRIMARY KEY(id)
);

CREATE TABLE ci_modules
(
	id int GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255),
	type VARCHAR(255),
	price INT,
	PRIMARY KEY(id)
);


CREATE TABLE wall_mounts
(
	id int ,
	name VARCHAR(255),
	adjustable BOOLEAN,
	price INT,
	PRIMARY KEY(id)
);

CREATE TABLE televisions
(
	id INT,
	brand VARCHAR(255),
	type VARCHAR(255),
	available INT,
	refresh_rate INT,
	screen_type VARCHAR(255),
	price INT,
	current_stock INT,
	sold INT,
	remote_controller_id INT,
	ci_module_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(remote_controller_id) REFERENCES remote_controllers(id),
	FOREIGN KEY(ci_module_id) REFERENCES ci_modules(id)
);

CREATE TABLE television_wall_mounts 
(
	television_id INT,
	wall_mount_id INT,
	FOREIGN KEY (television_id) REFERENCES televisions(id),
	FOREIGN KEY (wall_mount_id) REFERENCES wall_mounts(id)
);

	


INSERT INTO users(username, password)
VALUES ('Jeffrey Heideman', 'hellokitty123'), ('Joop Hendriksen', 'pikachu123');

INSERT INTO wall_mounts(id, name, adjustable, price)
VALUES
(3001, 'small tv mount', false, 69), 
(3002, 'big tv mount', true, 99);

INSERT INTO ci_modules(name, type, price)
VALUES
('Positronic', 'CBD5W5M000E3X', 14.99),
('Quantis', 'CBD5W5M0069XX', 69.99);

INSERT INTO remote_controllers(compatible_with, battery_type, price)
VALUES
('Phillips', 'AA', 19.99),
('LG', 'AA', 19.99),
('SONY', 'AA', 29.99),
('SAMSUNG', 'AAA', 43.99);

INSERT INTO televisions(id, brand, type, available, refresh_rate, screen_type, price, current_stock, sold, remote_controller_id, ci_module_id)
VALUES
(1001, 'LG', 'CX', 200, 120, 'OLED', 1299, 43, 52, 1, 1),
(1002, 'SAMSUNG', 'S95C', 154, 100, 'OLED QD', 4999, 52, 41, 4, 2),
(1003, 'SONY', 'BRAVIA', 12, 120, 'OLED', 1899, 12, 4, 3, 1),
(1004, 'Phillips', 'CX', 699, 120, 'LCD', 599, 43, 52, 2, 2),
(1005, 'LG', 'C2', 12, 10, 'OLED', 1499, 14, 54, 1, 1);


INSERT INTO television_wall_mounts(television_id, wall_mount_id)
VALUES
(1001, 3002),
(1002, 3001),
(1003, 3002),
(1004, 3002),
(1005, 3001);

SELECT televisions.id, televisions.remote_controller_id
FROM televisions
JOIN remote_controllers ON remote_controllers.id = televisions.remote_controller_id;



