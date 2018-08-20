USE [master]
GO
/****** Object:  Database [CampeonatoBD]    Script Date: 19/8/2018 7:19:31 p. m. ******/
CREATE DATABASE [CampeonatoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampeonatoBD_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CampeonatoBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CampeonatoBD_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CampeonatoBD.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CampeonatoBD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CampeonatoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CampeonatoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CampeonatoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CampeonatoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CampeonatoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CampeonatoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CampeonatoBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CampeonatoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CampeonatoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CampeonatoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CampeonatoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CampeonatoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CampeonatoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CampeonatoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CampeonatoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CampeonatoBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CampeonatoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CampeonatoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CampeonatoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CampeonatoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CampeonatoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CampeonatoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CampeonatoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CampeonatoBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CampeonatoBD] SET  MULTI_USER 
GO
ALTER DATABASE [CampeonatoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CampeonatoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CampeonatoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CampeonatoBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CampeonatoBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CampeonatoBD] SET QUERY_STORE = OFF
GO
USE [CampeonatoBD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CampeonatoBD]
GO
/****** Object:  Table [dbo].[Arbitro]    Script Date: 19/8/2018 7:19:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbitro](
	[idArbitro] [int] NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[apellido] [nchar](10) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[rolAutoridad] [int] NOT NULL,
	[tipoDoc] [nchar](10) NOT NULL,
	[DNI] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Arbitro] PRIMARY KEY CLUSTERED 
(
	[idArbitro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArbitroXPartido]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArbitroXPartido](
	[idArbitro] [int] NOT NULL,
	[nroFecha] [int] NOT NULL,
	[idClubLocal] [int] NOT NULL,
	[cantAmarillas] [int] NULL,
	[cantRojas] [int] NULL,
 CONSTRAINT [PK_ArbitroXPartido] PRIMARY KEY CLUSTERED 
(
	[idArbitro] ASC,
	[nroFecha] ASC,
	[idClubLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campeonato]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campeonato](
	[idCampeonato] [int] NOT NULL,
	[nombre] [varchar](10) NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[estadoCampeonato] [int] NULL,
	[puntajePartGanado] [int] NULL,
	[puntajePartEmpatado] [int] NULL,
 CONSTRAINT [PK_Campeonato] PRIMARY KEY CLUSTERED 
(
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[idCiudad] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClubFutbol]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClubFutbol](
	[idClub] [int] NOT NULL,
	[nombreClub] [varchar](50) NULL,
	[siglas] [nchar](10) NULL,
	[nroCuil] [int] NULL,
	[calle] [varchar](50) NULL,
	[nroCalle] [nchar](10) NULL,
	[codPostal] [int] NULL,
	[DNITecnico] [int] NULL,
	[tipoDocTecnico] [nchar](10) NULL,
	[idEstadio] [int] NULL,
 CONSTRAINT [PK_ClubFutbol] PRIMARY KEY CLUSTERED 
(
	[idClub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodigoPostal]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigoPostal](
	[codPostal] [int] NOT NULL,
	[idCiudad] [int] NULL,
 CONSTRAINT [PK_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[codPostal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estadio]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadio](
	[idEstadio] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[calle] [varchar](50) NULL,
	[nroCalle] [nchar](10) NULL,
	[codPostal] [int] NULL,
	[idEstadoCancha] [int] NULL,
	[capacidadPersonas] [int] NULL,
 CONSTRAINT [PK_Estadio] PRIMARY KEY CLUSTERED 
(
	[idEstadio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCampeonato]    Script Date: 19/8/2018 7:19:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCampeonato](
	[idEstado] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoCampeonato] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoEstadio]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoEstadio](
	[idEstadoEstadio] [int] NOT NULL,
	[descipcion] [nchar](10) NULL,
 CONSTRAINT [PK_EstadoEstadio] PRIMARY KEY CLUSTERED 
(
	[idEstadoEstadio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoFechaCamp]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoFechaCamp](
	[idEstado] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[detalle] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoFechaCamp] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoJugador]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoJugador](
	[idEstado] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoJugador] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fecha]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fecha](
	[nroFecha] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[idEstado] [int] NOT NULL,
	[fechaRetornoSuspencion] [date] NULL,
 CONSTRAINT [PK_FechaCampeonato] PRIMARY KEY CLUSTERED 
(
	[nroFecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FechaXCampeonato]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FechaXCampeonato](
	[nroFecha] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
 CONSTRAINT [PK_FechaXCampeonato] PRIMARY KEY CLUSTERED 
(
	[nroFecha] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[tipoDoc] [nchar](10) NOT NULL,
	[DNI] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[fechaNacimiento] [date] NULL,
	[calle] [varchar](50) NULL,
	[nroCalle] [int] NULL,
	[codPostal] [int] NULL,
	[idEstado] [int] NULL,
	[examenMedico] [bit] NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[tipoDoc] ASC,
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JugadorXClub]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JugadorXClub](
	[idClub] [int] NOT NULL,
	[tipoDoc] [nchar](10) NOT NULL,
	[DNI] [int] NOT NULL,
	[fechaDesde] [date] NULL,
	[fechaHasta] [date] NULL,
 CONSTRAINT [PK_JugadorXClub] PRIMARY KEY CLUSTERED 
(
	[idClub] ASC,
	[tipoDoc] ASC,
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JugadorXClubXCamp]    Script Date: 19/8/2018 7:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JugadorXClubXCamp](
	[idClub] [int] NOT NULL,
	[tipoDoc] [nchar](10) NOT NULL,
	[DNI] [int] NOT NULL,
	[fechaDesde] [date] NOT NULL,
	[fechaHasta] [date] NOT NULL,
	[nroCamiseta] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
 CONSTRAINT [PK_JugadorXClubXCamp] PRIMARY KEY CLUSTERED 
(
	[idClub] ASC,
	[tipoDoc] ASC,
	[DNI] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JugadorXPartido]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JugadorXPartido](
	[idPartido] [int] NOT NULL,
	[idClubLocal] [int] NOT NULL,
	[tipoDoc] [nchar](10) NOT NULL,
	[DNI] [int] NOT NULL,
	[idPosicion] [int] NULL,
	[nroCamiseta] [int] NULL,
	[minJugados] [time](7) NULL,
	[golesAFavor] [int] NULL,
	[golesContra] [int] NOT NULL,
	[faltasCometidas] [int] NULL,
	[cantAmarillas] [int] NULL,
	[cantRojas] [int] NULL,
	[idSancion] [int] NULL,
 CONSTRAINT [PK_JugadorXPartido] PRIMARY KEY CLUSTERED 
(
	[idPartido] ASC,
	[idClubLocal] ASC,
	[tipoDoc] ASC,
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[idPartido] [int] NOT NULL,
	[idClubLocal] [int] NOT NULL,
	[idClubVisitante] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[golesLocales] [int] NULL,
	[golesVisitantes] [int] NULL,
	[fechaInicio] [date] NULL,
	[horaInicio] [time](7) NULL,
	[horaFin] [time](7) NULL,
 CONSTRAINT [PK_Partido_1] PRIMARY KEY CLUSTERED 
(
	[idClubLocal] ASC,
	[idPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartidosXFechaXCampeonato]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartidosXFechaXCampeonato](
	[nroFecha] [int] NOT NULL,
	[idClubLocal] [int] NOT NULL,
	[idPartido] [int] NOT NULL,
	[idCampeonato] [int] NOT NULL,
 CONSTRAINT [PK_PartidosXFechaXCampeonato] PRIMARY KEY CLUSTERED 
(
	[nroFecha] ASC,
	[idClubLocal] ASC,
	[idPartido] ASC,
	[idCampeonato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PosicionJugador]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosicionJugador](
	[idPosicionJugador] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_PosicionJugador] PRIMARY KEY CLUSTERED 
(
	[idPosicionJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolArbitro]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolArbitro](
	[idRol] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RolArbitro] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sancion]    Script Date: 19/8/2018 7:19:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sancion](
	[idSancion] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[descripcion] [varchar](50) NULL,
	[fechasSuspencion] [int] NULL,
 CONSTRAINT [PK_Sancion] PRIMARY KEY CLUSTERED 
(
	[idSancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arbitro]  WITH CHECK ADD  CONSTRAINT [FK_Arbitro_RolArbitro] FOREIGN KEY([rolAutoridad])
REFERENCES [dbo].[RolArbitro] ([idRol])
GO
ALTER TABLE [dbo].[Arbitro] CHECK CONSTRAINT [FK_Arbitro_RolArbitro]
GO
ALTER TABLE [dbo].[ArbitroXPartido]  WITH CHECK ADD  CONSTRAINT [FK_ArbitroXPartido_Arbitro] FOREIGN KEY([idArbitro])
REFERENCES [dbo].[Arbitro] ([idArbitro])
GO
ALTER TABLE [dbo].[ArbitroXPartido] CHECK CONSTRAINT [FK_ArbitroXPartido_Arbitro]
GO
ALTER TABLE [dbo].[ArbitroXPartido]  WITH CHECK ADD  CONSTRAINT [FK_ArbitroXPartido_Partido] FOREIGN KEY([idClubLocal], [nroFecha])
REFERENCES [dbo].[Partido] ([idClubLocal], [idPartido])
GO
ALTER TABLE [dbo].[ArbitroXPartido] CHECK CONSTRAINT [FK_ArbitroXPartido_Partido]
GO
ALTER TABLE [dbo].[Campeonato]  WITH CHECK ADD  CONSTRAINT [FK_Campeonato_EstadoCampeonato] FOREIGN KEY([estadoCampeonato])
REFERENCES [dbo].[EstadoCampeonato] ([idEstado])
GO
ALTER TABLE [dbo].[Campeonato] CHECK CONSTRAINT [FK_Campeonato_EstadoCampeonato]
GO
ALTER TABLE [dbo].[ClubFutbol]  WITH CHECK ADD  CONSTRAINT [FK_ClubFutbol_CodigoPostal] FOREIGN KEY([codPostal])
REFERENCES [dbo].[CodigoPostal] ([codPostal])
GO
ALTER TABLE [dbo].[ClubFutbol] CHECK CONSTRAINT [FK_ClubFutbol_CodigoPostal]
GO
ALTER TABLE [dbo].[ClubFutbol]  WITH CHECK ADD  CONSTRAINT [FK_ClubFutbol_Estadio] FOREIGN KEY([idEstadio])
REFERENCES [dbo].[Estadio] ([idEstadio])
GO
ALTER TABLE [dbo].[ClubFutbol] CHECK CONSTRAINT [FK_ClubFutbol_Estadio]
GO
ALTER TABLE [dbo].[CodigoPostal]  WITH CHECK ADD  CONSTRAINT [FK_CodigoPostal_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[CodigoPostal] CHECK CONSTRAINT [FK_CodigoPostal_Ciudad]
GO
ALTER TABLE [dbo].[Estadio]  WITH CHECK ADD  CONSTRAINT [FK_Estadio_CodigoPostal] FOREIGN KEY([codPostal])
REFERENCES [dbo].[CodigoPostal] ([codPostal])
GO
ALTER TABLE [dbo].[Estadio] CHECK CONSTRAINT [FK_Estadio_CodigoPostal]
GO
ALTER TABLE [dbo].[Estadio]  WITH CHECK ADD  CONSTRAINT [FK_Estadio_EstadoEstadio] FOREIGN KEY([idEstadoCancha])
REFERENCES [dbo].[EstadoEstadio] ([idEstadoEstadio])
GO
ALTER TABLE [dbo].[Estadio] CHECK CONSTRAINT [FK_Estadio_EstadoEstadio]
GO
ALTER TABLE [dbo].[Fecha]  WITH CHECK ADD  CONSTRAINT [FK_Fecha_EstadoFechaCamp] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadoFechaCamp] ([idEstado])
GO
ALTER TABLE [dbo].[Fecha] CHECK CONSTRAINT [FK_Fecha_EstadoFechaCamp]
GO
ALTER TABLE [dbo].[FechaXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_FechaXCampeonato_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[FechaXCampeonato] CHECK CONSTRAINT [FK_FechaXCampeonato_Campeonato]
GO
ALTER TABLE [dbo].[FechaXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_FechaXCampeonato_Fecha] FOREIGN KEY([nroFecha])
REFERENCES [dbo].[Fecha] ([nroFecha])
GO
ALTER TABLE [dbo].[FechaXCampeonato] CHECK CONSTRAINT [FK_FechaXCampeonato_Fecha]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_CodigoPostal] FOREIGN KEY([codPostal])
REFERENCES [dbo].[CodigoPostal] ([codPostal])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_CodigoPostal]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_EstadoJugador] FOREIGN KEY([idEstado])
REFERENCES [dbo].[EstadoJugador] ([idEstado])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_EstadoJugador]
GO
ALTER TABLE [dbo].[JugadorXClub]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXClub_ClubFutbol] FOREIGN KEY([idClub])
REFERENCES [dbo].[ClubFutbol] ([idClub])
GO
ALTER TABLE [dbo].[JugadorXClub] CHECK CONSTRAINT [FK_JugadorXClub_ClubFutbol]
GO
ALTER TABLE [dbo].[JugadorXClub]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXClub_Jugador] FOREIGN KEY([tipoDoc], [DNI])
REFERENCES [dbo].[Jugador] ([tipoDoc], [DNI])
GO
ALTER TABLE [dbo].[JugadorXClub] CHECK CONSTRAINT [FK_JugadorXClub_Jugador]
GO
ALTER TABLE [dbo].[JugadorXClubXCamp]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXClubXCamp_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[JugadorXClubXCamp] CHECK CONSTRAINT [FK_JugadorXClubXCamp_Campeonato]
GO
ALTER TABLE [dbo].[JugadorXClubXCamp]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXClubXCamp_ClubFutbol] FOREIGN KEY([idClub])
REFERENCES [dbo].[ClubFutbol] ([idClub])
GO
ALTER TABLE [dbo].[JugadorXClubXCamp] CHECK CONSTRAINT [FK_JugadorXClubXCamp_ClubFutbol]
GO
ALTER TABLE [dbo].[JugadorXClubXCamp]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXClubXCamp_Jugador] FOREIGN KEY([tipoDoc], [DNI])
REFERENCES [dbo].[Jugador] ([tipoDoc], [DNI])
GO
ALTER TABLE [dbo].[JugadorXClubXCamp] CHECK CONSTRAINT [FK_JugadorXClubXCamp_Jugador]
GO
ALTER TABLE [dbo].[JugadorXPartido]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXPartido_Jugador] FOREIGN KEY([tipoDoc], [DNI])
REFERENCES [dbo].[Jugador] ([tipoDoc], [DNI])
GO
ALTER TABLE [dbo].[JugadorXPartido] CHECK CONSTRAINT [FK_JugadorXPartido_Jugador]
GO
ALTER TABLE [dbo].[JugadorXPartido]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXPartido_Partido] FOREIGN KEY([idClubLocal], [idPartido])
REFERENCES [dbo].[Partido] ([idClubLocal], [idPartido])
GO
ALTER TABLE [dbo].[JugadorXPartido] CHECK CONSTRAINT [FK_JugadorXPartido_Partido]
GO
ALTER TABLE [dbo].[JugadorXPartido]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXPartido_PosicionJugador] FOREIGN KEY([idPosicion])
REFERENCES [dbo].[PosicionJugador] ([idPosicionJugador])
GO
ALTER TABLE [dbo].[JugadorXPartido] CHECK CONSTRAINT [FK_JugadorXPartido_PosicionJugador]
GO
ALTER TABLE [dbo].[JugadorXPartido]  WITH CHECK ADD  CONSTRAINT [FK_JugadorXPartido_Sancion] FOREIGN KEY([idSancion])
REFERENCES [dbo].[Sancion] ([idSancion])
GO
ALTER TABLE [dbo].[JugadorXPartido] CHECK CONSTRAINT [FK_JugadorXPartido_Sancion]
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_PartidosXFechaXCampeonato_Campeonato] FOREIGN KEY([idCampeonato])
REFERENCES [dbo].[Campeonato] ([idCampeonato])
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato] CHECK CONSTRAINT [FK_PartidosXFechaXCampeonato_Campeonato]
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_PartidosXFechaXCampeonato_Fecha] FOREIGN KEY([nroFecha])
REFERENCES [dbo].[Fecha] ([nroFecha])
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato] CHECK CONSTRAINT [FK_PartidosXFechaXCampeonato_Fecha]
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato]  WITH CHECK ADD  CONSTRAINT [FK_PartidosXFechaXCampeonato_Partido] FOREIGN KEY([idClubLocal], [idPartido])
REFERENCES [dbo].[Partido] ([idClubLocal], [idPartido])
GO
ALTER TABLE [dbo].[PartidosXFechaXCampeonato] CHECK CONSTRAINT [FK_PartidosXFechaXCampeonato_Partido]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inscripcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'JugadorXClubXCamp'
GO
USE [master]
GO
ALTER DATABASE [CampeonatoBD] SET  READ_WRITE 
GO
