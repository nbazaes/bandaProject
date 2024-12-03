-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-12-2024 a las 01:36:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bandas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `banda_id` bigint(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `portada` varchar(255) NOT NULL,
  `video_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id`, `banda_id`, `titulo`, `fecha_lanzamiento`, `portada`, `video_url`) VALUES
(1, 1, 'Negative Spaces', '2024-11-15', 'albums/Poppy-Negative-Spaces-cover.webp', 'https://www.youtube.com/embed/ixRV9Tqrzw0'),
(2, 3, 'Construct', '2013-05-27', 'albums/DT-Construct2013.jpg', NULL),
(3, 3, 'Fiction', '2007-04-19', 'albums/Dark_tranquility_fiction_album.jpg', 'https://www.youtube.com/embed/VuuVEntrgl4'),
(4, 4, 'Dynamo', '1992-10-26', 'albums/Dynamo_Tapa_album.jpg', 'https://www.youtube.com/embed/dR7WagYEP3A'),
(5, 2, 'Barrio Fino', '2004-07-13', 'albums/classic-reggaeton-spanish-rap-album-daddy-yankee-barrio-v0-ktv70eld4juc1.webp', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Administradores'),
(1, 'Curadores'),
(2, 'Usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(10, 1, 25),
(11, 1, 26),
(12, 1, 27),
(13, 1, 28),
(14, 1, 29),
(15, 1, 30),
(16, 1, 31),
(1, 1, 32),
(2, 1, 33),
(3, 1, 34),
(4, 1, 35),
(5, 1, 36),
(6, 1, 37),
(7, 1, 38),
(8, 1, 39),
(9, 1, 40),
(19, 2, 28),
(17, 2, 32),
(20, 2, 36),
(18, 2, 40),
(21, 3, 1),
(22, 3, 2),
(23, 3, 3),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(27, 3, 7),
(28, 3, 8),
(29, 3, 9),
(30, 3, 10),
(31, 3, 11),
(32, 3, 12),
(33, 3, 13),
(34, 3, 14),
(35, 3, 15),
(36, 3, 16),
(37, 3, 17),
(38, 3, 18),
(39, 3, 19),
(40, 3, 20),
(41, 3, 21),
(42, 3, 22),
(43, 3, 23),
(44, 3, 24),
(45, 3, 25),
(46, 3, 26),
(47, 3, 27),
(48, 3, 28),
(49, 3, 29),
(50, 3, 30),
(51, 3, 31),
(52, 3, 32),
(53, 3, 33),
(54, 3, 34),
(55, 3, 35),
(56, 3, 36),
(57, 3, 37),
(58, 3, 38),
(59, 3, 39),
(60, 3, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add album', 7, 'add_album'),
(26, 'Can change album', 7, 'change_album'),
(27, 'Can delete album', 7, 'delete_album'),
(28, 'Can view album', 7, 'view_album'),
(29, 'Can add genero', 8, 'add_genero'),
(30, 'Can change genero', 8, 'change_genero'),
(31, 'Can delete genero', 8, 'delete_genero'),
(32, 'Can view genero', 8, 'view_genero'),
(33, 'Can add banda', 9, 'add_banda'),
(34, 'Can change banda', 9, 'change_banda'),
(35, 'Can delete banda', 9, 'delete_banda'),
(36, 'Can view banda', 9, 'view_banda'),
(37, 'Can add miembro', 10, 'add_miembro'),
(38, 'Can change miembro', 10, 'change_miembro'),
(39, 'Can delete miembro', 10, 'delete_miembro'),
(40, 'Can view miembro', 10, 'view_miembro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$75DDsSoanYTotCPKWaE0zX$pDd7UIWdB6zlJBIJVY2C8UR/HTWqPOq0popka2PXyVQ=', '2024-12-03 00:33:17.000000', 1, 'admin', '', '', 'nicolas.bazaes02@inacapmail.cl', 1, 1, '2024-12-01 23:17:23.000000'),
(2, 'pbkdf2_sha256$870000$37ZKMkBMGGXB5xmHfzep7P$3ORsGWIcnPpEF5f52T/aT1FvT60hSswip8h0TRZXiPk=', '2024-12-02 02:28:51.000000', 0, 'Curador', '', '', '', 0, 1, '2024-12-01 23:21:11.000000'),
(3, 'pbkdf2_sha256$870000$tFwsAMPE5HzdwY3wbSk3mf$pAhearmQ9rTC2dq0CBOHlVK7qRHoGU+ng4RIZeOo+PU=', '2024-12-03 00:27:15.000000', 0, 'Usuario', '', '', '', 0, 1, '2024-12-01 23:21:22.000000'),
(5, 'pbkdf2_sha256$870000$9Lel32pZUePt59I8hCTj5P$EFBK4SQgSESK3rlZg79KYLWW3v7K7nDs/SO+WQxVkHU=', '2024-12-02 04:38:41.000000', 0, 'nicolas', '', '', '', 0, 1, '2024-12-02 02:20:37.000000'),
(6, 'pbkdf2_sha256$870000$99DCUkwuahZZvnt4pawQo7$cupxxR1HcRqkYqIFBSGRnabDope+t3NIbQGlvSEqNFU=', '2024-12-02 03:19:13.000000', 0, 'Antonio', '', '', '', 0, 1, '2024-12-02 03:19:12.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 3),
(1, 2, 1),
(2, 3, 2),
(7, 5, 3),
(6, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banda`
--

CREATE TABLE `banda` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_formacion` date NOT NULL,
  `fecha_separacion` date DEFAULT NULL,
  `biografia` longtext NOT NULL,
  `genero_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `banda`
--

INSERT INTO `banda` (`id`, `nombre`, `fecha_formacion`, `fecha_separacion`, `biografia`, `genero_id`) VALUES
(1, 'Poppy', '2015-01-01', NULL, 'Popular desde YouTube, comenzó en el mundo de la música haciendo una mezcla de dark synth pop y Nu metal', 3),
(2, 'Daddy Yankee', '2000-01-01', '2023-10-15', 'Pionero en popularizar el reggaeton', 5),
(3, 'Dark Tranquillity', '1990-01-01', NULL, 'Pioneros del sonido de Gothemburgo y del death metal melódico', 6),
(4, 'Soda Stereo', '1982-01-01', '1997-01-01', 'Soda Stereo fue una banda de rock argentina formada en 1982 originalmente por el cantante y guitarrista Gustavo Cerati, el bajista Zeta Bosio y el baterista Charly Alberti.1​ Es considerada ampliamente por la crítica especializada como la banda más importante, popular e influyente del rock en españo', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-12-01 23:21:11.000000', '2', 'Curador', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-12-01 23:21:22.000000', '3', 'Usuario', 1, '[{\"added\": {}}]', 4, 1),
(3, '2024-12-01 23:26:13.000000', '3', 'Usuario', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(4, '2024-12-01 23:27:01.000000', '3', 'Usuario', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(5, '2024-12-01 23:28:19.000000', '3', 'Usuario', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(6, '2024-12-01 23:41:48.000000', '2', 'Curador', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(7, '2024-12-02 00:35:56.000000', '1', 'Curadores', 1, '[{\"added\": {}}]', 3, 1),
(8, '2024-12-02 00:36:15.000000', '2', 'Usuarios', 1, '[{\"added\": {}}]', 3, 1),
(9, '2024-12-02 00:36:33.000000', '2', 'Curador', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]', 4, 1),
(10, '2024-12-02 00:36:47.000000', '3', 'Usuario', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]', 4, 1),
(11, '2024-12-02 01:10:21.000000', '3', 'Administradores', 1, '[{\"added\": {}}]', 3, 1),
(12, '2024-12-02 01:10:38.000000', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(13, '2024-12-02 02:21:19.000000', '4', 'teo', 3, '', 4, 1),
(14, '2024-12-02 03:20:02.000000', '6', 'Antonio', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(15, '2024-12-02 03:20:10.000000', '5', 'nicolas', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'albumsApp', 'album'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'bandasApp', 'banda'),
(8, 'bandasApp', 'genero'),
(5, 'contenttypes', 'contenttype'),
(10, 'miembrosApp', 'miembro'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-30 21:46:57.000000'),
(2, 'auth', '0001_initial', '2024-11-30 21:46:57.000000'),
(3, 'admin', '0001_initial', '2024-11-30 21:46:57.000000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-30 21:46:57.000000'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-30 21:46:57.000000'),
(6, 'bandasApp', '0001_initial', '2024-11-30 21:46:57.000000'),
(7, 'albumsApp', '0001_initial', '2024-11-30 21:46:57.000000'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-11-30 21:46:57.000000'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-11-30 21:46:57.000000'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-11-30 21:46:57.000000'),
(11, 'auth', '0004_alter_user_username_opts', '2024-11-30 21:46:57.000000'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-11-30 21:46:57.000000'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-11-30 21:46:57.000000'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-11-30 21:46:57.000000'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-11-30 21:46:57.000000'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-11-30 21:46:57.000000'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-11-30 21:46:57.000000'),
(18, 'auth', '0011_update_proxy_permissions', '2024-11-30 21:46:57.000000'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-11-30 21:46:57.000000'),
(20, 'miembrosApp', '0001_initial', '2024-11-30 21:46:57.000000'),
(21, 'sessions', '0001_initial', '2024-11-30 21:46:57.000000'),
(22, 'albumsApp', '0002_album_video_url', '2024-12-01 22:32:20.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('09x9qjxbx86k7wpdj1ekylvdrzow5gwy', 'e30:1tHvud:Mzuma_U5HPFkfCe9LHtRfRF3n3cEpAcf5q_hvWIFJuE', '2024-12-16 02:11:47.000000'),
('m9lpho3xoep95v7m2v0lhs771f2gn6qm', '.eJxVjMsOwiAQRf-FtSG8KS7d-w1kGAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdEuCD2g7yHdqtc-xtXebEd4UfdPBrz_S8HO7fQYVRvzUq61yZKAgAkBa1t8YHNCVYRUJpdEnmSYFGGVKxmdCT8MEEYTyAIfb-AN0cN9g:1tIGqr:ZaO6g6gWKnkLnjrHH5ZVe9EUAxVN2P0RFT7lexx0O54', '2024-12-17 00:33:17.000000'),
('uwt4ephg1tuua59ths0hbdtoamfpmn6p', '.eJxVjMsOwiAQRf-FtSG8KS7d-w1kGAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdEuCD2g7yHdqtc-xtXebEd4UfdPBrz_S8HO7fQYVRvzUq61yZKAgAkBa1t8YHNCVYRUJpdEnmSYFGGVKxmdCT8MEEYTyAIfb-AN0cN9g:1tHwzc:3onSuOIMRjV3E4mFVtcBvcQ8Y1wQGkpavpg5PJCcoB0', '2024-12-16 03:21:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Rock alternativo'),
(3, 'Synth Pop'),
(4, 'Hardcore Punk'),
(5, 'Reggaeton'),
(6, 'Death metal melódico'),
(7, 'Pop/Rock');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE `miembro` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `instrumento` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `banda_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `miembro`
--

INSERT INTO `miembro` (`id`, `nombre`, `apellido`, `instrumento`, `foto`, `banda_id`) VALUES
(2, 'Mikael', 'Stanne', 'Cantante', 'miembros/MSbkLykr9rYpmp3qXiTPpN-320-80.webp', 3),
(3, 'Gustavo', 'Cerati', 'Cantante/guitarrista', 'miembros/0082337001699628759.webp', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_banda` (`banda_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `banda`
--
ALTER TABLE `banda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banda_genero_id_74696c43_fk_genero_id` (`genero_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miembro_banda_id_e0d15cad_fk_banda_id` (`banda_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `banda`
--
ALTER TABLE `banda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `miembro`
--
ALTER TABLE `miembro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_banda` FOREIGN KEY (`banda_id`) REFERENCES `banda` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `banda`
--
ALTER TABLE `banda`
  ADD CONSTRAINT `banda_genero_id_74696c43_fk_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD CONSTRAINT `miembro_banda_id_e0d15cad_fk_banda_id` FOREIGN KEY (`banda_id`) REFERENCES `banda` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
