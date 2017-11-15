-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Kas 2017, 09:07:41
-- Sunucu sürümü: 10.1.21-MariaDB
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `youtubedb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `singers`
--

CREATE TABLE `singers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `bio` text CHARACTER SET latin1 NOT NULL,
  `title` varchar(256) CHARACTER SET latin1 NOT NULL,
  `pic_url` varchar(200) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs ROW_FORMAT=COMPACT;

--
-- Tablo döküm verisi `singers`
--

INSERT INTO `singers` (`id`, `name`, `bio`, `title`, `pic_url`) VALUES
(1, 'Dua Lipa', 'Dua Lipa is an English singer, songwriter and model. Her musical career began at age 16, when she began covering songs by other artists on YouTube. In 2015, she was signed with Warner Music Group, and released her first single soon after. In December 2016, a documentary about Lipa was commissioned by The Fader magazine, titled See in Blue. In January 2017, she won the EBBA Public Choice Award. Her self-titled debut studio album was released on 2 June 2017. The album spawned seven singles, including the top-10 single \"Be the One\" and the number-one single \"New Rules\".', 'Singer', 'https://yt3.ggpht.com/-vooj0sSKm7Q/AAAAAAAAAAI/AAAAAAAAAAA/yTOMHizhaHQ/s288-c-k-no-mo-rj-c0xffffff/photo.jpg'),
(2, 'Martin Garrix', 'Martijn Gerard Garritsen (born 14 May 1996), known professionally Martin Garrix (stylized as Mar+in Garri×), is a Dutch DJ, record producer and musician. He is ranked number 1 on DJ Mag\'s Top 100 DJs list for 2016 and 2017. In 2016, he founded the label STMPD RCRDS months after leaving Spinnin\' Records, before signing with Sony Music. In 2017, he was announced as a resident DJ at Hï Ibiza.', 'DJ', 'https://yt3.ggpht.com/-KRv6BJdFwk8/AAAAAAAAAAI/AAAAAAAAAAA/pQpuy_-RPhE/s288-c-k-no-mo-rj-c0xffffff/photo.jpg'),
(3, 'Evrencan Gündüz', '16 Ya??nda müzisyenli?e ba?layan Evrencan Gündüz, o y?l içerisinde arkada?lar?yla T-Blues isimli bir grup kurarak festivallerde ve konserlerde yer ald?. \r\n\r\n17 ya??nda tesadüf eseri Be?ikta? vapurunda müzik yapan bir müzisyenle tan??t?. Dönü? vapurunda ayn? müzisyenle tekrar kar??la?an ve müzi?ine Evrencan’? davet eden Ate? ile ilk kez vapur müzisyenli?i deneyimini ya?ad?. Tüm yaz boyunca vapur müzisyenli?ine devam ederken, Kad?köy sokaklar?nda da müzik yapmaya devam etti. \r\n\r\nRock’n Purple’da en iyi solist ve rock kategorisinde en iyi grup ödülü, Dont Let Me Down (Beatles) parças?nda kemençeyi parçada kullanarak, en de?i?ik enstrüman ödülüyle toplamda 3 ödül kazanm??t?r. \r\n\r\nEkim 2017\'de ilk EP\'si Evrencan ve Uzayl?lar? yay?nlam??t?r.  Müzik hayat?na devam eden Evrencan, gelecekte Dünya’n?n en iyi Blues müzisyenlerinden biri olma hayalini gerçekle?tirmek için çal???yor.', 'Singer', 'https://yt3.ggpht.com/-zrN0QrMJBdk/AAAAAAAAAAI/AAAAAAAAAAA/iwUncpdWG3U/s288-c-k-no-mo-rj-c0xffffff/photo.jpg'),
(4, 'Bishop Briggs', 'Sarah Grace McLaughlin, known by her stage name Bishop Briggs, is a British musician based in Los Angeles, California. She is best known for her single \"River\".\r\nThis channel was generated automatically by YouTube\'s video discovery system.', 'Singer', 'https://yt3.ggpht.com/nSiM0-GV3yKJQSW0BmbLmSKQJNSwUYpevhSY0wHvxtc105ZZhjcaQSbbKThmceIlwc6FQDvqv0l-bGbVaA=s288-nd-c-c0xffffffff-rj-k-no');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`) VALUES
(1, 'serhan@zeo.org', '123123', 'serhan'),
(2, 'halay@zeo.org', 'halay', 'halay');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `videos`
--

CREATE TABLE `videos` (
  `vid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `embedData` varchar(256) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `videos`
--

INSERT INTO `videos` (`vid`, `oid`, `embedData`, `date`) VALUES
(1, 1, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/GzU8KqOY8YA\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-09-11'),
(2, 1, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/k2qgadSvNyU\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-09-05'),
(3, 2, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/ScNsBpQ8KIg?ecver=2\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-11-05'),
(4, 2, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/Exdt3upYpqA\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-07-10'),
(5, 3, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qbCAwVB3Dq8\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-11-01'),
(6, 4, '<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/Pa8bn1-Er4E\" frameborder=\"0\" gesture=\"media\" allowfullscreen></iframe>', '2017-07-18');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `singers`
--
ALTER TABLE `singers`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`vid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `singers`
--
ALTER TABLE `singers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Tablo için AUTO_INCREMENT değeri `videos`
--
ALTER TABLE `videos`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
