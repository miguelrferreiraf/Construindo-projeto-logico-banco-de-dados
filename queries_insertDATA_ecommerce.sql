-- inserção de dados e queries
use ecommerce;

show tables;
-- id cliente, Fname, Minit, Lname, Adress
insert into clients (Fname, Minit, lastname, CPF, Adress)
	values('Maria', 'M', 'Silva', '123456789', 'rua Silva de prata 29, Carangola - C. Flores'),
    ('Julia', 'J', 'Bergamota', '123476889', 'rua Florencia 87, Santa Fé - Cidade das Flores'),
    ('Matheus', 'M', 'Dizar', '121346789', 'rua Carneiro Azul 124, Orlando F. - Cidade das Flores'),
    ('Igor', 'I', 'Cachorro', '129636789', 'rua Hellsing 150, Praça XV - Cidade das Flores'),
    ('Luis', 'L', 'Felipe', '124156789', 'rua Jericó 12, Praã - Cidade das Flores'),
    ('Gustavo', 'G', 'Mu', '123412589', 'rua Aliche 865, Amarena - Cidade das Flores');

select * from clients;
-- idProduct Pname classification_kids category 'Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis' avaliação size

insert into product (Pname, classification_kids, category, avaliação, size)
	values('N. Switch', true, 'Eletrônico', 9, null),
    ('Paçoca', false, 'Alimentos', 10, null),
    ('Calopsita', false, 'Eletrônico', 8, null),
    ('Papel H.', false, 'Móveis', 6, null);

select * from clients;
select * from product;
-- idOrders, idOrdersClient ordersStatus ordersDescription sendValue idPaymentCash
-- delete from orders where idOrdersClient in (1,2,3,4);
insert into orders(idOrdersClient, ordersStatus, ordersDescription, sendValue, idPaymentCash)
	values (1, default, 'compra via aplicativo', null, 1),
    (2, default, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, default, 'compra via web site', 150, 0);
select * from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	values(5,1,2,null),
    (6,2,1,null),
    (7,3,1,null);

-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
	('Rio de Janeiro',1000),
    ('São Paulo',1),
    ('São Carlos',100),
    ('Rio Claro',890),
    ('Bangu',16),
    ('Americana',69);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
	(6,2,'RJ'),
    (8,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
	('Almeida e Filhos', 123456789123456, 1899999999),
    ('Ele Tro', 894621894621865, 1299999999),
    ('Arcos Azuis', 131562161133552, 1112349999);

select * from supplier;

-- idPsSupplier, idPsProduct, quantity

insert into product_Supplier (idPsSupplier, idPsProduct, quantity) values
	(10,6,500),
    (11,7,400),
    (12,8,400),
    (10,5,400),
    (12,7,400);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName,  CPNJ, CPF, location, contact) values
	('Tech Eletronics', null, 785631589632458, null, 'Rio de Janeiro', 42982569748),
    ('Botique Durgas', null, 785631574562458, null, 'São Paulo', 42983469748),
    ('Tech Eletronics', null, 785124589632458, null, 'Rio Claro', 42982565748);

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
	(1,6,80),
    (2,7,10);

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrdersClient;

select concat(Fname, ' ', lastname) as Client, idOrders as Request, ordersStatus as Status from clients c, orders o where c.idClient = idOrdersClient;


insert into orders(idOrdersClient, ordersStatus, ordersDescription, sendValue, idPaymentCash)
	values (2, default, 'compra via aplicativo', null, 1);
    

select count(*) from clients c, orders o where c.idClient = idOrdersClient;
select * from clients c, orders o 
	where c.idClient = idOrdersClient;
    
    
select * from clients left outer join orders ON idClient = idOrdersClient;

select * from orders;

select * from clients c inner join orders o ON c.idClient = o.idOrdersClient
	inner join productOrder p on p.idPOorder = o.idOrders;

select * from clients c inner join orders o ON c.idClient = o.idOrdersClient
	inner join productOrder p on p.idPOorder = o.idOrders
    group by IdClient;
    
    
select c.idClient, Fname,count(*) as Number_or_Orders from clients c inner join orders o ON c.idClient = o.idOrdersClient
	inner join productOrder p on p.idPOorder = o.idOrders
    group by IdClient;