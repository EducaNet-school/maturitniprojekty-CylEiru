-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 15. dub 2023, 19:48
-- Verze serveru: 5.7.17
-- Verze PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `filmcartowhatever`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(70) DEFAULT NULL,
  `last_name` varchar(70) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(400) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Sci-Fi');

-- --------------------------------------------------------

--
-- Struktura tabulky `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `length_minutes` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `movie`
--

INSERT INTO `movie` (`id`, `title`, `description`, `length_minutes`, `release_date`) VALUES
(1, 'Movie 1', 'Movie Description 1', 120, '2022-01-01'),
(2, 'Movie 2', 'Movie Description 2', 90, '2022-02-01'),
(3, 'Movie 3', 'Movie Description 3', 150, '2022-03-01'),
(4, 'Movie 4', 'Movie Description 4', 110, '2022-04-01'),
(5, 'Movie 5', 'Movie Description 5', 95, '2022-05-01');

-- --------------------------------------------------------

--
-- Struktura tabulky `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky `movie_award`
--

CREATE TABLE `movie_award` (
  `movie_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabulky `movie_category`
--

CREATE TABLE `movie_category` (
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Klíče pro tabulku `movie_award`
--
ALTER TABLE `movie_award`
  ADD PRIMARY KEY (`movie_id`,`award_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Klíče pro tabulku `movie_category`
--
ALTER TABLE `movie_category`
  ADD PRIMARY KEY (`movie_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
