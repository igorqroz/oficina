--tabelas e sequencias
create table
    clientes (
        id int not null primary key,
        nome varchar(50),
        cpf varchar(20),
        contato varchar(20)
    ) create sequence clientes_id_seq
alter table clientes
alter column id
set default nextval ('clientes_id_seq');

create table
    veiculos (
        id int not null primary key,
        cliente_id int references clientes (id),
        modelo varchar(20),
        placa varchar(10),
        ano int
    ) create sequence veiculos_id_seq
alter table veiculos
alter column id
set default nextval ('veiculos_id_seq');

create table
    mecanicos (
        id int not null primary key,
        nome varchar(50),
        especialidade varchar(50)
    ) create sequence mecanicos_id_seq
alter table mecanicos
alter column id
set default nextval ('mecanicos_id_seq');

create table
    servicos (
        id int not null primary key,
        descricao varchar(100),
        preco real
    ) create sequence servicos_id_seq
alter table servicos
alter column id
set default nextval ('servicos_id_seq');

create table
    ordens_servico (
        id int not null primary key,
        data timestamp,
        veiculo_id int references veiculos (id),
        mecanico_id int references mecanicos (id)
    ) create sequence ordens_servico_id_seq
alter table ordens_servico
alter column id
set default nextval ('ordens_servico_id_seq');

create table
    itens_os (
        id int not null primary key,
        ordens_servicos_id int references ordens_servico (id),
        servicos_id int references servicos,
        preco_praticado real
    ) create sequence itens_os_id_seq
alter table itens_os
alter column id
set default nextval ('itens_os_id_seq');