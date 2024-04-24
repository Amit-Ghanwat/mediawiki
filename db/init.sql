CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'spidermaN@123456';
CREATE DATABASE wikidatabase;  
GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;