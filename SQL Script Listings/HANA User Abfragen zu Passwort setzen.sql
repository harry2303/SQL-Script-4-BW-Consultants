SELECT
     user_name,
     create_time,
     valid_from,
     valid_until,
     last_successful_connect,
     password_change_time,
     password_change_needed 
FROM USERS 
WHERE user_name = current_user
--where user_name LIKE 'DEVELOP_'
;