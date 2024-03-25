CREATE DATABASE IF NOT EXISTS wva_database;

CREATE TABLE IF NOT EXISTS wva_database.leaders (
  id SERIAL,
  full_name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  actived BOOLEAN DEFAULT TRUE,

  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS wva_database.sectors (
    id SERIAL,
    full_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS wva_database.collaborators (
    id SERIAL,
    id_leader VARCHAR(150) NOT NULL,
    id_sector VARCHAR(150) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_leader) REFERENCES wva_database.leaders(id),
    FOREIGN KEY (id_sector) REFERENCES wva_database.sectors(id)
);

CREATE TABLE IF NOT EXISTS wva_database.productivity (
    id SERIAL,
    id_collaborator VARCHAR(150) NOT NULL,
    id_leader VARCHAR(150) NOT NULL,
    evaluation_note INTEGER NOT NULL,
    comment TEXT,
    goal VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_collaborator) REFERENCES wva_database.collaborators(id),
    FOREIGN KEY (id_leader) REFERENCES wva_database.leaders(id)
);

CREATE TABLE IF NOT EXISTS wva_database.engagement (
    id SERIAL,
    id_collaborator VARCHAR(150) NOT NULL,
    id_leader VARCHAR(150) NOT NULL,
    goal INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_collaborator) REFERENCES wva_database.collaborators(id),
    FOREIGN KEY (id_leader) REFERENCES wva_database.leaders(id)
);
