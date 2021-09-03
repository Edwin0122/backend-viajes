-- Database: viajes

-- DROP DATABASE viajes;

CREATE DATABASE viajes
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	
CREATE TABLE document_type(
	id_tp_document SERIAL PRIMARY KEY,
	description VARCHAR(30),
	acronym VARCHAR (10)
);


CREATE TABLE roles(
    id_roles SERIAL PRIMARY KEY,
    name_role VARCHAR(15),
    description_role VARCHAR(100),
    role_status BOOLEAN
);

CREATE TABLE pay_type(
    id_tp_pay SERIAL PRIMARY KEY,
    deposit VARCHAR(100),
    runway VARCHAR(100),
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE country(
    country_id SERIAL PRIMARY KEY,
    description TEXT,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE type_person(
    id_tp_person SERIAL PRIMARY KEY,
    description TEXT,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE reservation_type(
    id_tp_reservation SERIAL PRIMARY KEY,
    description TEXT
);

CREATE TABLE type_image(
    id_tp_image SERIAL PRIMARY KEY,
    description TEXT,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE services(
    services_id SERIAL PRIMARY KEY,
    description TEXT,
    image BYTEA,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE features(
    id_features SERIAL PRIMARY KEY,
    description TEXT,
    title VARCHAR(30),
    image BYTEA,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE type_toilets(
    id_tp_toilets SERIAL PRIMARY KEY,
    description TEXT
);

CREATE TABLE type_bed(
    id_tp_bed SERIAL PRIMARY KEY,
    description TEXT
);

CREATE TABLE type_bedrooms(
    id_tp_bedrooms SERIAL PRIMARY KEY,
    description_bedrooms TEXT
);

--union entre los roles y el usuario
CREATE TABLE roles_users(
    fk_id_roles SERIAL,
    fk_document_number VARCHAR 
);

CREATE TABLE users_reservation(
    fk_id_reservation SERIAL,
    fk_document_number VARCHAR
);

CREATE TABLE users(
    document_number VARCHAR PRIMARY KEY,
    first_name VARCHAR(30),
    second_name VARCHAR(30),
    surname VARCHAR(30),
    second_surname VARCHAR(30),
    fk_id_tp_document INTEGER,
	fk_country_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE brand_property(
    id_property SERIAL PRIMARY KEY,
    property_name VARCHAR(50),
    property_description TEXT,
    property_image BYTEA,
    property_address VARCHAR(50),
    property_phone VARCHAR(30),
    email_property VARCHAR(50),
    fk_city_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE sub_property(
    id_subproperty SERIAL PRIMARY KEY,
    subproperty_address VARCHAR (50),
    subproperty_phone VARCHAR(30),
    subproperty_name VARCHAR(50),
    subproperty_description TEXT,
    subproperty_image BYTEA,
    status BOOLEAN,
    fk_id_property INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE reservation(
    id_reserve SERIAL PRIMARY KEY,
    status_reservation BOOLEAN,
    date_from DATE,
    date_to DATE,
    number_guests INTEGER,
    number_days INTEGER,
    number_nights INTEGER,
    total_cost VARCHAR(15),
    reservation_date DATE,
    fk_id_sub_propiety INTEGER,
	fk_id_tp_reservation INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE pay(
    payment_id SERIAL PRIMARY KEY,
    description TEXT,
    fk_id_tp_pay INTEGER,
    fk_reservation_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE ticket(
    id_ticket SERIAL PRIMARY KEY,
    admission_date DATE,
    departure_date DATE,
    total_time DATE,
    iva VARCHAR(11),
    subtotal_payment VARCHAR(20),
    full_payment VARCHAR(20),
    fk_payment_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE city(
    id_city SERIAL PRIMARY KEY,
    description TEXT,
    fk_country_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE reservation_person(
    id_reservation_person SERIAL PRIMARY KEY,
    number_guests INTEGER,
    fk_id_tp_person INTEGER,
    fk_id_reservation INTEGER
);


CREATE TABLE image(
    id_image SERIAL PRIMARY KEY,
    image BYTEA,
    status BOOLEAN,
    fk_id_sub_propiety INTEGER,
    fk_id_tp_image INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE property_services(
    id_property_services SERIAL PRIMARY KEY,
    status BOOLEAN,
    fk_servises_id INTEGER,
    fk_sub_property_id INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE

);

CREATE TABLE status_features(
    id_features_status SERIAL PRIMARY KEY,
    status BOOLEAN,
    fk_id_sub_propiety INTEGER,
    fk_features_id INTEGER
);

CREATE TABLE toilets(
    id_toilets INTEGER,
    description TEXT,
    fk_id_tp_toilets INTEGER,
    fk_id_bedrooms INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);


CREATE TABLE bedrooms(
    id_bedroom SERIAL PRIMARY KEY,
    description TEXT,
    number_bedrooms INTEGER,
    fk_id_sub_propiety INTEGER,
    fk_id_bed INTEGER,
    fk_id_tp_bedrooms INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

CREATE TABLE bed(
    id_bed SERIAL PRIMARY KEY,
    description TEXT,
    number_beds INTEGER,
    fk_id_tp_bed INTEGER,
    create_date DATE,
    create_user VARCHAR(70),
    update_date DATE,
    user_update_date VARCHAR(70),
    delete_user VARCHAR(70),
    date_delete DATE
);

--29





ALTER TABLE users ADD CONSTRAINT fk_id_tp_document FOREIGN KEY (fk_id_tp_document)
REFERENCES document_type (id_tp_document)
on delete restrict on update restrict;

ALTER TABLE users ADD CONSTRAINT fk_country_id FOREIGN KEY (fk_country_id)
REFERENCES country (country_id)
on delete restrict on update restrict;

---------------------------------------------------------------------------
ALTER TABLE roles_users ADD CONSTRAINT fk_id_roles FOREIGN KEY (fk_id_roles)
REFERENCES roles (id_roles)
on delete restrict on update restrict;

ALTER TABLE roles_users ADD CONSTRAINT fk_document_number FOREIGN KEY (fk_document_number)
REFERENCES users (document_number)
on delete restrict on update restrict;

----------------------------------------------------------------------------

ALTER TABLE users_reservation ADD CONSTRAINT fk_id_reservation FOREIGN KEY (fk_id_reservation)
REFERENCES reservation (id_reserve)
on delete restrict on update restrict;


ALTER TABLE users_reservation ADD CONSTRAINT fk_document_number FOREIGN KEY (fk_document_number)
REFERENCES users (document_number)
on delete restrict on update restrict;

---------------------------------------------------------------------------

ALTER TABLE ticket ADD CONSTRAINT fk_payment_id FOREIGN KEY (fk_payment_id)
REFERENCES pay (payment_id)
on delete restrict on update restrict;

---------------------------------------------------------------------------

ALTER TABLE pay ADD CONSTRAINT fk_reservation_id FOREIGN KEY (fk_reservation_id)
REFERENCES reservation (id_reserve)
on delete restrict on update restrict;


ALTER TABLE pay ADD CONSTRAINT fk_id_tp_pay FOREIGN KEY (fk_id_tp_pay)
REFERENCES pay_type (id_tp_pay)
on delete restrict on update restrict;

--------------------------------------------------------------------------

ALTER TABLE city ADD CONSTRAINT fk_country_id FOREIGN KEY (fk_country_id)
REFERENCES country (country_id)
on delete restrict on update restrict;

-------------------------------------------------------------------------

ALTER TABLE reservation ADD CONSTRAINT fk_id_sub_propiety FOREIGN KEY (fk_id_sub_propiety)
REFERENCES sub_property (id_subproperty)
on delete restrict on update restrict;

ALTER TABLE reservation ADD CONSTRAINT fk_id_tp_reservation FOREIGN KEY (fk_id_tp_reservation)
REFERENCES reservation_type (id_tp_reservation)
on delete restrict on update restrict;

---------------------------------------------------------------------------

ALTER TABLE reservation_person ADD CONSTRAINT fk_id_tp_person FOREIGN KEY (fk_id_tp_person)
REFERENCES type_person (id_tp_person)
on delete restrict on update restrict;

ALTER TABLE reservation_person ADD CONSTRAINT fk_id_reservation FOREIGN KEY (fk_id_reservation)
REFERENCES reservation (id_reserve)
on delete restrict on update restrict;

------------------------------------------------------------------------------

ALTER TABLE brand_property ADD CONSTRAINT fk_city_id FOREIGN KEY (fk_city_id)
REFERENCES city (id_city)
on delete restrict on update restrict;

------------------------------------------------------------------------------

ALTER TABLE sub_property ADD CONSTRAINT fk_id_property FOREIGN KEY (fk_id_property)
REFERENCES brand_property (id_property)
on delete restrict on update restrict;

-------------------------------------------------------------------------------

ALTER TABLE bedrooms ADD CONSTRAINT fk_id_sub_propiety FOREIGN KEY (fk_id_sub_propiety)
REFERENCES sub_property (id_subproperty)
on delete restrict on update restrict;



ALTER TABLE bedrooms ADD CONSTRAINT fk_id_bed FOREIGN KEY (fk_id_bed)
REFERENCES bed (id_bed)
on delete restrict on update restrict;


ALTER TABLE bedrooms ADD CONSTRAINT fk_id_tp_bedrooms FOREIGN KEY (fk_id_tp_bedrooms)
REFERENCES type_bedrooms (id_tp_bedrooms)
on delete restrict on update restrict;

---------------------------------------------------------------------------------

ALTER TABLE image ADD CONSTRAINT fk_id_sub_propiety FOREIGN KEY (fk_id_sub_propiety)
REFERENCES sub_property (id_subproperty)
on delete restrict on update restrict;


ALTER TABLE image ADD CONSTRAINT fk_id_tp_image FOREIGN KEY (fk_id_tp_image)
REFERENCES type_image (id_tp_image)
on delete restrict on update restrict;

----------------------------------------------------------------------------------

ALTER TABLE property_services ADD CONSTRAINT fk_servises_id FOREIGN KEY (fk_servises_id)
REFERENCES services (services_id)
on delete restrict on update restrict;

ALTER TABLE property_services ADD CONSTRAINT fk_sub_property_id FOREIGN KEY (fk_sub_property_id)
REFERENCES sub_property (id_subproperty)
on delete restrict on update restrict;

----------------------------------------------------------------------------------

ALTER TABLE status_features ADD CONSTRAINT fk_id_sub_propiety FOREIGN KEY (fk_id_sub_propiety)
REFERENCES sub_property (id_subproperty)
on delete restrict on update restrict;

ALTER TABLE status_features ADD CONSTRAINT fk_features_id FOREIGN KEY (fk_features_id)
REFERENCES features (id_features)
on delete restrict on update restrict;

----------------------------------------------------------------------------------

ALTER TABLE toilets ADD CONSTRAINT fk_id_tp_toilets FOREIGN KEY (fk_id_tp_toilets)
REFERENCES type_toilets (id_tp_toilets)
on delete restrict on update restrict;

ALTER TABLE toilets ADD CONSTRAINT fk_id_bedrooms FOREIGN KEY (fk_id_bedrooms)
REFERENCES bedrooms (id_bedroom)
on delete restrict on update restrict;

----------------------------------------------------------------------------------


ALTER TABLE bed ADD CONSTRAINT fk_id_tp_bed FOREIGN KEY (fk_id_tp_bed)
REFERENCES type_bed (id_tp_bed)
on delete restrict on update restrict;

---------------------------------------------------------------------------------






--document_type
INSERT INTO document_type (description, acronym) 
VALUES ('Cedula Ciudadania','C.C'),
	   ('Tarjeta Identidad','T.I'),
	   ('Cedula Extranjeria','C.E'),
	   ('Pasaporte','P.A');



--coutry

INSERT INTO country (description)
VALUES ('Colombia'),
       ('Venezuela'),
       ('Brasil');


--type_person
INSERT INTO type_person (description)
VALUES ('Adulto'),
       ('Niño'),
       ('Tercera Edad');

INSERT INTO users (document_number, first_name, second_name, surname, second_surname, fk_id_tp_document, fk_country_id) 
VALUES ('1212124584','Edwin','Alexander','Navas','Quiroga',1,1),
       ('878212','Emily','Aleja','Perez','Puerto',2,1),
       ('65565232','Goku','Son','Gomez','Gutierres',2,2),
       ('1215454','Mario','Bross','Hernandez','Guerrero',3,3),
       ('565614452','Pedro','Jaimito','Chapatin','Carbajal',1,2);