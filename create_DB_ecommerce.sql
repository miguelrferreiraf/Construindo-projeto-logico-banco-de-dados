-- Criação do Banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    lastname varchar(20),
    CPF char(11) not null, 
    Adress varchar(100),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;
-- criar tabela produto

-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null, 
    avaliação float default 0,
    size varchar(10)
);
-- criar tabela pedido 

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexao com as tableas necessarias
-- alem disso, reflita essas modificacoes no diagrama de esquema relacional
-- constraints relacionados ao pagamento

create table payments(
	idclient int,
    id_payment int,
    typePayment enum('PIX','Boleto','Cartão','Dois Cartões'),
    limitAvailable float,
    primary key (idClient, id_payment)
);


-- criar tabela pedido

create table orders(
	idOrders int auto_increment primary key,
    idOrdersClient int, 
    ordersStatus enum('Cancelado','Confirmado','Em processamento') default 'Em Processamento',
    ordersDescription varchar(255),
    sendValue float default 10,
    idPaymentCash bool default false,
    constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient)
		on update cascade
        on delete set null
);
-- desc orders;

-- criar tabela estoque
create table productStorage(
	idProfStorage int auto_increment primary key,
	StorageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor

create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supplier unique (CNPJ)
);
-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CPNJ char(15),
    CPF char(9),
    location varchar(255),
    contact varchar(11) not null,
    constraint unique_cnpj_seller unique (CPNJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPSeller int,
    idPproduct int,
    ProdQuantity int default 1,
    primary key(idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(IdProduct)
);

CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem Estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct , idPOorder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product (idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders (idOrders)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProfStorage)
);

create table product_supplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = "ecommerce";
