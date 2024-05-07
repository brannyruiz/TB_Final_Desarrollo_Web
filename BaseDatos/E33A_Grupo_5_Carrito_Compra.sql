USE [E33A_Grupo_5_Carrito_Compras]
GO
/****** Object:  StoredProcedure [dbo].[SP_Logear_Usuario]    Script Date: 4/05/2024 18:30:59 ******/
DROP PROCEDURE [dbo].[SP_Logear_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Productos_Destacadas]    Script Date: 4/05/2024 18:30:59 ******/
DROP PROCEDURE [dbo].[SP_Listar_Productos_Destacadas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Producto_x_Ofertas]    Script Date: 4/05/2024 18:30:59 ******/
DROP PROCEDURE [dbo].[SP_Listar_Producto_x_Ofertas]
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Producto_x_Marcas]    Script Date: 4/05/2024 18:30:59 ******/
DROP PROCEDURE [dbo].[SP_Listar_Producto_x_Marcas]
GO
ALTER TABLE [dbo].[Ventas] DROP CONSTRAINT [FK_Ventas_Usuario]
GO
ALTER TABLE [dbo].[Talla_Articulo] DROP CONSTRAINT [FK_Talla_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Promocion] DROP CONSTRAINT [FK_Descuento_Articulo]
GO
ALTER TABLE [dbo].[Direccion] DROP CONSTRAINT [FK_Direccion_Usuario]
GO
ALTER TABLE [dbo].[Detalle_Venta] DROP CONSTRAINT [FK_Detalle_Carrito_Carrito]
GO
ALTER TABLE [dbo].[Detalle_Venta] DROP CONSTRAINT [FK_Detalle_Carrito_Articulo]
GO
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Marca]
GO
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT [FK_Articulo_Categoria]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ventas]') AND type in (N'U'))
DROP TABLE [dbo].[Ventas]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Talla_Articulo]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Talla_Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Talla_Articulo]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Promocion]') AND type in (N'U'))
DROP TABLE [dbo].[Promocion]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marca]') AND type in (N'U'))
DROP TABLE [dbo].[Marca]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion]') AND type in (N'U'))
DROP TABLE [dbo].[Direccion]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Venta]') AND type in (N'U'))
DROP TABLE [dbo].[Detalle_Venta]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 4/05/2024 18:30:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
DROP TABLE [dbo].[Articulo]
GO
USE [master]
GO
/****** Object:  Database [E33A_Grupo_5_Carrito_Compras]    Script Date: 4/05/2024 18:30:59 ******/
DROP DATABASE [E33A_Grupo_5_Carrito_Compras]
GO
/****** Object:  Database [E33A_Grupo_5_Carrito_Compras]    Script Date: 4/05/2024 18:30:59 ******/
CREATE DATABASE [E33A_Grupo_5_Carrito_Compras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E33A_Grupo_5_Carrito_Compras', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\E33A_Grupo_5_Carrito_Compras.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E33A_Grupo_5_Carrito_Compras_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\E33A_Grupo_5_Carrito_Compras_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E33A_Grupo_5_Carrito_Compras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ARITHABORT OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET  MULTI_USER 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET QUERY_STORE = OFF
GO
USE [E33A_Grupo_5_Carrito_Compras]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[estado_articulo] [bit] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[destacado] [bit] NULL,
	[imagen] [nvarchar](200) NULL,
	[descuento] [decimal](4, 2) NULL,
	[nuevo] [bit] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nvarchar](50) NOT NULL,
	[estado_categoria] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[id_detalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Detalle_Carrito] PRIMARY KEY CLUSTERED 
