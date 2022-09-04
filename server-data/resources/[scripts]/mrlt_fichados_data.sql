-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table vrp.mrlt_fichados_data
CREATE TABLE IF NOT EXISTS `mrlt_fichados_data` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `dkey` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dvalue` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `datahora` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`did`,`dkey`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table vrp.mrlt_fichados_data: ~3 rows (approximately)
/*!40000 ALTER TABLE `mrlt_fichados_data` DISABLE KEYS */;
INSERT INTO `mrlt_fichados_data` (`did`, `user_id`, `author_id`, `dkey`, `dvalue`, `valor`, `datahora`) VALUES
	(1, 2, 2, 'prisao', 'Foi preso(a) por 15 meses. (Multa = R$ 10000,00) <b>|</b> Motivo: Corrida ilegal', 2.00, '12/01/2022 às 06:36:48'),
	(16, 355, 355, 'multa', 'foi multado(a) em R$ 100,00 por x', 100.00, '14/03/2022 às 10:20:33'),
	(17, 361, 362, 'multa', 'foi multado(a) em R$ 5.000,00 por ma conduta', 5000.00, '14/03/2022 às 22:42:36');
/*!40000 ALTER TABLE `mrlt_fichados_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
