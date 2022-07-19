/*Josué Daniel Marroquín Hernández, 2020296, IN5BV*/
CREATE DATABASE TiendaWeb;

USE TiendaWeb;

CREATE TABLE IF NOT EXISTS Genero (
	IdGenero INT NOT NULL,
    Descripcion VARCHAR(45),
    PRIMARY KEY (IdGenero)
);

CREATE TABLE IF NOT EXISTS Clientes (
    IdCliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    Apellidos VARCHAR(45),
    Direccion VARCHAR(45),
    Telefono INT NULL,
    Genero_IdGenero INT NOT NULL,
    PRIMARY KEY (IdCLiente),
    CONSTRAINT fk_GeneroClientes 
    FOREIGN KEY (Genero_IdGenero) REFERENCES Genero (IdGenero)
);

CREATE TABLE IF NOT EXISTS  MetodoPago(
	IdMetodoPago INT NOT NULL,
    Descripcion VARCHAR(45),
    PRIMARY KEY (IdMetodoPago)
    );
    
CREATE TABLE IF NOT EXISTS  TipoPedido(
	IdTipoPedido INT NOT NULL,
    Descripcion VARCHAR(45),
    PRIMARY KEY (IdTipoPedido)
);

CREATE TABLE IF NOT EXISTS  Pedidos(
	IdPedido INT NOT NULL AUTO_INCREMENT,
	Fecha DATE,
    TipoPedido_IdTipoPedido INT NOT NULL,
    MetodoPago_IdMetodoPago INT NOT NULL,
    MontoTotal DECIMAL(10,2),
    Clientes_IdCliente INT NOT NULL,
    PRIMARY KEY (IdPedido),
    CONSTRAINT fk_Pedidos_TipoPedido
    FOREIGN KEY (TipoPedido_IdTipoPedido) REFERENCES TipoPedido(IdTipoPedido),
    CONSTRAINT fk_Pedidos_MetodoPago
    FOREIGN KEY (MetodoPago_IdMetodoPago) REFERENCES MetodoPago(IdMetodoPago),
    CONSTRAINT fk_Pedidos_Clientes
    FOREIGN KEY (Clientes_IdCliente) REFERENCES Clientes(IdCliente)
);

CREATE TABLE IF NOT EXISTS  Productos(
	IdProducto INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    Descripcion VARCHAR(45),
    PreciosinIVA DOUBLE,
    Stock INT,
    PRIMARY KEY (IdProducto)
);

CREATE TABLE IF NOT EXISTS  PedidosProductos(
	Pedidos_IdPedido INT NOT NULL,
    Productos_IdProducto INT NOT NULL,
    Cantidad INT, 
    PRIMARY KEY (Pedidos_IdPedido, Productos_IdProducto),
    CONSTRAINT fk_Pedidos_has_Productos_Pedidos
    FOREIGN KEY (Pedidos_IdPedido) REFERENCES Pedidos(IdPedido),
    CONSTRAINT fk_Pedidos_has_Productos_Productos
    FOREIGN KEY (Productos_IdProducto) REFERENCES Productos(IdProducto)
    );