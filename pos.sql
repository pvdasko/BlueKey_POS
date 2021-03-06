USE [PosDB] 
/****** Object:  Table [dbo].[001BARRCURRX]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001BARRCURRX](
	[Formato] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Col_1] [float] NOT NULL,
	[Col_2] [float] NOT NULL,
	[Col_3] [float] NOT NULL,
	[Col_4] [char](10) NOT NULL,
 CONSTRAINT [PK_001BARRCURX] PRIMARY KEY CLUSTERED 
(
	[Formato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001BARRCURRY]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[001BARRCURRY](
	[Formato] [int] NOT NULL,
	[Linea] [smallint] NOT NULL,
	[CurrentY] [float] NOT NULL,
 CONSTRAINT [PK_001BARRCURY] PRIMARY KEY CLUSTERED 
(
	[Formato] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[001COMCOTI]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMCOTI](
	[No_Requisicion] [bigint] NOT NULL,
	[No_Linea] [int] NOT NULL,
	[CodProv] [varchar](6) NOT NULL,
	[Precio] [money] NOT NULL,
	[PorDesc] [float] NOT NULL,
	[Selec] [bit] NOT NULL,
 CONSTRAINT [PK_001COMCOTI] PRIMARY KEY CLUSTERED 
(
	[No_Requisicion] ASC,
	[No_Linea] ASC,
	[CodProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMPDG]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMPDG](
	[No_Ped] [bigint] IDENTITY(1,1) NOT NULL,
	[Cod_Prov] [varchar](6) NULL,
	[Notas] [varchar](300) NULL,
	[Fecha_Ped] [datetime] NOT NULL,
	[Fecha_Entrega] [datetime] NOT NULL,
	[Cod_Depto] [varchar](4) NOT NULL,
	[Autoriza] [bit] NOT NULL,
	[Autoriza2] [bit] NOT NULL,
	[Impresa] [bit] NOT NULL,
	[Ope_Genera] [varchar](3) NOT NULL,
	[Ope_Autoriza] [varchar](3) NULL,
	[Ope_Autoriza2] [varchar](3) NULL,
	[Ope_Imprime] [varchar](3) NULL,
	[Entrada_1] [bit] NOT NULL,
	[Entrada_2] [bit] NOT NULL,
	[Entrada_3] [bit] NOT NULL,
	[Entrada_4] [bit] NOT NULL,
	[Fecha_1] [datetime] NULL,
	[Fecha_2] [datetime] NULL,
	[Fecha_3] [datetime] NULL,
	[Fecha_4] [datetime] NULL,
	[Dolares] [bit] NOT NULL,
	[Condiciones] [varchar](100) NULL,
	[Requisicion] [bigint] NOT NULL,
 CONSTRAINT [PK_001COMPDG] PRIMARY KEY CLUSTERED 
(
	[No_Ped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMPDL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[001COMPDL](
	[No_Ped] [bigint] NOT NULL,
	[No_Req] [bigint] NOT NULL,
	[No_Lin] [int] NOT NULL,
	[No_Art] [bigint] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Precio] [money] NOT NULL,
	[Descuento] [money] NOT NULL,
	[Total]  AS ([Cantidad] * [Precio] - [Cantidad] * [Precio] * ([Descuento] / 100)),
	[Entregada_1] [float] NOT NULL,
	[Entregada_2] [float] NOT NULL,
	[Entregada_3] [float] NOT NULL,
	[Entregada_4] [float] NOT NULL,
	[Falta]  AS ([Cantidad] - [Entregada_1] - [Entregada_2] - [Entregada_3] - [Entregada_4]),
	[Total_1]  AS ([Precio] * [Entregada_1]),
	[Total_2]  AS ([Precio] * [Entregada_2]),
	[Total_3]  AS ([Precio] * [Entregada_3]),
	[Total_4]  AS ([Precio] * [Entregada_4]),
 CONSTRAINT [PK_001COMPDL] PRIMARY KEY CLUSTERED 
(
	[No_Ped] ASC,
	[No_Req] ASC,
	[No_Lin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[001COMPRECIOS]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMPRECIOS](
	[Codigo_Articulo] [bigint] NOT NULL,
	[Codigo_Prov] [varchar](6) NOT NULL,
	[Precio_1] [money] NOT NULL,
	[Fecha_1] [datetime] NOT NULL,
	[Ope_1] [varchar](3) NOT NULL,
	[Vigente] [bit] NOT NULL,
	[Precio_2] [money] NULL,
	[Fecha_2] [datetime] NULL,
	[Ope_2] [varchar](3) NULL,
	[Precio_3] [money] NULL,
	[Fecha_3] [datetime] NULL,
	[Ope_3] [varchar](3) NULL,
	[Precio_4] [money] NULL,
	[Fecha_4] [datetime] NULL,
	[Ope_4] [varchar](3) NULL,
	[Precio_5] [money] NULL,
	[Fecha_5] [datetime] NULL,
	[Ope_5] [varchar](3) NULL,
	[Precio_6] [money] NULL,
	[Fecha_6] [datetime] NULL,
	[Ope_6] [varchar](3) NULL,
	[Precio_7] [money] NULL,
	[Fecha_7] [datetime] NULL,
	[Ope_7] [varchar](3) NULL,
	[Precio_8] [money] NULL,
	[Fecha_8] [datetime] NULL,
	[Ope_8] [char](3) NULL,
	[Precio_9] [money] NULL,
	[Fecha_9] [datetime] NULL,
	[Ope_9] [char](3) NULL,
	[Precio_10] [money] NULL,
	[Fecha_10] [datetime] NULL,
	[Ope_10] [char](3) NULL,
 CONSTRAINT [PK_001COMPRECIOS] PRIMARY KEY CLUSTERED 
(
	[Codigo_Articulo] ASC,
	[Codigo_Prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMPRI]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMPRI](
	[Tip_Prio] [varchar](1) NOT NULL,
	[Desc_Esp] [varchar](30) NOT NULL,
	[Desc_Ing] [varchar](30) NULL,
 CONSTRAINT [PK_001COMPRI] PRIMARY KEY CLUSTERED 
(
	[Tip_Prio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMRQG]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMRQG](
	[No_Req] [bigint] IDENTITY(1,1) NOT NULL,
	[Tip_Req] [varchar](1) NOT NULL,
	[Cod_Dep] [varchar](4) NULL,
	[Cod_Prio] [varchar](1) NOT NULL,
	[Notas_Req] [varchar](200) NULL,
	[Notas_Auto]  AS ([Notas_Req]),
	[Fecha_Req] [datetime] NOT NULL,
	[Hora_Req] [datetime] NOT NULL,
	[Ope_Req] [varchar](3) NOT NULL,
	[Fecha_Aut] [datetime] NULL,
	[Hora_Aut] [datetime] NULL,
	[Ope_Aut] [varchar](50) NULL,
	[Status_Req] [bit] NOT NULL,
	[Status_Cot] [bit] NOT NULL,
	[Status_Ped] [bit] NOT NULL,
	[Dolares] [bit] NOT NULL,
 CONSTRAINT [PK_001COMRQG] PRIMARY KEY CLUSTERED 
(
	[No_Req] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMRQL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMRQL](
	[No_Req] [bigint] NOT NULL,
	[No_Lin] [int] NOT NULL,
	[Cod_Art] [bigint] NOT NULL,
	[Desc_Art] [varchar](200) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Cod_Med] [varchar](10) NOT NULL,
	[Notas] [varchar](200) NULL,
	[Status_Cot] [bit] NOT NULL,
 CONSTRAINT [PK_001COMRQL] PRIMARY KEY CLUSTERED 
(
	[No_Req] ASC,
	[No_Lin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMSORT]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMSORT](
	[Ope] [varchar](3) NOT NULL,
	[Cod_Prov] [varchar](6) NOT NULL,
	[Pedido] [bigint] NOT NULL,
 CONSTRAINT [PK_001COMSORT] PRIMARY KEY CLUSTERED 
(
	[Ope] ASC,
	[Cod_Prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COMTIP]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COMTIP](
	[Tipo] [varchar](1) NOT NULL,
	[DescTip_Esp] [varchar](30) NOT NULL,
	[DescTip_Ing] [varchar](30) NULL,
 CONSTRAINT [PK_001CMTIP] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCASA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCASA](
	[Cia] [varchar](3) NOT NULL,
	[No_Casa] [bigint] NOT NULL,
 CONSTRAINT [PK_001CONCASA] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCIERRA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCIERRA](
	[Periodo] [varchar](4) NOT NULL,
	[Cerrado] [bit] NOT NULL,
 CONSTRAINT [PK_001CONCIERRA] PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCLA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCLA](
	[Tipo_Cuenta] [varchar](1) NOT NULL,
	[Clasificacion] [varchar](2) NOT NULL,
	[Descripcion_1] [varchar](30) NOT NULL,
	[Descripcion_2] [varchar](30) NULL,
 CONSTRAINT [PK_001CO01] PRIMARY KEY CLUSTERED 
(
	[Tipo_Cuenta] ASC,
	[Clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCOG]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCOG](
	[Cia] [varchar](3) NOT NULL,
	[Periodo] [varchar](4) NOT NULL,
	[Tipo_PolG] [varchar](2) NOT NULL,
	[Num_PolG] [varchar](8) NOT NULL,
	[Fecha_PolG] [datetime] NOT NULL,
	[Concepto_PolG] [varchar](100) NOT NULL,
	[Tot_Cargos] [money] NULL,
	[Tot_Abonos] [money] NOT NULL,
	[Status] [bit] NOT NULL,
	[Libre_2] [varchar](10) NULL,
	[Ope_Cap] [varchar](3) NOT NULL,
 CONSTRAINT [PK_001CONCOG] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC,
	[Periodo] ASC,
	[Tipo_PolG] ASC,
	[Num_PolG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCOL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCOL](
	[Cia] [varchar](3) NOT NULL,
	[Periodo] [varchar](4) NOT NULL,
	[Tipo_PolL] [varchar](2) NOT NULL,
	[Num_PolL] [varchar](8) NOT NULL,
	[Linea] [int] NOT NULL,
	[Cuenta_1] [varchar](4) NOT NULL,
	[Cuenta_2] [varchar](4) NOT NULL,
	[Cuenta_3] [varchar](4) NOT NULL,
	[Cuenta_4] [varchar](4) NOT NULL,
	[Fecha_PolL] [datetime] NOT NULL,
	[Concepto_PolL] [varchar](50) NOT NULL,
	[Cargo] [money] NOT NULL,
	[Abono] [money] NOT NULL,
	[Cia_Con] [varchar](3) NULL,
	[Cia_Cap] [varchar](3) NULL,
	[Documento] [varchar](10) NULL,
	[Referencia] [varchar](10) NULL,
	[Caza] [bigint] NOT NULL,
	[Fecha_Cap] [datetime] NOT NULL,
	[Ope_Cap] [varchar](3) NOT NULL,
	[Cod_Cxc] [varchar](6) NULL,
	[Cod_Mov] [varchar](6) NULL,
	[Flujo] [varchar](2) NULL,
 CONSTRAINT [PK_001CONCOL] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC,
	[Periodo] ASC,
	[Tipo_PolL] ASC,
	[Num_PolL] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCTA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCTA](
	[Cuenta_1] [varchar](4) NOT NULL,
	[Cuenta_2] [varchar](4) NOT NULL,
	[Cuenta_3] [varchar](4) NOT NULL,
	[Cuenta_4] [varchar](4) NOT NULL,
	[Tipo_Cuenta] [varchar](1) NOT NULL,
	[Clasificacion] [varchar](2) NOT NULL,
	[Subclasificacion] [varchar](2) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Descripcion_2] [varchar](100) NULL,
	[Flujo_Efectivo] [bit] NOT NULL,
	[Afectable] [bit] NOT NULL,
	[Complementaria] [varchar](16) NULL,
	[Cta_Modulo] [bit] NOT NULL,
	[Libre_1] [varchar](10) NULL,
	[Libre_2] [varchar](10) NULL,
	[Comentarios] [varchar](300) NOT NULL,
 CONSTRAINT [PK_001CONCTA] PRIMARY KEY CLUSTERED 
(
	[Cuenta_1] ASC,
	[Cuenta_2] ASC,
	[Cuenta_3] ASC,
	[Cuenta_4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONCTOS]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONCTOS](
	[Periodo] [varchar](2) NOT NULL,
	[Mes_1] [float] NOT NULL,
	[Mes_2] [float] NOT NULL,
	[Mes_3] [float] NOT NULL,
	[Mes_4] [float] NOT NULL,
	[Mes_5] [float] NOT NULL,
	[Mes_6] [float] NOT NULL,
	[Mes_7] [float] NOT NULL,
	[Mes_8] [float] NOT NULL,
	[Mes_9] [float] NOT NULL,
	[Mes_10] [float] NOT NULL,
	[Mes_11] [float] NOT NULL,
	[Mes_12] [float] NOT NULL,
 CONSTRAINT [PK_001CONCTOS] PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONF01]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONF01](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Desc_Esp] [varchar](100) NOT NULL,
	[Desc_Ing] [varchar](100) NULL,
	[Cod] [varchar](1) NOT NULL,
	[Calculo_Porcentaje] [varchar](7) NULL,
	[Ingreso] [bit] NOT NULL,
	[Operacion] [varchar](100) NULL,
 CONSTRAINT [PK_001CONF01] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONF02]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONF02](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Cuenta_Inicial] [varchar](16) NOT NULL,
	[Cuenta_Final] [varchar](16) NOT NULL,
 CONSTRAINT [PK_001CONF02] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC,
	[Cuenta_Inicial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONF03]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONF03](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Mes_1] [money] NOT NULL,
	[Mes_2] [money] NOT NULL,
	[Mes_3] [money] NOT NULL,
	[Mes_4] [money] NOT NULL,
	[Mes_5] [money] NOT NULL,
	[Mes_6] [money] NOT NULL,
	[Mes_7] [money] NOT NULL,
	[Mes_8] [money] NOT NULL,
	[Mes_9] [money] NOT NULL,
	[Mes_10] [money] NOT NULL,
	[Mes_11] [money] NOT NULL,
	[Mes_12] [money] NOT NULL,
	[Sal_1] [money] NOT NULL,
	[Sal_2] [money] NOT NULL,
	[Sal_3] [money] NOT NULL,
	[Sal_4] [money] NOT NULL,
	[Sal_5] [money] NOT NULL,
	[Sal_6] [money] NOT NULL,
	[Sal_7] [money] NOT NULL,
	[Sal_8] [money] NOT NULL,
	[Sal_9] [money] NOT NULL,
	[Sal_10] [money] NOT NULL,
	[Sal_11] [money] NOT NULL,
	[Sal_12] [money] NOT NULL,
	[Pres_1] [money] NOT NULL,
	[Pres_2] [money] NOT NULL,
	[Pres_3] [money] NOT NULL,
	[Pres_4] [money] NOT NULL,
	[Pres_5] [money] NOT NULL,
	[Pres_6] [money] NOT NULL,
	[Pres_7] [money] NOT NULL,
	[Pres_8] [money] NOT NULL,
	[Pres_9] [money] NOT NULL,
	[Pres_10] [money] NOT NULL,
	[Pres_11] [money] NOT NULL,
	[Pres_12] [money] NOT NULL,
	[APres_1] [money] NOT NULL,
	[APres_2] [money] NOT NULL,
	[APres_3] [money] NOT NULL,
	[APres_4] [money] NOT NULL,
	[APres_5] [money] NOT NULL,
	[APres_6] [money] NOT NULL,
	[APres_7] [money] NOT NULL,
	[APres_8] [money] NOT NULL,
	[APres_9] [money] NOT NULL,
	[APres_10] [money] NOT NULL,
	[APres_11] [money] NOT NULL,
	[APres_12] [money] NOT NULL,
	[AMes_1] [money] NOT NULL,
	[AMes_2] [money] NOT NULL,
	[AMes_3] [money] NOT NULL,
	[AMes_4] [money] NOT NULL,
	[AMes_5] [money] NOT NULL,
	[AMes_6] [money] NOT NULL,
	[AMes_7] [money] NOT NULL,
	[AMes_8] [money] NOT NULL,
	[AMes_9] [money] NOT NULL,
	[AMes_10] [money] NOT NULL,
	[AMes_11] [money] NOT NULL,
	[AMes_12] [money] NOT NULL,
	[ASal_1] [money] NOT NULL,
	[ASal_2] [money] NOT NULL,
	[ASal_3] [money] NOT NULL,
	[ASal_4] [money] NOT NULL,
	[ASal_5] [money] NOT NULL,
	[ASal_6] [money] NOT NULL,
	[ASal_7] [money] NOT NULL,
	[ASal_8] [money] NOT NULL,
	[ASal_9] [money] NOT NULL,
	[ASal_10] [money] NOT NULL,
	[ASal_11] [money] NOT NULL,
	[ASal_12] [money] NOT NULL,
	[PMes_1] [money] NOT NULL,
	[PMes_2] [money] NOT NULL,
	[PMes_3] [money] NOT NULL,
	[PMes_4] [money] NOT NULL,
	[PMes_5] [money] NOT NULL,
	[PMes_6] [money] NOT NULL,
	[PMes_7] [money] NOT NULL,
	[PMes_8] [money] NOT NULL,
	[PMes_9] [money] NOT NULL,
	[PMes_10] [money] NOT NULL,
	[PMes_11] [money] NOT NULL,
	[PMes_12] [money] NOT NULL,
	[PSal_1] [money] NOT NULL,
	[PSal_2] [money] NOT NULL,
	[PSal_3] [money] NOT NULL,
	[PSal_4] [money] NOT NULL,
	[PSal_5] [money] NOT NULL,
	[PSal_6] [money] NOT NULL,
	[PSal_7] [money] NOT NULL,
	[PSal_8] [money] NOT NULL,
	[PSal_9] [money] NOT NULL,
	[PSal_10] [money] NOT NULL,
	[PSal_11] [money] NOT NULL,
	[PSal_12] [money] NOT NULL,
	[PPres_1] [money] NOT NULL,
	[PPres_2] [money] NOT NULL,
	[PPres_3] [money] NOT NULL,
	[PPres_4] [money] NOT NULL,
	[PPres_5] [money] NOT NULL,
	[PPres_6] [money] NOT NULL,
	[PPres_7] [money] NOT NULL,
	[PPres_8] [money] NOT NULL,
	[PPres_9] [money] NOT NULL,
	[PPres_10] [money] NOT NULL,
	[PPres_11] [money] NOT NULL,
	[PPres_12] [money] NOT NULL,
	[PAPres_1] [money] NOT NULL,
	[PAPres_2] [money] NOT NULL,
	[PAPres_3] [money] NOT NULL,
	[PAPres_4] [money] NOT NULL,
	[PAPres_5] [money] NOT NULL,
	[PAPres_6] [money] NOT NULL,
	[PAPres_7] [money] NOT NULL,
	[PAPres_8] [money] NOT NULL,
	[PAPres_9] [money] NOT NULL,
	[PAPres_10] [money] NOT NULL,
	[PAPres_11] [money] NOT NULL,
	[PAPres_12] [money] NOT NULL,
	[PAMes_1] [money] NOT NULL,
	[PAMes_2] [money] NOT NULL,
	[PAMes_3] [money] NOT NULL,
	[PAMes_4] [money] NOT NULL,
	[PAMes_5] [money] NOT NULL,
	[PAMes_6] [money] NOT NULL,
	[PAMes_7] [money] NOT NULL,
	[PAMes_8] [money] NOT NULL,
	[PAMes_9] [money] NOT NULL,
	[PAMes_10] [money] NOT NULL,
	[PAMes_11] [money] NOT NULL,
	[PAMes_12] [money] NOT NULL,
	[PASal_1] [money] NOT NULL,
	[PASal_2] [money] NOT NULL,
	[PASal_3] [money] NOT NULL,
	[PASal_4] [money] NOT NULL,
	[PASal_5] [money] NOT NULL,
	[PASal_6] [money] NOT NULL,
	[PASal_7] [money] NOT NULL,
	[PASal_8] [money] NOT NULL,
	[PASal_9] [money] NOT NULL,
	[PASal_10] [money] NOT NULL,
	[PASal_11] [money] NOT NULL,
	[PASal_12] [money] NOT NULL,
 CONSTRAINT [PK_001CONF3] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONF04]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONF04](
	[Cia] [varchar](3) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Hora] [datetime] NOT NULL,
 CONSTRAINT [PK_001CONF04] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONFLUJO]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONFLUJO](
	[Rubro] [varchar](2) NOT NULL,
	[Concepto] [varchar](100) NOT NULL,
	[Ingles] [varchar](100) NOT NULL,
	[Tipo] [varchar](1) NOT NULL,
 CONSTRAINT [PK_001CONFLUJO] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONP01]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONP01](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Desc_Esp] [varchar](100) NOT NULL,
	[Desc_Ing] [varchar](100) NOT NULL,
	[Cod] [varchar](1) NOT NULL,
	[Calculo_Porcentaje] [varchar](7) NULL,
	[CambioSigno] [bit] NOT NULL,
	[Operacion] [varchar](100) NULL,
	[Variacion] [bit] NOT NULL,
	[MesAnt] [bit] NOT NULL,
 CONSTRAINT [PK_001CONP01] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONP02]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONP02](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Cuenta_Inicial] [varchar](16) NOT NULL,
	[Cuenta_Final] [varchar](16) NOT NULL,
	[Comando] [varchar](1) NOT NULL,
 CONSTRAINT [PK_001CONP02] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC,
	[Cuenta_Inicial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONP03]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONP03](
	[Rubro] [varchar](3) NOT NULL,
	[Secuencia] [varchar](4) NOT NULL,
	[Mes_1] [money] NOT NULL,
	[Mes_2] [money] NOT NULL,
	[Mes_3] [money] NOT NULL,
	[Mes_4] [money] NOT NULL,
	[Mes_5] [money] NOT NULL,
	[Mes_6] [money] NOT NULL,
	[Mes_7] [money] NOT NULL,
	[Mes_8] [money] NOT NULL,
	[Mes_9] [money] NOT NULL,
	[Mes_10] [money] NOT NULL,
	[Mes_11] [money] NOT NULL,
	[Mes_12] [money] NOT NULL,
	[Sal_1] [money] NOT NULL,
	[Sal_2] [money] NOT NULL,
	[Sal_3] [money] NOT NULL,
	[Sal_4] [money] NOT NULL,
	[Sal_5] [money] NOT NULL,
	[Sal_6] [money] NOT NULL,
	[Sal_7] [money] NOT NULL,
	[Sal_8] [money] NOT NULL,
	[Sal_9] [money] NOT NULL,
	[Sal_10] [money] NOT NULL,
	[Sal_11] [money] NOT NULL,
	[Sal_12] [money] NOT NULL,
	[Pres_1] [money] NOT NULL,
	[Pres_2] [money] NOT NULL,
	[Pres_3] [money] NOT NULL,
	[Pres_4] [money] NOT NULL,
	[Pres_5] [money] NOT NULL,
	[Pres_6] [money] NOT NULL,
	[Pres_7] [money] NOT NULL,
	[Pres_8] [money] NOT NULL,
	[Pres_9] [money] NOT NULL,
	[Pres_10] [money] NOT NULL,
	[Pres_11] [money] NOT NULL,
	[Pres_12] [money] NOT NULL,
	[APres_1] [money] NOT NULL,
	[APres_2] [money] NOT NULL,
	[APres_3] [money] NOT NULL,
	[APres_4] [money] NOT NULL,
	[APres_5] [money] NOT NULL,
	[APres_6] [money] NOT NULL,
	[APres_7] [money] NOT NULL,
	[APres_8] [money] NOT NULL,
	[APres_9] [money] NOT NULL,
	[APres_10] [money] NOT NULL,
	[APres_11] [money] NOT NULL,
	[APres_12] [money] NOT NULL,
	[AMes_1] [money] NOT NULL,
	[AMes_2] [money] NOT NULL,
	[AMes_3] [money] NOT NULL,
	[AMes_4] [money] NOT NULL,
	[AMes_5] [money] NOT NULL,
	[AMes_6] [money] NOT NULL,
	[AMes_7] [money] NOT NULL,
	[AMes_8] [money] NOT NULL,
	[AMes_9] [money] NOT NULL,
	[AMes_10] [money] NOT NULL,
	[AMes_11] [money] NOT NULL,
	[AMes_12] [money] NOT NULL,
	[ASal_1] [money] NOT NULL,
	[ASal_2] [money] NOT NULL,
	[ASal_3] [money] NOT NULL,
	[ASal_4] [money] NOT NULL,
	[ASal_5] [money] NOT NULL,
	[ASal_6] [money] NOT NULL,
	[ASal_7] [money] NOT NULL,
	[ASal_8] [money] NOT NULL,
	[ASal_9] [money] NOT NULL,
	[ASal_10] [money] NOT NULL,
	[ASal_11] [money] NOT NULL,
	[ASal_12] [money] NOT NULL,
	[PMes_1] [money] NOT NULL,
	[PMes_2] [money] NOT NULL,
	[PMes_3] [money] NOT NULL,
	[PMes_4] [money] NOT NULL,
	[PMes_5] [money] NOT NULL,
	[PMes_6] [money] NOT NULL,
	[PMes_7] [money] NOT NULL,
	[PMes_8] [money] NOT NULL,
	[PMes_9] [money] NOT NULL,
	[PMes_10] [money] NOT NULL,
	[PMes_11] [money] NOT NULL,
	[PMes_12] [money] NOT NULL,
	[PSal_1] [money] NOT NULL,
	[PSal_2] [money] NOT NULL,
	[PSal_3] [money] NOT NULL,
	[PSal_4] [money] NOT NULL,
	[PSal_5] [money] NOT NULL,
	[PSal_6] [money] NOT NULL,
	[PSal_7] [money] NOT NULL,
	[PSal_8] [money] NOT NULL,
	[PSal_9] [money] NOT NULL,
	[PSal_10] [money] NOT NULL,
	[PSal_11] [money] NOT NULL,
	[PSal_12] [money] NOT NULL,
	[PPres_1] [money] NOT NULL,
	[PPres_2] [money] NOT NULL,
	[PPres_3] [money] NOT NULL,
	[PPres_4] [money] NOT NULL,
	[PPres_5] [money] NOT NULL,
	[PPres_6] [money] NOT NULL,
	[PPres_7] [money] NOT NULL,
	[PPres_8] [money] NOT NULL,
	[PPres_9] [money] NOT NULL,
	[PPres_10] [money] NOT NULL,
	[PPres_11] [money] NOT NULL,
	[PPres_12] [money] NOT NULL,
	[PAPres_1] [money] NOT NULL,
	[PAPres_2] [money] NOT NULL,
	[PAPres_3] [money] NOT NULL,
	[PAPres_4] [money] NOT NULL,
	[PAPres_5] [money] NOT NULL,
	[PAPres_6] [money] NOT NULL,
	[PAPres_7] [money] NOT NULL,
	[PAPres_8] [money] NOT NULL,
	[PAPres_9] [money] NOT NULL,
	[PAPres_10] [money] NOT NULL,
	[PAPres_11] [money] NOT NULL,
	[PAPres_12] [money] NOT NULL,
	[PAMes_1] [money] NOT NULL,
	[PAMes_2] [money] NOT NULL,
	[PAMes_3] [money] NOT NULL,
	[PAMes_4] [money] NOT NULL,
	[PAMes_5] [money] NOT NULL,
	[PAMes_6] [money] NOT NULL,
	[PAMes_7] [money] NOT NULL,
	[PAMes_8] [money] NOT NULL,
	[PAMes_9] [money] NOT NULL,
	[PAMes_10] [money] NOT NULL,
	[PAMes_11] [money] NOT NULL,
	[PAMes_12] [money] NOT NULL,
	[PASal_1] [money] NOT NULL,
	[PASal_2] [money] NOT NULL,
	[PASal_3] [money] NOT NULL,
	[PASal_4] [money] NOT NULL,
	[PASal_5] [money] NOT NULL,
	[PASal_6] [money] NOT NULL,
	[PASal_7] [money] NOT NULL,
	[PASal_8] [money] NOT NULL,
	[PASal_9] [money] NOT NULL,
	[PASal_10] [money] NOT NULL,
	[PASal_11] [money] NOT NULL,
	[PASal_12] [money] NOT NULL,
 CONSTRAINT [PK_001CONP3] PRIMARY KEY CLUSTERED 
(
	[Rubro] ASC,
	[Secuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONP04]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONP04](
	[Cia] [varchar](3) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Hora] [datetime] NOT NULL,
 CONSTRAINT [PK_001CONP04] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONSUB]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONSUB](
	[Tipo_Cuenta] [varchar](1) NOT NULL,
	[Clasificacion] [varchar](2) NOT NULL,
	[Subclasificacion] [varchar](2) NOT NULL,
	[Descripcion_1] [varchar](30) NOT NULL,
	[Descripcion_2] [varchar](30) NULL,
 CONSTRAINT [PK_001CO02] PRIMARY KEY CLUSTERED 
(
	[Tipo_Cuenta] ASC,
	[Clasificacion] ASC,
	[Subclasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CONTC]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[001CONTC](
	[Fecha] [datetime] NOT NULL,
	[TipoCambio] [money] NOT NULL,
 CONSTRAINT [PK_001CONTC] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[001CONTIPOL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CONTIPOL](
	[Tipo_Poliza] [varchar](2) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_01CONTIPOL] PRIMARY KEY CLUSTERED 
(
	[Tipo_Poliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSART]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSART](
	[Codigo_Articulo] [varchar](8) NOT NULL,
	[Costo_Prom] [money] NOT NULL,
	[Cant_Articulo] [float] NOT NULL,
	[Unidad_Medida] [varchar](2) NOT NULL,
	[Cant_Util] [float] NOT NULL,
	[Costo_Real]  AS ([Costo_Prom] / ([Cant_Articulo] / [Cant_Util])),
 CONSTRAINT [PK_001COSART] PRIMARY KEY CLUSTERED 
(
	[Codigo_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSCONV]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSCONV](
	[Uni_Pricipal] [varchar](2) NOT NULL,
	[Uni_Conv] [varchar](2) NOT NULL,
	[Conv] [float] NOT NULL,
 CONSTRAINT [PK_001COSCONV] PRIMARY KEY CLUSTERED 
(
	[Uni_Pricipal] ASC,
	[Uni_Conv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSINV]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSINV](
	[Depto] [varchar](4) NOT NULL,
	[Cod_Art] [bigint] NOT NULL,
	[Exis_Dia] [float] NOT NULL,
	[Exis_Mes] [float] NOT NULL,
	[Exis_Per] [float] NOT NULL,
	[Ent_Dia] [float] NOT NULL,
	[Ent_Mes] [float] NOT NULL,
	[Ent_Per] [float] NOT NULL,
	[Sal_Dia] [float] NOT NULL,
	[Sal_Mes] [float] NOT NULL,
	[Sal_Per] [float] NOT NULL,
	[Devalm_Dia] [float] NOT NULL,
	[Devalm_Mes] [float] NOT NULL,
	[Devalm_Per] [float] NOT NULL,
	[Ajus_Dia] [float] NOT NULL,
	[Ajus_Med] [float] NOT NULL,
	[Ajus_Per] [float] NOT NULL,
	[Tras_Dia] [float] NOT NULL,
	[Tras_Mes] [float] NOT NULL,
	[Tras_Per] [float] NOT NULL,
	[Unidad] [varchar](2) NOT NULL,
	[Cos_Dia] [money] NOT NULL,
	[Cos_Mes] [money] NOT NULL,
	[Cos_Per] [money] NOT NULL,
	[Fecha_UE] [datetime] NULL,
	[Fecha_US] [datetime] NULL,
	[Fecha_UAJ] [datetime] NULL,
	[Fecha_UDA] [datetime] NULL,
 CONSTRAINT [PK_001COSINV] PRIMARY KEY CLUSTERED 
(
	[Depto] ASC,
	[Cod_Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSRCG]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSRCG](
	[Codigo_Receta] [bigint] IDENTITY(1,1) NOT NULL,
	[Nom_RecEsp] [varchar](50) NOT NULL,
	[Nom_RecIng] [varchar](50) NULL,
	[Porciones] [float] NOT NULL,
	[Precio_Venta] [money] NULL,
	[Unidad] [varchar](2) NOT NULL,
	[Porc_Inprod] [float] NOT NULL,
 CONSTRAINT [PK_001COSRCG] PRIMARY KEY CLUSTERED 
(
	[Codigo_Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSRCL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSRCL](
	[Cod_Receta] [bigint] NOT NULL,
	[No_Linea] [int] NOT NULL,
	[Cod_Art] [varchar](8) NULL,
	[Cod_Subrec] [bigint] NULL,
	[Uni_Med] [varchar](2) NOT NULL,
	[Cantidad] [float] NOT NULL,
 CONSTRAINT [PK_001COSRCL] PRIMARY KEY CLUSTERED 
(
	[Cod_Receta] ASC,
	[No_Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001COSUNI]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001COSUNI](
	[Codigo_Unidad] [varchar](2) NOT NULL,
	[Nom_UniEsp] [varchar](50) NOT NULL,
	[Nom_UniIng] [varchar](50) NULL,
 CONSTRAINT [PK_001COSUNI] PRIMARY KEY CLUSTERED 
(
	[Codigo_Unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPBAN]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPBAN](
	[Codigo_Banco] [varchar](2) NOT NULL,
	[Nombre_Banco] [varchar](70) NOT NULL,
	[Numero_Cheque] [varchar](10) NOT NULL,
	[Cta_Contable] [varchar](20) NOT NULL,
	[Tipo_Poliza] [varchar](2) NOT NULL,
	[Dolares] [bit] NOT NULL,
 CONSTRAINT [PK_001CXPBAN] PRIMARY KEY CLUSTERED 
(
	[Codigo_Banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCAR]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCAR](
	[Cod_Provedor] [varchar](6) NOT NULL,
	[Num_Factura] [varchar](6) NOT NULL,
	[Codigo_Cargo] [varchar](2) NOT NULL,
	[Codigo_Banco] [varchar](2) NOT NULL,
	[Num_Cheque] [varchar](10) NOT NULL,
	[Fecha_Fec] [datetime] NULL,
	[Fecha_Ven] [datetime] NULL,
	[Fecha_Mov] [datetime] NULL,
	[Comentarios] [varchar](50) NULL,
	[Importe] [money] NOT NULL,
	[Libre_1] [varchar](25) NULL,
	[Libre_2] [varchar](15) NULL,
	[Libre_3] [varchar](25) NULL,
	[Libre_4] [varchar](15) NULL,
 CONSTRAINT [PK_001CXPCAR] PRIMARY KEY CLUSTERED 
(
	[Cod_Provedor] ASC,
	[Num_Factura] ASC,
	[Codigo_Cargo] ASC,
	[Codigo_Banco] ASC,
	[Num_Cheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCASA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCASA](
	[Periodo] [varchar](4) NOT NULL,
	[Tipo_PolL] [varchar](2) NOT NULL,
	[Num_PolL] [varchar](8) NOT NULL,
	[Linea] [int] NOT NULL,
	[Cuenta_Prov] [varchar](19) NOT NULL,
	[Factura] [varchar](10) NOT NULL,
	[Referencia] [varchar](10) NULL,
	[Fecha] [datetime] NOT NULL,
	[Concepto] [varchar](50) NULL,
	[Cargo] [money] NOT NULL,
	[Abono] [money] NOT NULL,
	[Casar] [bit] NOT NULL,
 CONSTRAINT [PK_001CXPCASA] PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC,
	[Tipo_PolL] ASC,
	[Num_PolL] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCAT]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCAT](
	[Codigo_Provedor] [varchar](6) NOT NULL,
	[Razon_Social] [varchar](70) NOT NULL,
	[Tipo_Provedor] [varchar](2) NULL,
	[Cuenta] [varchar](20) NULL,
	[Direccion] [varchar](100) NULL,
	[Colonia] [varchar](70) NULL,
	[Poblacion] [varchar](50) NULL,
	[CP] [varchar](7) NULL,
	[Telefono] [varchar](20) NULL,
	[No_Fax] [varchar](20) NULL,
	[E_Mail] [varchar](70) NULL,
	[Pag_Web] [varchar](70) NULL,
	[RFC] [varchar](20) NULL,
	[Contacto] [varchar](70) NULL,
	[Cta_Banco] [varchar](30) NULL,
	[Forma_Pago] [varchar](70) NULL,
	[Tiempo_Entrega] [varchar](25) NULL,
	[Descuento] [varchar](10) NULL,
	[Procede] [float] NOT NULL,
	[Iva] [float] NOT NULL,
	[Saldo_Mes_Actual] [varchar](15) NULL,
	[Saldo_Vencer] [varchar](15) NULL,
	[Saldo_30] [varchar](15) NULL,
	[Saldo_60] [varchar](15) NULL,
	[Saldo_90] [varchar](15) NULL,
	[Saldo_120] [varchar](15) NULL,
 CONSTRAINT [PK_001CXPCAT] PRIMARY KEY CLUSTERED 
(
	[Codigo_Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCHAU]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCHAU](
	[Banco] [varchar](2) NOT NULL,
	[Consec] [varchar](10) NOT NULL,
	[Provedor] [varchar](6) NOT NULL,
	[Factura] [varchar](6) NOT NULL,
	[Abono] [varchar](1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Notas] [varchar](50) NULL,
	[Libre] [varchar](10) NULL,
	[Importe] [varchar](20) NULL,
 CONSTRAINT [PK_001CXPCHAU] PRIMARY KEY CLUSTERED 
(
	[Banco] ASC,
	[Consec] ASC,
	[Provedor] ASC,
	[Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCHEQUES]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCHEQUES](
	[No_Banco] [varchar](2) NOT NULL,
	[No_Cheque] [varchar](10) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cod_Prov] [char](10) NULL,
	[Beneficiario] [varchar](100) NULL,
	[Concepto] [varchar](50) NULL,
	[Importe] [money] NOT NULL,
	[AbonoEnCuenta] [bit] NOT NULL,
	[Tipo_Cheque] [varchar](1) NOT NULL,
	[Impreso] [bit] NOT NULL,
	[Cancelado] [bit] NOT NULL,
	[Conciliado] [bit] NOT NULL,
	[Periodo] [varchar](4) NOT NULL,
	[Ope_Captura] [varchar](3) NULL,
	[Ope_Cancela] [varchar](3) NULL,
	[Motivo_Cancel] [varchar](50) NULL,
 CONSTRAINT [PK_001CXPCHEQUES] PRIMARY KEY CLUSTERED 
(
	[No_Banco] ASC,
	[No_Cheque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCHMA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCHMA](
	[Codigo_Banco] [varchar](2) NOT NULL,
	[No_Cheque] [varchar](10) NOT NULL,
	[Codigo_Prov] [varchar](6) NOT NULL,
	[Poliza] [varchar](4) NOT NULL,
	[Codigo] [varchar](1) NULL,
	[Fecha] [varchar](8) NULL,
	[Beneficiario] [varchar](70) NULL,
	[Concepto] [varchar](70) NULL,
	[Importe] [money] NULL,
	[Anticipo] [varchar](1) NULL,
	[Factura] [varchar](6) NULL,
	[Cta_Gastos] [varchar](20) NULL,
	[Tipo_Cam] [money] NULL,
	[Impreso] [varchar](1) NULL,
 CONSTRAINT [PK_001CXPCHMA] PRIMARY KEY CLUSTERED 
(
	[Codigo_Banco] ASC,
	[No_Cheque] ASC,
	[Codigo_Prov] ASC,
	[Poliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCOD]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCOD](
	[Numero_Codigo] [varchar](2) NOT NULL,
	[Tipo_Codigo] [varchar](1) NOT NULL,
	[Nombre_Codigo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_001CXPCOD] PRIMARY KEY CLUSTERED 
(
	[Numero_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPCTA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPCTA](
	[Cia] [varchar](3) NOT NULL,
	[Cuenta_1] [varchar](4) NOT NULL,
	[Cuenta_2] [varchar](4) NOT NULL,
	[Cuenta_3] [varchar](4) NOT NULL,
	[Cuenta_4] [varchar](4) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPFORCH]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPFORCH](
	[Folio] [varchar](6) NOT NULL,
	[Seccion] [varchar](1) NOT NULL,
	[Campo] [varchar](2) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[X] [varchar](6) NULL,
	[Y] [varchar](6) NULL,
	[Font] [varchar](20) NULL,
	[Tamano] [varchar](1) NULL,
	[Texto_Mascara] [varchar](20) NULL,
	[Longitud] [varchar](1) NULL,
	[Justifica] [varchar](1) NULL,
	[Valor] [varchar](20) NULL,
 CONSTRAINT [PK_001CXPFORCH] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC,
	[Seccion] ASC,
	[Campo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPHPEDO]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPHPEDO](
	[Terminal] [varchar](4) NOT NULL,
	[Cod_Provedor] [varchar](6) NOT NULL,
	[Num_Factura] [varchar](6) NOT NULL,
	[Codigo_Cargo] [varchar](2) NOT NULL,
	[Codigo_Banco] [varchar](2) NOT NULL,
	[Num_Cheque] [varchar](10) NOT NULL,
	[Fecha_Fec] [datetime] NULL,
	[Fecha_Ven] [datetime] NULL,
	[Fecha_Mov] [datetime] NULL,
	[Comentarios] [varchar](50) NULL,
	[Importe] [varchar](15) NULL,
	[Libre_1] [varchar](25) NULL,
	[Libre_2] [varchar](15) NULL,
	[Libre_3] [varchar](25) NULL,
	[Libre_4] [varchar](15) NULL,
 CONSTRAINT [PK_001CXPHPEDO] PRIMARY KEY CLUSTERED 
(
	[Terminal] ASC,
	[Cod_Provedor] ASC,
	[Num_Factura] ASC,
	[Codigo_Cargo] ASC,
	[Codigo_Banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPPAGOS]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPPAGOS](
	[Periodo] [varchar](4) NOT NULL,
	[Tipo_PolL] [varchar](2) NOT NULL,
	[Num_PolL] [varchar](8) NOT NULL,
	[Linea] [int] NOT NULL,
	[Banco] [varchar](2) NULL,
	[Cheque] [float] NULL,
	[Cuenta_Prov] [varchar](19) NOT NULL,
	[Factura] [varchar](10) NOT NULL,
	[Referencia] [varchar](10) NULL,
	[Fecha] [datetime] NOT NULL,
	[Concepto] [varchar](50) NULL,
	[Cargo] [money] NOT NULL,
	[Abono] [money] NOT NULL,
	[Pagar] [bit] NOT NULL,
	[Impreso] [bit] NOT NULL,
 CONSTRAINT [PK_001CXPPAGOS] PRIMARY KEY CLUSTERED 
(
	[Periodo] ASC,
	[Tipo_PolL] ASC,
	[Num_PolL] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPSAL]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPSAL](
	[Provedor] [varchar](6) NOT NULL,
	[Factura] [varchar](6) NOT NULL,
	[Factura_Fec] [datetime] NULL,
	[Factura_Vence] [datetime] NULL,
	[Saldo_1] [money] NULL,
	[Saldio_2] [money] NULL,
	[Pago] [money] NULL,
 CONSTRAINT [PK_001CXPSAL] PRIMARY KEY CLUSTERED 
(
	[Provedor] ASC,
	[Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001CXPTIP]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001CXPTIP](
	[Codigo_Tipo] [varchar](2) NOT NULL,
	[Nombre_Tipo] [varchar](50) NOT NULL,
	[Cta_Contable] [varchar](20) NOT NULL,
 CONSTRAINT [PK_001CXPTIP] PRIMARY KEY CLUSTERED 
(
	[Codigo_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001FOLIOSPASO]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001FOLIOSPASO](
	[FOLIO] [varchar](20) NOT NULL,
	[APELLIDO] [varchar](80) NULL,
	[NOMBRE] [varchar](80) NULL,
	[LLEGADA] [datetime] NULL,
	[NOCHES] [smallint] NULL,
	[SALIDA] [datetime] NULL,
	[CUARTOS] [smallint] NULL,
	[CVE TIPO CUARTO] [varchar](20) NULL,
	[ADULTOS] [smallint] NULL,
	[NINOS] [smallint] NULL,
	[TARIFA] [money] NULL,
	[DIRECCION] [varchar](250) NULL,
	[CIUDAD] [varchar](20) NULL,
	[CVE EMPRESA] [varchar](20) NULL,
	[PROC RVA] [varchar](20) NULL,
	[GRUPO] [varchar](20) NULL,
	[AGENCIA] [varchar](20) NULL,
	[PLAN] [varchar](20) NULL,
	[F PAGO] [varchar](20) NULL,
	[NO TARJETA] [varchar](100) NULL,
	[L CREDITO] [money] NULL,
	[CVE SRC] [varchar](10) NULL,
	[CVE SRC VENTAS] [varchar](10) NULL,
	[CVE CRO] [varchar](10) NULL,
	[CVE VIP] [varchar](10) NULL,
	[CVE GARANTIA] [varchar](10) NULL,
	[FECHA LIMITE] [varchar](10) NULL,
	[CVE CTE FRECUENTE] [varchar](20) NULL,
	[FOLIO MAESTRA] [varchar](20) NULL,
	[SW] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[CONTACTO] [varchar](80) NULL,
	[CVE CONTRATO TC] [varchar](100) NULL,
	[HORA ENT] [datetime] NULL,
	[HORA SAL] [datetime] NULL,
	[CVE CUARTO] [varchar](20) NULL,
	[NOTAS] [varchar](250) NULL,
	[FECHA RVA] [datetime] NULL,
	[DEPOSITO] [money] NULL,
	[SALDO] [money] NULL,
	[ESTATUS] [varchar](2) NULL,
	[MENORES] [smallint] NULL,
	[JUNIORS] [smallint] NULL,
	[TARIFA RACK] [money] NULL,
	[LLEGADA ORIGINAL] [varchar](10) NULL,
	[SALIDA ORIGINAL] [varchar](10) NULL,
	[CXC] [varchar](20) NULL,
	[BANDA] [varchar](20) NULL,
	[CUPON] [varchar](20) NULL,
	[GALA 100] [varchar](50) NULL,
	[TARIFA CENTRAL] [money] NULL,
	[TARIFA TOUR OPERADOR] [money] NULL,
	[ARCHIVO FIRMA] [varchar](30) NULL,
	[FECHA RVA ORIGINAL] [datetime] NULL,
	[TOTAL ESTANCIA] [money] NULL,
	[MEDIO] [varchar](50) NULL,
	[COMISION] [varchar](10) NULL,
	[ENVIADA] [varchar](2) NULL,
	[AFECTA ALLOTMENT GALA] [varchar](2) NULL,
	[FECHA MANIFIESTO] [datetime] NULL,
	[CALCULO TARIFA] [varchar](2) NULL,
	[CAMPO 61] [varchar](2) NULL,
	[CAMPO 62] [varchar](2) NULL,
	[CAMPO 63] [varchar](2) NULL,
	[CAMPO 64] [varchar](2) NULL,
	[CAMPO 65] [varchar](2) NULL,
	[CAMPO 66] [varchar](2) NULL,
	[CAMPO 67] [varchar](2) NULL,
	[CAMPO 68] [varchar](2) NULL,
	[CAMPO 69] [varchar](2) NULL,
	[CAMPO 70] [varchar](2) NULL,
	[CAMPO 71] [varchar](2) NULL,
	[CAMPO 72] [varchar](2) NULL,
	[CAMPO 73] [varchar](2) NULL,
	[CAMPO 74] [varchar](2) NULL,
	[CAMPO 75] [varchar](2) NULL,
	[CAMPO 76] [varchar](2) NULL,
	[CAMPO 77] [varchar](2) NULL,
	[CAMPO 78] [varchar](2) NULL,
	[CAMPO 79] [varchar](2) NULL,
	[CAMPO 80] [varchar](2) NULL,
	[CONSECUTIVO] [bigint] NULL,
	[COMPROBANTE] [varchar](15) NULL,
 CONSTRAINT [PK_001FOLIOSPASO] PRIMARY KEY CLUSTERED 
(
	[FOLIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVALM]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVALM](
	[Codigo_Almacen] [varchar](4) NOT NULL,
	[Descripcion_Espanol] [varchar](40) NOT NULL,
	[Descripcion_Ingles] [varchar](40) NULL,
	[Cta_Contable] [varchar](19) NULL,
	[Libre] [varchar](50) NULL,
 CONSTRAINT [PK_001INVALM] PRIMARY KEY CLUSTERED 
(
	[Codigo_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVART]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVART](
	[Cod_Art] [bigint] IDENTITY(1,1) NOT NULL,
	[Cod_Barras] [varchar](18) NOT NULL,
	[Desc_Esp] [varchar](100) NOT NULL,
	[Desc_Ing] [varchar](100) NULL,
	[Alm] [varchar](4) NOT NULL,
	[Sub_Alm] [varchar](4) NOT NULL,
	[IVA] [float] NOT NULL,
	[Notas] [varchar](50) NULL,
	[Prov_1] [varchar](6) NOT NULL,
	[Prov_2] [varchar](6) NOT NULL,
	[Maximo] [numeric](19, 0) NOT NULL,
	[Minimo] [numeric](19, 0) NOT NULL,
	[Reorden] [numeric](19, 0) NOT NULL,
	[Uni_Ent] [varchar](10) NOT NULL,
	[Uni_Sal] [varchar](10) NOT NULL,
	[Conver] [varchar](3) NOT NULL,
	[Precio_Venta] [money] NOT NULL,
	[Consignacion] [bit] NOT NULL,
	[Taza0] [bit] NULL,
	[Receta] [bigint] NOT NULL,
	[Paquete] [bit] NOT NULL,
	[Caracteristicas1] [varchar](50) NULL,
	[Caracteristicas2] [varchar](50) NULL,
	[Caracteristicas3] [varchar](50) NULL,
	[RutaImagen] [varchar](50) NULL,
 CONSTRAINT [PK_001INVART] PRIMARY KEY CLUSTERED 
(
	[Cod_Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVDEP]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVDEP](
	[Cod_Dep] [varchar](4) NOT NULL,
	[Desc_Esp] [varchar](50) NOT NULL,
	[Desc_Ing] [varchar](50) NULL,
	[Cta_Mayor] [varchar](4) NULL,
	[Cta_Nivel] [varchar](4) NULL,
	[Inventario] [bit] NOT NULL,
 CONSTRAINT [PK_001INVDEP] PRIMARY KEY CLUSTERED 
(
	[Cod_Dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVDEPCTAS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVDEPCTAS](
	[Cod_Dep] [varchar](4) NOT NULL,
	[Cod_Alma] [varchar](4) NOT NULL,
	[Cod_Sub] [varchar](4) NOT NULL,
	[Cuenta_1] [varchar](4) NOT NULL,
	[Cuenta_2] [varchar](4) NOT NULL,
	[Cuenta_3] [varchar](4) NOT NULL,
	[Cuenta_4] [varchar](4) NOT NULL,
	[Depto] [bit] NOT NULL,
	[Subalma] [bit] NOT NULL,
	[Cuenta] [bit] NOT NULL,
 CONSTRAINT [PK_001INVDEPCTAS] PRIMARY KEY CLUSTERED 
(
	[Cod_Dep] ASC,
	[Cod_Alma] ASC,
	[Cod_Sub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVDIV]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVDIV](
	[Divisa] [varchar](3) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[TipoCambio] [float] NOT NULL,
 CONSTRAINT [PK_001INVDIV] PRIMARY KEY CLUSTERED 
(
	[Divisa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVEST]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVEST](
	[Cod_Art] [bigint] NOT NULL,
	[Exis_Dia] [float] NOT NULL,
	[Exis_Mes] [float] NOT NULL,
	[Exis_Per] [float] NOT NULL,
	[Ent_Dia] [float] NOT NULL,
	[Ent_Mes] [float] NOT NULL,
	[Ent_Per] [float] NOT NULL,
	[Sal_Dia] [float] NOT NULL,
	[Sal_Mes] [float] NOT NULL,
	[Sal_Per] [float] NOT NULL,
	[Devpro_Dia] [float] NOT NULL,
	[Devpro_Mes] [float] NOT NULL,
	[Devpro_Per] [float] NOT NULL,
	[Devalm_Dia] [float] NOT NULL,
	[Devalm_Mes] [float] NOT NULL,
	[Devalm_Per] [float] NOT NULL,
	[Ajus_Dia] [float] NOT NULL,
	[Ajus_Mes] [float] NOT NULL,
	[Ajus_Per] [float] NOT NULL,
	[Cos_UE] [money] NOT NULL,
	[Cos_Prom] [money] NOT NULL,
	[Cos_Ant] [money] NOT NULL,
	[TotalActual]  AS ([Exis_Dia] * [Cos_Prom]),
	[Fecha_UE] [datetime] NULL,
	[Fecha_US] [datetime] NULL,
	[Fecha_UA] [datetime] NULL,
	[Fecha_UDP] [datetime] NULL,
	[Fecha_UDD] [datetime] NULL,
	[Req_UE] [varchar](10) NULL,
	[Req_US] [varchar](10) NULL,
	[Req_UA] [varchar](10) NULL,
	[Req_UDP] [varchar](10) NULL,
	[Req_UDD] [varchar](10) NULL,
	[Merm_Dia] [float] NOT NULL,
	[Merm_Mes] [float] NOT NULL,
	[Merm_Per] [float] NOT NULL,
 CONSTRAINT [PK_001INVEST] PRIMARY KEY CLUSTERED 
(
	[Cod_Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVFECH]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[001INVFECH](
	[Fecha] [datetime] NOT NULL,
	[Cerrado] [bit] NOT NULL,
 CONSTRAINT [PK_001INVFECH] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[001INVFISICO]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVFISICO](
	[Cod_Art] [bigint] NOT NULL,
	[Inv_Fisico] [float] NOT NULL,
	[Costo_Promedio] [money] NOT NULL,
	[Iniciales] [varchar](3) NOT NULL,
	[Fecha_Captura] [datetime] NOT NULL,
 CONSTRAINT [PK_001INVFISICO] PRIMARY KEY CLUSTERED 
(
	[Cod_Art] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVGEN]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVGEN](
	[Ind_Mov] [bigint] IDENTITY(1,1) NOT NULL,
	[No_Req] [varchar](10) NOT NULL,
	[Tipo_Mov] [varchar](3) NOT NULL,
	[Fech_Mov] [datetime] NOT NULL,
	[Fech_Sis] [datetime] NOT NULL,
	[Cod_Prov] [varchar](6) NULL,
	[Cod_Dep] [varchar](4) NULL,
	[Notas] [varchar](200) NULL,
	[Total_Fac] [float] NOT NULL,
	[Iva_Fac] [float] NOT NULL,
	[Cod_Ope] [varchar](3) NOT NULL,
	[Stat_Mov] [bit] NOT NULL,
	[Ope_Aut] [varchar](3) NULL,
	[Stat_Aut] [bit] NOT NULL,
	[Entrada_Directa] [bit] NOT NULL,
	[No_Pedido] [bigint] NOT NULL,
	[Referencia] [varchar](10) NOT NULL,
	[Aplicado] [bit] NOT NULL,
	[Ope_Aplica] [varchar](3) NOT NULL,
	[Tpro] [money] NOT NULL,
	[Tdes] [money] NOT NULL,
	[Pagado] [money] NOT NULL,
	[Ini_cierre] [varchar](3) NOT NULL,
	[St] [varchar](1) NOT NULL,
	[Horaci] [datetime] NOT NULL,
	[Tiva] [money] NOT NULL,
	[Tal] [money] NOT NULL,
	[Tbeb] [money] NOT NULL,
	[Hab] [varchar](50) NULL,
	[Huesped] [varchar](50) NULL,
	[Folio] [varchar](50) NULL,
	[Tt0] [money] NULL,
 CONSTRAINT [PK_001INVGEN] PRIMARY KEY CLUSTERED 
(
	[Ind_Mov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVLIN]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVLIN](
	[Indice] [bigint] NOT NULL,
	[Linea] [int] NOT NULL,
	[Cod_Art] [bigint] NOT NULL,
	[Can] [float] NOT NULL,
	[Costo] [money] NOT NULL,
	[Total]  AS ([Can] * [Costo]),
	[Cta_Con] [varchar](16) NULL,
	[Serie] [varchar](100) NULL,
 CONSTRAINT [PK_001INVLIN] PRIMARY KEY CLUSTERED 
(
	[Indice] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVMED]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVMED](
	[Codigo_Unidad] [varchar](10) NOT NULL,
	[Tipo] [varchar](1) NOT NULL,
	[Descripcion_Espanol] [varchar](40) NOT NULL,
	[Descripcion_Ingles] [varchar](40) NULL,
 CONSTRAINT [PK_001INVMED] PRIMARY KEY CLUSTERED 
(
	[Codigo_Unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVSUB]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVSUB](
	[Cod_Almacen] [varchar](4) NOT NULL,
	[Cod_Subalmacen] [varchar](4) NOT NULL,
	[Descripcion_Espanol] [varchar](40) NULL,
	[Descripcion_Ingles] [varchar](40) NULL,
	[Cuenta_Abono] [varchar](16) NULL,
	[Cuenta_Cargo1] [varchar](16) NULL,
	[Cuenta_Cargo2] [varchar](16) NULL,
	[Libre] [varchar](50) NULL,
 CONSTRAINT [PK_001INVSUB] PRIMARY KEY CLUSTERED 
(
	[Cod_Almacen] ASC,
	[Cod_Subalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001INVTIPOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001INVTIPOS](
	[Cod_Tip] [varchar](3) NOT NULL,
	[Desc_Tip] [varchar](50) NOT NULL,
 CONSTRAINT [PK_001INVTIPOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Tip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001VTSCOMI]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001VTSCOMI](
	[PDV] [char](4) NOT NULL,
	[Ope] [char](3) NOT NULL,
	[Mov] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Importe_Total] [money] NOT NULL,
	[Importe] [money] NOT NULL,
	[Comision] [float] NOT NULL,
	[Imp_Comision] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001VTSDIA]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001VTSDIA](
	[Cod_Art] [bigint] NOT NULL,
	[Desc_Esp] [varchar](100) NOT NULL,
	[Can] [real] NOT NULL,
	[Costo] [money] NOT NULL,
	[TotalC] [money] NOT NULL,
	[Venta] [money] NOT NULL,
	[Totalv] [money] NOT NULL,
	[Util] [float] NULL,
	[Iva] [money] NOT NULL,
	[Total]  AS ([Iva] + [Totalv]),
	[PorcCosto]  AS (100 - [Util]),
	[Grupo] [varchar](4) NOT NULL,
	[Proveedor] [varchar](6) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[001VTSDIAT]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[001VTSDIAT](
	[Cod_Art] [bigint] NULL,
	[Desc_Esp] [varchar](100) NULL,
	[Can] [real] NULL,
	[Costo] [money] NULL,
	[TotalC] [money] NULL,
	[Venta] [money] NULL,
	[Totalv] [money] NULL,
	[Util] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARPMENUS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARPMENUS](
	[No_de_Menu] [varchar](6) NOT NULL,
	[Descripcion_Espanol] [varchar](50) NOT NULL,
	[Descripcion_Ingles] [varchar](50) NULL,
	[Password] [varchar](10) NULL,
	[Terminal] [varchar](2) NULL,
	[Visible] [bit] NOT NULL,
	[Nombre_programa] [varchar](100) NULL,
	[Maestro] [varchar](50) NULL,
 CONSTRAINT [PK_ARPMENUS_1] PRIMARY KEY CLUSTERED 
(
	[No_de_Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTICULOS_DIRECTOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS_DIRECTOS](
	[Boton] [int] NOT NULL,
	[Articulo] [bigint] NOT NULL,
 CONSTRAINT [PK_ARTICULOS_DIRECTOS] PRIMARY KEY CLUSTERED 
(
	[Boton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CARAB]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CARAB](
	[CarAbo] [varchar](5) NOT NULL,
	[DescAC] [varchar](50) NOT NULL,
	[Tipo] [varchar](1) NOT NULL,
	[Nivel] [smallint] NOT NULL,
	[Porc] [float] NOT NULL,
	[Cta_Contable] [varchar](20) NOT NULL,
	[Abre_Caja] [bit] NOT NULL,
	[Div] [varchar](3) NOT NULL,
 CONSTRAINT [PK_CARAB] PRIMARY KEY CLUSTERED 
(
	[CarAbo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[Rfc] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Razon_Social] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Num_Cedula] [varchar](20) NULL,
	[Direccion] [varchar](200) NULL,
	[Colonia] [varchar](100) NULL,
	[CP] [varchar](20) NULL,
	[Entre_Calles] [varchar](100) NULL,
	[Delegacion_Municipio] [varchar](100) NULL,
	[Ciudad] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Rfc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONMAESTRO]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONMAESTRO](
	[Codigo_Cia] [varchar](3) NOT NULL,
	[Razon_Social] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Colonia] [varchar](100) NULL,
	[Entidad_Federativa] [varchar](50) NULL,
	[Municipio_Delegacion] [varchar](50) NULL,
	[Codigo_Postal] [varchar](10) NULL,
	[Periodo] [varchar](4) NOT NULL,
	[Cuenta_Resultado] [varchar](16) NOT NULL,
	[Fecha_Proceso] [varchar](12) NULL,
	[Nombre_Base] [varchar](50) NULL,
	[Directorio_Trabajo] [varchar](50) NULL,
	[Cadena_Conn] [varchar](200) NULL,
	[Cuenta_Proveedores] [varchar](16) NULL,
	[Cuenta_Clientes] [varchar](16) NULL,
	[Cuenta_Iva] [varchar](16) NULL,
	[Impuesto_Hospedaje_ISHR] [float] NULL,
	[Factor_Servicio] [float] NULL,
	[Consecutivo_Factura] [varchar](6) NULL,
	[Tipo_Cambio] [money] NULL,
 CONSTRAINT [PK_CONMAESTRO] PRIMARY KEY CLUSTERED 
(
	[Codigo_Cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CXCCONSE]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CXCCONSE](
	[Cia] [varchar](3) NOT NULL,
	[ConFac] [bigint] NOT NULL,
 CONSTRAINT [PK_CXCCONSE] PRIMARY KEY CLUSTERED 
(
	[Cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DESCUENTOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESCUENTOS](
	[INDICE] [bigint] NOT NULL,
	[LINEA] [int] NOT NULL,
	[ARTICULO] [bigint] NOT NULL,
	[DESCUENTO] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[INDICE] ASC,
	[LINEA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIVALENCIAS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EQUIVALENCIAS](
	[Articulo] [bigint] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Articulo_Equivalente] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Articulo] ASC,
	[Articulo_Equivalente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FACTURA](
	[Clave] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[CurrentX] [int] NOT NULL,
	[CurrentY] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Clave] ASC,
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FECHAS_AFECTACION]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FECHAS_AFECTACION](
	[Fecha] [varchar](10) NULL,
	[Porcentaje] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fondo_Caja]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fondo_Caja](
	[Clave] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Cant] [bigint] NOT NULL,
 CONSTRAINT [PK_Fondo_Caja] PRIMARY KEY CLUSTERED 
(
	[Clave] ASC,
	[Valor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LLARPLINEAS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LLARPLINEAS](
	[Opcion] [varchar](10) NOT NULL,
	[Nombre_de_Opcion] [varchar](30) NOT NULL,
	[Password] [varchar](10) NULL,
	[Terminal] [varchar](2) NULL,
 CONSTRAINT [PK_ARPLINEAS] PRIMARY KEY CLUSTERED 
(
	[Opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LLARPMENUS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LLARPMENUS](
	[No_de_Menu] [varchar](6) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
	[Password] [varchar](10) NULL,
	[Terminal] [varchar](2) NULL,
	[Servidor] [varchar](10) NULL,
	[Visible] [varchar](10) NULL,
 CONSTRAINT [PK_ARPMENUS] PRIMARY KEY CLUSTERED 
(
	[No_de_Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NUEVA]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NUEVA](
	[Codigo_Cliente] [varchar](20) NOT NULL,
	[Razon_Social] [varchar](70) NULL,
	[Nombre_Comercial] [varchar](70) NULL,
	[Tipo_Cliente] [varchar](2) NULL,
	[Cuenta_Contable] [varchar](19) NULL,
	[Direccion] [varchar](70) NULL,
	[Colonia] [varchar](70) NULL,
	[Poblacion] [varchar](50) NULL,
	[CP] [varchar](7) NULL,
	[Telefono] [varchar](15) NULL,
	[No_Fax] [varchar](15) NULL,
	[E_Mail] [varchar](70) NULL,
	[Pag_Web] [varchar](70) NULL,
	[RFC] [varchar](20) NULL,
	[Contacto] [varchar](70) NULL,
	[Descuento] [varchar](15) NULL,
	[Procede] [varchar](25) NULL,
	[Saldo_Mes_Actual] [money] NULL,
	[Saldo_Vencer] [money] NULL,
	[Saldo_30] [money] NULL,
	[Saldo_60] [money] NULL,
	[Saldo_90] [money] NULL,
	[Saldo_120] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAGOSPDV]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAGOSPDV](
	[Clave_PDV] [varchar](4) NOT NULL,
	[Che] [bigint] NOT NULL,
	[Fpag] [varchar](5) NOT NULL,
	[Consec] [smallint] NOT NULL,
	[Folio] [varchar](10) NULL,
	[Importe] [money] NOT NULL,
	[Hab] [varchar](10) NULL,
	[No_Cuenta] [varchar](50) NULL,
	[Fecha_vencimiento] [datetime] NULL,
	[No_Aprobacion] [varchar](50) NULL,
	[Fecha_Aprobacion] [datetime] NULL,
	[Razon_Ampliacion] [varchar](200) NULL,
	[Notas] [varchar](200) NULL,
	[Orden] [smallint] NULL,
	[Importe_Real] [money] NOT NULL,
	[TipoCambio] [money] NOT NULL,
	[Comision] [float] NULL,
	[Vendedor] [nvarchar](3) NULL,
 CONSTRAINT [PK_01PAGOSPDV] PRIMARY KEY CLUSTERED 
(
	[Clave_PDV] ASC,
	[Che] ASC,
	[Fpag] ASC,
	[Consec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAGOSPDVTEMPO]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAGOSPDVTEMPO](
	[Terminal] [varchar](10) NOT NULL,
	[Clave_PDV] [varchar](4) NOT NULL,
	[Che] [bigint] NOT NULL,
	[Fpag] [varchar](5) NOT NULL,
	[Consec] [smallint] NOT NULL,
	[Folio] [varchar](10) NULL,
	[Importe] [money] NOT NULL,
	[Hab] [varchar](10) NULL,
	[No_Cuenta] [varchar](50) NULL,
	[Fecha_vencimiento] [datetime] NULL,
	[No_Aprobacion] [varchar](50) NULL,
	[Fecha_Aprobacion] [datetime] NULL,
	[Razon_Ampliacion] [varchar](200) NULL,
	[Notas] [varchar](200) NULL,
	[Orden] [smallint] NOT NULL,
	[Importe_real] [money] NOT NULL,
	[TipoCambio] [money] NOT NULL,
 CONSTRAINT [PK_PAGOSPDVTEMPO] PRIMARY KEY CLUSTERED 
(
	[Terminal] ASC,
	[Clave_PDV] ASC,
	[Che] ASC,
	[Fpag] ASC,
	[Consec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAQUETES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAQUETES](
	[ClaPaq] [varchar](4) NOT NULL,
	[NomPaq] [varchar](100) NOT NULL,
	[ClaArt] [varchar](4) NOT NULL,
	[NomArt] [varchar](100) NOT NULL,
	[CanArt] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaPaq] ASC,
	[ClaArt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PARAMETROS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PARAMETROS](
	[Parametro] [bigint] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Valor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PARAMETROS] PRIMARY KEY CLUSTERED 
(
	[Parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PDV]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PDV](
	[Clave_Pdv] [varchar](4) NOT NULL,
	[Nombre_Pdv] [varchar](75) NOT NULL,
	[Razon_Social] [varchar](75) NOT NULL,
	[Direccion1] [varchar](200) NULL,
	[Direccion2] [varchar](200) NULL,
	[Ciudad] [varchar](75) NULL,
	[Estado] [varchar](75) NULL,
	[Telefono] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Rfc] [varchar](20) NULL,
	[Tipo_Cambio] [money] NOT NULL,
	[Cod_Propinas] [varchar](5) NOT NULL,
	[Cod_Servicios] [varchar](5) NOT NULL,
	[Cod_Alimentos] [varchar](5) NOT NULL,
	[Cod_Bebidas] [varchar](5) NOT NULL,
	[Cod_Miscelaneos] [varchar](5) NOT NULL,
	[Cod_Descuentos] [varchar](5) NOT NULL,
	[Cod_Impuestos] [varchar](5) NOT NULL,
	[Per_Dia] [bigint] NOT NULL,
	[Per_Mes] [bigint] NOT NULL,
	[Per_Ano] [bigint] NOT NULL,
	[Ing_Ali_Dia] [money] NOT NULL,
	[Ing_Ali_Mes] [money] NOT NULL,
	[Ing_Ali_Ano] [money] NOT NULL,
	[Ing_Beb_Dia] [money] NOT NULL,
	[Ing_Beb_Mes] [money] NOT NULL,
	[Ing_Beb_Ano] [money] NOT NULL,
	[Ing_Mis_Dia] [money] NOT NULL,
	[Ing_Mis_Mes] [money] NOT NULL,
	[Ing_Mis_Ano] [money] NOT NULL,
	[Directorio_Hotel] [varchar](100) NULL,
	[Cod_Efectivo] [varchar](5) NOT NULL,
	[Impr_Comanda_Cuenta] [bit] NOT NULL,
	[Corta_Hoja] [bit] NOT NULL,
	[Abre_Caja] [bit] NOT NULL,
	[Imp_Lineas] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERFILES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERFILES](
	[Cod_Perfil] [varchar](4) NOT NULL,
	[Descripcion_Perfil] [varchar](100) NOT NULL,
	[Ac_Pla] [bit] NOT NULL,
	[Ac_Che] [bit] NOT NULL,
	[Ac_Hf] [bit] NOT NULL,
	[Mesero] [bit] NOT NULL,
	[Cajero] [bit] NULL,
	[Capitan] [bit] NULL,
	[Gerente] [bit] NULL,
	[Auditor] [bit] NULL,
	[Direccion] [bit] NULL,
	[Menus_Acceso] [varchar](30) NULL,
	[Programa_Default] [varchar](50) NULL,
	[Cancela_Platillo] [bit] NOT NULL,
	[Cancela_Cheque] [bit] NOT NULL,
	[Reimprime_Ticket] [bit] NOT NULL,
	[Descuentos] [bit] NOT NULL,
	[Cierre] [bit] NOT NULL,
 CONSTRAINT [PK_PERFILES] PRIMARY KEY CLUSTERED 
(
	[Cod_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PORCDESCTOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORCDESCTOS](
	[Id] [int] NOT NULL,
	[Porcentaje] [int] NULL,
 CONSTRAINT [PK_PORCDESCTOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POSICIONES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSICIONES](
	[Posicion] [varchar](50) NOT NULL,
	[menus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_POSICIONES] PRIMARY KEY CLUSTERED 
(
	[Posicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPCAMPOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPCAMPOS](
	[Reporte] [varchar](20) NOT NULL,
	[Campo] [varchar](2) NOT NULL,
	[Currentx] [float] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Mascara] [varchar](50) NOT NULL,
	[Texto Mascara] [varchar](50) NOT NULL,
	[Justifica] [varchar](1) NOT NULL,
	[Font] [varchar](50) NOT NULL,
	[Tamano] [varchar](50) NOT NULL,
	[Rayap1] [varchar](50) NOT NULL,
	[Rayap2] [varchar](50) NOT NULL,
	[Campo Principal] [float] NOT NULL,
	[Conversion] [varchar](50) NOT NULL,
	[Totaliza] [float] NOT NULL,
	[Ancho DBGrid] [float] NOT NULL,
 CONSTRAINT [PK_REPCAMPOS] PRIMARY KEY CLUSTERED 
(
	[Reporte] ASC,
	[Campo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPGENERALES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPGENERALES](
	[Reporte] [varchar](50) NOT NULL,
	[Linea] [varchar](20) NOT NULL,
	[Query Inicial] [varchar](50) NOT NULL,
	[Lineas] [float] NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[Orientacion] [float] NOT NULL,
	[Ancho Impresion] [float] NOT NULL,
	[Campo Gran Total] [float] NOT NULL,
	[Query Totales] [varchar](50) NOT NULL,
	[Con Subtotal] [varchar](50) NOT NULL,
	[Query Final] [varchar](50) NOT NULL,
	[DB Folio] [varchar](50) NOT NULL,
	[Imp Llegadas] [varchar](50) NOT NULL,
	[Imp Salidas] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REPGENERALES] PRIMARY KEY CLUSTERED 
(
	[Reporte] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORTE]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORTE](
	[Linea] [varchar](10) NOT NULL,
	[Campo 1] [varchar](250) NOT NULL,
	[Campo 2] [varchar](250) NOT NULL,
	[Campo 3] [varchar](250) NOT NULL,
	[Campo 4] [varchar](250) NOT NULL,
	[Campo 5] [varchar](250) NOT NULL,
	[Campo 6] [varchar](250) NOT NULL,
	[Campo 7] [varchar](250) NOT NULL,
	[Campo 8] [varchar](250) NOT NULL,
	[Campo 9] [varchar](250) NOT NULL,
	[Campo 10] [varchar](250) NOT NULL,
	[Campo 11] [varchar](250) NOT NULL,
	[Campo 12] [varchar](250) NOT NULL,
	[Campo 13] [varchar](250) NOT NULL,
	[Campo 14] [varchar](250) NOT NULL,
	[Campo 15] [varchar](250) NOT NULL,
	[Campo 16] [varchar](250) NOT NULL,
	[Campo 17] [varchar](250) NOT NULL,
	[Campo 18] [varchar](250) NOT NULL,
	[Campo 19] [varchar](250) NOT NULL,
	[Campo 20] [varchar](250) NOT NULL,
	[Campo 21] [varchar](250) NOT NULL,
	[Campo 22] [varchar](250) NOT NULL,
	[Campo 23] [varchar](250) NOT NULL,
	[Campo 24] [varchar](250) NOT NULL,
	[Campo 25] [varchar](250) NOT NULL,
	[Campo 26] [varchar](250) NOT NULL,
	[Campo 27] [varchar](250) NOT NULL,
	[Campo 28] [varchar](250) NOT NULL,
	[Campo 29] [varchar](250) NOT NULL,
	[Campo 30] [varchar](250) NOT NULL,
	[Ope] [varchar](3) NOT NULL,
	[Reporte] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REPORTE] PRIMARY KEY CLUSTERED 
(
	[Ope] ASC,
	[Reporte] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORTECXC]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORTECXC](
	[Linea] [varchar](10) NOT NULL,
	[Campo 1] [varchar](250) NOT NULL,
	[Campo 2] [varchar](250) NOT NULL,
	[Campo 3] [varchar](250) NOT NULL,
	[Campo 4] [varchar](250) NOT NULL,
	[Campo 5] [varchar](250) NOT NULL,
	[Campo 6] [varchar](250) NOT NULL,
	[Campo 7] [varchar](250) NOT NULL,
	[Campo 8] [varchar](250) NOT NULL,
	[Campo 9] [varchar](250) NOT NULL,
	[Campo 10] [varchar](250) NOT NULL,
	[Campo 11] [varchar](250) NOT NULL,
	[Campo 12] [varchar](250) NOT NULL,
	[Campo 13] [varchar](250) NOT NULL,
	[Campo 14] [varchar](250) NOT NULL,
	[Campo 15] [varchar](250) NOT NULL,
	[Campo 16] [varchar](250) NOT NULL,
	[Campo 17] [varchar](250) NOT NULL,
	[Campo 18] [varchar](250) NOT NULL,
	[Campo 19] [varchar](250) NOT NULL,
	[Campo 20] [varchar](250) NOT NULL,
	[Campo 21] [varchar](250) NOT NULL,
	[Campo 22] [varchar](250) NOT NULL,
	[Campo 23] [varchar](250) NOT NULL,
	[Campo 24] [varchar](250) NOT NULL,
	[Campo 25] [varchar](250) NOT NULL,
	[Campo 26] [varchar](250) NOT NULL,
	[Campo 27] [varchar](250) NOT NULL,
	[Campo 28] [varchar](250) NOT NULL,
	[Campo 29] [varchar](250) NOT NULL,
	[Campo 30] [varchar](250) NOT NULL,
	[Campo 31] [varchar](250) NOT NULL,
	[Campo 32] [varchar](250) NOT NULL,
	[Campo 33] [varchar](250) NOT NULL,
	[Campo 34] [varchar](250) NOT NULL,
	[Campo 35] [varchar](250) NOT NULL,
	[Ope] [varchar](3) NOT NULL,
	[Reporte] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REPORTECXC] PRIMARY KEY CLUSTERED 
(
	[Ope] ASC,
	[Reporte] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPTITULOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPTITULOS](
	[Titulo] [varchar](100) NOT NULL,
	[Texto] [varchar](100) NOT NULL,
	[Font] [varchar](50) NOT NULL,
	[Size] [varchar](10) NOT NULL,
	[Ope] [varchar](3) NOT NULL,
	[Reporte] [varchar](20) NOT NULL,
 CONSTRAINT [PK_REPTITULOS] PRIMARY KEY CLUSTERED 
(
	[Ope] ASC,
	[Reporte] ASC,
	[Titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SORTCOTI]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SORTCOTI](
	[Consecutivo] [smallint] NOT NULL,
	[Ope] [varchar](3) NOT NULL,
	[Cod_Prov] [varchar](6) NOT NULL,
	[Nombre_Prov] [varchar](100) NULL,
 CONSTRAINT [PK_SORTCOTI] PRIMARY KEY CLUSTERED 
(
	[Ope] ASC,
	[Cod_Prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TERMINAL]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TERMINAL](
	[Terminal] [varchar](50) NOT NULL,
	[Clave_Cia] [varchar](2) NOT NULL,
	[Ubicacion] [varchar](30) NULL,
	[Programa] [varchar](20) NULL,
	[Operador] [varchar](3) NULL,
	[Ruta] [varchar](50) NULL,
 CONSTRAINT [PK_TERMINAL] PRIMARY KEY CLUSTERED 
(
	[Terminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[Codigo] [varchar](3) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Password] [varchar](3) NOT NULL,
	[Perfil] [varchar](4) NOT NULL,
	[Autoriza_Requisicion] [bit] NOT NULL,
	[Autoriza_Pedido] [bit] NOT NULL,
	[Desintegra_Poliza] [bit] NOT NULL,
	[Abre_Periodos] [bit] NOT NULL,
	[Cod_Depto] [varchar](4) NULL,
	[Puesto] [varchar](100) NULL,
	[Id_UserId_1] [bigint] NULL,
	[Id_Finger_1] [bigint] NULL,
	[SampleNumber_1] [bigint] NULL,
	[Id_UserId_2] [bigint] NULL,
	[Id_Finger_2] [bigint] NULL,
	[SampleNumber_2] [bigint] NULL,
	[Cia_Default] [varchar](10) NULL,
	[Reservado2] [bit] NOT NULL,
	[Reservado3] [bit] NOT NULL,
	[Reservado4] [varchar](30) NULL,
	[Idioma] [varchar](1) NOT NULL,
	[Mesas_Dia] [bigint] NOT NULL,
	[Mesas_Mes] [bigint] NOT NULL,
	[Mesas_Ano] [bigint] NOT NULL,
	[Pers_Dia] [bigint] NOT NULL,
	[Pers_Mes] [bigint] NOT NULL,
	[Pers_Ano] [bigint] NOT NULL,
	[Pro_Dia] [money] NOT NULL,
	[Pro_Mes] [money] NOT NULL,
	[Pro_Ano] [money] NOT NULL,
	[Ing_Dia] [money] NOT NULL,
	[Ing_Mes] [money] NOT NULL,
	[Ing_Ano] [money] NOT NULL,
	[Reservado5] [varchar](50) NULL,
	[Vendedor] [bit] NULL,
	[Comision] [float] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[X30_CXC]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[X30_CXC](
	[Agencia] [varchar](10) NOT NULL,
	[Consecutivo] [varchar](10) NOT NULL,
	[Fecha] [varchar](10) NULL,
	[Hora] [varchar](10) NULL,
	[Codigo] [varchar](10) NULL,
	[Comprobante] [varchar](20) NULL,
	[Nombre] [varchar](100) NULL,
	[Cargos] [money] NULL,
	[Operador] [varchar](10) NULL,
	[Estatus] [varchar](1) NULL,
	[Folio_Huesped] [varchar](10) NULL,
	[Cve_Tpo_Cuarto] [varchar](10) NULL,
	[Adultos] [int] NULL,
	[Ninos] [int] NULL,
	[Menores] [int] NULL,
	[Juniors] [int] NULL,
	[Tarifa_por_noche] [money] NULL,
	[Noches] [int] NULL,
	[Plan] [varchar](10) NULL,
	[Notas] [varchar](250) NULL,
	[Fecha_Salida] [varchar](10) NULL,
	[Cuartos] [int] NULL,
	[Fecha_Ref] [varchar](10) NULL,
	[Estatus_Ref] [varchar](2) NULL,
	[Pasa] [bit] NULL,
 CONSTRAINT [PK_X30_CXC] PRIMARY KEY CLUSTERED 
(
	[Agencia] ASC,
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[001BARRCURRX] ADD  CONSTRAINT [DF_001BARRCURX_Col_1]  DEFAULT (0) FOR [Col_1]
GO
ALTER TABLE [dbo].[001BARRCURRX] ADD  CONSTRAINT [DF_001BARRCURX_Col_2]  DEFAULT (0) FOR [Col_2]
GO
ALTER TABLE [dbo].[001BARRCURRX] ADD  CONSTRAINT [DF_001BARRCURX_Col_3]  DEFAULT (0) FOR [Col_3]
GO
ALTER TABLE [dbo].[001BARRCURRX] ADD  CONSTRAINT [DF_001BARRCURX_Col_4]  DEFAULT (0) FOR [Col_4]
GO
ALTER TABLE [dbo].[001BARRCURRY] ADD  CONSTRAINT [DF_001BARRCURY_Renglon]  DEFAULT (0) FOR [Linea]
GO
ALTER TABLE [dbo].[001BARRCURRY] ADD  CONSTRAINT [DF_001BARRCURRY_CurrentY]  DEFAULT (0) FOR [CurrentY]
GO
ALTER TABLE [dbo].[001COMCOTI] ADD  CONSTRAINT [DF_001COMCOTI_Precio]  DEFAULT (0) FOR [Precio]
GO
ALTER TABLE [dbo].[001COMCOTI] ADD  CONSTRAINT [DF_001COMCOTI_PorDesc]  DEFAULT (0) FOR [PorDesc]
GO
ALTER TABLE [dbo].[001COMCOTI] ADD  CONSTRAINT [DF_001COMCOTI_Selec]  DEFAULT (0) FOR [Selec]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Status]  DEFAULT (0) FOR [Autoriza]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Autoriza2]  DEFAULT (0) FOR [Autoriza2]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Impresa]  DEFAULT (0) FOR [Impresa]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Entrada_1]  DEFAULT (0) FOR [Entrada_1]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Entrada_2]  DEFAULT (0) FOR [Entrada_2]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Entrada_3]  DEFAULT (0) FOR [Entrada_3]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Entrada_4]  DEFAULT (0) FOR [Entrada_4]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Dolares]  DEFAULT (0) FOR [Dolares]
GO
ALTER TABLE [dbo].[001COMPDG] ADD  CONSTRAINT [DF_001COMPDG_Requisicion]  DEFAULT (0) FOR [Requisicion]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Cantidad]  DEFAULT (0) FOR [Cantidad]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Precio]  DEFAULT (0) FOR [Precio]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Descuento]  DEFAULT (0) FOR [Descuento]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Entregada]  DEFAULT (0) FOR [Entregada_1]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Entregada_2]  DEFAULT (0) FOR [Entregada_2]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Entregada_3]  DEFAULT (0) FOR [Entregada_3]
GO
ALTER TABLE [dbo].[001COMPDL] ADD  CONSTRAINT [DF_001COMPDL_Entregada_4]  DEFAULT (0) FOR [Entregada_4]
GO
ALTER TABLE [dbo].[001COMPRECIOS] ADD  CONSTRAINT [DF_001COMPRECIOS_Precio_1]  DEFAULT (0) FOR [Precio_1]
GO
ALTER TABLE [dbo].[001COMPRECIOS] ADD  CONSTRAINT [DF_001COMPRECIOS_Vigente]  DEFAULT (0) FOR [Vigente]
GO
ALTER TABLE [dbo].[001COMPRECIOS] ADD  CONSTRAINT [DF_001COMPRECIOS_Precio_2]  DEFAULT (0) FOR [Precio_2]
GO
ALTER TABLE [dbo].[001COMRQG] ADD  CONSTRAINT [DF_001COMRQG_Status_Rec]  DEFAULT (0) FOR [Status_Req]
GO
ALTER TABLE [dbo].[001COMRQG] ADD  CONSTRAINT [DF_001COMRQG_Status_Cot]  DEFAULT (0) FOR [Status_Cot]
GO
ALTER TABLE [dbo].[001COMRQG] ADD  CONSTRAINT [DF_001COMRQG_Status_Ped]  DEFAULT (0) FOR [Status_Ped]
GO
ALTER TABLE [dbo].[001COMRQG] ADD  CONSTRAINT [DF_001COMRQG_Dolares]  DEFAULT (0) FOR [Dolares]
GO
ALTER TABLE [dbo].[001COMRQL] ADD  CONSTRAINT [DF_001COMRQL_Cantidad]  DEFAULT (0) FOR [Cantidad]
GO
ALTER TABLE [dbo].[001COMRQL] ADD  CONSTRAINT [DF_001COMRQL_Status_Cot]  DEFAULT (0) FOR [Status_Cot]
GO
ALTER TABLE [dbo].[001CONCIERRA] ADD  CONSTRAINT [DF_001CONCIERRA_Cerrado]  DEFAULT (0) FOR [Cerrado]
GO
ALTER TABLE [dbo].[001CONCOG] ADD  CONSTRAINT [DF_001CONCOG_Tot_Cargos]  DEFAULT (0) FOR [Tot_Cargos]
GO
ALTER TABLE [dbo].[001CONCOG] ADD  CONSTRAINT [DF_001CONCOG_Tot_Abonos]  DEFAULT (0) FOR [Tot_Abonos]
GO
ALTER TABLE [dbo].[001CONCOG] ADD  CONSTRAINT [DF_001CONCOG_Status]  DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[001CONCOL] ADD  CONSTRAINT [DF_001CONCOL_Caza]  DEFAULT (0) FOR [Caza]
GO
ALTER TABLE [dbo].[001CONCTA] ADD  CONSTRAINT [DF_001CONCTA_Flujo_Efectivo]  DEFAULT (0) FOR [Flujo_Efectivo]
GO
ALTER TABLE [dbo].[001CONCTA] ADD  CONSTRAINT [DF_001CONCTA_Afectable]  DEFAULT (0) FOR [Afectable]
GO
ALTER TABLE [dbo].[001CONCTA] ADD  CONSTRAINT [DF_001CONCTA_Cta_Modulo]  DEFAULT (0) FOR [Cta_Modulo]
GO
ALTER TABLE [dbo].[001CONCTA] ADD  CONSTRAINT [DF_001CONCTA_comentarios]  DEFAULT ('') FOR [Comentarios]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_1]  DEFAULT (0) FOR [Mes_1]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_2]  DEFAULT (0) FOR [Mes_2]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_3]  DEFAULT (0) FOR [Mes_3]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_4]  DEFAULT (0) FOR [Mes_4]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_5]  DEFAULT (0) FOR [Mes_5]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_6]  DEFAULT (0) FOR [Mes_6]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_7]  DEFAULT (0) FOR [Mes_7]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_8]  DEFAULT (0) FOR [Mes_8]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_9]  DEFAULT (0) FOR [Mes_9]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_10]  DEFAULT (0) FOR [Mes_10]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_11]  DEFAULT (0) FOR [Mes_11]
GO
ALTER TABLE [dbo].[001CONCTOS] ADD  CONSTRAINT [DF_001CONCTOS_Mes_12]  DEFAULT (0) FOR [Mes_12]
GO
ALTER TABLE [dbo].[001CONF01] ADD  CONSTRAINT [DF_001CONF01_Ingreso]  DEFAULT (0) FOR [Ingreso]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_1]  DEFAULT (0) FOR [Mes_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_2]  DEFAULT (0) FOR [Mes_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_3]  DEFAULT (0) FOR [Mes_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_4]  DEFAULT (0) FOR [Mes_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_5]  DEFAULT (0) FOR [Mes_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_6]  DEFAULT (0) FOR [Mes_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_7]  DEFAULT (0) FOR [Mes_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_8]  DEFAULT (0) FOR [Mes_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_9]  DEFAULT (0) FOR [Mes_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_10]  DEFAULT (0) FOR [Mes_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_11]  DEFAULT (0) FOR [Mes_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Mes_12]  DEFAULT (0) FOR [Mes_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_1]  DEFAULT (0) FOR [Sal_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_2]  DEFAULT (0) FOR [Sal_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_3]  DEFAULT (0) FOR [Sal_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_4]  DEFAULT (0) FOR [Sal_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_5]  DEFAULT (0) FOR [Sal_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_6]  DEFAULT (0) FOR [Sal_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_7]  DEFAULT (0) FOR [Sal_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_8]  DEFAULT (0) FOR [Sal_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_9]  DEFAULT (0) FOR [Sal_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_10]  DEFAULT (0) FOR [Sal_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_11]  DEFAULT (0) FOR [Sal_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Sal_12]  DEFAULT (0) FOR [Sal_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_1]  DEFAULT (0) FOR [Pres_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_2]  DEFAULT (0) FOR [Pres_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_3]  DEFAULT (0) FOR [Pres_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_4]  DEFAULT (0) FOR [Pres_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_5]  DEFAULT (0) FOR [Pres_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_6]  DEFAULT (0) FOR [Pres_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_7]  DEFAULT (0) FOR [Pres_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_8]  DEFAULT (0) FOR [Pres_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_9]  DEFAULT (0) FOR [Pres_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_10]  DEFAULT (0) FOR [Pres_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_11]  DEFAULT (0) FOR [Pres_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_Pres_12]  DEFAULT (0) FOR [Pres_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_1]  DEFAULT (0) FOR [APres_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_2]  DEFAULT (0) FOR [APres_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_3]  DEFAULT (0) FOR [APres_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_4]  DEFAULT (0) FOR [APres_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_5]  DEFAULT (0) FOR [APres_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_6]  DEFAULT (0) FOR [APres_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_7]  DEFAULT (0) FOR [APres_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_8]  DEFAULT (0) FOR [APres_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_9]  DEFAULT (0) FOR [APres_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_10]  DEFAULT (0) FOR [APres_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_11]  DEFAULT (0) FOR [APres_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_APres_12]  DEFAULT (0) FOR [APres_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_1]  DEFAULT (0) FOR [AMes_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_2]  DEFAULT (0) FOR [AMes_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_3]  DEFAULT (0) FOR [AMes_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_4]  DEFAULT (0) FOR [AMes_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_5]  DEFAULT (0) FOR [AMes_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_6]  DEFAULT (0) FOR [AMes_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_7]  DEFAULT (0) FOR [AMes_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_8]  DEFAULT (0) FOR [AMes_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_9]  DEFAULT (0) FOR [AMes_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_10]  DEFAULT (0) FOR [AMes_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_11]  DEFAULT (0) FOR [AMes_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_AMes_12]  DEFAULT (0) FOR [AMes_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_1]  DEFAULT (0) FOR [ASal_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_2]  DEFAULT (0) FOR [ASal_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_3]  DEFAULT (0) FOR [ASal_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_4]  DEFAULT (0) FOR [ASal_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_5]  DEFAULT (0) FOR [ASal_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_6]  DEFAULT (0) FOR [ASal_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_7]  DEFAULT (0) FOR [ASal_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_8]  DEFAULT (0) FOR [ASal_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_9]  DEFAULT (0) FOR [ASal_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_10]  DEFAULT (0) FOR [ASal_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_11]  DEFAULT (0) FOR [ASal_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_ASal_12]  DEFAULT (0) FOR [ASal_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_1]  DEFAULT (0) FOR [PMes_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_2]  DEFAULT (0) FOR [PMes_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_3]  DEFAULT (0) FOR [PMes_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_4]  DEFAULT (0) FOR [PMes_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_5]  DEFAULT (0) FOR [PMes_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_6]  DEFAULT (0) FOR [PMes_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_7]  DEFAULT (0) FOR [PMes_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_8]  DEFAULT (0) FOR [PMes_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_9]  DEFAULT (0) FOR [PMes_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_10]  DEFAULT (0) FOR [PMes_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_11]  DEFAULT (0) FOR [PMes_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF03_PMes_12]  DEFAULT (0) FOR [PMes_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_1]  DEFAULT (0) FOR [PSal_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_2]  DEFAULT (0) FOR [PSal_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_3]  DEFAULT (0) FOR [PSal_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_4]  DEFAULT (0) FOR [PSal_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_5]  DEFAULT (0) FOR [PSal_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_6]  DEFAULT (0) FOR [PSal_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_7]  DEFAULT (0) FOR [PSal_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_8]  DEFAULT (0) FOR [PSal_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_9]  DEFAULT (0) FOR [PSal_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_10]  DEFAULT (0) FOR [PSal_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_11]  DEFAULT (0) FOR [PSal_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PSal_12]  DEFAULT (0) FOR [PSal_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_1]  DEFAULT (0) FOR [PPres_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_2]  DEFAULT (0) FOR [PPres_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_3]  DEFAULT (0) FOR [PPres_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_4]  DEFAULT (0) FOR [PPres_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_5]  DEFAULT (0) FOR [PPres_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_6]  DEFAULT (0) FOR [PPres_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_7]  DEFAULT (0) FOR [PPres_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_8]  DEFAULT (0) FOR [PPres_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_9]  DEFAULT (0) FOR [PPres_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_10]  DEFAULT (0) FOR [PPres_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_11]  DEFAULT (0) FOR [PPres_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PPres_12]  DEFAULT (0) FOR [PPres_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_1]  DEFAULT (0) FOR [PAPres_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_2]  DEFAULT (0) FOR [PAPres_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_3]  DEFAULT (0) FOR [PAPres_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_4]  DEFAULT (0) FOR [PAPres_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_5]  DEFAULT (0) FOR [PAPres_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_6]  DEFAULT (0) FOR [PAPres_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_7]  DEFAULT (0) FOR [PAPres_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_8]  DEFAULT (0) FOR [PAPres_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_9]  DEFAULT (0) FOR [PAPres_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_10]  DEFAULT (0) FOR [PAPres_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_11]  DEFAULT (0) FOR [PAPres_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAPres_12]  DEFAULT (0) FOR [PAPres_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_1]  DEFAULT (0) FOR [PAMes_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_2]  DEFAULT (0) FOR [PAMes_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_3]  DEFAULT (0) FOR [PAMes_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_4]  DEFAULT (0) FOR [PAMes_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_5]  DEFAULT (0) FOR [PAMes_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_6]  DEFAULT (0) FOR [PAMes_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_7]  DEFAULT (0) FOR [PAMes_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_8]  DEFAULT (0) FOR [PAMes_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_9]  DEFAULT (0) FOR [PAMes_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_10]  DEFAULT (0) FOR [PAMes_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_11]  DEFAULT (0) FOR [PAMes_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PAMes_12]  DEFAULT (0) FOR [PAMes_12]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_1]  DEFAULT (0) FOR [PASal_1]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_2]  DEFAULT (0) FOR [PASal_2]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_3]  DEFAULT (0) FOR [PASal_3]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_4]  DEFAULT (0) FOR [PASal_4]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_5]  DEFAULT (0) FOR [PASal_5]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_6]  DEFAULT (0) FOR [PASal_6]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_7]  DEFAULT (0) FOR [PASal_7]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_8]  DEFAULT (0) FOR [PASal_8]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_9]  DEFAULT (0) FOR [PASal_9]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_10]  DEFAULT (0) FOR [PASal_10]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_11]  DEFAULT (0) FOR [PASal_11]
GO
ALTER TABLE [dbo].[001CONF03] ADD  CONSTRAINT [DF_001CONF3_PASal_12]  DEFAULT (0) FOR [PASal_12]
GO
ALTER TABLE [dbo].[001CONP01] ADD  CONSTRAINT [DF_001CONP01_Desc_Esp]  DEFAULT ('') FOR [Desc_Esp]
GO
ALTER TABLE [dbo].[001CONP01] ADD  CONSTRAINT [DF_001CONP01_Desc_Ing]  DEFAULT ('') FOR [Desc_Ing]
GO
ALTER TABLE [dbo].[001CONP01] ADD  CONSTRAINT [DF_001CONP01_CambioSigno]  DEFAULT (0) FOR [CambioSigno]
GO
ALTER TABLE [dbo].[001CONP01] ADD  CONSTRAINT [DF_001CONP01_Variacion]  DEFAULT (0) FOR [Variacion]
GO
ALTER TABLE [dbo].[001CONP01] ADD  CONSTRAINT [DF_001CONP01_MesAnt]  DEFAULT (0) FOR [MesAnt]
GO
ALTER TABLE [dbo].[001CONP02] ADD  CONSTRAINT [DF_001CONP02_Comando]  DEFAULT ('+') FOR [Comando]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_1]  DEFAULT (0) FOR [Mes_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_2]  DEFAULT (0) FOR [Mes_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_3]  DEFAULT (0) FOR [Mes_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_4]  DEFAULT (0) FOR [Mes_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_5]  DEFAULT (0) FOR [Mes_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_6]  DEFAULT (0) FOR [Mes_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_7]  DEFAULT (0) FOR [Mes_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_8]  DEFAULT (0) FOR [Mes_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_9]  DEFAULT (0) FOR [Mes_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_10]  DEFAULT (0) FOR [Mes_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_11]  DEFAULT (0) FOR [Mes_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Mes_12]  DEFAULT (0) FOR [Mes_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_1]  DEFAULT (0) FOR [Sal_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_2]  DEFAULT (0) FOR [Sal_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_3]  DEFAULT (0) FOR [Sal_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_4]  DEFAULT (0) FOR [Sal_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_5]  DEFAULT (0) FOR [Sal_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_6]  DEFAULT (0) FOR [Sal_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_7]  DEFAULT (0) FOR [Sal_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_8]  DEFAULT (0) FOR [Sal_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_9]  DEFAULT (0) FOR [Sal_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_10]  DEFAULT (0) FOR [Sal_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_11]  DEFAULT (0) FOR [Sal_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Sal_12]  DEFAULT (0) FOR [Sal_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_1]  DEFAULT (0) FOR [Pres_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_2]  DEFAULT (0) FOR [Pres_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_3]  DEFAULT (0) FOR [Pres_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_4]  DEFAULT (0) FOR [Pres_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_5]  DEFAULT (0) FOR [Pres_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_6]  DEFAULT (0) FOR [Pres_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_7]  DEFAULT (0) FOR [Pres_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_8]  DEFAULT (0) FOR [Pres_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_9]  DEFAULT (0) FOR [Pres_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_10]  DEFAULT (0) FOR [Pres_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_11]  DEFAULT (0) FOR [Pres_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_Pres_12]  DEFAULT (0) FOR [Pres_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_1]  DEFAULT (0) FOR [APres_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_2]  DEFAULT (0) FOR [APres_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_3]  DEFAULT (0) FOR [APres_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_4]  DEFAULT (0) FOR [APres_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_5]  DEFAULT (0) FOR [APres_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_6]  DEFAULT (0) FOR [APres_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_7]  DEFAULT (0) FOR [APres_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_8]  DEFAULT (0) FOR [APres_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_9]  DEFAULT (0) FOR [APres_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_10]  DEFAULT (0) FOR [APres_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_11]  DEFAULT (0) FOR [APres_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_APres_12]  DEFAULT (0) FOR [APres_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_1]  DEFAULT (0) FOR [AMes_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_2]  DEFAULT (0) FOR [AMes_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_3]  DEFAULT (0) FOR [AMes_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_4]  DEFAULT (0) FOR [AMes_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_5]  DEFAULT (0) FOR [AMes_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_6]  DEFAULT (0) FOR [AMes_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_7]  DEFAULT (0) FOR [AMes_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_8]  DEFAULT (0) FOR [AMes_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_9]  DEFAULT (0) FOR [AMes_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_10]  DEFAULT (0) FOR [AMes_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_11]  DEFAULT (0) FOR [AMes_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_AMes_12]  DEFAULT (0) FOR [AMes_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_1]  DEFAULT (0) FOR [ASal_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_2]  DEFAULT (0) FOR [ASal_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_3]  DEFAULT (0) FOR [ASal_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_4]  DEFAULT (0) FOR [ASal_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_5]  DEFAULT (0) FOR [ASal_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_6]  DEFAULT (0) FOR [ASal_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_7]  DEFAULT (0) FOR [ASal_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_8]  DEFAULT (0) FOR [ASal_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_9]  DEFAULT (0) FOR [ASal_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_10]  DEFAULT (0) FOR [ASal_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_11]  DEFAULT (0) FOR [ASal_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_ASal_12]  DEFAULT (0) FOR [ASal_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_1]  DEFAULT (0) FOR [PMes_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_2]  DEFAULT (0) FOR [PMes_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_3]  DEFAULT (0) FOR [PMes_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_4]  DEFAULT (0) FOR [PMes_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_5]  DEFAULT (0) FOR [PMes_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_6]  DEFAULT (0) FOR [PMes_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_7]  DEFAULT (0) FOR [PMes_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_8]  DEFAULT (0) FOR [PMes_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_9]  DEFAULT (0) FOR [PMes_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_10]  DEFAULT (0) FOR [PMes_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_11]  DEFAULT (0) FOR [PMes_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP03_PMes_12]  DEFAULT (0) FOR [PMes_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_1]  DEFAULT (0) FOR [PSal_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_2]  DEFAULT (0) FOR [PSal_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_3]  DEFAULT (0) FOR [PSal_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_4]  DEFAULT (0) FOR [PSal_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_5]  DEFAULT (0) FOR [PSal_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_6]  DEFAULT (0) FOR [PSal_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_7]  DEFAULT (0) FOR [PSal_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_8]  DEFAULT (0) FOR [PSal_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_9]  DEFAULT (0) FOR [PSal_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_10]  DEFAULT (0) FOR [PSal_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_11]  DEFAULT (0) FOR [PSal_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PSal_12]  DEFAULT (0) FOR [PSal_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_1]  DEFAULT (0) FOR [PPres_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_2]  DEFAULT (0) FOR [PPres_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_3]  DEFAULT (0) FOR [PPres_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_4]  DEFAULT (0) FOR [PPres_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_5]  DEFAULT (0) FOR [PPres_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_6]  DEFAULT (0) FOR [PPres_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_7]  DEFAULT (0) FOR [PPres_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_8]  DEFAULT (0) FOR [PPres_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_9]  DEFAULT (0) FOR [PPres_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_10]  DEFAULT (0) FOR [PPres_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_11]  DEFAULT (0) FOR [PPres_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PPres_12]  DEFAULT (0) FOR [PPres_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_1]  DEFAULT (0) FOR [PAPres_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_2]  DEFAULT (0) FOR [PAPres_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_3]  DEFAULT (0) FOR [PAPres_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_4]  DEFAULT (0) FOR [PAPres_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_5]  DEFAULT (0) FOR [PAPres_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_6]  DEFAULT (0) FOR [PAPres_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_7]  DEFAULT (0) FOR [PAPres_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_8]  DEFAULT (0) FOR [PAPres_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_9]  DEFAULT (0) FOR [PAPres_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_10]  DEFAULT (0) FOR [PAPres_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_11]  DEFAULT (0) FOR [PAPres_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAPres_12]  DEFAULT (0) FOR [PAPres_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_1]  DEFAULT (0) FOR [PAMes_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_2]  DEFAULT (0) FOR [PAMes_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_3]  DEFAULT (0) FOR [PAMes_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_4]  DEFAULT (0) FOR [PAMes_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_5]  DEFAULT (0) FOR [PAMes_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_6]  DEFAULT (0) FOR [PAMes_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_7]  DEFAULT (0) FOR [PAMes_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_8]  DEFAULT (0) FOR [PAMes_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_9]  DEFAULT (0) FOR [PAMes_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_10]  DEFAULT (0) FOR [PAMes_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_11]  DEFAULT (0) FOR [PAMes_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PAMes_12]  DEFAULT (0) FOR [PAMes_12]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_1]  DEFAULT (0) FOR [PASal_1]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_2]  DEFAULT (0) FOR [PASal_2]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_3]  DEFAULT (0) FOR [PASal_3]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_4]  DEFAULT (0) FOR [PASal_4]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_5]  DEFAULT (0) FOR [PASal_5]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_6]  DEFAULT (0) FOR [PASal_6]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_7]  DEFAULT (0) FOR [PASal_7]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_8]  DEFAULT (0) FOR [PASal_8]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_9]  DEFAULT (0) FOR [PASal_9]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_10]  DEFAULT (0) FOR [PASal_10]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_11]  DEFAULT (0) FOR [PASal_11]
GO
ALTER TABLE [dbo].[001CONP03] ADD  CONSTRAINT [DF_001CONP3_PASal_12]  DEFAULT (0) FOR [PASal_12]
GO
ALTER TABLE [dbo].[001CONTC] ADD  CONSTRAINT [DF_001CONTC_TipoCambio]  DEFAULT (0) FOR [TipoCambio]
GO
ALTER TABLE [dbo].[001COSART] ADD  CONSTRAINT [DF_001COSART_Costo_Prom]  DEFAULT (0) FOR [Costo_Prom]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Exis_Dia]  DEFAULT (0) FOR [Exis_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Exis_Mes]  DEFAULT (0) FOR [Exis_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Exis_Per]  DEFAULT (0) FOR [Exis_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ent_Dia]  DEFAULT (0) FOR [Ent_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ent_Mes]  DEFAULT (0) FOR [Ent_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ent_Per]  DEFAULT (0) FOR [Ent_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Sal_Dia]  DEFAULT (0) FOR [Sal_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Sal_Mes]  DEFAULT (0) FOR [Sal_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Sal_Per]  DEFAULT (0) FOR [Sal_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Devalm_Dia]  DEFAULT (0) FOR [Devalm_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Devalm_Mes]  DEFAULT (0) FOR [Devalm_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Devalm_Per]  DEFAULT (0) FOR [Devalm_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ajus_Dia]  DEFAULT (0) FOR [Ajus_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ajus_Med]  DEFAULT (0) FOR [Ajus_Med]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Ajus_Per]  DEFAULT (0) FOR [Ajus_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Tras_Dia]  DEFAULT (0) FOR [Tras_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Tras_Mes]  DEFAULT (0) FOR [Tras_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Tras_Per]  DEFAULT (0) FOR [Tras_Per]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Cos_Prom]  DEFAULT (0) FOR [Cos_Dia]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Cos_Mes]  DEFAULT (0) FOR [Cos_Mes]
GO
ALTER TABLE [dbo].[001COSINV] ADD  CONSTRAINT [DF_001COSINV_Cos_Per]  DEFAULT (0) FOR [Cos_Per]
GO
ALTER TABLE [dbo].[001COSRCG] ADD  CONSTRAINT [DF_001COSRCG_Porc_Inprod]  DEFAULT (0) FOR [Porc_Inprod]
GO
ALTER TABLE [dbo].[001CXPBAN] ADD  CONSTRAINT [DF_001CXPBAN_Dolares]  DEFAULT (0) FOR [Dolares]
GO
ALTER TABLE [dbo].[001CXPCAR] ADD  CONSTRAINT [DF_001CXPCAR_Importe]  DEFAULT (0) FOR [Importe]
GO
ALTER TABLE [dbo].[001CXPCAT] ADD  CONSTRAINT [DF_001CXPCAT_Procede]  DEFAULT (0) FOR [Procede]
GO
ALTER TABLE [dbo].[001CXPCAT] ADD  CONSTRAINT [DF_001CXPCAT_Iva]  DEFAULT (0) FOR [Iva]
GO
ALTER TABLE [dbo].[001CXPCHEQUES] ADD  CONSTRAINT [DF_001CXPCHEQUES_Importe]  DEFAULT (0) FOR [Importe]
GO
ALTER TABLE [dbo].[001CXPCHEQUES] ADD  CONSTRAINT [DF_001CXPCHEQUES_AbonoEnCuenta]  DEFAULT (0) FOR [AbonoEnCuenta]
GO
ALTER TABLE [dbo].[001CXPCHEQUES] ADD  CONSTRAINT [DF_001CXPCHEQUES_Impreso]  DEFAULT (0) FOR [Impreso]
GO
ALTER TABLE [dbo].[001CXPCHEQUES] ADD  CONSTRAINT [DF_001CXPCHEQUES_Cancelado]  DEFAULT (0) FOR [Cancelado]
GO
ALTER TABLE [dbo].[001CXPCHEQUES] ADD  CONSTRAINT [DF_001CXPCHEQUES_Conciliado]  DEFAULT (0) FOR [Conciliado]
GO
ALTER TABLE [dbo].[001CXPPAGOS] ADD  CONSTRAINT [DF_001CXPPAGOS_Saldo]  DEFAULT (0) FOR [Cargo]
GO
ALTER TABLE [dbo].[001CXPPAGOS] ADD  CONSTRAINT [DF_001CXPPAGOS_Abono]  DEFAULT (0) FOR [Abono]
GO
ALTER TABLE [dbo].[001CXPPAGOS] ADD  CONSTRAINT [DF_001CXPPAGOS_Pagar]  DEFAULT (0) FOR [Pagar]
GO
ALTER TABLE [dbo].[001CXPPAGOS] ADD  CONSTRAINT [DF_001CXPPAGOS_Impreso]  DEFAULT (0) FOR [Impreso]
GO
ALTER TABLE [dbo].[001INVART] ADD  CONSTRAINT [DF_001INVART_PrecioVenta]  DEFAULT ((0)) FOR [Precio_Venta]
GO
ALTER TABLE [dbo].[001INVART] ADD  CONSTRAINT [DF_001INVART_Consignacion]  DEFAULT ((0)) FOR [Consignacion]
GO
ALTER TABLE [dbo].[001INVART] ADD  CONSTRAINT [DF_001INVART_Taza0]  DEFAULT ((0)) FOR [Taza0]
GO
ALTER TABLE [dbo].[001INVART] ADD  CONSTRAINT [DF__001INVART__Recet__46FE2F53]  DEFAULT ((0)) FOR [Receta]
GO
ALTER TABLE [dbo].[001INVART] ADD  CONSTRAINT [DF__001INVART__Paque__4DAB2CE2]  DEFAULT ((0)) FOR [Paquete]
GO
ALTER TABLE [dbo].[001INVDEP] ADD  CONSTRAINT [DF_001INVDEP_Inventario]  DEFAULT (0) FOR [Inventario]
GO
ALTER TABLE [dbo].[001INVDEPCTAS] ADD  CONSTRAINT [DF_001INVDEPCTAS_Depto]  DEFAULT (0) FOR [Depto]
GO
ALTER TABLE [dbo].[001INVDEPCTAS] ADD  CONSTRAINT [DF_001INVDEPCTAS_Subalma]  DEFAULT (0) FOR [Subalma]
GO
ALTER TABLE [dbo].[001INVDEPCTAS] ADD  CONSTRAINT [DF_001INVDEPCTAS_Cuenta]  DEFAULT (0) FOR [Cuenta]
GO
ALTER TABLE [dbo].[001INVDIV] ADD  CONSTRAINT [DF_001INVDIV_TipoCambio]  DEFAULT (0) FOR [TipoCambio]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Exis_Dia]  DEFAULT (0) FOR [Exis_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Exis_Mes]  DEFAULT (0) FOR [Exis_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Exis_Per]  DEFAULT (0) FOR [Exis_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ent_Dia]  DEFAULT (0) FOR [Ent_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ent_Mes]  DEFAULT (0) FOR [Ent_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ent_Per]  DEFAULT (0) FOR [Ent_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Sal_Dia]  DEFAULT (0) FOR [Sal_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Sal_Mes]  DEFAULT (0) FOR [Sal_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Sal_Per]  DEFAULT (0) FOR [Sal_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devpro_Dia]  DEFAULT (0) FOR [Devpro_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devpro_Mes]  DEFAULT (0) FOR [Devpro_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devpro_Per]  DEFAULT (0) FOR [Devpro_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devalm_Dia]  DEFAULT (0) FOR [Devalm_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devalm_Mes]  DEFAULT (0) FOR [Devalm_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Devalm_Per]  DEFAULT (0) FOR [Devalm_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ajus_Dia]  DEFAULT (0) FOR [Ajus_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ajus_Mes]  DEFAULT (0) FOR [Ajus_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Ajus_Per]  DEFAULT (0) FOR [Ajus_Per]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Cos_UE]  DEFAULT (0) FOR [Cos_UE]
GO
ALTER TABLE [dbo].[001INVEST] ADD  CONSTRAINT [DF_001INVEST_Cos_Ant]  DEFAULT (0) FOR [Cos_Ant]
GO
ALTER TABLE [dbo].[001INVEST] ADD  DEFAULT ((0)) FOR [Merm_Dia]
GO
ALTER TABLE [dbo].[001INVEST] ADD  DEFAULT ((0)) FOR [Merm_Mes]
GO
ALTER TABLE [dbo].[001INVEST] ADD  DEFAULT ((0)) FOR [Merm_Per]
GO
ALTER TABLE [dbo].[001INVFISICO] ADD  CONSTRAINT [DF_001INVFISICO_Costo_Promedio]  DEFAULT (0) FOR [Costo_Promedio]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Total_Fac]  DEFAULT (0) FOR [Total_Fac]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Iva_Fac]  DEFAULT (0) FOR [Iva_Fac]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Stat_Mov]  DEFAULT (0) FOR [Stat_Mov]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Stat_Aut]  DEFAULT (0) FOR [Stat_Aut]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Entrada_Directa]  DEFAULT (0) FOR [Entrada_Directa]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_No_Pedido]  DEFAULT (0) FOR [No_Pedido]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Referencia]  DEFAULT ('') FOR [Referencia]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Aplicado]  DEFAULT (0) FOR [Aplicado]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Ope_Aplica]  DEFAULT ('') FOR [Ope_Aplica]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tpro]  DEFAULT (0) FOR [Tpro]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tdes]  DEFAULT (0) FOR [Tdes]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Pagado]  DEFAULT (0) FOR [Pagado]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Ini_cierre]  DEFAULT ('') FOR [Ini_cierre]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_St]  DEFAULT ('') FOR [St]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Horaci]  DEFAULT (0) FOR [Horaci]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tiva]  DEFAULT (0) FOR [Tiva]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tal]  DEFAULT (0) FOR [Tal]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tbeb]  DEFAULT (0) FOR [Tbeb]
GO
ALTER TABLE [dbo].[001INVGEN] ADD  CONSTRAINT [DF_001INVGEN_Tt0]  DEFAULT (0) FOR [Tt0]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Desc_Esp]  DEFAULT ('') FOR [Desc_Esp]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Can]  DEFAULT (0) FOR [Can]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Costo]  DEFAULT (0) FOR [Costo]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_TotalC]  DEFAULT (0) FOR [TotalC]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Venta]  DEFAULT (0) FOR [Venta]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Totalv]  DEFAULT (0) FOR [Totalv]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Util]  DEFAULT (0) FOR [Util]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Iva]  DEFAULT (0) FOR [Iva]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Grupo]  DEFAULT ('') FOR [Grupo]
GO
ALTER TABLE [dbo].[001VTSDIA] ADD  CONSTRAINT [DF_001VTSDIA_Proveedor]  DEFAULT ('') FOR [Proveedor]
GO
ALTER TABLE [dbo].[ARTICULOS_DIRECTOS] ADD  CONSTRAINT [DF_ARTICULOS_DIRECTOS_Articulo]  DEFAULT (0) FOR [Articulo]
GO
ALTER TABLE [dbo].[CARAB] ADD  CONSTRAINT [DF_CARAB_Nivel]  DEFAULT (0) FOR [Nivel]
GO
ALTER TABLE [dbo].[CARAB] ADD  CONSTRAINT [DF_CARAB_Porc]  DEFAULT (0) FOR [Porc]
GO
ALTER TABLE [dbo].[CARAB] ADD  CONSTRAINT [DF_CARAB_Abre_Caja]  DEFAULT (0) FOR [Abre_Caja]
GO
ALTER TABLE [dbo].[CXCCONSE] ADD  CONSTRAINT [DF_001CXCCONSE_ConFac]  DEFAULT (0) FOR [ConFac]
GO
ALTER TABLE [dbo].[Fondo_Caja] ADD  CONSTRAINT [DF_Fondo_Caja_Valor]  DEFAULT (0) FOR [Valor]
GO
ALTER TABLE [dbo].[Fondo_Caja] ADD  CONSTRAINT [DF_Fondo_Caja_Descripcion]  DEFAULT ('') FOR [Descripcion]
GO
ALTER TABLE [dbo].[Fondo_Caja] ADD  CONSTRAINT [DF_Fondo_Caja_Cant]  DEFAULT (0) FOR [Cant]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_PAGOSPDV_Clave_PDV]  DEFAULT ((0)) FOR [Clave_PDV]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_01PAGOSPDV_Che]  DEFAULT ((0)) FOR [Che]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_PAGOSPDV_Consec]  DEFAULT ((0)) FOR [Consec]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_01PAGOSPDV_Importe]  DEFAULT ((0)) FOR [Importe]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_PAGOSPDV_Orden]  DEFAULT ((0)) FOR [Orden]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_PAGOSPDV_Importe_Real]  DEFAULT ((0)) FOR [Importe_Real]
GO
ALTER TABLE [dbo].[PAGOSPDV] ADD  CONSTRAINT [DF_PAGOSPDV_TipoCambio]  DEFAULT ((0)) FOR [TipoCambio]
GO
ALTER TABLE [dbo].[PAGOSPDVTEMPO] ADD  CONSTRAINT [DF_PAGOSPDVTEMPO_Che]  DEFAULT (0) FOR [Che]
GO
ALTER TABLE [dbo].[PAGOSPDVTEMPO] ADD  CONSTRAINT [DF_PAGOSPDVTEMPO_Importe]  DEFAULT (0) FOR [Importe]
GO
ALTER TABLE [dbo].[PAGOSPDVTEMPO] ADD  CONSTRAINT [DF_PAGOSPDVTEMPO_Orden]  DEFAULT (0) FOR [Orden]
GO
ALTER TABLE [dbo].[PAGOSPDVTEMPO] ADD  CONSTRAINT [DF_PAGOSPDVTEMPO_Importe_real]  DEFAULT (0) FOR [Importe_real]
GO
ALTER TABLE [dbo].[PAGOSPDVTEMPO] ADD  CONSTRAINT [DF_PAGOSPDVTEMPO_TipoCambio]  DEFAULT (0) FOR [TipoCambio]
GO
ALTER TABLE [dbo].[PARAMETROS] ADD  CONSTRAINT [DF_PARAMETROS_Valor]  DEFAULT ('') FOR [Valor]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Ac_Pla]  DEFAULT (0) FOR [Ac_Pla]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Ac_Che]  DEFAULT (0) FOR [Ac_Che]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Ac_Hf]  DEFAULT (0) FOR [Ac_Hf]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Mesero]  DEFAULT (0) FOR [Mesero]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Cajero]  DEFAULT (0) FOR [Cajero]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Capitan]  DEFAULT (0) FOR [Capitan]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Gerente]  DEFAULT (0) FOR [Gerente]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Auditor]  DEFAULT (0) FOR [Auditor]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Direccion]  DEFAULT (0) FOR [Direccion]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Cancela_Platillo]  DEFAULT (0) FOR [Cancela_Platillo]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Cancela_Cheque]  DEFAULT (0) FOR [Cancela_Cheque]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Reimprime_Ticket]  DEFAULT (0) FOR [Reimprime_Ticket]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Descuentos]  DEFAULT (0) FOR [Descuentos]
GO
ALTER TABLE [dbo].[PERFILES] ADD  CONSTRAINT [DF_PERFILES_Cierre]  DEFAULT (0) FOR [Cierre]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Currentx]  DEFAULT (0) FOR [Currentx]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Titulo]  DEFAULT ('') FOR [Titulo]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Mascara]  DEFAULT ('') FOR [Mascara]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Texto Mascara]  DEFAULT ('') FOR [Texto Mascara]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Justifica]  DEFAULT (1) FOR [Justifica]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Font]  DEFAULT ('Arial') FOR [Font]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Tamano]  DEFAULT (6) FOR [Tamano]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Rayap1]  DEFAULT ('') FOR [Rayap1]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Rayap2]  DEFAULT ('') FOR [Rayap2]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Campo Principal]  DEFAULT (0) FOR [Campo Principal]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Conversion]  DEFAULT ('') FOR [Conversion]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Totaliza]  DEFAULT (0) FOR [Totaliza]
GO
ALTER TABLE [dbo].[REPCAMPOS] ADD  CONSTRAINT [DF_REPCAMPOS_Ancho DBGrid]  DEFAULT (0) FOR [Ancho DBGrid]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Query Inicial]  DEFAULT ('') FOR [Query Inicial]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Lineas]  DEFAULT (80) FOR [Lineas]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Titulo]  DEFAULT ('') FOR [Titulo]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Orientacion]  DEFAULT (1) FOR [Orientacion]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Ancho Impresion]  DEFAULT (11500) FOR [Ancho Impresion]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Campo Gran Total]  DEFAULT (0) FOR [Campo Gran Total]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Query Totales]  DEFAULT ('') FOR [Query Totales]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Con Subtotal]  DEFAULT ('') FOR [Con Subtotal]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Query Final]  DEFAULT ('') FOR [Query Final]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_DB Folio]  DEFAULT ('') FOR [DB Folio]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Imp Llegadas]  DEFAULT ('') FOR [Imp Llegadas]
GO
ALTER TABLE [dbo].[REPGENERALES] ADD  CONSTRAINT [DF_REPGENERALES_Imp Salidas]  DEFAULT ('') FOR [Imp Salidas]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 1]  DEFAULT ('') FOR [Campo 1]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 2]  DEFAULT ('') FOR [Campo 2]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 3]  DEFAULT ('') FOR [Campo 3]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 4]  DEFAULT ('') FOR [Campo 4]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 5]  DEFAULT ('') FOR [Campo 5]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 6]  DEFAULT ('') FOR [Campo 6]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 7]  DEFAULT ('') FOR [Campo 7]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 8]  DEFAULT ('') FOR [Campo 8]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 9]  DEFAULT ('') FOR [Campo 9]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 10]  DEFAULT ('') FOR [Campo 10]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 11]  DEFAULT ('') FOR [Campo 11]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 12]  DEFAULT ('') FOR [Campo 12]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 13]  DEFAULT ('') FOR [Campo 13]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 14]  DEFAULT ('') FOR [Campo 14]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 15]  DEFAULT ('') FOR [Campo 15]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 16]  DEFAULT ('') FOR [Campo 16]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 17]  DEFAULT ('') FOR [Campo 17]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 18]  DEFAULT ('') FOR [Campo 18]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 19]  DEFAULT ('') FOR [Campo 19]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 20]  DEFAULT ('') FOR [Campo 20]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 21]  DEFAULT ('') FOR [Campo 21]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 22]  DEFAULT ('') FOR [Campo 22]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 23]  DEFAULT ('') FOR [Campo 23]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 24]  DEFAULT ('') FOR [Campo 24]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 25]  DEFAULT ('') FOR [Campo 25]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 26]  DEFAULT ('') FOR [Campo 26]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 27]  DEFAULT ('') FOR [Campo 27]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 28]  DEFAULT ('') FOR [Campo 28]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 29]  DEFAULT ('') FOR [Campo 29]
GO
ALTER TABLE [dbo].[REPORTE] ADD  CONSTRAINT [DF_REPORTE_Campo 30]  DEFAULT ('') FOR [Campo 30]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 1]  DEFAULT ('') FOR [Campo 1]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 2]  DEFAULT ('') FOR [Campo 2]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 3]  DEFAULT ('') FOR [Campo 3]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 4]  DEFAULT ('') FOR [Campo 4]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 5]  DEFAULT ('') FOR [Campo 5]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 6]  DEFAULT ('') FOR [Campo 6]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 7]  DEFAULT ('') FOR [Campo 7]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 8]  DEFAULT ('') FOR [Campo 8]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 9]  DEFAULT ('') FOR [Campo 9]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 10]  DEFAULT ('') FOR [Campo 10]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 11]  DEFAULT ('') FOR [Campo 11]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 12]  DEFAULT ('') FOR [Campo 12]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 13]  DEFAULT ('') FOR [Campo 13]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 14]  DEFAULT ('') FOR [Campo 14]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 15]  DEFAULT ('') FOR [Campo 15]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 16]  DEFAULT ('') FOR [Campo 16]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 17]  DEFAULT ('') FOR [Campo 17]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 18]  DEFAULT ('') FOR [Campo 18]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 19]  DEFAULT ('') FOR [Campo 19]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 20]  DEFAULT ('') FOR [Campo 20]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 21]  DEFAULT ('') FOR [Campo 21]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 22]  DEFAULT ('') FOR [Campo 22]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 23]  DEFAULT ('') FOR [Campo 23]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 24]  DEFAULT ('') FOR [Campo 24]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 25]  DEFAULT ('') FOR [Campo 25]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 26]  DEFAULT ('') FOR [Campo 26]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 27]  DEFAULT ('') FOR [Campo 27]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 28]  DEFAULT ('') FOR [Campo 28]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 29]  DEFAULT ('') FOR [Campo 29]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 30]  DEFAULT ('') FOR [Campo 30]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 31]  DEFAULT ('') FOR [Campo 31]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 32]  DEFAULT ('') FOR [Campo 32]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 33]  DEFAULT ('') FOR [Campo 33]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 34]  DEFAULT ('') FOR [Campo 34]
GO
ALTER TABLE [dbo].[REPORTECXC] ADD  CONSTRAINT [DF_REPORTECXC_Campo 35]  DEFAULT ('') FOR [Campo 35]
GO
ALTER TABLE [dbo].[REPTITULOS] ADD  CONSTRAINT [DF_REPTITULOS_Titulo]  DEFAULT ('') FOR [Titulo]
GO
ALTER TABLE [dbo].[REPTITULOS] ADD  CONSTRAINT [DF_REPTITULOS_Texto]  DEFAULT ('') FOR [Texto]
GO
ALTER TABLE [dbo].[REPTITULOS] ADD  CONSTRAINT [DF_REPTITULOS_Font]  DEFAULT ('Courier') FOR [Font]
GO
ALTER TABLE [dbo].[REPTITULOS] ADD  CONSTRAINT [DF_REPTITULOS_Size]  DEFAULT (7.5) FOR [Size]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Autoriza_Requisicion]  DEFAULT (0) FOR [Autoriza_Requisicion]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Autoriza_Pedido]  DEFAULT (0) FOR [Autoriza_Pedido]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Desintegra_Poliza]  DEFAULT (0) FOR [Desintegra_Poliza]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Abre_Periodos]  DEFAULT (0) FOR [Abre_Periodos]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Id_UserId_1]  DEFAULT (0) FOR [Id_UserId_1]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Id_Finger_1]  DEFAULT (0) FOR [Id_Finger_1]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_SampleNumber_1]  DEFAULT (0) FOR [SampleNumber_1]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Id_UserId_2]  DEFAULT (0) FOR [Id_UserId_2]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Id_Finger_2]  DEFAULT (0) FOR [Id_Finger_2]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_SampleNumber_2]  DEFAULT (0) FOR [SampleNumber_2]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Reservado2]  DEFAULT (0) FOR [Reservado2]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Reservado3]  DEFAULT (0) FOR [Reservado3]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Mesas_Dia]  DEFAULT (0) FOR [Mesas_Dia]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Mesas_Mes]  DEFAULT (0) FOR [Mesas_Mes]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Mesas_Ano]  DEFAULT (0) FOR [Mesas_Ano]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pers_Dia]  DEFAULT (0) FOR [Pers_Dia]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pers_Mes]  DEFAULT (0) FOR [Pers_Mes]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pers_Ano]  DEFAULT (0) FOR [Pers_Ano]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pro_Dia]  DEFAULT (0) FOR [Pro_Dia]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pro_Mes]  DEFAULT (0) FOR [Pro_Mes]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Pro_Ano]  DEFAULT (0) FOR [Pro_Ano]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Ing_Dia]  DEFAULT (0) FOR [Ing_Dia]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Ing_Mes]  DEFAULT (0) FOR [Ing_Mes]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_Ing_Ano]  DEFAULT (0) FOR [Ing_Ano]
GO
ALTER TABLE [dbo].[001COMCOTI]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMCOTI_001COMRQL] FOREIGN KEY([No_Requisicion], [No_Linea])
REFERENCES [dbo].[001COMRQL] ([No_Req], [No_Lin])
GO
ALTER TABLE [dbo].[001COMCOTI] CHECK CONSTRAINT [FK_001COMCOTI_001COMRQL]
GO
ALTER TABLE [dbo].[001COMCOTI]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMCOTI_001CXPCAT] FOREIGN KEY([CodProv])
REFERENCES [dbo].[001CXPCAT] ([Codigo_Provedor])
GO
ALTER TABLE [dbo].[001COMCOTI] CHECK CONSTRAINT [FK_001COMCOTI_001CXPCAT]
GO
ALTER TABLE [dbo].[001COMPRECIOS]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMPRECIOS_001CXPCAT] FOREIGN KEY([Codigo_Prov])
REFERENCES [dbo].[001CXPCAT] ([Codigo_Provedor])
GO
ALTER TABLE [dbo].[001COMPRECIOS] CHECK CONSTRAINT [FK_001COMPRECIOS_001CXPCAT]
GO
ALTER TABLE [dbo].[001COMPRECIOS]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMPRECIOS_001INVART] FOREIGN KEY([Codigo_Articulo])
REFERENCES [dbo].[001INVART] ([Cod_Art])
GO
ALTER TABLE [dbo].[001COMPRECIOS] CHECK CONSTRAINT [FK_001COMPRECIOS_001INVART]
GO
ALTER TABLE [dbo].[001COMRQG]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMRQG_001COMPRI] FOREIGN KEY([Cod_Prio])
REFERENCES [dbo].[001COMPRI] ([Tip_Prio])
GO
ALTER TABLE [dbo].[001COMRQG] NOCHECK CONSTRAINT [FK_001COMRQG_001COMPRI]
GO
ALTER TABLE [dbo].[001COMRQG]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMRQG_001COMTIP] FOREIGN KEY([Tip_Req])
REFERENCES [dbo].[001COMTIP] ([Tipo])
GO
ALTER TABLE [dbo].[001COMRQG] CHECK CONSTRAINT [FK_001COMRQG_001COMTIP]
GO
ALTER TABLE [dbo].[001COMRQG]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMRQG_001INVDEP] FOREIGN KEY([Cod_Dep])
REFERENCES [dbo].[001INVDEP] ([Cod_Dep])
GO
ALTER TABLE [dbo].[001COMRQG] NOCHECK CONSTRAINT [FK_001COMRQG_001INVDEP]
GO
ALTER TABLE [dbo].[001COMRQL]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMRQL_001COMRQG] FOREIGN KEY([No_Req])
REFERENCES [dbo].[001COMRQG] ([No_Req])
GO
ALTER TABLE [dbo].[001COMRQL] CHECK CONSTRAINT [FK_001COMRQL_001COMRQG]
GO
ALTER TABLE [dbo].[001COMRQL]  WITH NOCHECK ADD  CONSTRAINT [FK_001COMRQL_001INVMED] FOREIGN KEY([Cod_Med])
REFERENCES [dbo].[001INVMED] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001COMRQL] CHECK CONSTRAINT [FK_001COMRQL_001INVMED]
GO
ALTER TABLE [dbo].[001CONCOG]  WITH NOCHECK ADD  CONSTRAINT [FK_001CONCOG_001CONTIPOL] FOREIGN KEY([Tipo_PolG])
REFERENCES [dbo].[001CONTIPOL] ([Tipo_Poliza])
GO
ALTER TABLE [dbo].[001CONCOG] CHECK CONSTRAINT [FK_001CONCOG_001CONTIPOL]
GO
ALTER TABLE [dbo].[001CONCOL]  WITH NOCHECK ADD  CONSTRAINT [FK_001CONCOL_001CONCOG] FOREIGN KEY([Cia], [Periodo], [Tipo_PolL], [Num_PolL])
REFERENCES [dbo].[001CONCOG] ([Cia], [Periodo], [Tipo_PolG], [Num_PolG])
GO
ALTER TABLE [dbo].[001CONCOL] CHECK CONSTRAINT [FK_001CONCOL_001CONCOG]
GO
ALTER TABLE [dbo].[001CONCOL]  WITH NOCHECK ADD  CONSTRAINT [FK_001CONCOL_001CONCTA] FOREIGN KEY([Cuenta_1], [Cuenta_2], [Cuenta_3], [Cuenta_4])
REFERENCES [dbo].[001CONCTA] ([Cuenta_1], [Cuenta_2], [Cuenta_3], [Cuenta_4])
GO
ALTER TABLE [dbo].[001CONCOL] NOCHECK CONSTRAINT [FK_001CONCOL_001CONCTA]
GO
ALTER TABLE [dbo].[001CONF02]  WITH NOCHECK ADD  CONSTRAINT [FK_001CONF02_001CONF01] FOREIGN KEY([Rubro], [Secuencia])
REFERENCES [dbo].[001CONF01] ([Rubro], [Secuencia])
GO
ALTER TABLE [dbo].[001CONF02] CHECK CONSTRAINT [FK_001CONF02_001CONF01]
GO
ALTER TABLE [dbo].[001CONP02]  WITH CHECK ADD  CONSTRAINT [FK_001CONP02_001CONP01] FOREIGN KEY([Rubro], [Secuencia])
REFERENCES [dbo].[001CONP01] ([Rubro], [Secuencia])
GO
ALTER TABLE [dbo].[001CONP02] CHECK CONSTRAINT [FK_001CONP02_001CONP01]
GO
ALTER TABLE [dbo].[001CONSUB]  WITH CHECK ADD  CONSTRAINT [FK_001CONSUB_001CONCLA] FOREIGN KEY([Tipo_Cuenta], [Clasificacion])
REFERENCES [dbo].[001CONCLA] ([Tipo_Cuenta], [Clasificacion])
GO
ALTER TABLE [dbo].[001CONSUB] CHECK CONSTRAINT [FK_001CONSUB_001CONCLA]
GO
ALTER TABLE [dbo].[001COSCONV]  WITH CHECK ADD  CONSTRAINT [FK_001COSCONV_001COSUNI] FOREIGN KEY([Uni_Pricipal])
REFERENCES [dbo].[001COSUNI] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001COSCONV] CHECK CONSTRAINT [FK_001COSCONV_001COSUNI]
GO
ALTER TABLE [dbo].[001COSCONV]  WITH CHECK ADD  CONSTRAINT [FK_001COSCONV_001COSUNI1] FOREIGN KEY([Uni_Conv])
REFERENCES [dbo].[001COSUNI] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001COSCONV] CHECK CONSTRAINT [FK_001COSCONV_001COSUNI1]
GO
ALTER TABLE [dbo].[001COSRCG]  WITH NOCHECK ADD  CONSTRAINT [FK_001COSRCG_001COSUNI] FOREIGN KEY([Unidad])
REFERENCES [dbo].[001COSUNI] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001COSRCG] CHECK CONSTRAINT [FK_001COSRCG_001COSUNI]
GO
ALTER TABLE [dbo].[001COSRCL]  WITH NOCHECK ADD  CONSTRAINT [FK_001COSRCL_001COSART] FOREIGN KEY([Cod_Art])
REFERENCES [dbo].[001COSART] ([Codigo_Articulo])
GO
ALTER TABLE [dbo].[001COSRCL] CHECK CONSTRAINT [FK_001COSRCL_001COSART]
GO
ALTER TABLE [dbo].[001COSRCL]  WITH NOCHECK ADD  CONSTRAINT [FK_001COSRCL_001COSRCG] FOREIGN KEY([Cod_Receta])
REFERENCES [dbo].[001COSRCG] ([Codigo_Receta])
GO
ALTER TABLE [dbo].[001COSRCL] CHECK CONSTRAINT [FK_001COSRCL_001COSRCG]
GO
ALTER TABLE [dbo].[001COSRCL]  WITH NOCHECK ADD  CONSTRAINT [FK_001COSRCL_001COSRCG1] FOREIGN KEY([Cod_Subrec])
REFERENCES [dbo].[001COSRCG] ([Codigo_Receta])
GO
ALTER TABLE [dbo].[001COSRCL] NOCHECK CONSTRAINT [FK_001COSRCL_001COSRCG1]
GO
ALTER TABLE [dbo].[001CXPBAN]  WITH CHECK ADD  CONSTRAINT [FK_001CXPBAN_001CONTIPOL] FOREIGN KEY([Tipo_Poliza])
REFERENCES [dbo].[001CONTIPOL] ([Tipo_Poliza])
GO
ALTER TABLE [dbo].[001CXPBAN] CHECK CONSTRAINT [FK_001CXPBAN_001CONTIPOL]
GO
ALTER TABLE [dbo].[001INVART]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVART_001INVMED] FOREIGN KEY([Uni_Ent])
REFERENCES [dbo].[001INVMED] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001INVART] CHECK CONSTRAINT [FK_001INVART_001INVMED]
GO
ALTER TABLE [dbo].[001INVART]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVART_001INVMED1] FOREIGN KEY([Uni_Sal])
REFERENCES [dbo].[001INVMED] ([Codigo_Unidad])
GO
ALTER TABLE [dbo].[001INVART] CHECK CONSTRAINT [FK_001INVART_001INVMED1]
GO
ALTER TABLE [dbo].[001INVART]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVART_001INVSUB] FOREIGN KEY([Alm], [Sub_Alm])
REFERENCES [dbo].[001INVSUB] ([Cod_Almacen], [Cod_Subalmacen])
GO
ALTER TABLE [dbo].[001INVART] CHECK CONSTRAINT [FK_001INVART_001INVSUB]
GO
ALTER TABLE [dbo].[001INVDEPCTAS]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVDEPCTAS_001CONCTA] FOREIGN KEY([Cuenta_1], [Cuenta_2], [Cuenta_3], [Cuenta_4])
REFERENCES [dbo].[001CONCTA] ([Cuenta_1], [Cuenta_2], [Cuenta_3], [Cuenta_4])
GO
ALTER TABLE [dbo].[001INVDEPCTAS] NOCHECK CONSTRAINT [FK_001INVDEPCTAS_001CONCTA]
GO
ALTER TABLE [dbo].[001INVDEPCTAS]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVDEPCTAS_001INVDEP] FOREIGN KEY([Cod_Dep])
REFERENCES [dbo].[001INVDEP] ([Cod_Dep])
GO
ALTER TABLE [dbo].[001INVDEPCTAS] NOCHECK CONSTRAINT [FK_001INVDEPCTAS_001INVDEP]
GO
ALTER TABLE [dbo].[001INVDEPCTAS]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVDEPCTAS_001INVSUB] FOREIGN KEY([Cod_Alma], [Cod_Sub])
REFERENCES [dbo].[001INVSUB] ([Cod_Almacen], [Cod_Subalmacen])
GO
ALTER TABLE [dbo].[001INVDEPCTAS] NOCHECK CONSTRAINT [FK_001INVDEPCTAS_001INVSUB]
GO
ALTER TABLE [dbo].[001INVEST]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVEST_001INVART] FOREIGN KEY([Cod_Art])
REFERENCES [dbo].[001INVART] ([Cod_Art])
GO
ALTER TABLE [dbo].[001INVEST] CHECK CONSTRAINT [FK_001INVEST_001INVART]
GO
ALTER TABLE [dbo].[001INVGEN]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVGEN_001INVDEP] FOREIGN KEY([Cod_Dep])
REFERENCES [dbo].[001INVDEP] ([Cod_Dep])
GO
ALTER TABLE [dbo].[001INVGEN] NOCHECK CONSTRAINT [FK_001INVGEN_001INVDEP]
GO
ALTER TABLE [dbo].[001INVGEN]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVGEN_001INVTIPOS] FOREIGN KEY([Tipo_Mov])
REFERENCES [dbo].[001INVTIPOS] ([Cod_Tip])
GO
ALTER TABLE [dbo].[001INVGEN] CHECK CONSTRAINT [FK_001INVGEN_001INVTIPOS]
GO
ALTER TABLE [dbo].[001INVLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVLIN_001INVART] FOREIGN KEY([Cod_Art])
REFERENCES [dbo].[001INVART] ([Cod_Art])
GO
ALTER TABLE [dbo].[001INVLIN] CHECK CONSTRAINT [FK_001INVLIN_001INVART]
GO
ALTER TABLE [dbo].[001INVLIN]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVLIN_001INVGEN] FOREIGN KEY([Indice])
REFERENCES [dbo].[001INVGEN] ([Ind_Mov])
GO
ALTER TABLE [dbo].[001INVLIN] CHECK CONSTRAINT [FK_001INVLIN_001INVGEN]
GO
ALTER TABLE [dbo].[001INVSUB]  WITH NOCHECK ADD  CONSTRAINT [FK_001INVSUB_001INVALM] FOREIGN KEY([Cod_Almacen])
REFERENCES [dbo].[001INVALM] ([Codigo_Almacen])
GO
ALTER TABLE [dbo].[001INVSUB] CHECK CONSTRAINT [FK_001INVSUB_001INVALM]
------------------------------------------------------------------------------
------------------------------------------------------------------------------
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CostoSubreceta]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CostoSubreceta] AS SELECT dbo.[001COSRCL].Cod_Receta, SUM(dbo.[001COSRCL].Cantidad * dbo.[001COSCONV].Conv * dbo.[001COSART].Costo_Real / dbo.[001COSART].Cant_Util) As Total_Ingrediente FROM dbo.[001COSRCG] FULL OUTER JOIN dbo.[001COSUNI] RIGHT OUTER JOIN dbo.[001INVART] RIGHT OUTER JOIN dbo.[001COSCONV] INNER JOIN dbo.[001COSRCL] ON dbo.[001COSCONV].Uni_Pricipal = dbo.[001COSRCL].Uni_Med INNER JOIN dbo.[001COSART] ON dbo.[001COSCONV].Uni_Conv = dbo.[001COSART].Unidad_Medida AND dbo.[001COSRCL].Cod_Art = dbo.[001COSART].Codigo_Articulo ON dbo.[001INVART].Cod_Art = dbo.[001COSRCL].Cod_Art ON dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Pricipal AND dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Conv ON dbo.[001COSRCG].Unidad = dbo.[001COSUNI].Codigo_Unidad AND dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Receta AND dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Subrec GROUP BY dbo.[001COSRCL].Cod_Receta
GO
/****** Object:  View [dbo].[Costo_Receta]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Costo_Receta] AS SELECT     TOP 100 PERCENT dbo.[001COSRCL].Cod_Receta, dbo.[001COSRCL].No_Linea, dbo.[001COSRCL].Cod_Art, dbo.[001COSRCL].Cod_Subrec, dbo.[001INVART].Desc_Esp, dbo.[001COSRCG].Nom_RecEsp, dbo.[001COSRCL].Cantidad, dbo.[001COSRCL].Uni_Med, dbo.[001COSUNI].Nom_UniEsp, (dbo.[001COSRCL].Cantidad * [001COSCONV_2].Conv) * (dbo.[001COSART].Costo_Real / dbo.[001COSART].Cant_Util) AS CosArt, (dbo.[001COSRCL].Cantidad * [001COSCONV_1].Conv) * (dbo.CostoSubreceta.Total_Ingrediente / dbo.[001COSRCG].Porciones) AS CosSub FROM dbo.[001COSART] INNER JOIN dbo.[001COSCONV] [001COSCONV_2] ON dbo.[001COSART].Unidad_Medida = [001COSCONV_2].Uni_Conv RIGHT OUTER JOIN dbo.[001COSUNI] INNER JOIN dbo.[001COSRCL] ON dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSRCL].Uni_Med LEFT OUTER JOIN dbo.[001INVART] ON dbo.[001COSRCL].Cod_Art = dbo.[001INVART].Cod_Art LEFT OUTER JOIN dbo.[001COSCONV] [001COSCONV_1] INNER JOIN dbo.CostoSubreceta INNER JOIN dbo.[001COSRCG] ON dbo.CostoSubreceta.Cod_Receta = dbo.[001COSRCG].Codigo_Receta ON [001COSCONV_1].Uni_Conv = dbo.[001COSRCG].Unidad ON dbo.[001COSRCL].Cod_Subrec = dbo.CostoSubreceta.Cod_Receta AND dbo.[001COSRCL].Uni_Med = [001COSCONV_1].Uni_Pricipal ON dbo.[001COSART].Codigo_Articulo = dbo.[001COSRCL].Cod_Art AND [001COSCONV_2].Uni_Pricipal = dbo.[001COSRCL].Uni_Med ORDER BY dbo.[001COSRCL].Cod_Receta
GO
/****** Object:  View [dbo].[tono]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tono]
AS
SELECT     dbo.[001COSRCL].Cod_Receta, 
                      SUM(dbo.[001COSRCL].Cantidad * dbo.[001COSCONV].Conv * dbo.[001COSART].Costo_Real / dbo.[001COSART].Cant_Util) AS Total_Ingrediente
FROM         dbo.[001COSRCG] FULL OUTER JOIN
                      dbo.[001COSUNI] RIGHT OUTER JOIN
                      dbo.[001INVART] RIGHT OUTER JOIN
                      dbo.[001COSCONV] INNER JOIN
                      dbo.[001COSRCL] ON dbo.[001COSCONV].Uni_Pricipal = dbo.[001COSRCL].Uni_Med INNER JOIN
                      dbo.[001COSART] ON dbo.[001COSCONV].Uni_Conv = dbo.[001COSART].Unidad_Medida AND 
                      dbo.[001COSRCL].Cod_Art = dbo.[001COSART].Codigo_Articulo ON dbo.[001INVART].Cod_Art = dbo.[001COSRCL].Cod_Art ON 
                      dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Pricipal AND dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Conv ON 
                      dbo.[001COSRCG].Unidad = dbo.[001COSUNI].Codigo_Unidad AND dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Receta AND 
                      dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Subrec
GROUP BY dbo.[001COSRCL].Cod_Receta

GO
/****** Object:  View [dbo].[VIEW1]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW1]
AS
SELECT     dbo.[001COSRCG].Codigo_Receta, dbo.[001COSRCG].Nom_RecEsp, dbo.[001COSRCG].Porciones, dbo.[001COSRCG].Unidad, 
                      dbo.tono.Total_Ingrediente
FROM         dbo.[001COSRCG] INNER JOIN
                      dbo.tono ON dbo.[001COSRCG].Codigo_Receta = dbo.tono.Cod_Receta

GO
/****** Object:  View [dbo].[Articulo para Compras]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Articulo para Compras]
AS
SELECT     dbo.[001INVART].Cod_Art, dbo.[001INVART].Desc_Esp, dbo.[001INVART].Desc_Ing, dbo.[001INVART].Alm, dbo.[001INVART].Sub_Alm, 
                      dbo.[001INVEST].Cos_UE, dbo.[001INVEST].Cos_Prom, dbo.[001INVEST].Cos_Ant, dbo.[001INVMED].Codigo_Unidad, 
                      dbo.[001INVMED].Descripcion_Espanol, dbo.[001INVMED].Descripcion_Ingles, dbo.[001INVART].Uni_Ent
FROM         dbo.[001INVART] INNER JOIN
                      dbo.[001INVEST] ON dbo.[001INVART].Cod_Art = dbo.[001INVEST].Cod_Art INNER JOIN
                      dbo.[001INVMED] ON dbo.[001INVART].Uni_Ent = dbo.[001INVMED].Codigo_Unidad

GO
/****** Object:  View [dbo].[Balanza]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Balanza]
AS
SELECT     dbo.[001CONSAL05].Cuenta_1, dbo.[001CONSAL05].Cuenta_2, dbo.[001CONSAL05].Cuenta_3, dbo.[001CONSAL05].Cuenta_4, 
                      dbo.[001CONCTA].Descripcion, dbo.[001CONSAL05].Sal_6, dbo.[001CONSAL05].Car_7, dbo.[001CONSAL05].Abo_7, 
                      dbo.[001CONSAL05].Car_7 - dbo.[001CONSAL05].Abo_7 AS Mes_7, dbo.[001CONSAL05].Sal_7
FROM         dbo.[001CONSAL05] INNER JOIN
                      dbo.[001CONCTA] ON dbo.[001CONSAL05].Cuenta_1 = dbo.[001CONCTA].Cuenta_1 AND 
                      dbo.[001CONSAL05].Cuenta_2 = dbo.[001CONCTA].Cuenta_2 AND dbo.[001CONSAL05].Cuenta_3 = dbo.[001CONCTA].Cuenta_3 AND 
                      dbo.[001CONSAL05].Cuenta_4 = dbo.[001CONCTA].Cuenta_4
WHERE     (dbo.[001CONSAL05].Sal_6 <> 0) OR
                      (dbo.[001CONSAL05].Car_7 <> 0) OR
                      (dbo.[001CONSAL05].Abo_7 <> 0) OR
                      (dbo.[001CONSAL05].Car_7 - dbo.[001CONSAL05].Abo_7 <> 0) OR
                      (dbo.[001CONSAL05].Sal_7 <> 0)

GO
/****** Object:  View [dbo].[BalanzaComprueba]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BalanzaComprueba]
AS
SELECT     dbo.[001CONCTA].Afectable, SUM(dbo.[001CONSAL05].Sal_0) AS Sal_0, SUM(dbo.[001CONSAL05].Car_1) AS Car_1, SUM(dbo.[001CONSAL05].Abo_1) 
                      AS Abo_1, SUM(dbo.[001CONSAL05].Car_1 - dbo.[001CONSAL05].Abo_1) AS Mes_1, SUM(dbo.[001CONSAL05].Sal_1) AS Sal_1, 
                      SUM(dbo.[001CONSAL05].Car_2) AS Car_2, SUM(dbo.[001CONSAL05].Abo_2) AS Abo_2, SUM(dbo.[001CONSAL05].Car_2 - dbo.[001CONSAL05].Abo_2) 
                      AS Mes_2, SUM(dbo.[001CONSAL05].Sal_2) AS Sal_2, SUM(dbo.[001CONSAL05].Car_3) AS Car_3, SUM(dbo.[001CONSAL05].Abo_3) AS Abo_3, 
                      SUM(dbo.[001CONSAL05].Car_3 - dbo.[001CONSAL05].Abo_3) AS Mes_3, SUM(dbo.[001CONSAL05].Sal_3) AS Sal_3, SUM(dbo.[001CONSAL05].Car_4) 
                      AS Car_4, SUM(dbo.[001CONSAL05].Abo_4) AS Abo_4, SUM(dbo.[001CONSAL05].Car_4 - dbo.[001CONSAL05].Abo_4) AS Mes_4, 
                      SUM(dbo.[001CONSAL05].Sal_4) AS Sal_4, SUM(dbo.[001CONSAL05].Car_5) AS Car_5, SUM(dbo.[001CONSAL05].Abo_5) AS Abo_5, 
                      SUM(dbo.[001CONSAL05].Car_5 - dbo.[001CONSAL05].Abo_5) AS Mes_5, SUM(dbo.[001CONSAL05].Sal_5) AS Sal_5, SUM(dbo.[001CONSAL05].Car_6) 
                      AS Car_6, SUM(dbo.[001CONSAL05].Abo_6) AS Abo_6, SUM(dbo.[001CONSAL05].Car_6 - dbo.[001CONSAL05].Abo_6) AS Mes_6, 
                      SUM(dbo.[001CONSAL05].Sal_6) AS Sal_6, SUM(dbo.[001CONSAL05].Car_7) AS Car_7, SUM(dbo.[001CONSAL05].Abo_7) AS Abo_7, 
                      SUM(dbo.[001CONSAL05].Car_7 - dbo.[001CONSAL05].Abo_7) AS Mes_7, SUM(dbo.[001CONSAL05].Sal_7) AS Sal_7, SUM(dbo.[001CONSAL05].Car_8) 
                      AS Car_8, SUM(dbo.[001CONSAL05].Abo_8) AS Abo_8, SUM(dbo.[001CONSAL05].Car_8 - dbo.[001CONSAL05].Abo_8) AS Mes_8, 
                      SUM(dbo.[001CONSAL05].Sal_8) AS Sal_8, SUM(dbo.[001CONSAL05].Car_9) AS Car_9, SUM(dbo.[001CONSAL05].Abo_9) AS Abo_9, 
                      SUM(dbo.[001CONSAL05].Car_9 - dbo.[001CONSAL05].Abo_9) AS Mes_9, SUM(dbo.[001CONSAL05].Sal_9) AS Sal_9, SUM(dbo.[001CONSAL05].Car_10) 
                      AS Car_10, SUM(dbo.[001CONSAL05].Abo_10) AS Abo_10, SUM(dbo.[001CONSAL05].Car_10 - dbo.[001CONSAL05].Abo_10) AS Mes_10, 
                      SUM(dbo.[001CONSAL05].Sal_10) AS Sal_10, SUM(dbo.[001CONSAL05].Car_11) AS Car_11, SUM(dbo.[001CONSAL05].Abo_11) AS Abo_11, 
                      SUM(dbo.[001CONSAL05].Car_11 - dbo.[001CONSAL05].Abo_11) AS Mes_11, SUM(dbo.[001CONSAL05].Sal_11) AS Sal_11, 
                      SUM(dbo.[001CONSAL05].Car_12) AS Car_12, SUM(dbo.[001CONSAL05].Abo_12) AS Abo_12, 
                      SUM(dbo.[001CONSAL05].Car_12 - dbo.[001CONSAL05].Abo_12) AS Mes_12, SUM(dbo.[001CONSAL05].Sal_12) AS Sal_12
FROM         dbo.[001CONSAL05] INNER JOIN
                      dbo.[001CONCTA] ON dbo.[001CONSAL05].Cuenta_1 = dbo.[001CONCTA].Cuenta_1 AND 
                      dbo.[001CONSAL05].Cuenta_2 = dbo.[001CONCTA].Cuenta_2 AND dbo.[001CONSAL05].Cuenta_3 = dbo.[001CONCTA].Cuenta_3 AND 
                      dbo.[001CONSAL05].Cuenta_4 = dbo.[001CONCTA].Cuenta_4
GROUP BY dbo.[001CONCTA].Afectable
HAVING      (dbo.[001CONCTA].Afectable = 1)

GO
/****** Object:  View [dbo].[Costo Ingrientes]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Costo Ingrientes]
AS
SELECT     dbo.[001COSRCL].Cod_Receta, dbo.[001COSRCL].No_Linea, dbo.[001COSRCL].Cod_Art, dbo.[001INVART].Desc_Esp, dbo.[001INVART].Desc_Ing, 
                      dbo.[001COSRCL].Cantidad, dbo.[001COSART].Cant_Util, dbo.[001COSART].Costo_Real, dbo.[001COSCONV].Uni_Pricipal, 
                      dbo.[001COSCONV].Uni_Conv, dbo.[001COSCONV].Conv, 
                      dbo.[001COSRCL].Cantidad * dbo.[001COSCONV].Conv * dbo.[001COSART].Costo_Real / dbo.[001COSART].Cant_Util AS Total_Ingrediente
FROM         dbo.[001COSRCG] FULL OUTER JOIN
                      dbo.[001COSUNI] RIGHT OUTER JOIN
                      dbo.[001INVART] RIGHT OUTER JOIN
                      dbo.[001COSCONV] INNER JOIN
                      dbo.[001COSRCL] ON dbo.[001COSCONV].Uni_Pricipal = dbo.[001COSRCL].Uni_Med INNER JOIN
                      dbo.[001COSART] ON dbo.[001COSCONV].Uni_Conv = dbo.[001COSART].Unidad_Medida AND 
                      dbo.[001COSRCL].Cod_Art = dbo.[001COSART].Codigo_Articulo ON dbo.[001INVART].Cod_Art = dbo.[001COSRCL].Cod_Art ON 
                      dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Pricipal AND dbo.[001COSUNI].Codigo_Unidad = dbo.[001COSCONV].Uni_Conv ON 
                      dbo.[001COSRCG].Unidad = dbo.[001COSUNI].Codigo_Unidad AND dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Receta AND 
                      dbo.[001COSRCG].Codigo_Receta = dbo.[001COSRCL].Cod_Subrec

GO
/****** Object:  View [dbo].[DECCXP]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DECCXP]
AS
SELECT     COUNT(*) AS Movtos, Cuenta_1 + Cuenta_2 + Cuenta_3 + Cuenta_4 AS Cuenta, SUM(Abono) AS Total
FROM         dbo.[001CONCOL]
WHERE     (Cuenta_1 = '2050') AND (Fecha_PolL >= CONVERT(DATETIME, '2005-07-01 00:00:00', 102)) AND (Fecha_PolL <= CONVERT(DATETIME, 
                      '2005-12-31 00:00:00', 102))
GROUP BY Tipo_PolL, Cuenta_1 + Cuenta_2 + Cuenta_3 + Cuenta_4
HAVING      (Tipo_PolL = 'EN')

GO
/****** Object:  View [dbo].[DESGLOSA COTIZACIONES]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DESGLOSA COTIZACIONES]
AS
SELECT     dbo.[001COMRQL].*, dbo.[001COMPRECIOS].Codigo_Prov AS Prov_Cot, dbo.[001COMPRECIOS].Precio_1 AS Precio_Cot, 
                      dbo.[001COMPRECIOS].Fecha_1 AS Fecha_Cot, dbo.[001CXPCAT].Razon_Social AS Proveedor_Cot, dbo.[001INVEST].Exis_Dia AS Exis, 
                      dbo.[001INVEST].Cos_Prom AS Costo
FROM         dbo.[001INVEST] RIGHT OUTER JOIN
                      dbo.[001COMRQL] INNER JOIN
                      dbo.[001COMRQG] ON dbo.[001COMRQL].No_Req = dbo.[001COMRQG].No_Req ON 
                      dbo.[001INVEST].Cod_Art = dbo.[001COMRQL].Cod_Art LEFT OUTER JOIN
                      dbo.[001CXPCAT] INNER JOIN
                      dbo.[001COMPRECIOS] ON dbo.[001CXPCAT].Codigo_Provedor = dbo.[001COMPRECIOS].Codigo_Prov ON 
                      dbo.[001COMRQL].Cod_Art = dbo.[001COMPRECIOS].Codigo_Articulo

GO
/****** Object:  View [dbo].[EDOCTAPROV]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EDOCTAPROV]
AS
SELECT     TOP 100 PERCENT dbo.[001CXPHP0305].Codigo_Provedor, dbo.[001CXPHP0805].Cod_Provedor, dbo.[001CXPHP0305].Razon_Social, 
                      dbo.[001CXPHP0305].Direccion, dbo.[001CXPHP0305].Colonia, dbo.[001CXPHP0305].Poblacion, dbo.[001CXPHP0305].CP, 
                      dbo.[001CXPHP0305].Telefono, dbo.[001CXPHP0805].Num_Factura, dbo.[001CXPHP0805].Codigo_Cargo, dbo.[001CXPHP0805].Codigo_Banco, 
                      dbo.[001CXPHP0805].Fecha_Ven, dbo.[001CXPHP0805].Comentarios, dbo.[001CXPHP0805].Importe, dbo.[001CXPHP0805].Fecha_Mov
FROM         dbo.[001CXPHP0305] INNER JOIN
                      dbo.[001CXPHP0805] ON dbo.[001CXPHP0305].Codigo_Provedor = dbo.[001CXPHP0805].Cod_Provedor
WHERE     (dbo.[001CXPHP0305].Codigo_Provedor = '100001')
ORDER BY dbo.[001CXPHP0805].Num_Factura

GO
/****** Object:  View [dbo].[Facturas]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Facturas]
AS
SELECT     dbo.[001CXPCAR].*
FROM         dbo.[001CXPCAR]

GO
/****** Object:  View [dbo].[Gral_Facturas]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Gral_Facturas]
AS
SELECT     dbo.[001CXCFCG].No_Factura, dbo.[001CXCFCG].Fecha_Fac, dbo.[001CXCFCG].Cod_Cliente, dbo.[001CXCCAT].Razon_Social, 
                      dbo.[001CXCCAT].Nombre_Comercial, dbo.[001CXCCAT].RFC, dbo.[001CXCCAT].Direccion, dbo.[001CXCCAT].Colonia, dbo.[001CXCCAT].Poblacion, 
                      dbo.[001CXCCAT].CP
FROM         dbo.[001CXCFCG] INNER JOIN
                      dbo.[001CXCCAT] ON dbo.[001CXCFCG].Cod_Cliente = dbo.[001CXCCAT].Codigo_Cliente

GO
/****** Object:  View [dbo].[GralPedidos]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GralPedidos]
AS
SELECT     dbo.[001COMPDG].*, dbo.[001CXPCAT].Razon_Social AS Prov, dbo.[001INVDEP].Desc_Esp AS Depto, dbo.[001CXPCAT].RFC AS RFC, 
                      dbo.[001CXPCAT].Telefono AS TEL, dbo.[001CXPCAT].Contacto AS Contacto
FROM         dbo.[001COMPDG] INNER JOIN
                      dbo.[001INVDEP] ON dbo.[001COMPDG].Cod_Depto = dbo.[001INVDEP].Cod_Dep LEFT OUTER JOIN
                      dbo.[001CXPCAT] ON dbo.[001COMPDG].Cod_Prov = dbo.[001CXPCAT].Codigo_Provedor

GO
/****** Object:  View [dbo].[IVAPROV]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IVAPROV]
AS
SELECT     dbo.[001CONCOL].*, Cuenta_1 AS Expr2, Cuenta_2 AS Expr3, Cuenta_3 AS Expr4, Cuenta_4 AS Expr5, Tipo_PolL AS Expr1
FROM         dbo.[001CONCOL]
WHERE     (Cuenta_1 = '1230') AND (Cuenta_2 = '0100') AND (Cuenta_3 = '0001') AND (Cuenta_4 = '0001') AND (Tipo_PolL = 'EN')

GO
/****** Object:  View [dbo].[LecturaArt]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LecturaArt]
AS
SELECT     dbo.[001INVART].Cod_Art, dbo.[001INVART].Cod_Barras, dbo.[001INVART].Desc_Esp, dbo.[001INVART].Desc_Ing, dbo.[001INVEST].Exis_Dia, 
                      dbo.[001INVEST].Cos_UE, dbo.[001INVEST].Cos_Ant, dbo.[001INVEST].Cos_Prom, dbo.[001INVART].Precio_Venta, dbo.[001INVART].Uni_Ent
FROM         dbo.[001INVART] INNER JOIN
                      dbo.[001INVEST] ON dbo.[001INVART].Cod_Art = dbo.[001INVEST].Cod_Art INNER JOIN
                      dbo.[001INVSUB] ON dbo.[001INVART].Alm = dbo.[001INVSUB].Cod_Almacen AND 
                      dbo.[001INVART].Sub_Alm = dbo.[001INVSUB].Cod_Subalmacen
WHERE     (dbo.[001INVART].Cod_Barras = 928237650399)

GO
/****** Object:  View [dbo].[Lee Articulo]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Lee Articulo]
AS
SELECT     dbo.[001INVART].Cod_Art, dbo.[001INVART].Desc_Esp, dbo.[001INVART].Desc_Ing, dbo.[001INVEST].Exis_Dia, dbo.[001INVEST].Cos_UE, 
                      dbo.[001INVEST].Cos_Ant, dbo.[001INVEST].Cos_Prom, dbo.[001INVSUB].Cuenta_Cargo1, dbo.[001INVART].Uni_Ent
FROM         dbo.[001INVART] INNER JOIN
                      dbo.[001INVEST] ON dbo.[001INVART].Cod_Art = dbo.[001INVEST].Cod_Art INNER JOIN
                      dbo.[001INVSUB] ON dbo.[001INVART].Alm = dbo.[001INVSUB].Cod_Almacen AND dbo.[001INVART].Sub_Alm = dbo.[001INVSUB].Cod_Subalmacen

GO
/****** Object:  View [dbo].[Lineas_Factura]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Lineas_Factura]
AS
SELECT     dbo.[001CXCFCL].No_Factura, dbo.[001CXCFCL].No_Linea, dbo.[001CXCFCL].Noches, dbo.[001CXCFCL].Concepto, dbo.[001CXCFCL].Tarifa, 
                      dbo.[001CXCFCL].Total, dbo.[001CXCCDF].Tipo_Cargo, dbo.[001CXCCDF].Folio, dbo.[001CXCCDF].Iva, dbo.[001CXCCDF].Ish
FROM         dbo.[001CXCFCL] INNER JOIN
                      dbo.[001CXCCDF] ON dbo.[001CXCFCL].Tipo_Mov = dbo.[001CXCCDF].Codigo_Cargo

GO
/****** Object:  View [dbo].[Pagos]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pagos]
AS
SELECT     SUM((dbo.[001CONCOL].Cargo - dbo.[001CONCOL].Abono) * - 1) AS saldos, dbo.[001CONCOL].Documento
FROM         dbo.[001CONCOL] INNER JOIN
                      dbo.[001CONCTA] ON dbo.[001CONCOL].Cuenta_1 = dbo.[001CONCTA].Cuenta_1 AND dbo.[001CONCOL].Cuenta_2 = dbo.[001CONCTA].Cuenta_2 AND 
                      dbo.[001CONCOL].Cuenta_3 = dbo.[001CONCTA].Cuenta_3 AND dbo.[001CONCOL].Cuenta_4 = dbo.[001CONCTA].Cuenta_4
WHERE     (dbo.[001CONCOL].Cuenta_1 = '2050') AND (dbo.[001CONCOL].Cuenta_2 = '0100') AND (dbo.[001CONCOL].Cuenta_3 = '0001') AND 
                      (dbo.[001CONCOL].Cuenta_4 = '0001')
GROUP BY dbo.[001CONCOL].Documento

GO
/****** Object:  View [dbo].[Pagos2]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pagos2]
AS
SELECT     dbo.[001CONCOL].Periodo, dbo.[001CONCOL].Tipo_PolL, dbo.[001CONCOL].Num_PolL, dbo.[001CONCOL].Linea, dbo.[001CONCOL].Documento, 
                      dbo.[001CONCOL].Referencia, dbo.[001CONCOL].Fecha_PolL, dbo.[001CONCOL].Concepto_PolL, dbo.[001CONCOL].Cargo, dbo.[001CONCOL].Abono, 
                      dbo.[001CONCTA].Cta_Modulo, dbo.[001CONCOL].Caza, dbo.[001CONCOG].Status, dbo.[001CONCOL].Cuenta_1, dbo.[001CONCOL].Cuenta_2, 
                      dbo.[001CONCOL].Cuenta_3, dbo.[001CONCOL].Cuenta_4
FROM         dbo.[001CONCOL] INNER JOIN
                      dbo.[001CONCTA] ON dbo.[001CONCOL].Cuenta_1 = dbo.[001CONCTA].Cuenta_1 AND dbo.[001CONCOL].Cuenta_2 = dbo.[001CONCTA].Cuenta_2 AND 
                      dbo.[001CONCOL].Cuenta_3 = dbo.[001CONCTA].Cuenta_3 AND dbo.[001CONCOL].Cuenta_4 = dbo.[001CONCTA].Cuenta_4 INNER JOIN
                      dbo.[001CONCOG] ON dbo.[001CONCOL].Cia = dbo.[001CONCOG].Cia AND dbo.[001CONCOL].Periodo = dbo.[001CONCOG].Periodo AND 
                      dbo.[001CONCOL].Tipo_PolL = dbo.[001CONCOG].Tipo_PolG AND dbo.[001CONCOL].Num_PolL = dbo.[001CONCOG].Num_PolG
WHERE     (dbo.[001CONCTA].Cta_Modulo = 1) AND (dbo.[001CONCOL].Caza IS NULL OR
                      dbo.[001CONCOL].Caza = '') AND (dbo.[001CONCOG].Status = 1) AND (dbo.[001CONCOL].Cargo <> 0) OR
                      (dbo.[001CONCTA].Cta_Modulo = 1) AND (dbo.[001CONCOL].Caza IS NULL OR
                      dbo.[001CONCOL].Caza = '') AND (dbo.[001CONCOG].Status = 1) AND (dbo.[001CONCOL].Abono <> 0)

GO
/****** Object:  View [dbo].[PedLin]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PedLin]
AS
SELECT     dbo.[001COMPDL].*, dbo.[001INVART].Desc_Esp AS Desc_Art, dbo.[001INVMED].Descripcion_Espanol AS Desc_Uni, 
                      dbo.[001COMPDL].No_Ped AS No_Pedido, dbo.[001INVART].IVA AS Iva, dbo.[001INVMED].Codigo_Unidad AS Cod_Uni
FROM         dbo.[001INVMED] INNER JOIN
                      dbo.[001INVART] ON dbo.[001INVMED].Codigo_Unidad = dbo.[001INVART].Uni_Ent AND 
                      dbo.[001INVMED].Codigo_Unidad = dbo.[001INVART].Uni_Sal INNER JOIN
                      dbo.[001COMPDL] ON dbo.[001INVART].Cod_Art = dbo.[001COMPDL].No_Art
WHERE     (dbo.[001COMPDL].No_Ped = '16')

GO
/****** Object:  View [dbo].[Poliza de Entradas de Almacén]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Poliza de Entradas de Almacén]
AS
SELECT     dbo.[001INVGEN].Ind_Mov, dbo.[001INVGEN].No_Req, dbo.[001INVART].Alm, dbo.[001INVALM].Cta_Contable, SUM(dbo.[001INVLIN].Total) AS SubAlm, 
                      dbo.[001CXPCAT].Cuenta AS Cuenta_Prov, dbo.[001INVGEN].Total_Fac, dbo.[001INVGEN].Iva_Fac, dbo.[001INVGEN].Notas, 
                      dbo.[001CXPCAT].Tipo_Provedor
FROM         dbo.[001INVGEN] INNER JOIN
                      dbo.[001INVLIN] ON dbo.[001INVGEN].Ind_Mov = dbo.[001INVLIN].Indice INNER JOIN
                      dbo.[001INVART] ON dbo.[001INVLIN].Cod_Art = dbo.[001INVART].Cod_Art INNER JOIN
                      dbo.[001CXPCAT] ON dbo.[001INVGEN].Cod_Prov = dbo.[001CXPCAT].Codigo_Provedor INNER JOIN
                      dbo.[001INVALM] ON dbo.[001INVART].Alm = dbo.[001INVALM].Codigo_Almacen
WHERE     (dbo.[001INVGEN].Fech_Mov = '2005-06-01') AND (dbo.[001INVGEN].Stat_Mov = 1) AND (dbo.[001INVGEN].Tipo_Mov = 'ENT')
GROUP BY dbo.[001INVGEN].Ind_Mov, dbo.[001INVGEN].No_Req, dbo.[001INVART].Alm, dbo.[001INVALM].Cta_Contable, dbo.[001CXPCAT].Cuenta, 
                      dbo.[001INVGEN].Total_Fac, dbo.[001INVGEN].Iva_Fac, dbo.[001INVGEN].Notas, dbo.[001CXPCAT].Tipo_Provedor

GO
/****** Object:  View [dbo].[POLIZA DE SALIDAS DE ALMACEN]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[POLIZA DE SALIDAS DE ALMACEN]
AS
SELECT     dbo.[001INVGEN].No_Req, dbo.[001INVGEN].Tipo_Mov, dbo.[001INVLIN].Linea, dbo.[001INVLIN].Cod_Art, dbo.[001INVLIN].Total, 
                      dbo.[001INVGEN].Notas, dbo.[001INVGEN].Cod_Dep, dbo.[001INVDEP].Cta_Mayor, dbo.[001INVSUB].Cuenta_Cargo1, dbo.[001INVALM].Cta_Contable, 
                      dbo.[001INVART].Desc_Esp, dbo.[001INVGEN].Fech_Mov, dbo.[001INVGEN].Ind_Mov, dbo.[001INVLIN].Cta_Con, dbo.[001INVDEPCTAS].Cuenta_1, 
                      dbo.[001INVDEPCTAS].Cuenta_2, dbo.[001INVDEPCTAS].Cuenta_3, dbo.[001INVDEPCTAS].Cuenta_4
FROM         dbo.[001INVSUB] INNER JOIN
                      dbo.[001INVALM] ON dbo.[001INVSUB].Cod_Almacen = dbo.[001INVALM].Codigo_Almacen INNER JOIN
                      dbo.[001INVART] ON dbo.[001INVSUB].Cod_Almacen = dbo.[001INVART].Alm AND 
                      dbo.[001INVSUB].Cod_Subalmacen = dbo.[001INVART].Sub_Alm INNER JOIN
                      dbo.[001INVGEN] INNER JOIN
                      dbo.[001INVLIN] ON dbo.[001INVGEN].Ind_Mov = dbo.[001INVLIN].Indice INNER JOIN
                      dbo.[001INVDEP] ON dbo.[001INVGEN].Cod_Dep = dbo.[001INVDEP].Cod_Dep ON dbo.[001INVART].Cod_Art = dbo.[001INVLIN].Cod_Art INNER JOIN
                      dbo.[001INVDEPCTAS] ON dbo.[001INVSUB].Cod_Almacen = dbo.[001INVDEPCTAS].Cod_Alma AND 
                      dbo.[001INVSUB].Cod_Subalmacen = dbo.[001INVDEPCTAS].Cod_Sub AND dbo.[001INVDEP].Cod_Dep = dbo.[001INVDEPCTAS].Cod_Dep
WHERE     (dbo.[001INVGEN].Fech_Mov = '2005-07-01') AND (dbo.[001INVGEN].Tipo_Mov = 'SAL')

GO
/****** Object:  View [dbo].[Receta]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Receta]
AS
SELECT     dbo.[001COSRCL].Cod_Receta, dbo.[001COSRCL].No_Linea
FROM         dbo.[001COSART] CROSS JOIN
                      dbo.[001INVART] CROSS JOIN
                      dbo.[001COSRCL] CROSS JOIN
                      dbo.[001COSRCG] CROSS JOIN
                      dbo.[001COSCONV]

GO
/****** Object:  View [dbo].[Relacion de facturas pagadas]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Relacion de facturas pagadas]
AS
SELECT     Banco, Cheque, Factura, Referencia, Fecha, Concepto, Cargo, Abono, Pagar
FROM         dbo.[001CXPPAGOS]
WHERE     (Banco = '01') AND (Cheque = '6553') AND (Pagar = 1)

GO
/****** Object:  View [dbo].[Resultados]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Resultados]
AS
SELECT     SUM(dbo.[001CONSAL05].Car_1 - dbo.[001CONSAL05].Abo_1) AS Mes_1, SUM(dbo.[001CONSAL05].Car_2 - dbo.[001CONSAL05].Abo_2) AS Mes_2, 
                      SUM(dbo.[001CONSAL05].Car_3 - dbo.[001CONSAL05].Abo_3) AS Mes_3, SUM(dbo.[001CONSAL05].Car_4 - dbo.[001CONSAL05].Abo_4) AS Mes_4, 
                      SUM(dbo.[001CONSAL05].Car_5 - dbo.[001CONSAL05].Abo_5) AS Mes_5, SUM(dbo.[001CONSAL05].Car_6 - dbo.[001CONSAL05].Abo_6) AS Mes_6, 
                      SUM(dbo.[001CONSAL05].Car_7 - dbo.[001CONSAL05].Abo_7) AS Mes_7, SUM(dbo.[001CONSAL05].Car_8 - dbo.[001CONSAL05].Abo_8) AS Mes_8, 
                      SUM(dbo.[001CONSAL05].Car_9 - dbo.[001CONSAL05].Abo_9) AS Mes_9
FROM         dbo.[001CONSAL05] INNER JOIN
                      dbo.[001CONCTA] ON dbo.[001CONSAL05].Cuenta_1 = dbo.[001CONCTA].Cuenta_1 AND 
                      dbo.[001CONSAL05].Cuenta_2 = dbo.[001CONCTA].Cuenta_2 AND dbo.[001CONSAL05].Cuenta_3 = dbo.[001CONCTA].Cuenta_3 AND 
                      dbo.[001CONSAL05].Cuenta_4 = dbo.[001CONCTA].Cuenta_4
WHERE     (dbo.[001CONSAL05].Cuenta_1 + dbo.[001CONSAL05].Cuenta_2 + dbo.[001CONSAL05].Cuenta_3 + dbo.[001CONSAL05].Cuenta_4 >= '4000010000000000')
                       AND (dbo.[001CONCTA].Afectable = 1) AND 
                      (dbo.[001CONSAL05].Cuenta_1 + dbo.[001CONSAL05].Cuenta_2 + dbo.[001CONSAL05].Cuenta_3 + dbo.[001CONSAL05].Cuenta_4 <= '4000010009990000')

GO
/****** Object:  View [dbo].[VIEW10]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW10]
AS
SELECT     TOP 100 PERCENT *
FROM         dbo.[001CXCCART]
WHERE     (Cod_Cliente >= '1') AND (Cod_Cliente <= '69') AND (Fecha_Doc <= CONVERT(DATETIME, '2005-07-31 00:00:00', 102))
ORDER BY Cod_Cliente

GO
/****** Object:  View [dbo].[VIEW11]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW11]
AS
SELECT     *
FROM         dbo.[001PRECART]
WHERE     (Cod_Cliente >= '3') AND (Cod_Cliente <= '1131')

GO
/****** Object:  View [dbo].[VIEW2]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW2]
AS
SELECT     dbo.[001CONCTA].*, dbo.[001CONCLA].Descripcion_1, dbo.[001CONSUB].Descripcion_1 AS SubClas
FROM         dbo.[001CONCTA] INNER JOIN
                      dbo.[001CONSUB] ON dbo.[001CONCTA].Tipo_Cuenta = dbo.[001CONSUB].Tipo_Cuenta AND 
                      dbo.[001CONCTA].Clasificacion = dbo.[001CONSUB].Clasificacion AND 
                      dbo.[001CONCTA].Subclasificacion = dbo.[001CONSUB].Subclasificacion INNER JOIN
                      dbo.[001CONCLA] ON dbo.[001CONCTA].Tipo_Cuenta = dbo.[001CONCLA].Tipo_Cuenta AND 
                      dbo.[001CONCTA].Clasificacion = dbo.[001CONCLA].Clasificacion

GO
/****** Object:  View [dbo].[VIEW3]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW3]
AS
SELECT     COUNT(*) AS Expr1, SUM(Cargo) AS Expr2, SUM(Abono) AS Expr3, (SUM(Cargo) - SUM(Abono)) * - 1 AS Total
FROM         dbo.[001CXPPAGOS]
WHERE     (Pagar = 1)

GO
/****** Object:  View [dbo].[VIEW4]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW4]
AS
SELECT     Periodo, Tipo_PolL, Num_PolL, Linea, Cuenta_1 + '-' + Cuenta_2 + '-' + Cuenta_3 + '-' + Cuenta_4 AS Cuentas, Fecha_PolL, Concepto_PolL, Documento, 
                      Cargo, Abono, Caza
FROM         dbo.[001CONCOL]
WHERE     (Caza = '22')

GO
/****** Object:  View [dbo].[VIEW5]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW5]
AS
SELECT     SUM(dbo.[001CONCOL].Cargo) AS Cargos, SUM(dbo.[001CONCOL].Abono) AS Abonos, SUM(dbo.[001CONCOL].Cargo) - SUM(dbo.[001CONCOL].Abono) 
                      AS Total
FROM         dbo.[001CONCOG] INNER JOIN
                      dbo.[001CONCOL] ON dbo.[001CONCOG].Cia = dbo.[001CONCOL].Cia AND dbo.[001CONCOG].Periodo = dbo.[001CONCOL].Periodo AND 
                      dbo.[001CONCOG].Tipo_PolG = dbo.[001CONCOL].Tipo_PolL AND dbo.[001CONCOG].Num_PolG = dbo.[001CONCOL].Num_PolL
WHERE     (dbo.[001CONCOL].Cuenta_1 = '2050') AND (dbo.[001CONCOL].Cuenta_2 = '0100') AND (dbo.[001CONCOL].Cuenta_3 = '0001') AND 
                      (dbo.[001CONCOL].Cuenta_4 = '0003') AND (dbo.[001CONCOL].Caza = '' OR
                      dbo.[001CONCOL].Caza IS NULL)

GO
/****** Object:  View [dbo].[VIEW6]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW6]
AS
SELECT     dbo.[001INVGEN].*, dbo.[001CXPCAT].Razon_Social AS Expr1, dbo.[001INVDEP].Desc_Esp AS Expr4, dbo.[001INVDEP].Cta_Mayor AS Expr2
FROM         dbo.[001INVGEN] LEFT OUTER JOIN
                      dbo.[001INVDEP] ON dbo.[001INVGEN].Cod_Dep = dbo.[001INVDEP].Cod_Dep LEFT OUTER JOIN
                      dbo.[001CXPCAT] ON dbo.[001INVGEN].Cod_Prov = dbo.[001CXPCAT].Codigo_Provedor
WHERE     (dbo.[001INVGEN].Ind_Mov LIKE '" & Me.No_Mov & "')

GO
/****** Object:  View [dbo].[VIEW7]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW7]
AS
SELECT     dbo.[001CONCTA].Cuenta_1, dbo.[001CONCTA].Cuenta_2, dbo.[001CONCTA].Cuenta_3, dbo.[001CONCTA].Cuenta_4, dbo.[001CONCTA].Descripcion, 
                      dbo.[001CONCTA].Descripcion_2, dbo.[001CONCTA].Tipo_Cuenta, dbo.[001CONCTA].Clasificacion, dbo.[001CONCLA].Descripcion_1, 
                      dbo.[001CONSUB].Descripcion_1 AS SubClas
FROM         dbo.[001CONCTA] INNER JOIN
                      dbo.[001CONSUB] ON dbo.[001CONCTA].Tipo_Cuenta = dbo.[001CONSUB].Tipo_Cuenta AND 
                      dbo.[001CONCTA].Clasificacion = dbo.[001CONSUB].Clasificacion AND 
                      dbo.[001CONCTA].Subclasificacion = dbo.[001CONSUB].Subclasificacion LEFT OUTER JOIN
                      dbo.[001CONCLA] ON dbo.[001CONCTA].Clasificacion = dbo.[001CONCLA].Clasificacion AND 
                      dbo.[001CONCTA].Tipo_Cuenta = dbo.[001CONCLA].Tipo_Cuenta

GO
/****** Object:  View [dbo].[VIEW8]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW8]
AS
SELECT     MIN(Precio) AS Expr1, No_Requisicion, No_Linea
FROM         dbo.[001COMCOTI]
WHERE     (No_Requisicion = '13') AND (No_Linea = '1')
GROUP BY No_Requisicion, No_Linea, CodProv

GO
/****** Object:  View [dbo].[VIEW9]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW9]
AS
SELECT     TOP 100 PERCENT COUNT(*) AS Total, dbo.[001CXCPREVIA].Billing AS Billing, dbo.[001CXCPREVIA].AGENCIA, dbo.[001CXCCAT].Razon_Social, 
                      dbo.[001CXCCAT].Codigo_Cliente
FROM         dbo.[001CXCPREVIA] RIGHT OUTER JOIN
                      dbo.[001CXCCAT] ON dbo.[001CXCPREVIA].CodCxc = dbo.[001CXCCAT].Codigo_Cliente
WHERE     (dbo.[001CXCPREVIA].Billing <> 0)
GROUP BY dbo.[001CXCPREVIA].Billing, dbo.[001CXCPREVIA].AGENCIA, dbo.[001CXCCAT].Razon_Social, dbo.[001CXCCAT].Codigo_Cliente
ORDER BY dbo.[001CXCPREVIA].Billing

GO
/****** Object:  View [dbo].[Vista Art Recetas]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista Art Recetas]
AS
SELECT     dbo.[001INVART].Cod_Art, dbo.[001INVART].Desc_Esp, dbo.[001INVART].Desc_Ing, dbo.[001INVMED].Descripcion_Espanol, 
                      dbo.[001INVMED].Descripcion_Ingles, dbo.[001INVEST].Cos_Prom
FROM         dbo.[001INVART] INNER JOIN
                      dbo.[001INVMED] ON dbo.[001INVART].Uni_Ent = dbo.[001INVMED].Codigo_Unidad AND 
                      dbo.[001INVART].Uni_Sal = dbo.[001INVMED].Codigo_Unidad INNER JOIN
                      dbo.[001INVEST] ON dbo.[001INVART].Cod_Art = dbo.[001INVEST].Cod_Art

GO
/****** Object:  View [dbo].[Vista Lineas de Requisicion]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista Lineas de Requisicion]
AS
SELECT     dbo.[001COMRQL].No_Lin, dbo.[001COMRQL].Cod_Art, dbo.[001COMRQL].Desc_Art, dbo.[001COMRQL].Cantidad, dbo.[001COMRQL].Notas, 
                      dbo.[001INVMED].Descripcion_Espanol
FROM         dbo.[001COMRQL] INNER JOIN
                      dbo.[001INVMED] ON dbo.[001COMRQL].Cod_Med = dbo.[001INVMED].Codigo_Unidad

GO
/****** Object:  View [dbo].[Vista requisiciones]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista requisiciones]
AS
SELECT     dbo.[001COMRQG].No_Req, dbo.[001COMRQG].Tip_Req, dbo.[001COMRQG].Cod_Dep, dbo.[001COMRQG].Cod_Prio, dbo.[001COMRQG].Notas_Req, 
                      dbo.[001COMRQG].Fecha_Req, dbo.[001INVDEP].Desc_Esp, dbo.[001COMPRI].Desc_Esp AS Desc_Prio, dbo.[001COMTIP].Desc_Esp AS Desc_Tipo, 
                      dbo.[001COMRQG].Status_Req
FROM         dbo.[001COMRQG] INNER JOIN
                      dbo.[001COMPRI] ON dbo.[001COMRQG].Cod_Prio = dbo.[001COMPRI].Tip_Prio INNER JOIN
                      dbo.[001COMTIP] ON dbo.[001COMRQG].Tip_Req = dbo.[001COMTIP].Tipo INNER JOIN
                      dbo.[001INVDEP] ON dbo.[001COMRQG].Cod_Dep = dbo.[001INVDEP].Cod_Dep

GO
/****** Object:  View [dbo].[vistaCuentas]    Script Date: 30/11/2017 06:36:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vistaCuentas]
AS
SELECT     dbo.[01CONCTA05].Cuenta_1 + '-' + dbo.[01CONCTA05].Cuenta_2 + '-' + dbo.[01CONCTA05].Cuenta_3 + '-' + dbo.[01CONCTA05].Cuenta_4 AS Juntos, 
                      dbo.[01CONCTA05].Tipo_Cuenta, dbo.[01CONCTA05].Clasificacion, dbo.[01CONCTA05].Subclasificacion, dbo.[01CONCTA05].Descripcion, 
                      dbo.[01CONCTA05].Descripcion_2, dbo.[01CONCTA05].Flujo_Efectivo, dbo.[01CONCLA].Descripcion_1, 
                      dbo.[01CONSUB].Descripcion_1 AS DEscripcion_Consub
FROM         dbo.[01CONCTA05] LEFT OUTER JOIN
                      dbo.[01CONSUB] ON dbo.[01CONCTA05].Tipo_Cuenta = dbo.[01CONSUB].Tipo_Cuenta AND 
                      dbo.[01CONCTA05].Clasificacion = dbo.[01CONSUB].Clasificacion AND 
                      dbo.[01CONCTA05].Subclasificacion = dbo.[01CONSUB].Subclasificacion LEFT OUTER JOIN
                      dbo.[01CONCLA] ON dbo.[01CONCTA05].Tipo_Cuenta = dbo.[01CONCLA].Tipo_Cuenta AND 
                      dbo.[01CONCTA05].Clasificacion = dbo.[01CONCLA].Clasificacion

GO

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONCLA', @level2type=N'COLUMN',@level2name=N'Tipo_Cuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clasificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONCLA', @level2type=N'COLUMN',@level2name=N'Clasificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONCLA', @level2type=N'COLUMN',@level2name=N'Descripcion_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción 2 (nombre en otro idioma al original)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONCLA', @level2type=N'COLUMN',@level2name=N'Descripcion_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONSUB', @level2type=N'COLUMN',@level2name=N'Tipo_Cuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clasificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONSUB', @level2type=N'COLUMN',@level2name=N'Clasificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Subclasificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONSUB', @level2type=N'COLUMN',@level2name=N'Subclasificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONSUB', @level2type=N'COLUMN',@level2name=N'Descripcion_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción 2 (idioma diferente al original)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'001CONSUB', @level2type=N'COLUMN',@level2name=N'Descripcion_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Razón Social' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONMAESTRO', @level2type=N'COLUMN',@level2name=N'Razon_Social'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONMAESTRO', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Periodo a trabajar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CONMAESTRO', @level2type=N'COLUMN',@level2name=N'Periodo'
GO
-----------------------------------------------------
-----------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_posConsultaArticulo]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posConsultaArticulo] 'Ani'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posConsultaArticulo]
	-- Add the parameters for the stored procedure here
	@Cadena VARCHAR(200) = ''
	
AS
BEGIN


/**********************************************************  
VARIABLES DEL PROCEDIMIENTO
**********************************************************/
DECLARE @Sql NVARCHAR(2000)

