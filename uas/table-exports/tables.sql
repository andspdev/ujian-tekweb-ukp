CREATE TABLE IF NOT EXISTS `user` (
    `id` int NOT NULL AUTO_INCREMENT,
    `username` varchar(30) NOT NULL,
    `password` varchar(255) NOT NULL,
    `nama_admin` varchar(20) NOT NULL,
    `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) Engine=InnoDB CHARSET=utf8mb4 AUTO_INCREMENT=1;


CREATE TABLE IF NOT EXISTS `pengiriman` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nomor_resi` varchar(50) NOT NULL UNIQUE,
    `tanggal_resi` date NOT NULL,
    `jenis_pengiriman` tinyint(1) NOT NULL,
    PRIMARY KEY (`id`)
) Engine=InnoDB CHARSET=utf8mb4 AUTO_INCREMENT=1;



CREATE TABLE IF NOT EXISTS `pengiriman_detail` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nomor_resi` varchar(50) NOT NULL,
    `tanggal` date NOT NULL,
    `kota` varchar(50) NOT NULL,
    `keterangan` varchar(250) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`nomor_resi`)
        REFERENCES `pengiriman` (`nomor_resi`)
) Engine=InnoDB CHARSET=utf8mb4 AUTO_INCREMENT=1;


