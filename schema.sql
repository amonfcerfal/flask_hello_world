DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS livres;
DROP TABLE IF EXISTS emprunts;
DROP TABLE IF EXISTS utilisateurs;

CREATE TABLE utilisateurs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'utilisateur'
);

CREATE TABLE livres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    auteur TEXT NOT NULL,
    annee INTEGER,
    disponible BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE emprunts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    utilisateur_id INTEGER NOT NULL,
    livre_id INTEGER NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    FOREIGN KEY(utilisateur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY(livre_id) REFERENCES livres(id)
);

ALTER TABLE utilisateurs ADD COLUMN role TEXT DEFAULT 'utilisateur';
