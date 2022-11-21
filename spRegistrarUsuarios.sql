#Examen 2 de Bases de Datos 2
#Jesús De la Fuente Reyes

CREATE DATABASE Examen2_BD2;
USE Examen2_BD2;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `spRegistrarUsuario`(IN pUsuario VARCHAR(150), IN pEmail VARCHAR(150), 
							   IN pPass BLOB, OUT pMensaje VARCHAR(500))

BEGIN
	IF (SELECT REGEXP_LIKE(pPass, '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$#%&/.,?])[A-Za-z[0-9]$#%&/.,?]{8,}$')!=1) THEN
		SET pMensaje := 'El email ya existe o la contraseña debe ser de más de 8 caracteres, con al menos: una mayúscula,
						una minúscula, un número y un caracter especial';
	ELSE
		INSERT INTO usuarios (Usuario, Email, Pass)
		VALUES (pUsuario, pEmail, AES_ENCRYPT(pPass, 'llave'));
        SET pMensaje := 'Usuario creado';
	
    END IF;
END$$
DELIMITER ;

#------------------------------------------------------------------------------------
#Caso en el que el usuario SI ingresa correctamente
CALL spRegistrarUsuario ('chuz', 'jesusdlfr@gmail.com', '#12389bZ', @pMensaje);	
SELECT @pMensaje AS MENSAJE;
SELECT * FROM usuarios;

#-------------------------------------------------------------------------------------
#caso en el que da error porque el email ya existe
CALL spRegistrarUsuario ('chuz', 'jesusdlfr@gmail.com', '#12389bZ', @pMensaje);	
SELECT @pMensaje AS MENSAJE;
SELECT * FROM usuarios;

#-------------------------------------------------------------------------------------
#caso en el que da error porque la contraseña no cumple con los requisitos
CALL spRegistrarUsuario ('chuz', 'jesusdlf@gmail.com', '#12389b', @pMensaje);	
SELECT @pMensaje AS MENSAJE;
SELECT * FROM usuarios;
