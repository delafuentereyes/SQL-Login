#Examen 2 de Bases de Datos 2
#Jesús De la Fuente Reyes

CREATE DATABASE Examen2_BD2;
USE Examen2_BD2;

CREATE TABLE usuarios (
	ID_Usuario TINYINT AUTO_INCREMENT NOT NULL,
    Usuario VARCHAR (150),
    Email VARCHAR(150) NOT NULL UNIQUE, 
    Pass BLOB NOT NULL,
    
    PRIMARY KEY (ID_Usuario)
)

SELECT * FROM usuarios

#para ver las contraseñas desencriptadas
SELECT Usuario, CAST(AES_DECRYPT(Pass, 'llave') AS CHAR) AS Pass FROM usuarios;