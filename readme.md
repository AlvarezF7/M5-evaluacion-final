# M4 — Evaluación Final- Base Datos Teleseries

## Descripción
Proyecto de modelado y gestión de base de datos de teleseries y actores;
la cual incluye sus roles (protagonistas y secundarios) y su participación en diferentes teleseries.
Permite consultar reparto, sueldos y relaciones entre actores y teleseries.

## Tecnologías utilizadas
- Postgress.
- Pg Admin 4. 
- Modelo Normalizado con tablas actor, reparto_actor y teleserie.

## Estructura del Proyecto
![estructura](https://github.com/AlvarezF7/M4-evaluacion-final/blob/main/assets/img/estructura-proyecto.png)


## Consultas incluidas

- Obtener actores que participaron en ambas teleseries y la suma de sus sueldos
- Listar actores exclusivos de una teleserie con filtros de sueldo
- Mostrar todas las teleseries con sus protagonistas y sueldos
- Actualizar información de años de estreno y cantidad de capítulos
- Consultas de prueba para verificar relaciones entre tablas

## Notas
- Algunos registros mantienen la edad en NULL para reflejar el comportamiento real de datos migrados incompletos.

- Cómo ejecutar el proyecto:

 - Crear una base de datos nueva: con el comando CREATE DATABASE teleseries;
 - Seleccionarla:
        USE teleseries; -- MySQL
        \c teleseries    -- PostgreSQL

- Ejecutar el script sql/m5-evaluacion-final.sql
- Ejecutar las consultas incluidas o agregar nuevas según se necesite.


 

