-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-11-2022 a las 17:38:27
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdvacantes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'ventas', 'Descripción de la categoría ventas'),
(2, 'ingeniería civil', 'Descripción de la categoría ingeniería civil'),
(3, 'desarrollo de software', 'Descripción de la categoría desarrollo de software'),
(4, 'cocina', 'Descripción de la categoría cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `id` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id`, `calle`, `ciudad`, `pais`, `idUsuario`) VALUES
(1, 'calle 5 20 A 33', 'Bogota', 'Colombia', 1),
(2, 'calle 4 5 N 20', 'Cali', 'Colombia', 2),
(3, 'calle 6 25 A 70', 'Medellin', 'Colombia', 3),
(4, 'calle 4 no 23 A 34', 'Popayán', 'Colombia', 9),
(5, 'calle 4 no 23 A 34', 'Popayán', 'Colombia', 10),
(7, 'calle 8 no 23 A 34', 'palmira', 'Colombia', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `perfil`) VALUES
(1, 'SUPERVISOR'),
(2, 'ADMINISTRADOR'),
(3, 'USUARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `comentarios` text,
  `idVacante` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `fecha`, `archivo`, `comentarios`, `idVacante`, `idUsuario`) VALUES
(1, '2022-11-02', 'hoja de vida 1', 'Solicitud para la postulación a la vacante de desarrollador', 11, 1),
(2, '2022-11-15', 'hoja de vida', 'Solicitud parapresentarse a la vacante de análista', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioperfil`
--

CREATE TABLE `usuarioperfil` (
  `idUsuario` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarioperfil`
--

INSERT INTO `usuarioperfil` (`idUsuario`, `idPerfil`) VALUES
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `username`, `password`, `estatus`, `fechaRegistro`) VALUES
(1, 'Juan Perez', 'juanp@unicauca.edu.co', 'juanp', '123', 1, '2020-10-01'),
(2, 'Calatina Serna', 'catalinaS@unicauca.edu.co', 'catalinas', '123', 2, '2020-10-02'),
(3, 'Andres Sanchez', 'andres@unicauca.edu.co', 'andres', '123', 3, '2020-10-03'),
(9, 'Daniel Paz', 'danielp2@unicauca.edu.co', 'danielp2', '12345', 1, '2020-10-16'),
(10, 'Daniel Paz', 'danielp3@unicauca.edu.co', 'danielp3', '12345', 1, '2020-10-16'),
(18, 'Andrea Sanchez', 'Andrea2@unicauca.edu.co', 'Andrea', '12345', 1, '2022-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `salario` double NOT NULL,
  `estatus` enum('Creada','Aprobada','Eliminada') NOT NULL,
  `destacado` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `detalles` text,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`id`, `nombre`, `descripcion`, `fecha`, `salario`, `estatus`, `destacado`, `imagen`, `detalles`, `idCategoria`) VALUES
(1, 'Analista Contable.', 'Importante Empresa dedicada a ofrecer servicios de Consultoria en Recursos Humanos, Jurídico y Finanzas te invita a formar parte de su equipo como Analista Contable.', '2019-05-05', 8500, 'Aprobada', 0, 'logo1.png', '<p><strong>Requisitos:</strong><br />Edad: 24 a 35 a&ntilde;os<br />Escolaridad: Licenciatura en Contabilidad o af&iacute;n</p>\r\n<p><strong>Experiencia m&iacute;nima de 2 a&ntilde;os en:</strong><br />1. Descarga de facturas del sistema de CXP y/o SAT<br />2. Registro de gastos<br />3. Elaboraci&oacute;n de papel de trabajo ISR e IVA<br />4. Presentaci&oacute;n de impuestos federales en el SAT<br />5. Elaboraci&oacute;n de papel de trabajo declaraci&oacute;n informativa (DIOT)<br />6. Presentaci&oacute;n de DIOT en el SAT<br />7. Seguimiento a CXC<br />8. Registro de pagos y complementos de pagos<br />9. Confronta vs el SAT para registro de facturas pendientes<br />10. Integraci&oacute;n de CXP y CXC<br />11. Arqueo de caja<br />12. Depuraci&oacute;n de cuentas<br />13. Cuadre de nominas<br />14. Seguimiento a pagos anticipados<br />15. Registro de depreciaci&oacute;n mensual<br />16. Registro de devengaci&oacute;n mensual<br />17. Registro de rembolsos<br />18. Conciliaciones bancarias</p>\r\n<p>Ofrecemos Prestaciones de Ley + Bono de Asistencia del 5% + Vales de Despensa del 5%.</p>\r\n<p><strong>Requerimientos</strong><br />Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />A&ntilde;os de experiencia: 2<br />Idiomas: Ingl&eacute;s ,Espa&ntilde;ol<br />Edad: entre 24 y 35 a&ntilde;os<br />Conocimientos: LibreOffice<br />Disponibilidad de viajar: No<br />Disponibilidad de cambio de residencia: No</p>\r\n<p>&nbsp;</p>', 1),
(2, 'Administrador de datos en la nube ', 'Únete al Socio Logístico con mayor presencia en México, Soft Technologies te invita a formar parte de su gran equipo de trabajo como Administrador de datos en la nube.', '2019-05-05', 14200, 'Aprobada', 0, 'logo2.png', '<p><span style="color: #0000ff;"><strong>REQUISITOS</strong></span></p>\r\n<p>Escolaridad: Lic. trunca o pasante en Ing en Sistemas Computacionales o afin.<br />Experiencia de 2 a&ntilde;os en:</p>\r\n<ul>\r\n<li>2 a&ntilde;os como ingeniero de infraestructura en tecnolog&iacute;as Microsoft, experiencia en soluciones de Infraestructura (Hardware/Software).</li>\r\n<li>2 a&ntilde;os administrando servidores en centros de datos.</li>\r\n</ul>\r\n<p><span style="color: #0000ff;"><strong>ESPEC&Iacute;FICOS</strong></span></p>\r\n<ul>\r\n<li>Administraci&oacute;n monitoreo y mantenimiento de servicios en la nube Microsoft Azure.</li>\r\n<li>Administraci&oacute;n de servicios y proveedores de nube ITIL Foundations.</li>\r\n<li>Herramientas y Tecnolog&iacute;as de Virtualizaci&oacute;n Autoestudio.</li>\r\n<li>Herramientas de Monitoreo para servicios en la Nube o en Sitio.</li>\r\n<li>Esquemas de alta disponibilidad para nubes, cluster dispersos geogr&aacute;ficamente.</li>\r\n<li>Servicios de Nube: SaaS, PaaS, IaaS.</li>\r\n<li>Conocimientos b&aacute;sicos de Redes.</li>\r\n<li>Administraci&oacute;n de bases de datos en la nube SQL Azure.</li>\r\n<li>Conocimiento de consumo de costos de servicios en la nube.</li>\r\n<li>Herramientas de Monitoreo para nube.</li>\r\n<li>VPN.</li>\r\n<li>Almacenamiento en Nube.</li>\r\n</ul>\r\n<p>&nbsp;<span style="color: #0000ff;"><strong>OFRECEMOS</strong></span></p>\r\n<ul>\r\n<li>ATRACTIVO SUELDO + prestaciones superiores a las de ley.</li>\r\n<li>Excelente ambiente de trabajo.</li>\r\n<li>Zonas de trabajo: Condesa.</li>\r\n<li>Horario Tiempo Completo: Lunes a Viernes: 09:00-06:00 con disponibilidad de horario.</li>\r\n</ul>\r\n<p><span style="color: #0000ff;"><strong>ADICIONALES</strong></span></p>\r\n<ul>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ul>', 3),
(3, 'Coordinador de Marketing', 'TE INVITAMOS A UNIRTE A MARKETING TEC2000 COMO COORDINADOR O COORDINADORA DE MARKETING. SOMOR UNA EMPRESA DE INNOVACION EN EL SECTOR METALMECANICO E IMPORTACIONES, EXCELENTE OPORTUNIDAD DE DESARROLLO Y APLICACION DE CONOCIMIENTOS.', '2019-05-06', 7900, 'Aprobada', 0, 'logo3.png', '<p><strong><span style="background-color: #ccffcc;">BUSCAMOS LIDER QUE GUSTE DE RETOS PARA:</span></strong></p>\r\n<ul>\r\n<li>DISE&Ntilde;AR, PLANIFICAR ELABORAR E INSTAURAR LOS PLANES DE MARKETING DE LA EMPRESA.</li>\r\n<li>DESARROLLAR PLAN PARA IMAGEN CORPORATIVA.</li>\r\n<li>PLANEACI&Oacute;N, EJECUCI&Oacute;N Y CONTROL DE CAMPA&Ntilde;AS 360&deg; (IMPLEMENTACI&Oacute;N, EJECUCI&Oacute;N, M&Eacute;TRICAS, AN&Aacute;LISIS, RESULTADOS, PRESENTACIONES EJECUTIVAS, PRESUPUESTOS).</li>\r\n<li>DAR SOPORTE AL &Aacute;REA DE VENTAS EN CUANTO A ESTRATEGIAS, POL&Iacute;TICAS, CANALES, PUBLICIDAD, M&Aacute;NEJO DE REDES SOCIALES, INVESTIGACI&Oacute;N DE MERCADOS, SEGUIMIENTO A RESULTADOS DE &Aacute;REA COMERCIAL.</li>\r\n<li>HACER INVESTIGACIONES COMERCIALES DE LOS PRODUCTOS EXISTENTES O NUEVOS, REALIZANDO EL ESTUDIO DE LAS DEBILIDADES, AMENAZAS, FORTALEZAS Y OPORTUNIDADES DE LOS MISMOS EN EL MERCADO.</li>\r\n<li>SE ENCARGAR&Aacute; DE CAPTAR NUEVOS CLIENTES Y DE MANTENER LOS QUE YA EXISTEN.</li>\r\n<li>DESARROLLAR E IMPLANTAR UNA ESTRATEGIA DE COMUNICACI&Oacute;N INTEGRAL DE CONFORMIDAD CON LA MISI&Oacute;N Y PLAN DE MARKETING.</li>\r\n<li>LLEVAR A CABO LA PRESENTACI&Oacute;N DE LA COMPA&Ntilde;&Iacute;A.</li>\r\n<li>COORDINAR SU ACTIVIDAD CON OTROS DEPARTAMENTOS.</li>\r\n<li>ORGANIZAR Y DEFINIR LOS EVENTOS DE LA EMPRESA.</li>\r\n<li>INTRODUCCI&Oacute;N DE NUEVOS PRODUCTOS</li>\r\n</ul>\r\n<p><strong><span style="background-color: #ccffcc;">REQUERIMIENTOS</span></strong></p>\r\n<ul>\r\n<li>EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA</li>\r\n<li>A&Ntilde;OS DE EXPERIENCIA: 1</li>\r\n<li>EDAD: ENTRE 23 Y 40 A&Ntilde;OS</li>\r\n<li>CONOCIMIENTOS: LIBREOFFICE</li>\r\n<li>LICENCIAS DE CONDUCIR: AUTOMOVIL</li>\r\n<li>DISPONIBILIDAD DE VIAJAR: NO</li>\r\n<li>DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</li>\r\n</ul>\r\n<p><strong><span style="background-color: #ccffcc;">COMPETENCIAS</span></strong></p>\r\n<ol>\r\n<li>ENFOCADO A RESULTADOS</li>\r\n<li>ENFOQUE ESTRAT&Eacute;GICO</li>\r\n<li>TOMA DE DECISIONES</li>\r\n<li>APEGO A NORMAS</li>\r\n<li>TRABAJO EN EQUIPO</li>\r\n</ol>\r\n<p><span style="color: #ff0000;">SUELDO COMPETITIVO.</span><br /><span style="color: #ff0000;">HORARIO DE 9:00 A 7:00 DE LUNES A VIERNES</span><br /><span style="color: #ff0000;">ZONA DE TRABAJO: VALLEJO</span><br /><span style="color: #ff0000;">INTERESADOS POSTULARSE POR ESTE MEDIO</span></p>', 1),
(4, 'Gerente de Recursos Humanos', 'Importante empresa líder en su giro solicita por expansión Gerente de Recursos Humanos para llevar el control de personal, supervisión del reclutamiento y los programas de capacitación.', '2019-05-06', 17000, 'Aprobada', 0, 'logo4.png', '<p><strong>IMPORTANTE EMPRESA L&Iacute;DER EN SU GIRO SOLICITA POR EXPANSI&Oacute;N</strong><br /><br />EJECUTIVO DE RECLUTAMIENTO BILING&Uuml;E<br /><br /><span style="color: #ff0000;"><strong>REQUISITOS:</strong></span></p>\r\n<ol>\r\n<li>LIC. EN PSICOLOGIA, ADMINISTRACI&Oacute;N O AFIN</li>\r\n<li>EDAD 22 A 35 A&Ntilde;OS</li>\r\n<li>EXPERIENCIA MINIMA DE 2 A&Ntilde;OS EN PUESTO SIMILAR</li>\r\n<li>INGLES AVANZADO</li>\r\n<li>MANEJO DE OFFICE</li>\r\n<li>DISPONIBILIDAD INMEDIATA</li>\r\n<li>EXCELENTE PRESENTACION</li>\r\n</ol>\r\n<p><span style="color: #ff0000;"><strong><span style="color: #ff0000;">FUNCIONES:</span></strong></span></p>\r\n<ul>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">ADMINISTRACI&Oacute;N DE PERSONAL</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">ALTAS, BAJAS, MODIFICACI&Oacute;N DE SALARIO</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">ELABORACI&Oacute;N Y GESTI&Oacute;N DE INCIDENCIAS</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">ELABORACI&Oacute;N Y REVISI&Oacute;N DE CONTRATOS</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">PROCESO, ELABORACI&Oacute;N Y C&Aacute;LCULO DE PRE-N&Oacute;MINA</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">SEGUIMIENTO Y OBLIGACIONES ANTE EL IMSS, INFONAVIT, ISR</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">CONTROL Y ENTREGA DE CREDENCIALES</span> </span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">GESTIONAR FIRMAS DE CONTRATOS.</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">ELABORACI&Oacute;N Y REVISI&Oacute;N DE REPORTES.</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">CONTROL DE KPI&acute;S</span></span></li>\r\n<li><span style="color: #ff0000;"><span style="color: #000000;">GESTIONAR Y DAR SEGUIMIENTO EN FORMA Y TIEMPO A CUALQUIER SOLICITUD RELACIONADA A LOS CLIENTES Y COLABORADORES.</span><strong><br /></strong></span></li>\r\n</ul>\r\n<p><span style="color: #ff0000;"><strong>OFRECEMOS:</strong></span></p>\r\n<ul>\r\n<li>PRESTACIONES DE LEY</li>\r\n<li>VALES DE DESPENSA</li>\r\n<li>DIAS Y HORARIO DE TRABAJO:LUNES A VIERNES DE 9:00 HRS A 18:00 HRS</li>\r\n<li>ZONA DE TRABAJO: ALVARO OBREGON, CDMX</li>\r\n</ul>\r\n<p><em><strong><span style="color: #0000ff;">INTERESADOS QUE CUMPLAN CON EL PERFIL SOLICITADO:</span></strong></em><br /><em><strong><span style="color: #0000ff;">ENVIAR CV ACTUALIZADO AL CORREO POR ESTE MISMO MEDIO Y EN BREVE ESTAREMOS AGENDADO UNA ENTREVISTA. EN ASUNTO PONER NOMBRE DE LA VACANTE.</span></strong></em></p>\r\n<p>&nbsp;</p>', 1),
(5, 'Residente de obra Arquitecto o Ing Civil', 'Estamos solicitando Arquitecto / Ing Civil con experiencia en desarrollos habitacionales, en los procesos de venta, comercialización, publicidad y administradores de obras.', '2019-05-08', 16500, 'Aprobada', 1, 'logo12.png', '<p><strong>Descripci&oacute;n</strong><br />Empresa constructora solicita personal para puesto de Residente de Obra.<br /><br /><strong>Escolaridad:</strong> Arquitecto y/o Ingeniero Civil<br /><br /><strong>Funci&oacute;n principal:</strong><br />* Supervisi&oacute;n y control de obra<br />* Cuantificacion de avances<br />* Elaboraci&oacute;n de estimaciones<br />* Manejo de contratistas y personal<br />* Estimaciones de avance de obra<br />* Elaboraci&oacute;n de paquetes de obra<br />* Realizaciones de reports de obra<br />* Interpretaci&oacute;n de planos.( Memorias de calculo ..)<br />* An&aacute;lisis de precios unitarios.<br />* Ejecuci&oacute;n de proyectos.<br />* Bit&aacute;cora de obra<br /><br /><strong>Habilidades:</strong><br />* Negociaci&oacute;n, liderazgo, capacidad para resolver conflictos<br />* Opus, AutoCAD, Excell<br /><br /><strong>Requerimientos</strong><br />* Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />* A&ntilde;os de experiencia: 4<br />* Idiomas: Ingl&eacute;s<br />* Edad: entre 27 y 60 a&ntilde;os<br />* Disponibilidad de viajar: No<br />* Disponibilidad de cambio de residencia: No</p>\r\n<p><span style="background-color: #ffffff; color: #0000ff;"><strong>Interesados, favor en enviar su CV en formato PDF aqu&iacute; en la plataforma.</strong></span></p>', 2),
(6, 'Administrador de redes y Sistema Operativo Red Hat', 'Empresa importante del sector financiero solicita Ing. de Sistemas para monitorear y administrar el desempeño de los servidores Linux.', '2019-05-09', 25000, 'Aprobada', 1, 'logo14.png', '<p style="text-align: center;"><span style="color: #0000ff;">&iexcl;&iexcl;INT&Eacute;GRATE A NUESTRO GRAN EQUIPO!!</span><br /><span style="color: #0000ff;">EMPRESA IMPORTANTE SOLICITA ADMINISTRADOR DE SO RED HAT ENTERPRISE LINUX.</span></p>\r\n<p><span style="color: #ff0000;"><strong>Requisitos:</strong></span></p>\r\n<ul>\r\n<li>Ingeniero en computaci&oacute;n o carrera af&iacute;n (Titulado)</li>\r\n<li>Promedio m&iacute;nimo de 8.0</li>\r\n<li>Sexo: Indistinto</li>\r\n</ul>\r\n<p><span style="color: #ff0000;"><strong>Experiencia m&iacute;nima de 2 a 3 a&ntilde;os en:</strong></span></p>\r\n<ul>\r\n<li>Instalaci&oacute;n, configuraci&oacute;n, aplicaci&oacute;n de parches y actualizaci&oacute;n del software mencionado.</li>\r\n<li>Implementaci&oacute;n de recomendaciones de seguridad inform&aacute;tica y buenas pr&aacute;cticas.</li>\r\n<li>Resoluci&oacute;n de problemas a nivel Sistema Operativo.</li>\r\n<li>Monitoreo y an&aacute;lisis de desempe&ntilde;o de los servidores Linux.</li>\r\n<li>Atenci&oacute;n de reportes de Soporte t&eacute;cnico, atenci&oacute;n y asesor&iacute;as a usuarios finales asignados por el Centro de Soporte Institucional (Mesa de Ayuda).</li>\r\n<li>Alta, baja y modificaci&oacute;n de cuentas de usuario.</li>\r\n</ul>\r\n<p><span style="color: #ff0000;"><strong>Contar con alguno de los siguientes cursos:</strong></span></p>\r\n<ul>\r\n<li>Red Hat System Administration I version 6 o superior</li>\r\n<li>Red Hat System Administration II</li>\r\n<li>Certificaci&oacute;n Red Hat Certified System Administrator (RHCSA) para versi&oacute;n 6 o superior</li>\r\n<li>Red Hat Certified Engineer (RHCE) para versi&oacute;n 6 o superior</li>\r\n</ul>\r\n<p><span style="color: #ff0000;"><strong>Propuesta de trabajo:</strong></span></p>\r\n<ul>\r\n<li>Sueldo seg&uacute;n experiencia y conocimientos</li>\r\n<li>Prestaciones de Ley</li>\r\n<li>Zona de trabajo: Legar&iacute;a</li>\r\n<li>Horario propuesto: lunes a viernes de 9 &ndash; 18 horas</li>\r\n</ul>\r\n<p><span style="color: #ff0000;"><strong>Requerimientos</strong></span></p>\r\n<ol>\r\n<li>Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura</li>\r\n<li>A&ntilde;os de experiencia: 2</li>\r\n<li>Disponibilidad de viajar: No</li>\r\n<li>Disponibilidad de cambio de residencia: No</li>\r\n</ol>\r\n<p><span style="color: #008000;"><strong>SI CUMPLES CON LOS REQUISITOS MENCIONADOS NO DUDES EN ENVIARNOS TU CV POR ESTE MEDIO.</strong> </span></p>', 3),
(7, 'Programador de Software', 'Empresa con presencia a nivel nacional, te invita a formar parte de su equipo de trabajo para diseñar, crear y realizar mantenimiento a páginas y aplicaciones web.', '2019-05-09', 19700, 'Creada', 1, 'logo15.png', '<p><span style="color: #ff0000;"><strong>PROGRAMADOR DE SOFTWARE</strong></span><br /><br /><strong>OBJETIVO:</strong> DISE&Ntilde;AR, CREAR Y REALIZAR MANTENIMIENTO A P&Aacute;GINAS Y APLICACIONES WEB<br /><br /><strong><span style="color: #0000ff;">REQUISITOS:</span></strong></p>\r\n<p>* EDAD: 25 A 35 A&Ntilde;OS<br />* LICENCIATURA: DESARROLLO DE SOFTWARE, INFORM&Aacute;TICA, INGENIER&Iacute;A EN SISTEMAS COMPUTACIONALES O AF&Iacute;N<br />* INGLES T&Eacute;CNICO<br />* EXPERIENCIA EN PUESTO SIMILAR M&Iacute;NIMA 3 A&Ntilde;OS (ESTAR EJERCIENDO ACTUALMENTE)<br />* MANEJO DE ERP<br />* EXPERIENCIA EN VISUAL C# (2 A&Ntilde;OS)<br />* EXPERIENCIA EN JAVA (2 A&Ntilde;OS)<br />* EXPERIENCIA EN MICROSOFT SQL SERVER (2 A&Ntilde;OS)<br />* EXPERIENCIA DE MVC Y POO (1 A&Ntilde;O)<br /><br /><strong><span style="color: #0000ff;">FUNCIONES: (EXPERIENCIA EN ESTAS ACTIVIDADES)</span></strong></p>\r\n<p>* MANEJO DE C&Oacute;DIGO EN DISTINTOS LENGUAJES DE PROGRAMACI&Oacute;N, TALES COMO HTML, XML PHP Y JAVASCRIPT.<br />* DISE&Ntilde;AR NUEVAS APLICACIONES Y SITIOS DE INTERNET<br />* DETECTAR Y SOLUCIONAR ERRORES O PROBLEMAS EN LA EJECUCI&Oacute;N DE LAS APLICACIONES Y SITIOS WEB.<br />* AGREGAR NUEVAS FUNCIONES A LA EJECUCI&Oacute;N DE LOS SITIOS DE INTERNET Y LAS APLICACIONES<br />* ESTAR AL CORRIENTE CON LOS NUEVOS LENGUAJES DE PROGRAMACI&Oacute;N, TECNOLOG&Iacute;AS Y TENDENCIAS EN EL MERCADO<br />* COLABORAR EN LA ATENCI&Oacute;N Y CAPACITACI&Oacute;N DE LOS USUARIOS EN LOS SISTEMAS IMPLEMENTADOS<br />* DOCUMENTAR ADECUADAMENTE LOS PROGRAMAS DESARROLLADOS<br /><br /><strong><span style="color: #0000ff;">OFERTA:</span></strong></p>\r\n<p>* PERCEPCI&Oacute;N MENSUAL $10,000 NETOS (PAGO QUINCENAL, INCLUYE VALES DE DESPENSA)<br />* PRESTACIONES DE LEY<br />* HORARIO: L-V 9:00 A 7:00 Y S&Aacute;BADO MEDIO D&Iacute;A<br /><br /><span style="color: #0000ff;"><strong>REQUERIMIENTOS</strong></span></p>\r\n<p>* EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA<br />* A&Ntilde;OS DE EXPERIENCIA: 3<br />* IDIOMAS: INGL&Eacute;S<br />* EDAD: ENTRE 25 Y 35 A&Ntilde;OS<br />* CONOCIMIENTOS: SQL SERVER, C#, JAVA, ASP.NET MVC, MYSQL<br />* DISPONIBILIDAD DE VIAJAR: NO<br />* DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</p>\r\n<p><em><strong>SI CUMPLES CON EL PERFIL. POR FAVOR ENVIANOS TU CV POR ESTE MEDIO EN FORMATO PDF, DOCX.</strong></em></p>\r\n<p>&nbsp;</p>', 3),
(8, 'Ejecutivo Contable', 'Empresa internacional solicita Contador Público para realizar las siguientes actividades: conciliaciones y movimientos bancarios, emisión de estados financieros, cálculo de impuestos y presentación de declaraciones, estrategias fiscales, entre otros.', '2019-05-09', 16900, 'Aprobada', 1, 'logo10.png', '<p><strong>EMPRESA L&Iacute;DER EN LA ADMINISTRACI&Oacute;N DE CAPITAL HUMANO EST&Aacute; EN B&Uacute;SQUEDA DE:</strong><br /><br /><strong>EJECUTIVO DE CONTABLE</strong><br /><br /><strong><span style="color: #ff0000;">REQUISITOS:</span></strong><br /><br />- Contabilidad (Titulado o Pasante)<br />- 1 a&ntilde;o de experiencia comprobable en el &aacute;rea contable.<br /><br /><span style="color: #ff0000;"><strong>FUNCIONES:</strong></span><br /><br />- Manejar los registros contables (p&oacute;lizas de ingreso y egresos diarios).<br />- C&aacute;lculo de impuestos provisionales.<br />- C&aacute;lculo de declaraciones anuales para personas morales y f&iacute;sicas.<br />- Elaboraci&oacute;n de estados financieros.<br />- Atenci&oacute;n a visitas domiciliarias.<br /><br /><strong>ZONA DE TRABAJO: Col. Buena Vista, D.F</strong></p>\r\n<p><span style="color: #ff0000;"><strong>OFRECEMOS:</strong></span></p>\r\n<p>- Salario atractivo, seg&uacute;n experiencia.<br />- Prestaciones superiores a las de ley (seguro de vida, seguro de gastos m&eacute;dicos, seguro de gastos funerarios, tarjeta de descuentos, universidad corporativa), desde el primer d&iacute;a.<br /><br /><span style="color: #ff0000;"><strong>REQUERIMIENTOS:</strong></span></p>\r\n<p>- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />- A&ntilde;os de experiencia: 1<br />- Disponibilidad de viajar: Si<br />- Disponibilidad de cambio de residencia: No</p>\r\n<p>INTERESADOS FAVOR DE ENVIAR SU CV POR ESTE MEDIO.<br /><br /><strong>SOMOS UNA EMPRESA INCLUYENTE QUE RESPETA LA DIVERSIDAD Y NO HACE NING&Uacute;N TIPO DE DISCRIMINACI&Oacute;N YA SEA POR G&Eacute;NERO, DISCAPACIDAD, ORIENTACI&Oacute;N POL&Iacute;TICA, RELIGIOSA O SEXUAL, NI CONDICI&Oacute;N SOCIAL O EDAD.</strong></p>', 1),
(9, 'Ingeniero electrónico', 'Estamos reclutando Ing. Electrónico para diseñar equipos y sistemas electrónicos (circuitos), tanto analógicos como digitales y para dirigir la operación de equipos y sistemas electrónicos en las áreas de comunicación, control, instrumentación y potencia.', '2019-05-09', 23600, 'Creada', 1, 'logo13.png', '<p>&iexcl;&Uacute;nete a nuestro equipo de trabajo!<br /><br />Nuestra visi&oacute;n es ser la inspiraci&oacute;n de la industria de la entrega inmediata, a trav&eacute;s del desarrollo del talento humano y la excelencia operacional.</p>\r\n<p><span style="color: #0000ff;"><strong>FUNCIONES:</strong></span><br />- Mantendr&aacute; los equipos, maquinaria dentro del sectro en excelentes condiciones mediante un buen servicio de mantenimiento preventivo, correctivo, predictivo.<br />- Evitar&aacute; paros inoportunos y p&eacute;rdidas para la empresa.<br />- Apoyar&aacute; a producci&oacute;n medienta capacitaci&oacute;n de maquinaria nueva.<br />- Coordinar&aacute; al personal para establecer par&aacute;metros en &aacute;rea.<br /><br /><span style="color: #0000ff;"><strong>DEBERAS TENER:</strong></span><br />- Ing. en mecatr&oacute;nica, electr&oacute;nica y electromec&aacute;nico.<br />- Experiencia en el ramo de mantenimiento en general.<br />- Conocimiento en maquinaria industrial.<br />- 2 a&ntilde;os de experiencia minimo.<br />- Destrezay habilidad en herramientas mec&aacute;nicas, el&eacute;ctricas y electr&oacute;nicas.<br /><br /><span style="color: #0000ff;"><strong>VALORAMOS:</strong></span><br />- Liderazgo<br />- Responsabilidad<br />- Actitud de servicio<br />- Enfoque a resultados<br />- Comunicaci&oacute;n efectiva<br />- Retenci&oacute;n de informaci&oacute;n<br />- Habilidad anal&iacute;tica<br /><br /><span style="color: #0000ff;"><strong>QUE OFRECEMOS:</strong></span><br />- Prestaciones superiores a la ley (fondo de ahorro, 30 d&iacute;as de aguinaldo, 15 d&iacute;as de vacaciones, vales de despensa, utilidades, bono por puntualidad y asistencia, SGMM).<br />- Estabilidad y crecimiento laboral.</p>\r\n<p><span style="color: #0000ff;"><strong>REQUERIMIENTOS:</strong></span><br />- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />- A&ntilde;os de experiencia: 3<br />- Edad: entre 25 y 30 a&ntilde;os<br />- Conocimientos: Windows, Administraci&oacute;n de archivos<br />- Disponibilidad de viajar: No<br />- Disponibilidad de cambio de residencia: No</p>\r\n<p><span style="color: #0000ff;"><strong>SI CUBRES EL PERFIL, POR FAVOR ENVIANOS TU CV POR ESTE MEDIO.</strong></span></p>', 3),
(11, 'Desarrollador en Spring boot framework 2', 'El desarrollador debe tener conocimiento en Angular,Spring, Spring boot y JPA', '2020-10-16', 8500, 'Aprobada', 0, 'imagen.png', '<h1>Los requisitos para el cargo son los siguientes</h1>', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Vacante_Usuario_UNIQUE` (`idVacante`,`idUsuario`),
  ADD KEY `fk_Solicitudes_Vacantes1_idx` (`idVacante`),
  ADD KEY `fk_Solicitudes_Usuarios1_idx` (`idUsuario`);

--
-- Indices de la tabla `usuarioperfil`
--
ALTER TABLE `usuarioperfil`
  ADD UNIQUE KEY `Usuario_Perfil_UNIQUE` (`idUsuario`,`idPerfil`),
  ADD KEY `fk_Usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_Perfiles1_idx` (`idPerfil`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacantes_categorias1_idx` (`idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_Solicitudes_Vacantes1` FOREIGN KEY (`idVacante`) REFERENCES `vacantes` (`id`);

--
-- Filtros para la tabla `usuarioperfil`
--
ALTER TABLE `usuarioperfil`
  ADD CONSTRAINT `fk_Perfiles1` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`id`),
  ADD CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD CONSTRAINT `fk_vacantes_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