/**********************************************************  
TABLA CON LAS POSIBLES PALABRAS
**********************************************************/
CREATE TABLE #Palabras (Palabra NVARCHAR(200) COLLATE Traditional_Spanish_CI_AI NULL , Longitud INT)

/**********************************************************  
SE OBTIENEN EL ARREGLO CON LAS PALABRAS A BUSCAR
**********************************************************/
INSERT INTO #Palabras (Palabra, Longitud)
SELECT Value, len(Value) FROM dbo.uFN_Split(@Cadena,' ') ORDER BY 2 DESC

--SE CREA EL DICCIONARIO
CREATE TABLE #Diccionario (ID int, Contenido NVARCHAR(600) COLLATE Traditional_Spanish_CI_AI NULL)

-- IDs Resultado
CREATE TABLE #Resultado (ID int)

-- TODO EL CATALOGO


INSERT INTO #Diccionario (ID, Contenido)
SELECT A.cod_art [ID],
		CAST( A.cod_art  AS VARCHAR (10)) COLLATE Traditional_Spanish_CI_AI + ' ' + 
	   A.cod_barras COLLATE Traditional_Spanish_CI_AI + ' ' + 
	   A.desc_esp COLLATE Traditional_Spanish_CI_AI
FROM dbo.[001INVART] A


