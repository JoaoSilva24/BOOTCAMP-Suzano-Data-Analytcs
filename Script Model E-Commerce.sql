Database E-Commerce

create table clients(
		idClient int auto-increment primary key,
		Fname varchar(10),
        Minit varchar(10),
        Lastname varchar(10),
        cpf char(11) not null,
        Adress varchar(30),
        RegistrationDate varchar(8), 
        constraint unique_cpf_client unique (cpf)
);

create table documentation(
		idDocumentação INT auto-increment primary key,
        ID Card varchar(45) not null,
        CPF char(11) not null,
        E-mail varchar(20),
        constraint unique_cpf_client unique (cpf)
);

create table store(
		idStore int,
        corporate reason varchar(45),
        adress varchar(45)
);

create table productStorage(
		idProductStorage int auto-increment primary key,
        location varchar(45),
        quantity int default 0
);

create table supplier(
		idSupplier int auto-increment primary key,
        socialname varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        location char(45) not null,
        constraints unique_supplier unique (CNPJ)
);

create table seller(
		idSeller int auto-increment primary key,
        socialname varchar(255) not null,
        abstname varchar(255),
        CNPJ char(15) not null,
        CPF char(11) not null
        contact char(11) not null,
        adress char(45) not null,
        constraints unique_cpf_seller unique (CNPJ)
);

create table orders(
		idOrder int auto_increment primary key
        idOrder_Client int
        Orderstatus enum('cancelado', 'confirmado', 'em processamento') not null,
        OrderDescripition varcahr(255),
        Sendvalue float default 10,
        idPayment,
        constraints fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

create table product(
		idProduto int auto-increment primary key,
        Pname varchar(10) not null,
        Classification kids_bool,
        Category enum('Eletrônico', 'Brinquedo', 'Vestimenta', 'Móveis') not null,
        Pdescription float,
        Price varchar(10),
        Size varchar(10),
        constraints unique_cpf_client unique (cpf)
);

create table payment(
		idClient int,
        idPayment int,
        typePayment enum('Boleto', 'Cartão de crédito', 'À vista') not null,
		limitavailable float,
        primary key (idClient, idPayment)
);

create table credit card(
		idClient int,
        idPayment int,
        installmentsnumber varchar(10),
        cardnumber varchar(10),
        banner varchar(45),
        primary key (idClient, idPayment)
);

create table cash payment(
		idClient int,
        idPayment int,
        money varchar(45),
        Debit card varchar(45),
        Pix varchar(15),
        primary key (idClient, idPayment)
);

create table productorder(
		idPOProduct int,
        idPOOrders int,
        poQuantity int default 1,
        poStatus enum('disponível', 'sem estoque') default 'disponível',
        primary key (idProduct, idOrders)
        constraints fk_product_order foreign key (idPOproduct) references product(idProduct)
        constraints fk_product_product foreign key (idPOorder) references order(idOrder)
);

create table warehouse(
		idWarehouse int,
        idSSstorage int,
        idSSsupplier int,
        SSphysicalspace varchar(20),
        SScapacity int,
        constraints fk_storage_supplier foreign key (idSSsupplier) references supplier(idSupplier)
        constraints fk_storage_storage foreign key (idSSstorage) references storage(idStorage)
);


