CREATE DATABASE IF NOT EXISTS wva_database;

CREATE TABLE IF NOT EXISTS leaders (
  id SERIAL,
  user_id INT UNIQUE,
  full_name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actived BOOLEAN DEFAULT TRUE,

  PRIMARY KEY (id)
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS sectors (
    id SERIAL,
    full_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actived BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_manager BOOLEAN DEFAULT FALSE,
    leader_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id),
    FOREIGN KEY (leader_id) REFERENCES leaders(id)
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
