DROP DATABASE IF EXISTS hospital;
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

DROP TABLE IF EXISTS especialidade;
CREATE TABLE IF NOT EXISTS especialidade(
id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
nome_especialidade VARCHAR(512)
);

DROP TABLE IF EXISTS medico;
CREATE TABLE IF NOT EXISTS medico(
id_medico INT AUTO_INCREMENT PRIMARY KEY,
nome_medico VARCHAR (512) NOT NULL,
cpf_medico bigint UNIQUE NOT NULL,
email_medico VARCHAR(512),
crm VARCHAR(13) UNIQUE NOT NULL,
cargo VARCHAR(512) NOT NULL,
id_especialidade INT,
FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLES IF EXISTS convenio;
CREATE TABLE IF NOT EXISTS convenio(
id_convenio INT AUTO_INCREMENT PRIMARY KEY,
nome_convenio VARCHAR(512),
cnpj_convenio VARCHAR(14) NOT NULL,
tempo_carencia VARCHAR(100)
);


DROP TABLE IF EXISTS paciente;
CREATE TABLE IF NOT EXISTS paciente(
id_paciente INT AUTO_INCREMENT PRIMARY KEY,
nome_paciente VARCHAR(512),
cpf_paciente bigint UNIQUE NOT NULL,
rg_paciente VARCHAR(9) NOT NULL,
data_nascimento_paciente DATE NOT NULL,
email_paciente VARCHAR(512),
id_convenio INT DEFAULT NULL,
FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS enfermeiro;
CREATE TABLE IF NOT EXISTS enfermeiro(
id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
nome_enfermeiro VARCHAR(512) NOT NULL,
cpf_enfermeiro INT(11) UNIQUE UNIQUE NOT NULL,
cre VARCHAR(13) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS consulta;
CREATE TABLE IF NOT EXISTS consulta(
id_consulta INT AUTO_INCREMENT PRIMARY KEY,
data_consulta DATE NOT NULL,
hora_consulta TIME NOT NULL,
valor_consulta DECIMAL,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
id_convenio INT DEFAULT NULL,
id_especialidade INT,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_medico) REFERENCES medico (id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_convenio) REFERENCES convenio (id_convenio) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS receita;
CREATE TABLE IF NOT EXISTS receita(
id_receita INT AUTO_INCREMENT PRIMARY KEY,
medicamento VARCHAR(512) NOT NULL,
quantidade_med INT(11) NOT NULL,
instrucao_uso VARCHAR(512) NOT NULL,
id_consulta INT NOT NULL,
FOREIGN KEY (id_consulta) REFERENCES consulta (id_consulta) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS telefone;
CREATE TABLE IF NOT EXISTS telefone(
id_telefone INT AUTO_INCREMENT PRIMARY KEY,
ddd INT(11) NOT NULL,
numero INT(11) NOT NULL,
id_medico INT DEFAULT NULL,
id_paciente INT DEFAULT NULL,
FOREIGN KEY ( id_medico) REFERENCES medico (id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ( id_paciente) REFERENCES paciente (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS endereco;
CREATE TABLE IF NOT EXISTS endereco(
id_endereco INT AUTO_INCREMENT PRIMARY KEY,
rua VARCHAR(512) NOT NULL,
bairro VARCHAR(512) NOT NULL,
cep INT(11) NOT NULL,
cidade VARCHAR(512) NOT NULL,
estado VARCHAR(512) NOT NULL,
id_medico INT DEFAULT NULL,
id_paciente INT DEFAULT NULL,
FOREIGN KEY (id_medico) REFERENCES medico (id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS tipo_quarto;
CREATE TABLE IF NOT EXISTS tipo_quarto(
id_tipo_quarto INT AUTO_INCREMENT PRIMARY KEY,
valor_diario DECIMAL NOT NULL,
descricao VARCHAR(512)
);


DROP TABLE IF EXISTS quarto;
CREATE TABLE IF NOT EXISTS quarto(
id_quarto INT AUTO_INCREMENT PRIMARY KEY,
numero INT(11) NOT NULL,
id_tipo_quarto INT(11) NOT NULL,
FOREIGN KEY (id_tipo_quarto) REFERENCES tipo_quarto (id_tipo_quarto) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS internacao;
CREATE TABLE IF NOT EXISTS internacao(
id_internacao INT AUTO_INCREMENT PRIMARY KEY,
data_entrada DATE NOT NULL,
data_efet_alta DATE NOT NULL,
data_prev_alta DATE NOT NULL,
desc_procedimentos VARCHAR(512) NOT NULL,
id_medico INT NOT NULL,
id_paciente INT NOT NULL,
id_quarto INT NOT NULL,
FOREIGN KEY (id_medico) REFERENCES medico (id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_quarto) REFERENCES quarto (id_quarto) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (1, 'Pediatria');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (2, 'Clínica Geral');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (3, 'Gastrentologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (4, 'Dermatologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (5, 'Cardiologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (6, 'Ortopedia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (7, 'Neurologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (8, 'Oftalmologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (9, 'Otorrinolaringologia');
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (10, 'Endocrinologia');

INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (1, 'Ana silva', '12345678901', 'ana.silva@gmail.com', '12345-SP', 'Residente', 1);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (2, 'Roberto Mendes', '13456789012', 'roberto.mendes@hotmail.com', '23456-RJ', 'Especialista', 2);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (3, 'Carla Santos', '14567890123', 'carla.santos@yahoo.com', '34567-BH', 'Interno', 3);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (4, 'Miguel Pereira', '15678901234', 'miguel.pereira@outlook.com', '45678-SP', 'Residente', 4);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (5, 'Isabel Oliveria', '16789012345', 'isabel.oliveira@gmail.com', '56789-RS', 'Especialista', 5);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (6, 'André Almeida', '17890123456', 'andre.almeida@gmail.com', '67890-SP', 'Interno', 6);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (7, 'Marta Costa', '18901234567', 'marta.costa@gmail.com', '78901-RJ', 'Residente', 7);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (8, 'Tiago Martins', '19012345678', 'tiago.martins@yahoo.com', '89012-MG', 'Especialista', 8);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (9, 'Joanna Ferreira', '10123456789', 'joanna.ferreira@hotmail.com', '90123-SC', 'Interno', 9);
INSERT INTO medico(id_medico, nome_medico, cpf_medico, email_medico, crm, cargo, id_especialidade)
VALUES (10, 'Sofia Ramos', 11234567890, 'sofia.ramos@outlook.com', '01234-DF', 'Residente', 10);

INSERT INTO convenio (id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) 
VALUES (1, 'SaúdeTotal', '12345678000101', '60 dias');
INSERT INTO convenio (id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) 
VALUES (2, 'VidaPlena', '23456789000102', '90 dias');
INSERT INTO convenio (id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) 
VALUES (3, 'BemEstar', '34567890000103', '30 dias');
INSERT INTO convenio (id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) 
VALUES (4, 'QualiVida', '45678901000104', '120 dias');

INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (1, 'Ana Souza', '12345678901', '987654321', '1985-03-15', 'ana.souza@gmail.com', 1);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (2, 'Carlos Pereira', '23456789012', '876543212', '1990-08-22', 'carlos.pereira@gmail.com', 2);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (3, 'Mariana Santos', '34567890123', '765432103', '1982-11-05', 'mariana.santos@gmail.com', 3);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (4, 'João Silva', '45678901234', '654321094', '1995-07-10', 'joao.silva@gmail.com', 4);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (5, 'Patrícia Oliveira', '56789012345', '543210985', '1978-04-03', 'patricia.oliveira@gmail.com', null);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (6, 'André Costa', '67890123456', '432109876', '1989-09-18', 'andre.costa@gmail.com', 1);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (7, 'Camila Rodrigues', '78901234567', '321098767', '1980-01-25', 'camila.rodrigues@gmail.com', 2);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (8, 'Ricardo Mendonça', '89012345678', '210987658', '1992-06-12', 'ricardo.mendonca@gmail.com', 3);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (9, 'Gabriela Almeida', '90123456789', '109876540', '1987-12-07', 'gabriela.almeida@gmail.com', 4);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (10, 'Rafaela Martins', '01234567890', '098765431', '1993-05-30', 'rafaela.martins@gmail.com', null);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (11, 'Pedro Cardoso', '12345678902', '987654321', '1985-03-15', 'pedro.cardoso@gmail.com', 1);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (12, 'Fernanda Lima', '23456789912', '876543212', '1990-08-22', 'fernanda.lima@gmail.com', 2);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (13, 'Tiago Pereira', '34567870123', '765432103', '1982-11-05', 'tiago.pereira@gmail.com', 3);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (14, 'Beatriz Gonçalves', '45678951234', '654321094', '1995-07-10', 'beatriz.goncalves@gmail.com', 4);
INSERT INTO paciente (id_paciente, nome_paciente, cpf_paciente, rg_paciente, data_nascimento_paciente, email_paciente, id_convenio)
VALUES (15, 'Daniel Fonseca', '56789412345', '543210985', '1978-04-03', 'daniel.fonseca@gmail.com', null);

INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (1, '2017-03-15', '09:30:00', '150.00', 1, 1, 1, 1);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (2, '2018-08-22', '11:00:00', '200.00', 2, 2, 2, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (3, '2019-11-05', '14:45:00', '180.00', 3, 3, 3, 3);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (4, '2016-07-10', '10:15:00', '160.00', 4, 4, 4, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (5, '2020-04-03', '13:30:00', '250.00', 5, 5, null, 5);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (6, '2017-09-18', '16:00:00', '180.00', 6, 6, 1, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (7, '2018-01-25', '09:45:00', '200.00', 7, 7, 2, 7);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (8, '2016-06-12', '14:00:00', '170.00', 8, 8, 3, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (9, '2019-12-07', '11:30:00', '190.00', 9, 9, 4, 9);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (10, '2021-05-30', '15:15:00', '220.00', 10, 10, null, 10);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (11, '2017-03-15', '09:00:00', '150.00', 11, 1, 1, 1);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (12, '2018-08-22', '10:45:00', '200.00', 12, 2, 2, 2);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (13, '2019-11-05', '14:00:00', '180.00', 13, 3, 3, 3);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (14, '2016-07-10', '11:30:00', '160.00', 14, 4, 4, 4);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (15, '2020-04-03', '13:45:00', '250.00', 15, 5, null, 5);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (16, '2017-09-18', '16:30:00', '180.00', 1, 6, 1, 6);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (17, '2018-01-25', '10:00:00', '200.00', 2, 7, 2, 7);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (18, '2016-06-12', '14:30:00', '170.00', 3, 8, 3, 8);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (19, '2019-12-07', '11:45:00', '190.00', 4, 9, 4, 9);
INSERT INTO consulta (id_consulta, data_consulta, hora_consulta, valor_consulta, id_paciente, id_medico, id_convenio, id_especialidade)
VALUES (20, '2021-05-30', '15:45:00', '220.00', 5, 10, null, 10);

INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(1, 11, 40028922, 1, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(2, 11, 40089655, 2, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(3, 11, 75589644, 3, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(4, 11, 41587622, 4, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(5, 11, 46685711, 5, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(6, 11, 40028922, 6, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(7, 11, 74851987, 7, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(8, 11, 58749684, 8, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(9, 11, 41879655, 9, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(10, 11, 14487522, 10, null);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(11, 11, 985632001, null, 1);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(12, 11, 998654789, null, 2);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(13, 11, 987569856, null, 3);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(14, 11, 987654021, null, 4);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(15, 11, 958620347, null, 5);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(16, 11, 985314758, null, 6);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(17, 11, 987654259, null, 7);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(18, 11, 974851471, null, 8);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(19, 11, 914032569, null, 9);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(20, 11, 963266587, null, 10);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(21, 11, 941178546, null, 11);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(22, 11, 985864127, null, 12);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(23, 11, 963568891, null, 13);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(24, 11, 987475812, null, 14);
INSERT INTO telefone(id_telefone, ddd, numero, id_medico, id_paciente)
VALUES(25, 11, 987745876, null, 15);

INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(1, 'Rua Cardeal Arcoverde', 05407-003, 'Pinheiros', 'São Paulo', 'São Paulo', 1, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(2, 'R. Jesuíno Arruda', 04532-082, 'Itaim Bibi', 'São Paulo', 'São Paulo', 2, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(3, 'Rua Romano Schiesari', 05018-020, 'Sumaré', 'São Paulo', 'São Paulo', 3, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(4, 'R. da Consolação',  3325-3181 , 'Cerqueira César', 'São Paulo', 'São Paulo', 4, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(5, 'R. São Joaquim', 01508-001, 'Liberdade', 'São Paulo', 'São Paulo', 5, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(6, 'R. Batataes', 01423-010, 'Jardim Paulista', 'São Paulo', 'São Paulo', 6, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(7, 'R. Abílio Soares', 04005-001, 'Paraíso', 'São Paulo', 'São Paulo', 7, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(8, 'R. Alvarenga', 05509-001, 'Butatã', 'São Paulo', 'São Paulo', 8, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(9, 'R. Gago Coutinho', 02577-020, 'Vila Yara', 'Osasco', 'São Paulo', 9, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(10, 'R. Froben', 05315-010, 'Vila Leopoldina', 'São Paulo', 'São Paulo', 10, null);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(11, 'R. Mipibu', 05049-030, 'Vila Romana', 'São Paulo', 'São Paulo', null, 1);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(12, 'R. Conselheiro Ramalho', 01325-001, 'Bela Vista', 'São Paulo', 'São Paulo', null, 2);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(13, 'Av. Tiradentes', 16400-050, 'Jardim Santa Edwirges', 'Guarulhos', 'São Paulo', null, 3);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(14, 'R. Damianopolis', 07070-111, 'Vila Galvão', 'Guarulhos', 'São Paulo', null, 4);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(15, 'R. Ismael Neri', 02335-001, 'Água Fria', 'São Paulo', 'São Paulo', null, 5);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(16, 'Av. Joaquina Ramalho', 02065-010, 'Vila Guilherme', 'São Paulo', 'São Paulo', null, 6);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(17, 'R. Dias da Silva', 02114-001, 'Vila Maria', 'São Paulo', 'São Paulo', null, 7);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(18, 'Av. Pedroso da Silveira', 03028-050, 'Pari', 'São Paulo', 'São Paulo', null, 8);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(19, 'R. Maria Joaquina', 03016-010, 'Brás', 'São Paulo', 'São Paulo', null, 9);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(20, 'R. da Graça', 0659-511, 'Bom Retiro', 'São Paulo', 'São Paulo', null, 10);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(21, 'R. Brg. Galvão', 01154-000, 'Barra Funda', 'São Paulo', 'São Paulo', null, 11);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(22, 'R. Dom Bento pickel', 02555-000, 'Casa Verde Alta', 'São Paulo', 'São Paulo', null, 12);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(23, 'Av. Lasar Segall', 02543-010, 'Vila Celeste', 'São Paulo', 'São Paulo', null, 13);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(24, 'Av. Imirim', 02464-600, 'Imirim', 'São Paulo', 'São Paulo', null, 14);
INSERT INTO endereco(id_endereco, rua, cep, bairro, cidade, estado, id_medico, id_paciente)
VALUES(25, 'R. Maria do Carmo', 03206-010, 'Vila Alpina', 'São Paulo', 'São Paulo', null, 15);

INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(1, 'Isabella Oliveira', 74851574, '415879');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(2, 'Lucas Pereira', 58749617, '254109');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(3, 'Rafael Santos', 78032145, '012478');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(4, 'Marina Costa', 10479547, '960124');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(5, 'Bruno Silva', 87459612, '784169');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(6, 'Gabriel Alves', 20147896, '894175');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(7, 'Camila Rodrigues', 12047953, '784196');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(8, 'Matheus Oliveira', 2143608, '254987');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(9, 'Felipe Martins', 74198569, '120478');
INSERT INTO enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre)
VALUES(10, 'Larissa Lima', 88742514, '251369');

INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(2, 'Roacutan, Pycnogenol', 2, 'Tomar um comprimido de roacutan uma vez ao dia. Tomar um comprimido de Pycnogenol uma vez ao dia', 1);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(11, 'Omeprazol e Ibuprofeno', 2, 'Tomar 1 vez ao dia de manhã, durante 4 semanas. Tomar 1 comprimido de ibuprofene a cada 4 horas.', 2);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(1, 'Dipirona 1g', 1, 'Tomar um comprimido a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 3);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(3, 'Omeprazol, Dipirona', 2, 'Tomar 1 comprimido de omeprazol uma vez ao dia de manhã, durante 4 semanas. Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 4);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(4, 'Dipirona, Ibuprofeno, Seki Xarope ', 3, 'Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia, Tomar 1 comprimido de ibuprofene a cada 4 horas. Tomar o xarope se houver tosse', 5);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(5, 'Diurético, Metoprolol', 2, 'Tomar 2 comprimidos de Diurético de 50 mg + 50 mg por dia. Tomar o Metoprolol uma vez ao dia', 6);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(6, 'Omeprazol e Ibuprofeno', 2, 'Tomar 1 vez ao dia de manhã, durante 4 semanas. Tomar 1 comprimido de ibuprofene a cada 4 horas.', 7);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(7, 'Roacutan, Pycnogenol', 2, 'Tomar um comprimido de roacutan uma vez ao dia. Tomar um comprimido de Pycnogenol uma vez ao dia', 8);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(8, 'Omeprazol, Dipirona', 2, 'Tomar 1 comprimido de omeprazol uma vez ao dia de manhã, durante 4 semanas. Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 9);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(9, 'Dipirona, Ibuprofeno', 2, 'Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia, Tomar 1 comprimido de ibuprofene a cada 4 horas. Tomar o xarope se houver tosse', 10);
INSERT INTO receita(id_receita, medicamento, quantidade_med,instrucao_uso, id_consulta)
VALUES(10, 'Diurético, Metoprolol', 2, 'Tomar 2 comprimidos de Diurético de 50 mg + 50 mg por dia. Tomar o Metoprolol uma vez ao dia', 11);

INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(1, '1000.00', 'Apartamento');
INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(2, '700.00', 'Quartos duplos');
INSERT INTO tipo_quarto(id_tipo_quarto, valor_diario, descricao)
VALUES(3, '500.00', 'Enfermaria');

INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(1, 01, 1);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(2, 02, 2);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(3, 03, 3);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(4, 04, 3);
INSERT INTO quarto(id_quarto, numero, id_tipo_quarto)
VALUES(5, 05, 1);

INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (1, '2015-01-01', '2015-01-15', '2015-01-15', 'Lorem Ipsum', 8, 5, 2);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (2, '2020-05-21', '2020-05-29', '2020-05-25', 'Lorem Ipsum', 1, 10, 5);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (3, '2016-08-18', '2016-08-30', '2016-08-26', 'Lorem Ipsum', 8, 5, 2);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (4, '2018-07-02', '2018-07-10', '2018-07-15', 'Lorem Ipsum', 15, 3, 1);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (5, '2022-01-01', '2022-01-05', '2022-01-04', 'Lorem Ipsum', 1, 6, 3);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (6, '2019-02-22', '2019-02-27', '2019-02-27', 'Lorem Ipsum', 7, 9, 4);
INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, id_paciente, id_medico, id_quarto)
VALUES (7, '2020-03-14', '2020-03-20', '2020-03-19', 'Lorem Ipsum', 13, 8,5);

ALTER TABLE medico ADD em_atividade VARCHAR(100);

UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 1;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 2;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 3;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 4;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 5;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 6;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 7;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 8;
UPDATE medico SET em_atividade = 'Inativo' WHERE id_medico = 9;
UPDATE medico SET em_atividade = 'Ativo' WHERE id_medico = 10;

SELECT *
FROM Consulta
WHERE YEAR(Data_consulta) = 2020 OR id_Convenio IS NOT NULL;

SELECT AVG(Valor_consulta) AS ValorMedioConsultas
FROM Consulta
WHERE YEAR(Data_consulta) = 2020 OR id_Convenio IS NOT NULL;

SELECT *
FROM Internacao
WHERE Data_efet_alta > Data_prev_alta;

SELECT *
FROM receita
WHERE id_consulta = (SELECT MIN(id_consulta) FROM Consulta);

SELECT *
FROM consulta
WHERE id_convenio IS NULL
ORDER BY valor_consulta DESC
LIMIT 1;

SELECT *
FROM consulta
WHERE id_convenio IS NULL
ORDER BY valor_consulta ASC
LIMIT 1;

select *, DATEDIFF(data_efet_alta, data_entrada) dias_internado, tipo_quarto.valor_diario, DATEDIFF(data_efet_alta, data_entrada) * tipo_quarto.valor_diario valor_total from internacao inner join quarto 
on internacao.id_quarto = quarto.id_quarto inner join tipo_quarto 
on quarto.id_tipo_quarto = tipo_quarto.id_tipo_quarto;

SELECT I.data_entrada, I.desc_procedimentos, I.id_quarto
FROM internacao I
JOIN Quarto Q ON I.id_quarto = Q.id_quarto
WHERE id_tipo_quarto = 'apartamento';

select p.nome_paciente, c.data_consulta, e.nome_especialidade from consulta c inner join paciente p 
on p.id_paciente = c.id_paciente inner join especialidade e 
on e.id_especialidade = c.id_especialidade 
where c.id_especialidade <> 1 and year(c.data_consulta) - year(p.data_nascimento_paciente) < 19 and year(c.data_consulta) - year(p.data_nascimento_paciente) > 0 
order by c.data_consulta;

SELECT P.nome_paciente, M.nome_medico, I.data_entrada, I.desc_procedimentos
FROM internacao I
JOIN medico M ON I.id_medico = M.id_medico
JOIN paciente P ON I.id_paciente = P.id_paciente
WHERE M.id_especialidade = 'gastroenterologia'; -- AND I.id_tipo_quarto = 'enfermaria' essa parte não funciona 

SELECT M.nome_medico, M.crm, COUNT(C.id_consulta) AS QuantidadeConsultas
FROM medico M
LEFT JOIN consulta C ON M.id_medico = C.id_medico
GROUP BY M.nome_medico, M.crm;

SELECT *
FROM medico
WHERE nome_medico LIKE '%Gabriel%';

SELECT E.nome_enfermeiro, E.cre, COUNT(I.id_internacao) AS NumeroInternacoes
FROM enfermeiro E
JOIN ParticipacaoEnfermeiro P ON E.id_enfermeiro = P.id_nfermeiro
JOIN internacao I ON P.id_internacao = I.id_internacao
GROUP BY E.nome_enfermeiro, E.cre
HAVING COUNT(I.id_internacao) > 1;











