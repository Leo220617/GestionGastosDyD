CREATE TABLE [dbo].[BandejaEntrada](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlFactura] [varbinary](max) NULL,
	[XmlConfirmacion] [varbinary](max) NULL,
	[Pdf] [varbinary](max) NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[Procesado] [varchar](1) NULL,
	[FechaProcesado] [datetime] NULL,
	[Mensaje] [varchar](max) NULL,
	[Asunto] [varchar](max) NULL,
	[Remitente] [varchar](max) NULL,
	[NumeroConsecutivo] [varchar](100) NULL,
	[TipoDocumento] [varchar](20) NULL,
	[FechaEmision] [varchar](20) NULL,
	[NombreEmisor] [varchar](200) NULL,
	[IdEmisor] [varchar](100) NULL,
	[CodigoMoneda] [varchar](20) NULL,
	[TotalComprobante] [money] NULL,
 CONSTRAINT [PK_BandejaEntrada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[BandejaEntrada] ADD  CONSTRAINT [DF_BandejaEntrada_FechaIngreso]  DEFAULT (getdate()) FOR [FechaIngreso]
GO
-------------------------------------------------------------Bandeja de Entrada----------------------------------------------------
CREATE TABLE [dbo].[BitacoraErrores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[StackTrace] [varchar](max) NULL,
	[Fecha] [datetime] NULL,
	[Metodo] [varchar](200) NULL,
 CONSTRAINT [PK_BitacoraErrores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
-------------------------------------------------Bitacora de Errores--------------------------------------------------------------
CREATE TABLE [dbo].[ConexionSAP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SAPUser] [varchar](50) NULL,
	[SAPPass] [varchar](100) NULL,
	[SQLUser] [varchar](50) NULL,
	[ServerSQL] [varchar](100) NULL,
	[ServerLicense] [varchar](50) NULL,
	[SQLPass] [varchar](100) NULL,
	[SQLType] [varchar](50) NULL,
	[SQLBD] [varchar](50) NULL,
 CONSTRAINT [PK_ConexionSAP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------------------Conexion SAP------------------------------------------------
CREATE TABLE [dbo].[CuentasContables](
	[idCuentaContable] [int] IDENTITY(1,1) NOT NULL,
	[CodSAP] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_CuentasContables] PRIMARY KEY CLUSTERED 
(
	[idCuentaContable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
------------------------------------------------------Cuentas Contables-----------------------------------------
CREATE TABLE [dbo].[DetCierre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCierre] [int] NULL,
	[NumLinea] [int] NULL,
	[idFactura] [int] NULL,
	[Comentario] [varchar](150) NULL,
 CONSTRAINT [PK_DetCierre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-------------------------------------------------------Det Cierre-----------------------------------
CREATE TABLE [dbo].[DetCompras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodEmpresa] [varchar](20) NULL,
	[CodProveedor] [varchar](20) NULL,
	[TipoDocumento] [char](2) NULL,
	[ClaveHacienda] [varchar](50) NULL,
	[ConsecutivoHacienda] [varchar](20) NULL,
	[NomProveedor] [varchar](500) NULL,
	[NumFactura] [int] NOT NULL,
	[NumLinea] [int] NOT NULL,
	[CodPro] [varchar](50) NULL,
	[UnidadMedida] [varchar](50) NULL,
	[NomPro] [varchar](500) NULL,
	[PrecioUnitario] [money] NULL,
	[CodCliente] [varchar](20) NULL,
	[NomCliente] [varchar](500) NULL,
	[Cantidad] [int] NULL,
	[MontoTotal] [money] NULL,
	[MontoDescuento] [money] NULL,
	[SubTotal] [money] NULL,
	[ImpuestoTarifa] [decimal](12, 4) NULL,
	[ImpuestoMonto] [money] NULL,
	[MontoTotalLinea] [money] NULL,
	[Estado] [char](1) NULL,
	[Observacion] [varchar](500) NULL,
	[idTipoGasto] [int] NULL,
	[idCierre] [int] NULL,
	[CodCabys] [varchar](50) NULL,
 CONSTRAINT [PK_DetCompras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------------------Det Compras--------------------------------------

CREATE TABLE [dbo].[Dimensiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoSAP] [varchar](50) NULL,
	[Nombre] [varchar](100) NULL,
 CONSTRAINT [PK_Dimensiones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------------Dimensiones--------------------------------------
CREATE TABLE [dbo].[EncCierre](
	[idCierre] [int] IDENTITY(1,1) NOT NULL,
	[Periodo] [varchar](20) NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[idLogin] [int] NULL,
	[SubTotal] [money] NULL,
	[Descuento] [money] NULL,
	[Impuestos] [money] NULL,
	[Total] [money] NULL,
	[Impuesto1] [money] NULL,
	[Impuesto2] [money] NULL,
	[Impuesto4] [money] NULL,
	[Impuesto8] [money] NULL,
	[Impuesto13] [money] NULL,
	[CantidadRegistros] [int] NULL,
	[FechaCierre] [datetime] NULL,
	[Estado] [char](1) NULL,
	[Observacion] [varchar](500) NULL,
	[idLoginAceptacion] [int] NULL,
	[CodMoneda] [varchar](10) NULL,
	[TotalOtrosCargos] [money] NULL,
	[ProcesadaSAP] [bit] NULL,
 CONSTRAINT [PK_EncCierre] PRIMARY KEY CLUSTERED 
(
	[idCierre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------Enc Cierre----------------------------------------------
CREATE TABLE [dbo].[EncCompras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodEmpresa] [varchar](20) NOT NULL,
	[CodProveedor] [varchar](20) NOT NULL,
	[NomProveedor] [varchar](500) NULL,
	[TipoDocumento] [varchar](10) NOT NULL,
	[NumFactura] [int] NOT NULL,
	[FecFactura] [datetime] NULL,
	[TipoIdentificacionCliente] [varchar](10) NULL,
	[CodCliente] [varchar](20) NULL,
	[NomCliente] [varchar](500) NULL,
	[EmailCliente] [varchar](500) NULL,
	[DiasCredito] [int] NULL,
	[CondicionVenta] [char](2) NULL,
	[ClaveHacienda] [char](50) NULL,
	[ConsecutivoHacienda] [char](20) NULL,
	[MedioPago] [char](2) NULL,
	[Situacion] [tinyint] NULL,
	[CodMoneda] [char](3) NULL,
	[TotalServGravados] [money] NULL,
	[TotalServExentos] [money] NULL,
	[TotalMercanciasGravadas] [money] NULL,
	[TotalMercanciasExentas] [money] NULL,
	[TotalExento] [money] NULL,
	[TotalVenta] [money] NULL,
	[TotalDescuentos] [money] NULL,
	[TotalVentaNeta] [money] NULL,
	[TotalImpuesto] [money] NULL,
	[TotalComprobante] [money] NULL,
	[XmlFacturaRecibida] [varchar](max) NULL,
	[FechaGravado] [datetime] NULL,
	[TotalServExonerado] [money] NULL,
	[TotalMercExonerada] [money] NULL,
	[TotalExonerado] [money] NULL,
	[TotalIVADevuelto] [money] NULL,
	[TotalOtrosCargos] [money] NULL,
	[CodigoActividadEconomica] [varchar](6) NULL,
	[idLoginAsignado] [int] NULL,
	[FecAsignado] [datetime] NULL,
	[PdfFactura] [varchar](max) NULL,
	[idNormaReparto] [int] NULL,
	[idTipoGasto] [int] NULL,
	[idCierre] [int] NULL,
	[Impuesto1] [decimal](18, 2) NULL,
	[Impuesto2] [decimal](18, 2) NULL,
	[Impuesto4] [decimal](18, 2) NULL,
	[Impuesto8] [decimal](18, 2) NULL,
	[Impuesto13] [decimal](18, 2) NULL,
	[PdfFac] [varbinary](max) NULL,
	[RegimenSimplificado] [bit] NULL,
	[FacturaExterior] [bit] NULL,
	[GastosVarios] [bit] NULL,
	[FacturaNoRecibida] [bit] NULL,
	[Comentario] [varchar](150) NULL,
 CONSTRAINT [PK_EncCompras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[EncCompras] ADD  CONSTRAINT [DF_EncCompras_GastosVarios]  DEFAULT ((0)) FOR [GastosVarios]
GO

ALTER TABLE [dbo].[EncCompras] ADD  CONSTRAINT [DF_EncCompras_FacturaNoRecibida]  DEFAULT ((0)) FOR [FacturaNoRecibida]
GO
-----------------------------------------------------Enc Compras---------------------------------------------------------
CREATE TABLE [dbo].[Gastos](
	[idTipoGasto] [int] IDENTITY(1,1) NOT NULL,
	[idCuentaContable] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[PalabrasClave] [varchar](max) NULL,
 CONSTRAINT [PK_Gastos] PRIMARY KEY CLUSTERED 
(
	[idTipoGasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
-----------------------------------------------------gastos-----------------------------------------
CREATE TABLE [dbo].[Login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[Email] [varchar](200) NULL,
	[Nombre] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[Clave] [varchar](500) NULL,
	[idLoginAceptacion] [int] NULL,
	[CardCode] [varchar](500) NULL,
	[CambiarClave] [bit] NULL,
	[CambioFecha] [bit] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_idLoginAceptacion]  DEFAULT ((0)) FOR [idLoginAceptacion]
GO

ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_CambioFecha]  DEFAULT ((0)) FOR [CambioFecha]
GO
-------------------------------------------Login----------------------------------------------

CREATE TABLE [dbo].[NormasReparto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idLogin] [int] NOT NULL,
	[CodSAP] [varchar](4) NULL,
	[Nombre] [varchar](100) NULL,
	[idDimension] [int] NULL,
 CONSTRAINT [PK_NormasReparto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
----------------------------------------------Normas de Reparto-------------------------------
CREATE TABLE [dbo].[Parametros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RecepcionEmail] [varchar](500) NULL,
	[RecepcionPassword] [varchar](500) NULL,
	[RecepcionHostName] [varchar](50) NULL,
	[RecepcionUseSSL] [bit] NULL,
	[RecepcionPort] [int] NULL,
	[RecepcionUltimaLecturaImap] [datetime] NULL,
	[UrlSitioPublicado] [varchar](500) NULL,
	[EnvioPort] [int] NULL,
	[UrlImagenesApp] [varchar](500) NULL,
	[UrlLogo] [varchar](500) NULL,
	[CI1] [varchar](50) NULL,
	[CI2] [varchar](50) NULL,
	[CI4] [varchar](50) NULL,
	[CI8] [varchar](50) NULL,
	[CI13] [varchar](50) NULL,
	[IMPEX] [varchar](5) NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------Parametros------------------------------------------
CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------------Roles---------------------------------------------
CREATE TABLE [dbo].[SeguridadModulos](
	[CodModulo] [int] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SeguridadModulos_1] PRIMARY KEY CLUSTERED 
(
	[CodModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
---------------------------------------------Seguridad Modulos--------------------------------------
CREATE TABLE [dbo].[SeguridadRolesModulos](
	[CodRol] [int] NOT NULL,
	[CodModulo] [int] NOT NULL,
 CONSTRAINT [PK_SeguridadRolesModulos_1] PRIMARY KEY CLUSTERED 
(
	[CodRol] ASC,
	[CodModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------Seguridad Roles Modulos-----------------------------------------








------------***************************************************--------------------------------------------



 

/****** Object:  Table [dbo].[Barrios]    Script Date: 25/4/2022 10:38:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Barrios](
	[CodProvincia] [int] NOT NULL,
	[CodCanton] [int] NOT NULL,
	[CodDistrito] [int] NOT NULL,
	[CodBarrio] [int] NOT NULL,
	[NomBarrio] [varchar](100) NULL,
 CONSTRAINT [PK_Barrios] PRIMARY KEY CLUSTERED 
(
	[CodProvincia] ASC,
	[CodCanton] ASC,
	[CodDistrito] ASC,
	[CodBarrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[BitacoraErrores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DocNum] [varchar](max) NULL,
	[Type] [varchar](2) NULL,
	[Descripcion] [varchar](max) NULL,
	[StackTrace] [varchar](max) NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_BitacoraErrores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[BitacoraErrores] ADD  CONSTRAINT [DF_BitacoraErrores_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO


CREATE TABLE [dbo].[Cantones](
	[CodProvincia] [int] NOT NULL,
	[CodCanton] [int] NOT NULL,
	[NomCanton] [varchar](30) NULL,
 CONSTRAINT [PK_Cantones] PRIMARY KEY CLUSTERED 
(
	[CodProvincia] ASC,
	[CodCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[CorreosRecepcion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RecepcionEmail] [varchar](500) NULL,
	[RecepcionPassword] [varchar](500) NULL,
	[RecepcionHostName] [varchar](50) NULL,
	[RecepcionUseSSL] [bit] NULL,
	[RecepcionPort] [int] NULL,
	[RecepcionUltimaLecturaImap] [datetime] NULL,
 CONSTRAINT [PK_CorreosRecepcion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Distritos](
	[CodProvincia] [int] NOT NULL,
	[CodCanton] [int] NOT NULL,
	[CodDistrito] [int] NOT NULL,
	[NomDistrito] [varchar](30) NULL,
 CONSTRAINT [PK_Distritos] PRIMARY KEY CLUSTERED 
(
	[CodProvincia] ASC,
	[CodCanton] ASC,
	[CodDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[Email] [varchar](200) NULL,
	[Nombre] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[Clave] [varchar](500) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OtrosCargos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEncabezado] [int] NULL,
	[tipoDocumento] [varchar](2) NULL,
	[detalle] [varchar](160) NULL,
	[porcentaje] [decimal](5, 5) NULL,
	[monto] [money] NULL,
 CONSTRAINT [PK_OtrosCargos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OtrosTextos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEncabezado] [int] NULL,
	[codigo] [varchar](2) NULL,
	[detalle] [varchar](50) NULL,
 CONSTRAINT [PK_OtrosTextos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RespuestasCyber](
	[id] [int] NOT NULL,
	[Detalle] [varchar](300) NULL,
 CONSTRAINT [PK_RespuestasCyber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SeguridadModulos](
	[CodModulo] [int] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SeguridadModulos_1] PRIMARY KEY CLUSTERED 
(
	[CodModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SeguridadRolesModulos](
	[CodRol] [int] NOT NULL,
	[CodModulo] [int] NOT NULL,
 CONSTRAINT [PK_SeguridadRolesModulos_1] PRIMARY KEY CLUSTERED 
(
	[CodRol] ASC,
	[CodModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Sucursales](
	[codSuc] [varchar](3) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[NombreComercial] [varchar](100) NULL,
	[Terminal] [varchar](5) NULL,
	[TipoCedula] [varchar](2) NULL,
	[Cedula] [varchar](12) NULL,
	[Provincia] [varchar](1) NULL,
	[Canton] [varchar](2) NULL,
	[Distrito] [varchar](2) NULL,
	[Barrio] [varchar](2) NULL,
	[sennas] [varchar](250) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[Logo] [varchar](max) NULL,
	[ApiKey] [varchar](max) NULL,
	[consecFac] [int] NULL,
	[consecTiq] [int] NULL,
	[consecNC] [int] NULL,
	[consecND] [int] NULL,
	[consecFEC] [int] NULL,
	[consecFEE] [int] NULL,
	[consecAFC] [int] NULL,
	[codPais] [varchar](3) NULL,
	[idConexion] [int] NOT NULL,
	[CodActividadComercial] [varchar](6) NULL,
 CONSTRAINT [PK_Sucursaless] PRIMARY KEY CLUSTERED 
(
	[codSuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

 