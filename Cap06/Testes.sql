CREATE DATABASE titanicDB;
USE titanicDB;

CREATE TABLE titanic (
	pclass char(3),
    survived char(1),
    name varchar(100),
    sex char(6),
    age char(11),
    sibsp varchar(16),
    parch varchar(16),
    ticket varchar(20),
    fare varchar(100),
    cabin varchar(16),
    embarked varchar(12),
    boat varchar(50),
    body varchar(32),
    home_dest varchar(200)
);

SELECT * FROM titanic;

SELECT name, age, sex, pclass FROM titanic WHERE age > 70;

SELECT pclass, survived, avg(age) as media FROM titanic group by pclass, survived;

CREATE DATABASE cadastroDB;
USE cadastroDB;

CREATE TABLE FUNCIONARIOS(
	ID INT NOT NULL,
    NOME VARCHAR(20) NOT NULL,
    IDADE INT NOT NULL,
    CIDADE CHAR(25),
    SALARIO DECIMAL(18, 2),
    PRIMARY KEY(ID)
);

DESC FUNCIONARIOS;

INSERT INTO FUNCIONARIOS (ID,NOME,IDADE,CIDADE,SALARIO)
VALUES(1, 'Pele',32, 'Roma', 2000.00);

INSERT INTO FUNCIONARIOS (ID,NOME,IDADE,CIDADE,SALARIO)
VALUES
	(2, 'Zico', 25, 'Paris', 1500.00),
    (3, 'Rivelino', 23, 'Santiago', 4000.00),
    (4, 'Garrincha', 25, 'Vienna', 6500.00),
    (5, 'Jair', 64, 'Vienna', 7800.00);
    
INSERT INTO FUNCIONARIOS (ID,NOME,IDADE,CIDADE,SALARIO)
VALUES(6, 'Careca',25, 'Milao', 8900.00);

SELECT * FROM FUNCIONARIOS;

SELECT nome, salario FROM funcionarios;

SELECT ID,NOME,SALARIO
FROM FUNCIONARIOS
WHERE SALARIO > 2000 AND IDADE < 55;

UPDATE FUNCIONARIOS
SET CIDADE = 'Boston'
WHERE ID = 6;

DELETE FROM FUNCIONARIOS
WHERE ID = 6;

SELECT DISTINCT CIDADE FROM FUNCIONARIOS;

SELECT count(*) FROM FUNCIONARIOS;

SELECT CIDADE, sum(SALARIO) as SUM_SALARIO FROM FUNCIONARIOS GROUP BY CIDADE HAVING SUM_SALARIO > 2000;

CREATE INDEX cidade_idx ON FUNCIONARIOS(CIDADE);
SHOW INDEX FROM FUNCIONARIOS;

SELECT CIDADE FROM FUNCIONARIOS;

CREATE TABLE funcionarios_bkp
AS SELECT * FROM FUNCIONARIOS;

DROP DATABASE employeemanager;