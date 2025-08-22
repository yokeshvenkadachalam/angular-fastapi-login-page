-- 1. Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS login_db;

-- 2. Select the database to use
USE login_db;

-- 3. Disable foreign key checks (optional, safe drop)
SET FOREIGN_KEY_CHECKS = 0;

-- 4. Drop the users table if it exists
DROP TABLE IF EXISTS users;

-- 5. Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- 6. Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- internal auto-increment ID
    username VARCHAR(50) UNIQUE NOT NULL,    -- unique username
    password VARCHAR(50) NOT NULL,           -- password
    unique_id VARCHAR(10) UNIQUE NOT NULL    -- unique ID like JSR01
);

-- 7. Optional: verify table structure
DESCRIBE users;

-- 8. Optional: verify table is empty
SELECT * FROM users;

