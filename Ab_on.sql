/*
SQLyog Ultimate
MySQL - 10.4.21-MariaDB : Database - abon
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `absensi` */

DROP TABLE IF EXISTS `absensi`;

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tanggal` varchar(8) DEFAULT NULL,
  `terlambat` varchar(12) DEFAULT '-62170009632',
  `denda` int(25) DEFAULT 0,
  `waktu_masuk` varchar(12) DEFAULT NULL,
  `waktu_pulang` varchar(12) DEFAULT '-62170009632',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `announcement` */

DROP TABLE IF EXISTS `announcement`;

CREATE TABLE `announcement` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `pengumuman` varchar(255) DEFAULT NULL,
  `tanggal` varchar(14) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `cuti` */

DROP TABLE IF EXISTS `cuti`;

CREATE TABLE `cuti` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `jenis_cuti` int(2) DEFAULT NULL,
  `cuti_khusus` varchar(50) DEFAULT NULL,
  `tanggal_mulai` varchar(11) DEFAULT NULL,
  `tanggal_selesai` varchar(11) DEFAULT NULL,
  `jml_cuti` int(2) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `berangkat` varchar(6) DEFAULT NULL,
  `pulang` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `divisi` */

DROP TABLE IF EXISTS `divisi`;

CREATE TABLE `divisi` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `kode_divisi` varchar(2) DEFAULT NULL,
  `nama_divisi` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `jabatan` */

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `kode_jabatan` varchar(2) DEFAULT NULL,
  `jabatan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `jadwal` */

DROP TABLE IF EXISTS `jadwal`;

CREATE TABLE `jadwal` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nik` varchar(12) DEFAULT NULL,
  `shift_id` int(1) DEFAULT NULL,
  `tanggal` varchar(2) DEFAULT NULL,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `jenis_cuti` */

DROP TABLE IF EXISTS `jenis_cuti`;

CREATE TABLE `jenis_cuti` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `jenis_cuti` varchar(30) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `shift` */

DROP TABLE IF EXISTS `shift`;

CREATE TABLE `shift` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `jam_masuk` varchar(5) DEFAULT NULL,
  `jam_pulang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(12) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gambar` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `role_id` int(1) DEFAULT NULL,
  `waktu_gabung` int(11) DEFAULT NULL,
  `aktif` int(1) DEFAULT NULL,
  `tentang` varchar(128) DEFAULT NULL,
  `tempat_tinggal` varchar(128) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `jabatan_id` varchar(2) DEFAULT NULL,
  `divisi_id` varchar(2) DEFAULT NULL,
  `sisa_cuti` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user_akses_menu` */

DROP TABLE IF EXISTS `user_akses_menu`;

CREATE TABLE `user_akses_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user_menu` */

DROP TABLE IF EXISTS `user_menu`;

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user_sub_menu` */

DROP TABLE IF EXISTS `user_sub_menu`;

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `user_token` */

DROP TABLE IF EXISTS `user_token`;

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
