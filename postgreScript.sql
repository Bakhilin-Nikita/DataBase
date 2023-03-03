CREATE TABLE `hero` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(255),
  `age` INTEGER,
  `boat_id` INTEGER FOREIGN KEY
);
CREATE TABLE `boat` (
  `id` SERIAL PRIMARY KEY,
  `model_id` INTEGER NULL,
  `date_manufacture` DATE NULL,
  `rubber_id` INTEGER NULL
);
CREATE TABLE `water` (
  `id` SERIAL PRIMARY KEY,
  `type_id` INTEGER NULL,
  `temperature` INTEGER NULL,
  `side_stream_id` INTEGER NULL,
  `depth` INTEGER NULL
);
CREATE TABLE `wind` (
  `id` SERIAL PRIMARY KEY,
  `type_id` INTEGER NULL,
  `force_wind` INTEGER NULL
);		
CREATE TABLE `place` (
  `id` SERIAL PRIMARY KEY,
  `country_id` INTEGER NULL ,
  `city_id` INTEGER NULL,
  `water_id` INETEGER NULL,
  `wind_id` INTEGER NULL
);
		
CREATE TABLE `rubber` (
  `id` SERIAL PRIMARY KEY,
  `name` INTEGER NULL,
  `date_manufacture` DATE NULL,
  `expiration` INTEGER NULL,
  `melting_point` INTEGER NULL
);
	
CREATE TABLE `murmur` (
  `id` SERIAL PRIMARY KEY,
  `volume` INTEGER NULL,
);
	
CREATE TABLE `coridor` (
  `id` SERIAL PRIMARY KEY,
  `type_id` INTEGER NULL DEFAULT NULL,
  `composition` INTEGER NULL DEFAULT NULL,
  `size` INTEGER NULL DEFAULT NULL,   
  `place_id` INTEGER NULL	
);
		
CREATE TABLE `model` (
  `id` SERIAL PRIMARY KEY,
  `model_name` INTEGER NULL,
  `size` INTEGER NOT NULL,
  `speed` INTEGER NOT NULL 
);

CREATE TABLE `type_water` (
  `id` SERIAL PRIMARY KEY,
  `type` INTEGER NULL 
);

		
CREATE TABLE `stream` (
  `id` SERIAL PRIMARY KEY,
  `stream` INTEGER NULL
);
		
CREATE TABLE `type_wind` (
  `id` SERIAL PRIMARY KEY,
  `type` INTEGER NULL,
);
		
CREATE TABLE `Country` (
  `id` SERIAL PRIMARY KEY,
  `name` INTEGER NULL,
);		
CREATE TABLE `City` (
  `id` SERIAL PRIMARY KEY,
  `country_id` INTEGER NULL,
  `name` INTEGER NULL
);
		
CREATE TABLE `Type_of_Coridor` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(255) NULL
);

ALTER TABLE hero ADD FOREIGN KEY (boat_id) REFERENCES boat(id);
ALTER TABLE boat ADD FOREIGN KEY (model_id) REFERENCES `model` (`id`),
	ADD FOREIGN KEY (rubber_id) REFERENCES `rubber`(`id`);
ALTER TABLE water  ADD FOREIGN KEY (type_id) REFERENCES `model` (`id`), 
	ADD FOREIGN KEY (side_stream_id) REFERENCES   `stream`(`id`);
ALTER TABLE wind ADD FOREIGN KEY (type_id) REFERENCES  `type_wind`(`id`);
ALTER TABLE place  ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`), 
	ADD FOREIGN KEY (city_id) REFERENCES   `city`(`id`);

ALTER TABLE city ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`);
ALTER TABLE corridor ADD FOREIGN KEY (place_id) REFERENCES `place`(`id`);

INSERT INTO rubber VALUES('ni12', 12-20-2002, 2, 3);
INSERT INTO rubber VALUES('ni212', 12-10-2002, 12, 1);
INSERT INTO model VALUES('jas22', 122, 12);
INSERT INTO model VALUES('jas42', 112, 12);
INSERT INTO country VALUES('Russia');
INSERT INTO country VALUES('USA');
INSERT INTO country VALUES('GERMANY');
INSERT INTO city VALUES('ASTRAKHAN', 1);
INSERT INTO type_wind VALUES('RIGHT');
INSERT INTO wind VALUES(1, 111);
INSERT INTO wind VALUES(1, 123);
INSERT INTO stream VALUES('Right');
INSERT INTO type VALUES('sea');
INSERT INTO water VALUES(1, 11, 1, 22);
INSERT INTO place VALUES(1,1,1,1);
INSERT INTO type_of_coridor VALUES('дерево');
INSERT INTO coridor VALUES('sosos', 112, 1, );
INSERT INTO place VALUES(1,1,1,1);
INSERT INTO boat VALUES(1, 20-20-1990, 1, 1);
INSERT INTO boat VALUES(2, 20-20-1990, 2, 1);
