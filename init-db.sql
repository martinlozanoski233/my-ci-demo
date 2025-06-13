CREATE TABLE IF NOT EXISTS users (
     id SERIAL PRIMARY KEY,
     name VARCHAR(100) NOT NULL,
     email VARCHAR(100)
);

INSERT INTO users (name, email) VALUES 
('Martin', 'martin@hotmail.com'),
('Ana','ana@gmail.com'),
('Davor','davor@yahoo.com'),
('Marko','marko@hotmail.com');
