CREATE TABLE `hero` (
  `id` SERIAL PRIMARY KEY,
  `name` varchar(255),
  `age` INTEGER,
  `boat_id` INTEGER FOREIGN KEY,
);
CREATE TABLE `boat` (
  `id` SERIAL PRIMARY KEY,
  `size` INTEGER NULL,
  `model_id` INTEGER NULL,
  `date_manufacture` DATE NULL,
  `speed` INTEGER NULL,
);
CREATE TABLE `water` (
  `id` SERIAL PRIMARY KEY,
  `type_id` INTEGER NULL,
  `temperature` INTEGER NULL,
  `side_stream_id` INTEGER NULL,
  `depth` INTEGER NULL,
  ADD FOREIGN KEY (type_id) REFERENCES `model` (`id`),
  ADD FOREIGN KEY (side_stream_id) REFERENCES   `side_stream`(`id`)
);
CREATE TABLE `wind` (
  `id` SERIAL PRIMARY KEY,
  `type_id` INTEGER NULL,
  `force_wind` INTEGER NULL,
  ADD FOREIGN KEY (type_id) REFERENCES   `type`(`id`)
);		
CREATE TABLE `place` (
  `id` SERIAL PRIMARY KEY,
  `country_id` INTEGER NULL ,
  `city_id` INTEGER NULL,
  ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`),
  ADD FOREIGN KEY (city_id) REFERENCES   `city`(`id`)
);
		
CREATE TABLE `rubber` (
  `id` SERIAL PRIMARY KEY,
  `name` INTEGER NULL,
  `date_manufacture` DATE NULL,
  `expiration` INTEGER NULL,
  `melting_point` INTEGER NULL,
  `boat_id` INTEGER NULL,
  ADD FOREIGN KEY (boat_id) REFERENCES   `boat`(`id`)
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
);
		
CREATE TABLE `model` (
  `id` SERIAL PRIMARY KEY,
  `model_name` INTEGER NULL,
);

CREATE TABLE `type_water` (
  `id` SERIAL PRIMARY KEY,
  `type` INTEGER NULL 
);

		
CREATE TABLE `side_stream` (
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
  `name` INTEGER NULL,
   ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`)
);
		
CREATE TABLE `Type_of_Coridor` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(255) NULL
);

ALTER TABLE hero ADD FOREIGN KEY (boat_id) REFERENCES boat(id);
ALTER TABLE boat ADD FOREIGN KEY (model_id) REFERENCES `model` (`id`);
ALTER TABLE water  ADD FOREIGN KEY (type_id) REFERENCES `model` (`id`), ADD FOREIGN KEY (side_stream_id) REFERENCES   `side_stream`(`id`);
ALTER TABLE wind ADD FOREIGN KEY (type_id) REFERENCES  `type_wind`(`id`);
ALTER TABLE place  ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`), ADD FOREIGN KEY (city_id) REFERENCES   `city`(`id`);
ALTER TABLE rubber ADD FOREIGN KEY (boat_id) REFERENCES   `boat`(`id`);
ALTER TABLE city ADD FOREIGN KEY (country_id) REFERENCES   `country`(`id`);