#Examen 2 de Bases de Datos 2
#Jesús De la Fuente Reyes

CREATE DATABASE Examen2_BD2;
USE Examen2_BD2;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `spValidarUsuario` (pEmail VARCHAR(150), pPass BLOB)

BEGIN
	
	SELECT Usuario, Email, CAST(AES_DECRYPT(Pass, 'llave') AS CHAR) AS Pass FROM usuarios
    WHERE Email = pEmail AND 
    Pass = AES_ENCRYPT(pPass, 'llave');
    
END$$
DELIMITER ;


#En caso de que el login sea correcto (muestra el usuario)
CALL spValidarUsuario ('jesusdlfr@gmail.com', '#12389bZ');

#-------------------------------------------------------------

#En caso de que el login sea incorrecto (no muestra nada)
CALL spValidarUsuario ('jesusdlfr@gmail.com', '#12389b');