(
	[id_detalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[id_direccion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[codigo_postal] [nvarchar](50) NOT NULL,
	[telefono_referencia] [nvarchar](50) NOT NULL,
	[predeterminado] [bit] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[marca] [nvarchar](50) NOT NULL,
	[estado_marca] [bit] NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[id_descuento] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[tipo_descuento] [bit] NOT NULL,
	[valor_descuento] [decimal](10, 2) NOT NULL,
	[inicio_vigencia] [date] NOT NULL,
	[fin_vigencia] [date] NOT NULL,
	[estado_descuento] [bit] NOT NULL,
 CONSTRAINT [PK_Descuento] PRIMARY KEY CLUSTERED 
(
	[id_descuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Talla_Articulo]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Talla_Articulo](
	[id_talla_articulo] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[talla] [int] NOT NULL,
	[stock] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
	[nombres] [nvarchar](50) NOT NULL,
	[apellidos] [nvarchar](50) NOT NULL,
	[dni] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[habilitado] [bit] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[id_usuario] [int] NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[codigo_postal] [nvarchar](50) NOT NULL,
	[telefono_referencia] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[dni] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Carrito] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (3, 1, 3, N'DAVI-2215 AFRICANO', 1, CAST(219.00 AS Decimal(10, 2)), 0, N'../../../assets/images/BOTIN-DAVI-2215-AFRICANO.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (4, 1, 1, N'DAVI-2310 MARRON', 1, CAST(239.00 AS Decimal(10, 2)), 1, N'../../../assets/images/BOTA-MEDIA-DAVI-2310-MARRON.jpg', CAST(50.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (5, 1, 2, N'DARA-188 FUCSIA', 1, CAST(79.90 AS Decimal(10, 2)), 0, N'../../../assets/images/SANDALIA-DARA-188-FUCSIA.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (7, 2, 2, N'2IP-G81 BEIGE', 1, CAST(54.90 AS Decimal(10, 2)), 0, N'../../../assets/images/SANDALIA-2IP-G81-BEIGE.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (9, 2, 2, N'2IP-C40 PLATA', 1, CAST(49.90 AS Decimal(10, 2)), 0, N'../../../assets/images/SANDALIA-2IP-C40-PLATA.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (10, 2, 2, N'2IP-G81 NEGRO', 1, CAST(39.90 AS Decimal(10, 2)), 1, N'../../../assets/images/SANDALIA-2IP-G81-NEGRO.jpg', CAST(20.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (11, 3, 4, N'IMP-1025A NEGRO', 1, CAST(169.90 AS Decimal(10, 2)), 0, N'../../../assets/images/zapato-imp-1025a-negro.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (12, 3, 4, N'DON-090 BEIGE', 1, CAST(159.90 AS Decimal(10, 2)), 1, N'../../../assets/images/zapato-don-090-beige.jpg', CAST(40.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (13, 3, 4, N'DON-103 CELESTE', 1, CAST(159.90 AS Decimal(10, 2)), 0, N'../../../assets/images/ZAPATO-DON-103-CELESTE.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (14, 4, 3, N'FER-1929 NEGRO', 1, CAST(319.90 AS Decimal(10, 2)), 1, N'../../../assets/images/BOTIN-FER-1929-NEGRO.jpg', CAST(0.00 AS Decimal(4, 2)), 1)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (15, 4, 3, N'LINDA-2210 NEGRO', 1, CAST(329.90 AS Decimal(10, 2)), 0, N'../../../assets/images/BOTIN-LINDA-2210-NEGRO.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (16, 4, 4, N'REC-2001 NEGRO', 1, CAST(199.90 AS Decimal(10, 2)), 0, N'../../../assets/images/zapatilla-rec-2001-negro.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (18, 5, 4, N'1184-1101 NEGRO', 1, CAST(169.90 AS Decimal(10, 2)), 1, N'../../../assets/images/ZAPATO-1184-1101-NEGRO.jpg', CAST(0.00 AS Decimal(4, 2)), 1)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (20, 5, 4, N'1184-1101 BEIGE', 1, CAST(169.90 AS Decimal(10, 2)), 0, N'../../../assets/images/ZAPATO-1184-1101-BEIGE.jpg', CAST(0.00 AS Decimal(4, 2)), 0)
GO
INSERT [dbo].[Articulo] ([id_articulo], [id_marca], [id_categoria], [descripcion], [estado_articulo], [precio], [destacado], [imagen], [descuento], [nuevo]) VALUES (21, 6, 2, N'2GZ-183 VERDE', 1, CAST(109.90 AS Decimal(10, 2)), 1, N'../../../assets/images/SANDALIA-2GZ-183-VERDE.jpg', CAST(25.00 AS Decimal(4, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([id_categoria], [categoria], [estado_categoria]) VALUES (1, N'BOTAS', 1)
GO
INSERT [dbo].[Categoria] ([id_categoria], [categoria], [estado_categoria]) VALUES (2, N'ZANDALIAS', 1)
GO
INSERT [dbo].[Categoria] ([id_categoria], [categoria], [estado_categoria]) VALUES (3, N'BOTIN', 1)
GO
INSERT [dbo].[Categoria] ([id_categoria], [categoria], [estado_categoria]) VALUES (4, N'ZAPATO', 1)
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (1, N'ANN D VIAN', 1)
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (2, N'IPANEMA', 1)
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (3, N'PIAZZA', 1)
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (4, N'VIALE', 1)
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (5, N'VIZZANO', 1)
GO
INSERT [dbo].[Marca] ([id_marca], [marca], [estado_marca]) VALUES (6, N'ZACY', 1)
GO
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Talla_Articulo] ON 
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (9, 3, 35, 35)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (10, 3, 36, 31)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (11, 3, 37, 29)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (12, 3, 38, 7)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (13, 3, 39, 1)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (14, 3, 40, 3)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (15, 4, 35, 43)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (16, 4, 36, 25)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (17, 4, 37, 27)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (18, 4, 38, 6)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (19, 4, 39, 2)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (20, 4, 40, 2)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (21, 5, 35, 14)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (22, 5, 36, 14)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (23, 5, 37, 0)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (24, 5, 38, 3)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (25, 5, 39, 15)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (26, 5, 40, 7)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (33, 7, 35, 33)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (34, 7, 36, 14)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (35, 7, 37, 32)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (36, 7, 38, 36)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (37, 7, 39, 30)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (38, 7, 40, 15)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (39, 9, 35, 45)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (40, 9, 36, 5)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (41, 9, 37, 18)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (42, 9, 38, 22)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (43, 9, 39, 27)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (44, 9, 40, 13)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (45, 10, 35, 18)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (46, 10, 36, 17)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (47, 10, 37, 18)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (48, 10, 38, 15)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (49, 10, 39, 13)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (50, 10, 40, 45)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (51, 11, 35, 18)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (52, 11, 36, 16)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (53, 11, 37, 6)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (54, 11, 38, 1)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (55, 11, 39, 47)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (56, 11, 40, 17)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (57, 12, 35, 25)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (58, 12, 36, 47)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (59, 12, 37, 8)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (60, 12, 38, 42)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (61, 12, 39, 3)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (62, 12, 40, 17)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (63, 13, 35, 21)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (64, 13, 36, 18)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (65, 13, 37, 31)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (66, 13, 38, 14)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (67, 13, 39, 41)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (68, 13, 40, 25)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (69, 14, 35, 6)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (70, 14, 36, 22)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (71, 14, 37, 35)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (72, 14, 38, 32)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (73, 14, 39, 37)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (74, 14, 40, 14)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (75, 15, 35, 0)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (76, 15, 36, 28)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (77, 15, 37, 35)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (78, 15, 38, 31)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (79, 15, 39, 0)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (80, 15, 40, 48)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (81, 16, 35, 33)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (82, 16, 36, 21)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (83, 16, 37, 16)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (84, 16, 38, 10)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (85, 16, 39, 27)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (86, 16, 40, 31)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (87, 18, 35, 12)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (88, 18, 36, 26)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (89, 18, 37, 20)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (90, 18, 38, 4)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (91, 18, 39, 41)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (92, 18, 40, 45)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (93, 20, 35, 28)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (94, 20, 36, 31)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (95, 20, 37, 15)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (96, 20, 38, 25)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (97, 20, 39, 37)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (98, 20, 40, 27)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (99, 21, 35, 42)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (100, 21, 36, 39)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (101, 21, 37, 37)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (102, 21, 38, 39)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (103, 21, 39, 10)
GO
INSERT [dbo].[Talla_Articulo] ([id_talla_articulo], [id_articulo], [talla], [stock]) VALUES (104, 21, 40, 12)
GO
SET IDENTITY_INSERT [dbo].[Talla_Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id_usuario], [clave], [nombres], [apellidos], [dni], [telefono], [correo], [habilitado], [login]) VALUES (1, N'123456', N'Danny Alberto', N'Herrera Montano', N'42864062', N'956358394', N'U201220612@UPC.EDU.PE', 1, N'U201220612')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id_marca])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Marca]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Carrito_Articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [FK_Detalle_Carrito_Articulo]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Carrito_Carrito] FOREIGN KEY([id_venta])
REFERENCES [dbo].[Ventas] ([id_venta])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [FK_Detalle_Carrito_Carrito]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Usuario]
GO
ALTER TABLE [dbo].[Promocion]  WITH CHECK ADD  CONSTRAINT [FK_Descuento_Articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[Promocion] CHECK CONSTRAINT [FK_Descuento_Articulo]
GO
ALTER TABLE [dbo].[Talla_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Talla_Articulo_Articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[Talla_Articulo] CHECK CONSTRAINT [FK_Talla_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Producto_x_Marcas]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[SP_Listar_Producto_x_Marcas]
  @idMarca INT
  AS
  BEGIN
	SELECT M.id_marca, id_articulo, marca, descripcion, 
	precio, 
	CASE descuento
	WHEN 0 THEN
	precio
	ELSE
	CAST((precio*(1-descuento/100)) AS DECIMAL(10,2))
	END precio_descuento,
	imagen, descuento, nuevo	
	FROM dbo.Marca M 
	Inner Join dbo.Articulo A 
	ON M.id_marca = A.id_marca
	WHERE M.id_marca = @idMarca
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Producto_x_Ofertas]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_Listar_Producto_x_Ofertas]
  AS
  BEGIN
	SELECT M.id_marca, id_articulo, marca, descripcion, 
	precio, 
	CASE descuento
	WHEN 0 THEN
	precio
	ELSE
	CAST((precio*(1-descuento/100)) AS DECIMAL(10,2))
	END precio_descuento,
	imagen, descuento, nuevo	
	FROM dbo.Marca M 
	Inner Join dbo.Articulo A 
	ON M.id_marca = A.id_marca
	WHERE descuento > 0
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Listar_Productos_Destacadas]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Listar_Productos_Destacadas]
  AS
  BEGIN
	SELECT M.id_marca, id_articulo, marca, descripcion, 
	precio, 
	CASE descuento
	WHEN 0 THEN
	precio
	ELSE
	CAST((precio*(1-descuento/100)) AS DECIMAL(10,2))
	END precio_descuento,
	imagen, descuento, nuevo	
	FROM dbo.Marca M 
	Inner Join dbo.Articulo A 
	ON M.id_marca = A.id_marca
	WHERE A.destacado = 1
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_Logear_Usuario]    Script Date: 4/05/2024 18:30:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Logear_Usuario]
@Login NVARCHAR(50),
@Clave NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.Usuario AS U
	WHERE U."login" = @Login AND U.clave = @Clave

END
GO
USE [master]
GO
ALTER DATABASE [E33A_Grupo_5_Carrito_Compras] SET  READ_WRITE 
GO
