#Examen 2 de Bases de Datos 2
#Jesús De la Fuente Reyes

CREATE DATABASE Examen2_BD2;
USE Examen2_BD2;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `spResetPassword`(IN pEmail VARCHAR(150), IN pPass BLOB)

BEGIN
	
    UPDATE usuarios 
    SET Pass = pPass
    WHERE Email = pEmail;							
    
END$$
DELIMITER ;

#--------------------------------------------------------------------------------

#password actualizada
CALL spResetPassword ('jesusdlfr@gmail.com', aes_encrypt('*78901Jq', 'llave'));
SELECT Usuario, CAST(AES_DECRYPT(Pass, 'llave') AS CHAR) AS Pass FROM usuarios;