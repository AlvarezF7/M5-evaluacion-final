--------------------------------------------------------------------------------
--Evaluación final Modulo 5
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- PARTE: 1 Crea tablas entregadas para el ejercicio
--------------------------------------------------------------------------------
DROP TABLE IF EXISTS reparto_soltera_otra_vez;
CREATE TABLE reparto_soltera_otra_vez
(
    nombre character varying(255) NOT NULL,
    temporadas integer,
    protagonico boolean,
    sueldo integer,
    PRIMARY KEY (nombre)
);

insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Paz Bascuñán', 3, true, 100);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Pablo Macaya', 3, true, 100);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Cristián Arriagada', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Josefina Montané', 2, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Loreto Aravena', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Lorena Bosch', 2, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Nicolás Poblete', 2, true, 85);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Héctor Morales', 3, true, 80);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Aranzazú Yankovic', 2, true, 80);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Luis Gnecco', 3, true, 95);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Catalina Guerra', 3, true, 90);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Solange Lackington', 2, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Ignacio Garmendia', 2, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Julio González', 3, true, 75);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Antonella Orsini', 3, true, 70);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Tamara Acosta', 1, false, 60);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Silvia Santelices', 1, false, 55);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Alejandro Trejo', 1, false, 55);
insert into reparto_soltera_otra_vez (nombre, temporadas, protagonico, sueldo) values ('Grimanesa Jiménez', 1, false, 60);

DROP TABLE IF EXISTS reparto_papi_ricky;
CREATE TABLE reparto_papi_ricky
(
    nombre character varying(255) NOT NULL,
    capitulos integer,
    protagonico boolean,
    sueldo integer,
    PRIMARY KEY (nombre)
);

insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Jorge Zabaleta', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Belén Soto', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Tamara Acosta', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('María Elena Swett', 135, true, 100);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Juan Falcón', 135, true, 95);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Silvia Santelices', 135, true, 85);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Leonardo Perucci', 135, true, 85);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Teresita Reyes', 135, true, 80);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Luis Gnecco', 135, true, 75);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Alejandro Trejo', 135, true, 65);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Grimanesa Jiménez', 135, true, 60);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Remigio Remedy', 135, true, 60);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('María Paz Grandjean', 135, true, 55);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Héctor Morales', 135, true, 50);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('César Caillet', 135, true, 40);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('José Tomás Guzmán', 135, true, 25);
insert into reparto_papi_ricky (nombre, capitulos, protagonico, sueldo) values ('Manuel Aguirre', 135, true, 30);


---consulta 1 obtiene actores en comun entre ambas tablas y su  respectivo sueldo

SELECT 
    rp.nombre,
    rp.sueldo AS sueldo_papi_ricky,
    rs.sueldo AS sueldo_soltera,
    (rp.sueldo + rs.sueldo) AS sueldo_total
FROM reparto_papi_ricky AS rp
INNER JOIN reparto_soltera_otra_vez AS rs
    ON rp.nombre = rs.nombre
ORDER BY rp.nombre;

--consulta 2 actores que participaron exclusivamente en soltera otravez suelco mayor a 90

SELECT rs.nombre FROM reparto_soltera_otra_vez rs
LEFT JOIN reparto_papi_ricky rp

--consulta 3 actores con sueldo menor a 85 de cualquier comedia pero no en las dos

SELECT nombre, sueldo
FROM reparto_soltera_otra_vez WHERE sueldo < 85 
AND nombre NOT IN(SELECT nombre FROM reparto_papi_ricky)
UNION
SELECT nombre, sueldo
FROM reparto_papi_ricky WHERE sueldo < 85 
AND nombre NOT IN (SELECT nombre FROM reparto_soltera_otra_vez);

----------------------------------------------------------------------------------------
--PARTE: 2 DIAGRAMA DE ENTIDAD RELACIONADA
----------------------------------------------------------------------------------------

--1 completar diagrama ok
--2 crear las tablas

CREATE TABLE actor(
id_actor SERIAL PRIMARY KEY,
nombre VARCHAR (60) NOT NULL,
edad INT 
);