/**********************************************************  
SE OBTIENE EL QUERY QUE HARA LA BUSQUEDA
**********************************************************/
SELECT @SQL = 'SELECT ID [ID] FROM #Diccionario WHERE '
SELECT @SQL = @SQL + ' Contenido LIKE ''%' +  Palabra + '%'' AND' FROM #Palabras
--SE QUITA EL ULTIMO AND
SELECT @SQL = LEFT(@SQL, LEN(@SQL) - 3)

INSERT INTO #Resultado (ID)
execute sp_executesql @sql


SELECT 
	A.RutaImagen,	
	A.cod_art, 
	A.cod_barras, 
	A.desc_esp, 
	A.precio_venta, 
	E.exis_dia	
FROM #Resultado R
INNER JOIN dbo.[001INVART] A ON R.ID = A.cod_art 
INNER JOIN dbo.[001INVEST] E ON R.ID = E.cod_art 
WHERE  E.exis_dia >= 1



RETURN

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posConsultaCodArt]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posConsultaCodArt] 10
-- =============================================
CREATE PROCEDURE [dbo].[sp_posConsultaCodArt]
	-- Add the parameters for the stored procedure here
	@CodArt VARCHAR(20)
	
AS
BEGIN

IF LEN(@CodArt) >= 10
BEGIN
	SELECT cod_art 
	FROM dbo.[001INVART] 	 
	WHERE  cod_barras = @CodArt
	
	RETURN
	 
