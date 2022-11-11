-- Criação de banco de dados para cenario e-commerce

create database ecommerce;
use ecommerce;
-- Criação de banco de dados para cenario e-commerce

-- criat tabela Cliente
create table client(
		idClient int auto_increment primary key,
        Pname varchar(10),
        Minit char(13),
        Lname varchar(20),
        CPF char(11) not null,
        constraint unique_cpf_client unique(CPF)
);
-- criat tabela Produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        classification_kids bool default false,
        category enum("Eletronicos","Vestuario","Brinqudos","Alimentos","Móveis") not null,
        Adress varchar(200),
        avaliação float default 0,
        size varchar(10),
        constraint unique_cpf_client unique(CPF)
);

-- criat tabela Pedido
create table orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum("Cancelado","Confirmado","Em Processamento") default "Em Processamento",
        Minit char(13),
        sendValue float default 10,        
        constraint fk_orders_client foreign key(orderClient) references clients(idClient)
);
-- criat tabela pagamentos
create table payments(
		idClient int,
        idPayments int,
        TypePayments enum("Boleto","Cartão","Dois Cartões"),
        limitAvailable float,
        primary key (idClient, id_payment)
);
-- criat tabela Estoque
create table productStorage(
		idProductStorage int auto_increment primary key,
        category enum("Eletronicos","Vestuario","Brinqudos","Alimentos","Móveis") not null,
        StorageLocation varchar(255),
        quantity int default 0
);
-- criat tabela Fornecedor
create table supplier(
		idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique(CNPJ)

);


-- criat tabela Terceiro vendedor
create table seller(
		idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        CPF char(11),
        CNPJ char(15) ,
        contact char(11) not null,
        constraint unique_cpf_seller unique(CNPJ),
        constraint unique_cnpj_seller unique(CNPJ)
);

-- criat tabela produto vendido
create table productseller(
		idPseller int,
        idProduct int,
        prodQuantity int default 1,
        primary key(idPseller, idProduct),
        constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
        constraint fk_product_product foreign key(idProduct) references product(idproduct)        
);

create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum("Disponível","Sem Estoque") default "Disponível",
        primary key(idPOproduct, idPOorder),
        constraint fk_product_seller foreign key(idPOproduct) references product(idPproduct),
        constraint fk_product_product foreign key(idPOorder) references orders (idorder)    
);

create table storageLocation(
		idLproduct int,
        idLorder int,
        location varchar(255) not null,
        primary key(idLproduct, idLorder),
        constraint fk_storage_location_product foreign key(idLproduct) references product(idproduct),
        constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)    
);

create table productSupplier(
		idPsSupplier int,
		idPsProduct int,
        quantity int not null,
        primary key(idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key(idPsSupplier) references Supplier(idSupplier),
        constraint fk_product_supplier_product foreign key(idPsproduct) references product(idProduct)    
);

