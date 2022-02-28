create database smartgame;

use smartgame;

create table tblCategoria
(
	idCategoria int not null auto_increment primary key,
    nome varchar(10) not null,
    unique index(idCategoria) 
);

create table tblProduto
(
	idProduto int not null auto_increment primary key,
    nome varchar(100),
    descricao text,
    imagem text,
    preco float,
    unique index(idProduto)
); 

create table tblLoja
(
	idLoja int not null auto_increment primary key,
    nome varchar(100),
    unique index(idLoja)
);

create table tblProdutoCategoria
(
	idProdutoCategoria int not null auto_increment primary key,
    idProduto int not null,
    #Nome do relacionamento 
    constraint FK_Produto_ProdutoCategoria
    #Definicao de quem será a FK(foreign key) dessa tabela
    foreign key (idProduto)
    #Referencia da tabela que tem a PK para virar a FK
    references tblProduto(idProduto),
    
    idCategoria int not null, 
    #Nome do relacionamento 
    constraint FK_Categoria_ProdutoCategoria
    #Definicao de quem será a FK(foreign key) dessa tabela
    foreign key (idCategoria)
    #Referencia da tabela que tem a PK para virar a FK
    references tblCategoria (idCategoria),
    
    unique index(idProdutoCategoria)
);

create table tblLojaProduto
(
	idLojaProduto int not null auto_increment primary key,
    
    idLoja int not null, 
    #Nome do relacionamento 
    constraint FK_Loja_LojaProduto
    #Definicao de quem será a FK(foreign key) dessa tabela
    foreign key (idLoja)
    #Referencia da tabela que tem a PK para virar a FK
    references tblLoja (idLoja),
    
    idProduto int not null,
    #Nome do relacionamento 
    constraint FK_Produto_LojaProduto
    #Definicao de quem será a FK(foreign key) dessa tabela
    foreign key (idProduto)
    #Referencia da tabela que tem a PK para virar a FK
    references tblProduto(idProduto),
    
    unique index(idLojaProduto)
);

show tables;

desc tbllojaproduto;

create view vwProdutoCategoria as

	select tblProdutoCategoria.idProdutoCategoria, 
                    tblProduto.nome as Produto, tblProduto.idProduto, 
                    tblCategoria.nome as Categoria, tblCategoria.idLoja
                        from tblProdutoCategoria
                            inner join tblProduto on tblProduto.idProduto = tblProdutoCategoria.idProduto
                            inner join tblCategoria on tblCategoria.idLoja = tblProdutoCategoria.idLoja 
                                order by idProdutoCategoria desc;
                                
select * from vwProdutoCategoria;

create view vwLojaProduto as

	select tblLojaProduto.idLojaProduto, 
                    tblProduto.nome as Produto, tblProduto.idProduto, 
                    tblLoja.nome as Loja, tblLoja.idLoja
                        from tblLojaProduto as LojaProduto
                            inner join tblProduto on tblProduto.idProduto = tblLojaProduto.idProduto
                            inner join tblLoja on tblLoja.idLoja = tblLojaProduto.idLoja 
                                order by tblLojaProduto desc;

select tblLojaProduto.idLojaProduto, 
                    tblProduto.nome as Produto, tblProduto.idProduto, 
                    tblLoja.nome as Loja, tblLoja.idLoja
                        from tblLojaProduto as LojaProduto
                            inner join tblProduto on tblProduto.idProduto = tblLojaProduto.idProduto
                            inner join tblLoja on tblLoja.idLoja = tblLojaProduto.idLoja 
                                order by tblLojaProduto desc;

desc tblLojaProduto;