CREATE TABLE teleserie(
id_teleserie SERIAL PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
cantidad_capitulos INT,
anio_estreno INT 
);

-- Tabla intermedia para manejar la relación N:M  entre las tablas actor y teleserie
CREATE TABLE reparto_actor(
id_reparto SERIAL PRIMARY KEY,
sueldo INT,
protagonico BOOLEAN,
id_actor INT NOT NULL,
id_teleserie INT NOT NULL,
FOREIGN KEY (id_actor) REFERENCES actor (id_actor),
FOREIGN KEY (id_teleserie)REFERENCES teleserie(id_teleserie)
);
--------------------------------------------------------------------------------------
--Poblando Tablas
--------------------------------------------------------------------------------------
INSERT INTO actor (nombre, edad) VALUES
('Paz Bascuñán', NULL),
('Pablo Macaya', NULL),
('Cristián Arriagada', NULL),
('Josefina Montané', NULL),
('Loreto Aravena', NULL),
('Lorena Bosch', NULL),
('Nicolás Poblete', NULL),
('Héctor Morales', NULL),
('Aranzazú Yankovic', NULL),
('Luis Gnecco', NULL),
('Catalina Guerra', NULL),
('Solange Lackington', NULL),
('Ignacio Garmendia', NULL),
('Julio González', NULL),
('Antonella Orsini', NULL),
('Tamara Acosta', NULL),
('Silvia Santelices', NULL),
('Alejandro Trejo', NULL),
('Grimanesa Jiménez', NULL),
('Jorge Zabaleta', NULL),
('Belén Soto', NULL),
('María Elena Swett', NULL),
('Juan Falcón', NULL),
('Leonardo Perucci', NULL),
('Teresita Reyes', NULL),
('Remigio Remedy', NULL),
('María Paz Grandjean', NULL),
('César Caillet', NULL),
('José Tomás Guzmán', NULL),
('Manuel Aguirre', NULL);

------------------------------------------------------------------------------------------------
--Se agregan edades aproximadas y se mantienen algunos valores en NULL
-- para reflejar un escenario real de migración de datos incompletos
-----------------------------------------------------------------------------------------------

UPDATE actor SET edad = 38 WHERE nombre = 'Paz Bascuñán';
UPDATE actor SET edad = 42 WHERE nombre = 'Jorge Zabaleta';
UPDATE actor SET edad = 35 WHERE nombre = 'Tamara Acosta';
UPDATE actor SET edad = 50 WHERE nombre = 'Luis Gnecco';
UPDATE actor SET edad = 30 WHERE nombre = 'Josefina Montané';
UPDATE actor SET edad = 45 WHERE nombre = 'Juan Falcón';


INSERT INTO teleserie (nombre, cantidad_capitulos, anio_estreno)
VALUES
('Soltera Otra Vez', NULL, NULL),
('Papi Ricky', 135, NULL);

INSERT INTO reparto_actor (id_actor, id_teleserie, sueldo, protagonico)
SELECT a.id_actor, 1, r.sueldo, r.protagonico
FROM reparto_soltera_otra_vez r
JOIN actor a ON a.nombre = r.nombre;

INSERT INTO reparto_actor (id_actor, id_teleserie, sueldo, protagonico)
SELECT a.id_actor, 2, r.sueldo, r.protagonico
FROM reparto_papi_ricky r
JOIN actor a ON a.nombre = r.nombre;

-----completando datos tabla teleserie-------------------------------------------------
UPDATE teleserie
SET 
    anio_estreno = 2012,
    cantidad_capitulos = 125
WHERE nombre = 'Soltera Otra Vez';

UPDATE teleserie
SET anio_estreno = 2007
WHERE nombre = 'Papi Ricky';

---consulta para listar teleserie y los actores protagonistas--------------------------
SELECT 
    t.nombre AS teleserie,
    a.nombre AS actor,
    ra.sueldo
FROM teleserie t
INNER JOIN reparto_actor ra
    ON t.id_teleserie = ra.id_teleserie
INNER JOIN actor a
    ON ra.id_actor = a.id_actor
WHERE ra.protagonico = true
ORDER BY t.nombre, a.nombre;

