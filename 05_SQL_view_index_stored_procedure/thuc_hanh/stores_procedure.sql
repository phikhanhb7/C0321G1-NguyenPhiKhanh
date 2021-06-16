use classcmodels;

DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //
DELIMITER ;


call findAllCustomers();