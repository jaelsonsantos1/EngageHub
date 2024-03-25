CREATE DATABASE IF NOT EXISTS wva_database;

CREATE TABLE IF NOT EXISTS leaders (
  id SERIAL,
  full_name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actived BOOLEAN DEFAULT TRUE,

  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS sectors (
    id SERIAL,
    full_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS collaborators (
    id SERIAL,
    id_leader SERIAL NOT NULL,
    id_sector SERIAL NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_leader) REFERENCES leaders(id),
    FOREIGN KEY (id_sector) REFERENCES sectors(id)
);

CREATE TABLE IF NOT EXISTS productivity (
    id SERIAL,
    id_colaborator SERIAL NOT NULL,
    id_leader SERIAL NOT NULL,
    evaluation_note INTEGER NOT NULL,
    comment TEXT,
    goal VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_colaborator) REFERENCES collaborators(id),
    FOREIGN KEY (id_leader) REFERENCES leaders(id)
);

CREATE TABLE IF NOT EXISTS engagement (
    id SERIAL,
    id_colaborator SERIAL NOT NULL,
    id_leader SERIAL NOT NULL,
    goal INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id),
    FOREIGN KEY (id_colaborator) REFERENCES collaborators(id),
    FOREIGN KEY (id_leader) REFERENCES leaders(id)
);
