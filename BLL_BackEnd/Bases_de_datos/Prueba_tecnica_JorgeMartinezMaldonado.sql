USE [Prueba_Tecnica]
GO
ALTER TABLE [dbo].[Control_Integral] DROP CONSTRAINT [FK_Control_Integral_Pacientes]
GO
ALTER TABLE [dbo].[Control_Integral] DROP CONSTRAINT [FK_Control_Integral_Doctores]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 1/02/2021 9:47:19 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pacientes]') AND type in (N'U'))
DROP TABLE [dbo].[Pacientes]
GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 1/02/2021 9:47:19 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctores]') AND type in (N'U'))
DROP TABLE [dbo].[Doctores]
GO
/****** Object:  Table [dbo].[Control_Integral]    Script Date: 1/02/2021 9:47:19 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Control_Integral]') AND type in (N'U'))
DROP TABLE [dbo].[Control_Integral]
GO
/****** Object:  Table [dbo].[Control_Integral]    Script Date: 1/02/2021 9:47:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Integral](
	[Id_Seguimiento] [int] IDENTITY(1,1) NOT NULL,
	[Id_Paciente] [int] NOT NULL,
	[Id_Doctor] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Control_Integral] PRIMARY KEY CLUSTERED 
(
	[Id_Seguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Control_Integral] UNIQUE NONCLUSTERED 
(
	[Id_Paciente] ASC,
	[Id_Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 1/02/2021 9:47:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctores](
	[Id_Doctor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [nchar](150) NOT NULL,
	[Especialidad] [nchar](100) NOT NULL,
	[Numero_Credencial] [numeric](8, 0) NOT NULL,
	[Hospital_Adscrito] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Doctores] PRIMARY KEY CLUSTERED 
(
	[Id_Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 1/02/2021 9:47:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Id_Paciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Completo] [nchar](150) NOT NULL,
	[Numero_Seguro_Social] [nchar](10) NOT NULL,
	[Codigo_Postal] [nchar](10) NOT NULL,
	[Telefono_Contacto] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Id_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Control_Integral]  WITH CHECK ADD  CONSTRAINT [FK_Control_Integral_Doctores] FOREIGN KEY([Id_Doctor])
REFERENCES [dbo].[Doctores] ([Id_Doctor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Control_Integral] CHECK CONSTRAINT [FK_Control_Integral_Doctores]
GO
ALTER TABLE [dbo].[Control_Integral]  WITH CHECK ADD  CONSTRAINT [FK_Control_Integral_Pacientes] FOREIGN KEY([Id_Paciente])
REFERENCES [dbo].[Pacientes] ([Id_Paciente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Control_Integral] CHECK CONSTRAINT [FK_Control_Integral_Pacientes]
GO
