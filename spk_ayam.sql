-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 07:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_ayam`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `gejala`) VALUES
(1, 'terasa berminyak beberapa jam setelah mencuci muka\r\n'),
(2, 'terlihat sering mengkilap, terutama di area dahi dan hidung (zona T)'),
(3, 'terasa kering atau tertarik setelah mencuci muka\r\n'),
(4, 'sering mengalami pengelupasan'),
(5, 'mudah berminyak saat cuaca panas'),
(6, 'memiliki pori-pori yang besar terutama di area hidung dan pipi dekat hidung'),
(7, 'sering mengalami jerawat atau komedo\r\n'),
(8, 'terasa lembap dan nyaman sepanjang hari tanpa produk tambahan\r\n'),
(9, 'terasa iritasi, kemerahan, atau perih saat mencoba produk skincare baru\r\n'),
(10, 'lebih sering terlihat kusam daripada bersinar alami?\r\n'),
(11, 'terasa berminyak hanya di bagian tertentu, sementara bagian lain terasa kering'),
(12, 'terasa berminyak saat bangun tidur\r\n'),
(13, 'memerlukan pelembap setiap hari agar kulit tidak terasa kaku atau tertarik\r\n'),
(14, 'mudah mengalami iritasi saat mencoba produk baru\r\n'),
(15, 'terlihat kusam meskipun sudah dibersihkan dan diberi pelembap'),
(16, 'terasa berubah-ubah (terkadang kering, terkadang berminyak) tergantung cuaca atau hormon\r\n'),
(17, 'terlihat halus dan tidak tampak pori-pori yang besar'),
(18, 'perlu menggunakan dua jenis produk skincare untuk bagian wajah yang berbeda'),
(19, 'kesulitan menemukan satu produk yang cocok untuk seluruh wajahmu\r\n'),
(20, 'memerlukan produk dengan label “oil control” atau “matte” setiap hari\r\n'),
(21, 'sering terlihat “patchy” atau tidak rata saat menggunakan make up\r\n'),
(22, 'terasa kusam jika tidak melakukan cuci muka lebih dari satu kali\r\n'),
(23, 'terasa tidak nyaman jika tidak memakai produk berbahan hydrating\r\n'),
(24, 'sering terasa gatal atau perih setelah mencuci muka tanpa pelembap\r\n'),
(25, 'sering terasa sulit untuk memakai produk skincare yang cocok karena kondisi kulitmu tidak konsisten\r'),
(26, 'jarang mengalami reaksi negatif saat mencoba produk skincare baru\r\n'),
(27, 'membutuhkan produk dengan kandungan Hyaluronic Acid\r\n'),
(28, 'membutuhkan produk dengan kandungan Salicylic Acid'),
(29, 'terasa normal dan tidak terlalu berminyak atau kering di seluruh area wajah\r\n'),
(30, 'merasa kering terutama setelah terkena air panas atau cuaca dingin\r\n'),
(31, 'lebih mudah berjerawat saat stres atau cuaca panas\r\n'),
(32, 'mengalami  minyak berlebih sehingga perlu menggunakan tisu minyak sepanjang hari'),
(33, 'terasa sangat berminyak pada hari-hari tertentu dan sangat kering pada hari lainnya\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `penyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `penyakit`) VALUES
(1, 'Kulit Normal\r\n'),
(2, 'Kulit Kering\r\n'),
(3, 'Kulit Berminyak'),
(4, 'Kulit Kombinasi\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_gejala` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_gejala`, `id_penyakit`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 2, 4),
(7, 3, 3),
(8, 6, 3),
(9, 7, 3),
(10, 8, 1),
(11, 9, 2),
(12, 10, 3),
(13, 6, 4),
(14, 11, 4),
(15, 12, 3),
(16, 15, 3),
(17, 16, 4),
(18, 17, 1),
(19, 18, 4),
(20, 19, 4),
(21, 20, 3),
(22, 21, 2),
(23, 22, 3),
(24, 23, 2),
(25, 24, 2),
(26, 22, 4),
(27, 24, 4),
(28, 25, 4),
(29, 26, 1),
(30, 27, 2),
(31, 28, 3),
(32, 29, 1),
(33, 30, 2),
(34, 27, 4),
(35, 28, 4),
(36, 30, 4),
(37, 31, 3),
(38, 32, 3),
(39, 33, 4);

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `solusi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_penyakit`, `deskripsi`, `solusi`) VALUES
(1, 1, 'Kondisi kulit yang seimbang, yaitu tidak terlalu berminyak dan tidak terlalu kering. Tekstur kulit ini terasa halus, lembut, pori-pori tampak kecil, dan jarang mengalami masalah kulit seperti jerawat atau iritasi.\r\n', 'Bersihkan wajah dua kali sehari (pagi dan malam) dengan facial wash yang lembut dan tidak mengandung'),
(2, 2, 'Kondisi kulit yang kekurangan kelembapan alami (sebum) sehingga terasa kasar, kaku, atau mengelupas. Kulit ini sering terasa gatal atau tampak kusam, terutama setelah mencuci muka atau terkena udara dingin. Pori-pori cenderung kecil dan jarang berjerawat,', 'Gunakan cleanser lembut tanpa alkohol dan bebas sabun yang bisa mengeringkan kulit.\r\n\r\nAplikasikan t'),
(3, 3, 'Kondisi kulit yang memproduksi sebum (minyak alami) secara berlebih, terutama di area wajah seperti dahi, hidung, dan dagu (zona T). Akibatnya, kulit tampak mengkilap, licin, dan rentan berjerawat karena pori-pori mudah tersumbat. Pori-pori cenderung besa', 'Gunakan pembersih wajah (cleanser) yang mengontrol minyak tapi tetap menjaga kelembapan (hindari yan'),
(4, 4, 'Kondisi kulit yang memiliki dua kondisi berbeda dalam satu wajah—biasanya berminyak di zona T (dahi, hidung, dagu) dan kering atau normal di area pipi. Jenis kulit ini bisa berjerawat di area berminyak, tapi juga terasa kering dan sensitif di area lain, j', 'Gunakan pembersih wajah ringan yang bisa membersihkan minyak tanpa membuat area kering jadi makin ke');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `nama`, `email`, `alamat`, `tgl_lahir`, `password`) VALUES
(1, 0, 'admin', 'admin@gmail.com', 'globaladmin', '2002-11-13', '$2y$10$613SNaOJ54XMnxLe2tyOj.enn1v4xgzJQlIHZ86.YA25GEVwggTAa'),
(11, 1, 'ara', 'ara13@gmail.com', 'Tangerang', '2000-10-13', '$2y$10$613SNaOJ54XMnxLe2tyOj.enn1v4xgzJQlIHZ86.YA25GEVwggTAa'),
(12, 1, 'sundari', 'sunndrwidia57@gmail.com', 'suka jadi', '2005-07-05', '$2y$10$PtaXHJ.kRZ84jEd9GdNa8.IaYP2YWZ7MSkCrsVkjkg7SJuzZC2L3C'),
(13, 1, 'sundari', 'sunndrwidia57@gmail.com', 'suka jadi', '2005-07-05', '$2y$10$lP7wsw233VW49A7bajTxlOGshl/gNNB62QQbGqGnir.3DrDPAWNlu'),
(14, 1, 'sundari', 'sunndrwidia57@gmail.com', 'suka jadi', '2005-07-05', '$2y$10$IE88io0IpIV2zcqQqHp1nu8ztgFeNoxLizeC2YPZRFgWxye6uK0ea'),
(15, 1, 'sundari', 'sunndrwidia57@gmail.com', 'suka jadi', '2005-07-05', '$2y$10$.jCHexAnOmfczsNJd9ytiONh2tWkhZMERCWlZP32FBsxkbX/UR1Gy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`),
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);

--
-- Constraints for table `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
