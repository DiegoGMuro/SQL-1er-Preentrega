CREATE SCHEMA 1er_preentrega;
USE 1er_preentrega;

CREATE TABLE segmento(
id_segm INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descrip_seg VARCHAR(100) NOT NULL
);

CREATE TABLE condicion_pago(
id_payment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descrip_pay VARCHAR(100) NOT NULL
);

CREATE TABLE causa_retorno(
id_cause INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descrip_causeret VARCHAR(100) NOT NULL
);

CREATE TABLE ship_mode(
id_ship INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descrip_ship VARCHAR(100) NOT NULL
);

CREATE TABLE categoria(
id_categ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_cat VARCHAR(100) NOT NULL
);


CREATE TABLE vendedor(
id_salesman INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_salesman VARCHAR(100) NOT NULL,
lastname_salesman VARCHAR(100) NOT NULL
);

CREATE TABLE codigo_postal(
id_pc INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_pc VARCHAR(100) NOT NULL
);






CREATE TABLE subcategoria(
id_subcateg INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_subcat VARCHAR(100) NOT NULL,
id_categ INT NOT NULL,
FOREIGN KEY (id_categ) REFERENCES categoria(id_categ)
);

CREATE TABLE cliente(
id_cust INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
day_In DATE NOT NULL,
name_cust VARCHAR(100) NOT NULL,
id_Segm INT NOT NULL,
FOREIGN KEY (id_Segm) REFERENCES segmento(id_segm)
);

CREATE TABLE ciudad(
id_city INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_city VARCHAR(100) NOT NULL,
id_pc INT NOT NULL,
FOREIGN KEY (id_pc) REFERENCES codigo_postal(id_pc)
);

CREATE TABLE estado(
id_state INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_state VARCHAR(100) NOT NULL,
id_city INT NOT NULL,
FOREIGN KEY (id_city) REFERENCES ciudad(id_city)
);

CREATE TABLE pais(
id_country INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_count VARCHAR(100) NOT NULL,
id_state INT NOT NULL,
FOREIGN KEY (id_state) REFERENCES estado(id_state)
);

CREATE TABLE region(
id_region INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_region VARCHAR(100) NOT NULL,
id_salesman INT NOT NULL,
FOREIGN KEY (id_salesman) REFERENCES vendedor(id_salesman)
);

CREATE TABLE productos(
id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name_prod VARCHAR(100) NOT NULL,
id_subcateg INT NOT NULL,
unit_price DECIMAL NOT NULL,
sku INT NOT NULL,
FOREIGN KEY (id_subcateg) REFERENCES subcategoria(id_subcateg)
);


CREATE TABLE ordenes(
id_order INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_date DATE NOT NULL,
id_ship INT NOT NULL,
id_product INT NOT NULL,
unit_price DECIMAL NOT NULL,
sku INT NOT NULL,
qty INT NOT NULL,
sales DECIMAL NOT NULL,
id_cust INT NOT NULL,
id_pc INT NOT NULL,
id_region INT NOT NULL,
id_payment INT NOT NULL,
FOREIGN KEY (id_ship) REFERENCES ship_mode(id_ship),
FOREIGN KEY (id_product) REFERENCES productos(id_product),
FOREIGN KEY (id_cust) REFERENCES cliente(id_cust),
FOREIGN KEY (id_pc) REFERENCES codigo_postal(id_pc),
FOREIGN KEY (id_region) REFERENCES region(id_region),
FOREIGN KEY (id_payment) REFERENCES condicion_pago(id_payment)
);

CREATE TABLE retornos(
id_retorno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
day_return DATE NOT NULL,
id_order INT NOT NULL,
id_cause INT NOT NULL,
id_cust INT NOT NULL,
FOREIGN KEY (id_order) REFERENCES ordenes(id_order),
FOREIGN KEY (id_cause) REFERENCES causa_retorno(id_cause),
FOREIGN KEY (id_cust) REFERENCES cliente(id_cust)
);


CREATE TABLE ordenes_productos(
Id_vta_order_prod INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_order INT NOT NULL,
id_product INT NOT NULL,
qty INT NOT NULL,
FOREIGN KEY (id_order) REFERENCES ordenes(id_order),
FOREIGN KEY (id_product) REFERENCES productos(id_product)
);
