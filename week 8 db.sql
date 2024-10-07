
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL
);


CREATE TABLE Household (
    household_id INT PRIMARY KEY AUTO_INCREMENT,
    household_name VARCHAR(100),
    num_members INT,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);


CREATE TABLE Energy_Source (
    energy_source_id INT PRIMARY KEY AUTO_INCREMENT,
    source_name VARCHAR(50) NOT NULL
);


CREATE TABLE Consumption_Record (
    consumption_id INT PRIMARY KEY AUTO_INCREMENT,
    household_id INT,
    energy_source_id INT,
    consumption_amount DECIMAL(10, 2),  -- Energy consumed in kilowatt-hours (kWh)
    date_consumed DATE NOT NULL,
    FOREIGN KEY (household_id) REFERENCES Household(household_id),
    FOREIGN KEY (energy_source_id) REFERENCES Energy_Source(energy_source_id)
);

INSERT INTO Location (location_name)
VALUES ('Rural Area 1'), ('Rural Area 2'), ('Rural Area 3');

INSERT INTO Household (household_name, num_members, location_id)
VALUES ('Household A', 4, 1), ('Household B', 6, 2), ('Household C', 3, 3);

INSERT INTO Energy_Source (source_name)
VALUES ('Wood'), ('Kerosene'), ('Solar'), ('Wind');

INSERT INTO Consumption_Record (household_id, energy_source_id, consumption_amount, date_consumed)
VALUES 
(1, 1, 50.75, '2024-01-01'),  
(1, 3, 20.50, '2024-01-15'),  
(2, 2, 100.00, '2024-02-01'), 
(3, 4, 75.25, '2024-03-01'); 

SELECT h.household_name, l.location_name, es.source_name, c.consumption_amount, c.date_consumed
FROM Household h
JOIN Consumption_Record c ON h.household_id = c.household_id
JOIN Energy_Source es ON c.energy_source_id = es.energy_source_id
JOIN Location l ON h.location_id = l.location_id
ORDER BY h.household_name;


 