END
	
	SELECT cod_art 
	FROM dbo.[001INVART] 	
	WHERE  cod_art = CONVERT (INT, @CodArt )
	
	RETURN
	
	


END

GO
/****** Object:  StoredProcedure [dbo].[sp_posConsultaDetalleArt]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posConsultaDetalleArt] '3'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posConsultaDetalleArt]
	-- Add the parameters for the stored procedure here
	@CodArt VARCHAR(20)
	
AS
BEGIN
	

	SELECT 
	A.RutaImagen,	
	A.cod_art, 
	A.cod_barras, 
	A.desc_esp, 
	A.precio_venta,	
	E.exis_dia,
	ISNULL (A.Caracteristicas1, '') AS Caracteristicas1,
	ISNULL (A.Caracteristicas2, '') AS Caracteristicas2,
	ISNULL (A.Caracteristicas3, '') AS Caracteristicas3
	FROM dbo.[001INVART] A
	INNER JOIN dbo.[001INVEST] E ON A.cod_art = E.cod_art
	WHERE  A.cod_art = CONVERT (INT, @CodArt )
	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posDescuentosConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posDescuentosConsulta]
-- =============================================
CREATE PROCEDURE [dbo].[sp_posDescuentosConsulta]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.PORCDESCTOS

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posFechaSistema]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_posFechaSistema]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT fecha from dbo.[001INVFECH]
	where Cerrado = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posFPConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posFPConsulta]
-- =============================================
CREATE PROCEDURE [dbo].[sp_posFPConsulta]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CarAbo, DescAC, Tipo FROM dbo.CARAB
	WHERE tipo IN ('A', 'H')

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvArtValidaExis]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [sp_posInvLinValidaExis] 285
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvArtValidaExis]
	-- Add the parameters for the stored procedure here
		@CodArt   AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	SELECT exis_dia [Existencia] 
	FROM dbo.[001INVEST] 
	WHERE  cod_art = @CodArt 
	

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGen]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGen] '2007-21-12', 'CIA'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGen]
	-- Add the parameters for the stored procedure here	
    @FechaMov SMALLDATETIME,
	@CodOpe   VARCHAR(10)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @NoReq    INT
			

    -- Insert statements for procedure here


			SET @NoReq    = (SELECT MAX( CONVERT (INT , No_Req))  FROM dbo.[001INVGEN] WHERE  Tipo_Mov = 'VEN') + 1			
	
					
			INSERT dbo.[001INVGEN] (No_Req, Tipo_Mov, Fech_Mov, Fech_Sis, Cod_Ope)
			VALUES  ( @NoReq, 'VEN', @FechaMov, CONVERT(VARCHAR  (10), GETDATE(), 121), @CodOpe) 

		RETURN

	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenActualizaStatus]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGenActualizaStatus] 113
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenActualizaStatus]
	-- Add the parameters for the stored procedure here
	@IndMov   INT,
	@Status   VARCHAR(1)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		UPDATE dbo.[001INVGEN]
		SET st  = @Status, 
		horaci = getdate()
		WHERE ind_mov = @indMov
		

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenCierre]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGenCierre] 91, 10
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenCierre]
	-- Add the parameters for the stored procedure here
	@IndMov    INT,
	@Descuento FLOAT --%Descuento

	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Pagado       FLOAT,	
			@IVA          FLOAT,
			@Alimentos    FLOAT,
			@Bebidas      FLOAT,
			@Tazacero     FLOAT,
			@ImpDescuento FLOAT	


	--Obtiene los totales 
	SELECT L.*,
	(L.Costo * L.Can) / (1 + A.IVA /100) as Sub,
	L.Costo * L.Can - (L.Costo * L.Can) / (1 + A.IVA / 100) AS Iva, 
	((L.Costo * L.Can) / (1 + A.IVA / 100) + L.Costo * L.Can) - (L.Costo * L.Can) / (1 + A.IVA / 100) AS Tot, 
	A.IVA AS PorIva, 
	A.Taza0	,
	CASE WHEN  	@Descuento > 0 THEN ROUND((L.Costo * L.Can) / (1 + A.IVA /100) * (@Descuento / 100), 2)  ELSE 0 END  AS Descuento,
	CAST (0 AS FLOAT ) AS TotTaza0,
	CAST (0 AS FLOAT ) AS TotExento,
	CAST (0 AS FLOAT ) AS TotGrabado	
	INTO #TmpTotales
	FROM dbo.[001INVGEN] G	
	INNER JOIN dbo.[001INVLIN] L ON G.Ind_Mov = L.Indice 
	INNER JOIN dbo.[001INVART] A ON L.Cod_Art= A.Cod_Art
	WHERE G.ind_mov = @IndMov		
	
	UPDATE 	#TmpTotales
	SET TotTaza0 = CASE WHEN PorIva = 0  and  Taza0 = 1 THEN  Sub - descuento ELSE 0 END, 
	TotExento = CASE WHEN PorIva =  0 and  Taza0 = 0  THEN Sub - descuento ELSE 0 END, 
	TotGrabado = CASE WHEN PorIva > 0  THEN Sub - descuento ELSE 0 END,
	Tot = CASE WHEN descuento > 0  THEN Total - descuento ELSE Total END

--	SELECT  * FROM #TmpTotales 
--	ORDER BY Linea

	SELECT @Pagado       =  (SELECT  round (SUM (tot),2) as Total FROM #TmpTotales )
	SELECT @ImpDescuento =  (SELECT  round (SUM (descuento),2) as Total FROM #TmpTotales )
	SELECT @IVA          =  (SELECT  round (SUM (iva),2) as Total FROM #TmpTotales )
	SELECT @Alimentos    =  (SELECT  round (SUM (TotExento),2) as Total FROM #TmpTotales )
	SELECT @Bebidas      =  (SELECT  round (SUM (TotGrabado),2) as Total FROM #TmpTotales )
	SELECT @Tazacero     =  (SELECT  round (SUM (TotTaza0),2) as Total FROM #TmpTotales )


	--Actualiza movimiento

	UPDATE dbo.[001INVGEN]
	SET st  = 'P', 
	horaci = getdate(), 
	Total_Fac = @Pagado,
	Stat_Mov= 1,
	Tdes = @ImpDescuento,
	Pagado = @Pagado,
	Tiva =@IVA,
	Tal = @Alimentos,
	Tbeb = @Bebidas,
	Tt0 =@Tazacero
	WHERE ind_mov = @indMov
		

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGenConsulta] 116
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenConsulta]
	-- Add the parameters for the stored procedure here
	@IndMov   INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	IF @IndMov=0 
		BEGIN 
			SELECT MAX (Ind_Mov) as Ind_Mov FROM dbo.[001INVGEN]
			WHERE tipo_mov= 'VEN'

			RETURN
		END
		
			

		UPDATE dbo.[001INVGEN]
		SET pagado = (SELECT ISNULL(SUM(TOTAL),0) FROM [001INVLIN] where indice = @indMov) - ISNULL (tdes,0) - ISNULL(tpro,0)
		WHERE ind_mov = @IndMov

		SELECT 
		ind_mov,
		no_req,
		tipo_mov, 
		cod_ope, 
		fech_mov,
		stat_mov,
		pagado, 
		case when  st ='P' then 'Pagado' when
			   st='X' then 'Cancelado' else 'Abierto' end St,
		case when  st ='P' then '~/App_themes/Img/P.jpg' when
		st='X' then '~/App_themes/Img/X.jpg' else '~/App_themes/Img/A.jpg' end RutaImagen
		FROM dbo.[001INVGEN]
		WHERE ind_mov = @IndMov

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenConsultaReq]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGenConsultaReq] '2'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenConsultaReq]
	-- Add the parameters for the stored procedure here
	@Req varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @IndMov Int;
	
    SELECT @IndMov = (	SELECT Ind_Mov FROM dbo.[001INVGEN]	WHERE tipo_mov= 'VEN' and No_Req= CONVERT (VARCHAR(10), @Req))
		
	 SELECT @IndMov AS IndMov
		

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenConsultaTodos]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec [sp_posInvGenConsultaTodos] '2007-12-21', 'Ven'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenConsultaTodos]
	-- Add the parameters for the stored procedure here
	@FechaMov VARCHAR(10),
	@TipoMov  VARCHAR(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 
		ind_mov,
		no_req,
		tipo_mov, 
		cod_ope, 
		fech_mov,
		stat_mov,
		pagado, 
		st,
		case when  st ='P' then '~/App_themes/Img/P.jpg' when
		st='X' then '~/App_themes/Img/X.jpg' else '~/App_themes/Img/A.jpg' end RutaImagen
		FROM dbo.[001INVGEN]
		WHERE CONVERT(VARCHAR  (10), fech_mov, 121) =  @FechaMov and tipo_mov = @TipoMov

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvGenInserta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvGenInserta] '20071221', 'CIA'
-- envia fecha con formato YYYYMMDD
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvGenInserta]
	-- Add the parameters for the stored procedure here		 
    @FechaMov DATETIME,
	@CodOpe   VARCHAR(10)

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @NoReq    INT
			

    -- Insert statements for procedure here


			SET @NoReq = (SELECT MAX( CONVERT (INT , No_Req))  FROM dbo.[001INVGEN] WHERE  Tipo_Mov = 'VEN')
			SET @NoReq = @NoReq+ 1						

			INSERT dbo.[001INVGEN] (No_Req, Tipo_Mov, Fech_Mov, Fech_Sis, Cod_Ope)
			VALUES  ( CONVERT (VARCHAR (10), @NoReq), 'VEN', @FechaMov, convert (varchar(8), getdate(), 112)  , @CodOpe) 

		RETURN
	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvLinBorra]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvLinBorra] 113,4,1,'2007-21-12','92'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvLinBorra]
	-- Add the parameters for the stored procedure here
    @Indice   AS INT,
	@Linea    AS INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

    -- Insert statements for procedure here
	DECLARE	@CodArt   AS INT,
			@Can	  AS INT
		

	SELECT @CodArt = (SELECT cod_art FROM dbo.[001INVLIN] WHERE Indice =@Indice and Linea = @Linea)
	SELECT @Can = (SELECT can FROM dbo.[001INVLIN] WHERE Indice =@Indice and Linea = @Linea)
	
	--BORRA LA LINEA EN MOVIMENTO
	DELETE  dbo.[001INVLIN] 
	WHERE Indice= @Indice and Linea = @Linea

	--ACTULIZA LA EXISTENCIA DEL INVENTARIO
	UPDATE 	dbo.[001INVEST]
	SET exis_dia =  exis_dia + @Can,
		sal_dia  = sal_dia - @Can,
		sal_mes  = sal_mes - @Can,
		sal_per  = sal_per - @Can,	
		fecha_us = null,
		req_us   =  null
	WHERE cod_art = @CodArt

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvLinConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvLinConsulta] 2
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvLinConsulta]
	-- Add the parameters for the stored procedure here
	@Indice   INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT L.indice, L.Linea, A.Cod_barras, A.Desc_Esp, ISNULL(L.Serie, '') as Serie, L.Can, L.Costo, L.Total, A.RutaImagen
		FROM dbo.[001INVLIN] L
		INNER join dbo.[001INVART] A ON L.Cod_Art = A.Cod_Art
		WHERE Indice = @Indice

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posInvLinInserta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posInvLinInserta] 113,3,2,'2007-21-12','92'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posInvLinInserta]
	-- Add the parameters for the stored procedure here
    @Indice   AS INT,	
	@CodArt   AS INT,
	@Can	  AS INT,
	@FechaSis AS VARCHAR (10), --Formato AAAA-DD-MM
	@Req      AS INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

    -- Insert statements for procedure here
	DECLARE  @Linea AS INT,
			 @Costo AS FLOAT 
		

	SELECT @Costo = (SELECT precio_venta FROM dbo.[001INVART] WHERE Cod_art = @CodArt)
	SELECT @Linea = (SELECT MAX (linea) FROM dbo.[001INVLIN] WHERE Indice = @Indice ) + 1
	IF @Linea IS NULL
		BEGIN 
			SET @Linea = 1
		END
	

	
		--INSERTA LA LINEA EN MOVIMENTO
		INSERT INTO dbo.[001INVLIN] (indice, linea, cod_art, can, costo )
		VALUES ( @Indice,
				 @Linea,
				 @CodArt,
				 @Can,
				 @Costo
				 )

		--ACTULIZA LA EXISTENCIA DEL INVENTARIO
		UPDATE 	dbo.[001INVEST]
		SET exis_dia =  exis_dia - @Can,
			sal_dia  = sal_dia + @Can,
			sal_mes  = sal_mes + @Can,
			sal_per  = sal_per + @Can,	
			fecha_us = @FechaSis,
			req_us   =  @Req
		WHERE cod_art = @CodArt
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPagosBorra]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPagosBorra] 'TABAQ', '97', 'CASH'
-- envia fecha con formato YYYYMMDD
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPagosBorra]
	-- Add the parameters for the stored procedure here		 
	@ClavePdv varchar (10),	
	@IndMov   int,
	@FormaPago       varchar(4) 
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here		
	DELETE  dbo.PAGOSPDV 
	WHERE clave_pdv = @ClavePdv  AND che = @IndMov AND Fpag= @FormaPago

	RETURN
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPagosConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPagosConsulta] 11
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPagosConsulta]
	-- Add the parameters for the stored procedure here
	@IndMov   INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT 	
		P.fpag , 
		C.descac,
		P.importe_real
		FROM dbo.PAGOSPDV P 
		INNER JOIN dbo.CARAB C ON P.fpag = C.carabo
		WHERE P.che = @indMov

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPagosDesgloseConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPagosDesgloseConsulta]  91, 10
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPagosDesgloseConsulta]
	-- Add the parameters for the stored procedure here	
	@IndMov INT,
	@Descuento FLOAT --%Descuento
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	

    -- Insert statements for procedure here
	SELECT L.*,
	(L.Costo * L.Can) / (1 + A.IVA /100) as Sub,
	L.Costo * L.Can - (L.Costo * L.Can) / (1 + A.IVA / 100) AS Iva, 
	((L.Costo * L.Can) / (1 + A.IVA / 100) + L.Costo * L.Can) - (L.Costo * L.Can) / (1 + A.IVA / 100) AS Tot, 
	A.IVA AS PorIva, 
	A.Taza0	,
	CASE WHEN  	@Descuento > 0 THEN ROUND((L.Costo * L.Can) / (1 + A.IVA /100) * (@Descuento / 100), 2)  ELSE 0 END  AS Descuento,
	CAST (0 AS FLOAT ) AS TotTaza0,
	CAST (0 AS FLOAT ) AS TotExento,
	CAST (0 AS FLOAT ) AS TotGrabado 	
	INTO #TmpTotales
	FROM dbo.[001INVGEN] G	
	INNER JOIN dbo.[001INVLIN] L ON G.Ind_Mov = L.Indice 
	INNER JOIN dbo.[001INVART] A ON L.Cod_Art= A.Cod_Art
	WHERE G.ind_mov = @IndMov	
			
	
	UPDATE 	#TmpTotales
	SET TotTaza0 = CASE WHEN PorIva = 0  and  Taza0 = 1 THEN  Sub - descuento ELSE 0 END, 
	TotExento = CASE WHEN PorIva =  0 and  Taza0 = 0  THEN Sub - descuento ELSE 0 END, 
	TotGrabado = CASE WHEN PorIva > 0  THEN Sub - descuento ELSE 0 END,
	Tot = CASE WHEN descuento > 0  THEN Total - descuento ELSE Total END
		
--	SELECT  * FROM #TmpTotales 
--	ORDER BY Linea

	SELECT 
	round (SUM (sub),2 ) as Subtotal, 
	round (SUM (iva), 2) as Iva, 
	round (SUM (tot),2) as Total, 
	round (SUM (descuento),2) as Descuento,
	round (SUM (TotTaza0),2) as Taza0,
	round (SUM (TotExento),2) as Exento,
	round (SUM (TotGrabado),2) as Grabado	
	FROM #TmpTotales 

	RETURN

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPagosInserta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPagosInserta] '20071221', 'CIA'
-- envia fecha con formato YYYYMMDD
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPagosInserta]
	-- Add the parameters for the stored procedure here		 
	@ClavePdv varchar (10),	
	@IndMov int ,
	@FormaPago varchar(4),
	@Importe money,
	@ImporteReal money,
	@Vendedor varchar (10)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Consec    INT
			

    -- Insert statements for procedure here


			SELECT @Consec = (Select max (consec) FROM dbo.PAGOSPDV WHERE clave_pdv= @ClavePdv AND che =@IndMov)  + 1	
			IF @Consec IS NULL
			BEGIN 
				SET @Consec = 1
			END					

			INSERT INTO dbo.PAGOSPDV (clave_pdv, che, fpag, consec,importe, orden, importe_real, comision, vendedor )
			VALUES (@ClavePdv, @IndMov, @FormaPago,  @Consec, @Importe, 0, @ImporteReal, 0, @Vendedor )


		RETURN
	

	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPagosTotalConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPagosTotalConsulta] 89
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPagosTotalConsulta]
	-- Add the parameters for the stored procedure here
	@IndMov   INT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT ISNULL (ROUND (SUM(Importe),2),0) as Pagado,
		ISNULL (ROUND (SUM(Importe_real),2),0) as Pagado_Real
		FROM dbo.PAGOSPDV
		WHERE che = @indMov

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posPDVConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posPDVConsulta] 
-- =============================================
CREATE PROCEDURE [dbo].[sp_posPDVConsulta]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	Clave_Pdv,
	Nombre_Pdv,
	Razon_Social,
	Direccion1,
	Direccion2,
	Ciudad,
	Estado,
	Telefono,
	Fax,
	Rfc,
	Tipo_Cambio
	FROM dbo.PDV

END

GO
/****** Object:  StoredProcedure [dbo].[sp_posTicketConsulta]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posTicketConsulta] 2, 'Cinco mil novecientos'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posTicketConsulta]
	-- Add the parameters for the stored procedure here
	@Indice   INT,	
	@CL       VARCHAR (MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT
		Clave_Pdv,
		Nombre_Pdv,
		Razon_Social,
		Direccion1,
		Direccion2,
		Ciudad,
		Estado,
		Telefono,
		Fax,
		Rfc,
		Tipo_Cambio
		FROM dbo.PDV

		SELECT L.indice, L.Linea, A.Cod_barras, A.Desc_Esp, ISNULL(L.Serie, '') as Serie, L.Can, L.Costo, L.Total, A.RutaImagen
		FROM dbo.[001INVLIN] L
		INNER join dbo.[001INVART] A ON L.Cod_Art = A.Cod_Art
		WHERE Indice = @Indice

		SELECT 	
		P.fpag , 
		C.descac,
		P.importe_real
		FROM dbo.PAGOSPDV P 
		INNER JOIN dbo.CARAB C ON P.fpag = C.carabo
		WHERE P.che = @Indice


		SELECT ISNULL (ROUND (SUM(Importe),2),0) as Pagado,
		ISNULL (ROUND (SUM(Importe_real),2),0) as Pagado_Real
		FROM dbo.PAGOSPDV
		WHERE che = @Indice
		

		SELECT  No_req as Ticket, Cod_Ope as Ope, Fech_Mov as fecha, getdate() as Hora,  @CL AS Importeletra
		FROM dbo.[001INVGEN]
		WHERE Ind_Mov = @Indice
		


END

GO
/****** Object:  StoredProcedure [dbo].[sp_posTopArticulos]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posTopArticulos]
-- =============================================
CREATE PROCEDURE [dbo].[sp_posTopArticulos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.Cod_Art, A.Desc_Esp, A.Precio_Venta, A.RutaImagen, E.Exis_Dia
	FROM dbo.ARTICULOS_DIRECTOS D
	INNER JOIN dbo.[001INVART] A ON D.Articulo = A.Cod_Art
	INNER JOIN dbo.[001INVEST] E ON D.Articulo = E.Cod_Art
	ORDER BY D.Boton
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posUsuarioAcceso]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_posUsuarioAcceso]

	-- Add the parameters for the stored procedure here
	@usuario  varchar (10),
	@contraseña varchar (10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Result int

    -- Insert statements for procedure here
	
	IF EXISTS (SELECT * FROM dbo.USUARIOS WHERE codigo = @usuario AND password  = @contraseña)
		BEGIN
			SET @Result=1
			
		END
	ELSE
			SET @Result= 0
			

	SELECT @Result as Resultado
	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posUsuarioAccesoCIA]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_posUsuarioAccesoCIA]

	-- Add the parameters for the stored procedure here
	@usuario  varchar (10)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Result int

    -- Insert statements for procedure here
	
	IF EXISTS (SELECT * FROM dbo.USUARIOS WHERE codigo = @usuario)
		BEGIN
			SET @Result=1
			
		END
	ELSE
			SET @Result= 0
			

	SELECT @Result as Resultado
	RETURN
END

GO
/****** Object:  StoredProcedure [dbo].[sp_posUsuarioInfo]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[sp_posUsuarioInfo] 'CIA'
-- =============================================
CREATE PROCEDURE [dbo].[sp_posUsuarioInfo]

	-- Add the parameters for the stored procedure here
	@usuario  varchar (10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	
	SELECT Codigo, Nombre, Perfil, Comision FROM dbo.USUARIOS WHERE codigo = @usuario 
	
	RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[uFN_Split]    Script Date: 30/11/2017 06:36:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[uFN_Split](
 @String nvarchar (4000),
 @Delimiter nvarchar (10)
 )
returns @ValueTable table ([Value] nvarchar(4000))
begin
 declare @NextString nvarchar(4000)
 declare @Pos int
 declare @NextPos int
 declare @CommaCheck nvarchar(1)
 
 --Initialize
 set @NextString = ''
 set @CommaCheck = right(@String,1) 
 
 --Check for trailing Comma, if not exists, INSERT
 --if (@CommaCheck <> @Delimiter )
 set @String = @String + @Delimiter
 
 --Get position of first Comma
 set @Pos = charindex(@Delimiter,@String)
 set @NextPos = 1
 
 --Loop while there is still a comma in the String of levels
 while (@pos <>  0)  
 begin
  set @NextString = substring(@String,1,@Pos - 1)
 
  insert into @ValueTable ( [Value]) Values (@NextString)
 
  set @String = substring(@String,@pos +1,len(@String))
  
  set @NextPos = @Pos
  set @pos  = charindex(@Delimiter,@String)
 end
 
 return
end
GO
