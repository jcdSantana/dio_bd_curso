DROP SCHEMA IF EXISTS faculdade;
CREATE SCHEMA faculdade;

USE faculdade;

-- Tabela Dimensão: Professor
CREATE TABLE IF NOT EXISTS Professor (
    idProfessor INT AUTO_INCREMENT,
    nomeProfessor VARCHAR(50) NOT NULL,
    especialidade VARCHAR(30),
    dataCertificacao DATE,
    titulacao VARCHAR(30),
    CONSTRAINT pk_professor PRIMARY KEY (idProfessor)
);

-- Tabela Dimensão: Departamento
CREATE TABLE IF NOT EXISTS Departamento (
    idDepartamento INT AUTO_INCREMENT,
    nomeDepartamento VARCHAR(30),
    campus ENUM('campus1', 'campus2', 'campus3') DEFAULT 'campus1',
    CONSTRAINT pk_departamento PRIMARY KEY (idDepartamento)
);

-- Tabela Dimensão: Curso
CREATE TABLE IF NOT EXISTS Curso (
    idCurso INT AUTO_INCREMENT,
    nomeCurso VARCHAR(30) NOT NULL,
    dataOferta DATE,
    CONSTRAINT pk_curso PRIMARY KEY (idCurso)
);

-- Tabela Dimensão: Disciplina
CREATE TABLE IF NOT EXISTS Disciplina (
    idDisciplina INT AUTO_INCREMENT,
    nomeDisciplina VARCHAR(30) NOT NULL,
    preRequisitos VARCHAR(120),
    dataOferta DATE,
    CONSTRAINT pk_disciplina PRIMARY KEY (idDisciplina)
);

-- Tabela Fato
CREATE TABLE IF NOT EXISTS Fato (
    idFato INT AUTO_INCREMENT,
    idProfessor INT NOT NULL,
    idDepartamento INT NOT NULL,
    idCurso INT NOT NULL,
    idDisciplina INT NOT NULL,
    numAlunos INT NOT NULL,
    cargaHoraria INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE,
    CONSTRAINT pk_fato PRIMARY KEY (idFato),
    CONSTRAINT fk_fato_professor FOREIGN KEY (idProfessor) REFERENCES Professor (idProfessor),
    CONSTRAINT fk_fato_departamento FOREIGN KEY (idDepartamento) REFERENCES Departamento (idDepartamento),
    CONSTRAINT fk_fato_curso FOREIGN KEY (idCurso) REFERENCES Curso (idCurso),
    CONSTRAINT fk_fato_disciplina FOREIGN KEY (idDisciplina) REFERENCES Disciplina (idDisciplina)
);