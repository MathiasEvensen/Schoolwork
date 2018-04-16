drop procedure if exists `create_feedback`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_feedback`(IN status VARCHAR(30), comment_open VARCHAR(300), 
comment_hidden VARCHAR(300), score int, module_id int, name varchar(50))
BEGIN

declare newUser_account_id int;

set newUser_account_id = (select user_account_id from user_Account a where a.name=name); 

insert into feedback (status, comment_open, comment_hidden, score, module_id, user_account_id) values (status, comment_open, comment_hidden, score, module_id, NewUser_account_id);



END //
DELIMITER ;