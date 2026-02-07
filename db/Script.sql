--tabelas e sequencias
CREATE TABLE
    clientes (
        id INT NOT NULL PRIMARY KEY,
        nome VARCHAR(50),
        cpf VARCHAR(20),
        contato VARCHAR(20)
    ) CREATE SEQUENCE clientes_id_seq
ALTER TABLE clientes
ALTER column id
SET default nextval ('clientes_id_seq');

CREATE TABLE
    veiculos (
        id INT NOT NULL PRIMARY KEY,
        cliente_id INT REFERENCES clientes (id),
        modelo VARCHAR(20),
        placa VARCHAR(10),
        ano INT
    ) CREATE SEQUENCE veiculos_id_seq
ALTER TABLE veiculos
ALTER column id
SET default nextval ('veiculos_id_seq');

CREATE TABLE
    mecanicos (
        id INT NOT NULL PRIMARY KEY,
        nome VARCHAR(50),
        especialidade VARCHAR(50)
    ) CREATE SEQUENCE mecanicos_id_seq
ALTER TABLE mecanicos
ALTER column id
SET default nextval ('mecanicos_id_seq');

CREATE TABLE
    servicos (
        id INT NOT NULL PRIMARY KEY,
        descricao VARCHAR(100),
        preco REAL
    ) CREATE SEQUENCE servicos_id_seq
ALTER TABLE servicos
ALTER column id
SET default nextval ('servicos_id_seq');

CREATE TABLE
    ordens_servico (
        id INT NOT NULL PRIMARY KEY,
        data timestamp,
        veiculo_id INT REFERENCES veiculos (id),
        mecanico_id INT REFERENCES mecanicos (id)
    ) CREATE SEQUENCE ordens_servico_id_seq
ALTER TABLE ordens_servico
ALTER column id
SET default nextval ('ordens_servico_id_seq');

CREATE TABLE
    itens_os (
        id INT NOT NULL PRIMARY KEY,
        ordens_servicos_id INT REFERENCES ordens_servico (id),
        servicos_id INT REFERENCES servicos,
        preco_praticado REAL
    ) CREATE SEQUENCE itens_os_id_seq
ALTER TABLE itens_os
ALTER column id
SET default nextval ('itens_os_id_seq');