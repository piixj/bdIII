CREATE TABLE tbautor (
    idautor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
 
CREATE TABLE tblivros (
    idlivro INT PRIMARY KEY AUTO_INCREMENT,
    título VARCHAR(100),
    idtbautor INT,
    FOREIGN KEY (idtbautor) REFERENCES tbautor (idautor)
);
 
INSERT INTO tbautor (nome) VALUES ('Machado de Assis');

INSERT INTO tblivros (título, idtbautor) VALUES ('Ressurreição', 1);

CREATE TABLE tbalunos (
    idaluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE tbcursos (
    idcurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);  

CREATE TABLE tbmatricula (
    idaluno INT,
    idcurso INT,
    PRIMARY KEY (idaluno, idcurso),
    FOREIGN KEY (idaluno) REFERENCES tbalunos(idaluno),
    FOREIGN KEY (idcurso) REFERENCES tbcursos(idcurso)
);

INSERT INTO tbalunos (nome) VALUES ('João Silva');

INSERT INTO tbcursos (nome) VALUES ('Matemática');

INSERT INTO tbmatricula (idaluno, idcurso) VALUES (
    (SELECT idaluno FROM tbalunos WHERE nome = 'João Silva'),
    (SELECT idcurso FROM tbcursos WHERE nome = 'Matematica')
);