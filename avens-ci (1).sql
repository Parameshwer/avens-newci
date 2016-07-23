-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2016 at 06:39 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avens-ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_cookies`
--

CREATE TABLE `ci_cookies` (
  `id` int(11) NOT NULL,
  `cookie_id` varchar(255) DEFAULT NULL,
  `netid` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `orig_page_requested` varchar(120) DEFAULT NULL,
  `php_session_id` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1382c3565149c2a859073f484a910ab8', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36', 1463205919, '');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(1, 'test'),
(2, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_addres` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `pass_word` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `first_name`, `last_name`, `email_addres`, `user_name`, `pass_word`) VALUES
(5, 'Parameshwer', 'ch', 'parameshwer0515@gmail.com', 'parameshwer', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `description` varchar(40) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `cost_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `description`, `stock`, `cost_price`, `sell_price`, `manufacture_id`) VALUES
(1, 'test', 12, 12, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_journals`
--

CREATE TABLE `wp_journals` (
  `id` int(11) NOT NULL,
  `issn_number` varchar(255) NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `journal_name` varchar(255) NOT NULL,
  `journal_url_slug` text NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `journal_meta_keywords` text NOT NULL,
  `journal_ic_value` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `sidebar_image` varchar(255) NOT NULL,
  `journal_description` text NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_journals`
--

INSERT INTO `wp_journals` (`id`, `issn_number`, `created_date`, `updated_date`, `journal_name`, `journal_url_slug`, `main_category_id`, `journal_meta_keywords`, `journal_ic_value`, `banner_image`, `sidebar_image`, `journal_description`, `deleted`) VALUES
(1, '', '2016-04-20', '2016-04-20', 'Advances in Diabetes & Endocrinology', 'advances-in-diabetes-endocrinology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/glycemic_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/glycemic_sidenav.jpg', '', 1),
(2, '[ISSN: 2380-0569]', '2016-04-20', '2016-04-20', 'International Journal of Otorhinolaryngology', 'international-journal-of-otorhinolaryngology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/otolorynology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/otolorynology_sidenav.jpg', '', 1),
(3, '[ISSN: 2330-2178]', '2016-04-20', '2016-04-20', 'Journal of Addiction & Prevention', 'journal-of-addiction-prevention', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/addiction_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/addiction_sidenav.jpg', '', 1),
(4, '[ISSN: 2332-3442]', '2016-04-20', '2016-04-20', 'Journal of Andrology & Gynaecology', 'journal-of-andrology-gynaecology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/andrology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/andrology_sidenav.jpg', '', 1),
(5, '[ISSN: 2377-9292]', '2016-04-20', '2016-04-20', 'Journal of Cancer Sciences', 'journal-of-cancer-sciences', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/cancerscience_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/cancerscience_sidenav.jpg', '', 1),
(6, '[ISSN: 2332-3671]', '2016-04-20', '2016-04-20', 'Journal of Cardiobiology', 'journal-of-cardiobiology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/cardiology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/cardiology_sidenav1.jpg', '', 1),
(7, '[ISSN: 2332-4120]', '2016-04-20', '2016-04-20', 'Journal of Clinical & Medical Case Reports', 'journal-of-clinical-medical-case-reports', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicalmedical_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicalmedical_sidenav.jpg', '', 1),
(8, '[ISSN: 2373-1044]', '2016-04-20', '2016-04-20', 'Journal of Clinical and Investigative Dermatology', 'journal-of-clinical-and-investigative-dermatology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicalinvest_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicalinvest_sidenav.jpg', '', 1),
(9, '', '2016-04-20', '2016-04-20', 'Journal of Clinical Trials & Patenting', 'journal-of-clinical-trials-patenting', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicaltrails_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/clinicaltrails_sidenav.jpg', '', 1),
(10, '[ISSN: 2469-4045]', '2016-04-20', '2016-04-20', 'Journal of Emergency Medicine & Critical Care', 'journal-of-emergency-medicine-critical-care', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/emergency_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/emergency3_sidenav.jpg', '', 1),
(11, '', '2016-04-20', '2016-04-20', 'Journal of Epidemiology & Health Care', 'journal-of-epidemiology-health-care', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/epedimiology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/epedimiology_sidenav.jpg', '', 1),
(12, '[ISSN: 2330-0396]', '2016-04-20', '2016-04-20', 'Journal of Forensic Investigation', 'journal-of-forensic-investigation', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/forensic_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/forensic_sidenav.jpg', '', 1),
(13, '[ISSN: 2381-3326]', '2016-04-20', '2016-04-20', 'Journal of Gene Therapy', 'journal-of-gene-therapy', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/gene_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/gene_sidenav.jpg', '', 1),
(14, '[ISSN: 2373-1133]', '2016-04-20', '2016-04-20', 'Journal of Geriatrics and Palliative Care', 'journal-of-geriatrics-and-palliative-care', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/gereiatrics_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/geriatrics_sidenav.jpg', '', 1),
(15, '[ISSN: 2380-6842]', '2016-04-20', '2016-04-20', 'Journal of Hematology & Thrombosis', 'journal-of-hematology-thrombosis', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/hemotologyg_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/hemotology_sidenav1.jpg', '', 1),
(16, '', '2016-04-20', '2016-04-20', 'Journal of Human Anatomy & Physiology', 'journal-of-human-anatomy-physiology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/humananatomy_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/humananatomy_sidenav.jpg', '', 1),
(17, '[ISSN: 2378-1343]', '2016-04-20', '2016-04-20', 'Journal of Integrative Medicine & Therapy', 'journal-of-integrative-medicine-therapy', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/integratedmedicine_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/integratedmedicine_sidenav.jpg', '', 1),
(18, '[ISSN: 2332-3469]', '2016-04-20', '2016-04-20', 'Journal of Neurology and Psychology', 'journal-of-neurology-and-psychology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/neurology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/neurology_sidenav.jpg', '', 1),
(19, '[ISSN: 2469-4185]', '2016-04-20', '2016-04-20', 'Journal of Nutrition & Health', 'journal-of-nutrition-health', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/nutrition_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/nutrition_sidenav.jpg', '', 1),
(20, '[ISSN: 2377-9284]', '2016-04-20', '2016-04-20', 'Journal of Obesity and Bariatrics', 'journal-of-obesity-and-bariatrics', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/obesity_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/obesity_sidenav.jpg', '', 1),
(21, '[ISSN: 2334-2838]', '2016-04-20', '2016-04-20', 'Journal of Ocular Biology', 'journal-of-ocular-biology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/ocular_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/ocular_sidenav.jpg', '', 1),
(22, '[ISSN: 2377-987X]', '2016-04-20', '2016-04-20', 'Journal of Oral Biology', 'journal-of-oral-biology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/oralbio_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/oralbio_sidenav.jpg', '', 1),
(23, '[ISSN: 2334-2846]', '2016-04-20', '2016-04-20', 'Journal of Orthopedics & Rheumatology', 'journal-of-orthopedics-rheumatology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/orthopedics_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/orthopedics_sidenav.jpg', '', 1),
(24, '[ISSN: 2376-922X]', '2016-04-20', '2016-04-20', 'Journal of Parkinson’s disease and Alzheimer\\\\\\''s disease', 'journal-of-parkinsons-disease-and-alzheimers-disease', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/parkinsons_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/parkinsons_sidenav.jpg', '', 1),
(25, '[ISSN: 2380-0534]', '2016-04-20', '2016-04-20', 'Journal of Pediatrics & Child Care', 'journal-of-pediatrics-child-care', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/pediatrics_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/pediatrics_sidenav.jpg', '', 1),
(26, '[ISSN: 2332-4139]', '2016-04-20', '2016-04-20', 'Journal of Surgery', 'journal-of-surgery', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/surgery_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/surgery_sidenav.jpg', '', 1),
(27, '[ISSN: 2380-6036]', '2016-04-20', '2016-04-20', 'Journal of Syndromes', 'journal-of-syndromes', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/syndromes_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/syndromes_sidenav.jpg', '', 1),
(28, '[ISSN: 2380-0585]', '2016-04-20', '2016-04-20', 'Journal of Urology & Nephrology', 'journal-of-urology-nephrology', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/urology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/urology_sidenav.jpg', '', 1),
(29, '[ISSN: 2325-4645]', '2016-04-20', '2016-04-20', 'Journal of Veterinary Science & Medicine', 'journal-of-veterinary-science-medicine', 10, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/vet_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/vet_sidenav.jpg', '', 1),
(30, '', '2016-04-20', '2016-04-20', 'Journal of Bioanalysis & Biostatistics', 'journal-of-bioanalysis-biostatistics', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/bioanalysis_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/bioanalysis_sidenav.jpg', '', 1),
(31, '', '2016-04-20', '2016-04-20', 'Journal of Bioelectronics and Nanotechnology', 'journal-of-bioelectronics-and-nanotechnology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/nanotech_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/nanotech_sidenav.jpg', '', 1),
(32, '[ISSN: 2332-4104]', '2016-04-20', '2016-04-20', 'Journal of Food Processing & Beverages', 'journal-of-food-processing-beverages', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/food_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/food_sidenav.jpg', '', 1),
(33, '[ISSN: 2329-1583]', '2016-04-20', '2016-04-20', 'Journal of Metabolomics & Systems Biology', 'journal-of-metabolomics-systems-biology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/metabolamics_banner2.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/metabolomics_sidenav1.jpg', '', 1),
(34, '', '2016-04-20', '2016-04-20', 'Journal of Microbiology & Microbial Technology', 'journal-of-microbiology-microbial-technology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/09/unnamed.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/09/microbiology_sidenav.jpg', '', 1),
(35, '[ISSN: 2325-2340]', '2016-04-20', '2016-04-20', 'Journal of Oncobiomarkers', 'journal-of-oncobiomarkers', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/oncobio_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/oncobio_sidenav.jpg', '', 1),
(36, '', '2016-04-20', '2016-04-20', 'Journal of Proteomics & Computational Biology', 'journal-of-proteomics-computational-biology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/proteomics_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/proteomics_sidenav.jpg', '', 1),
(37, '[ISSN: 2374-9326]', '2016-04-20', '2016-04-20', 'Journal of Transplantation & Stem Cell Biology', 'journal-of-transplantation-stem-cell-biology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/transplantation_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/transplantation_sidenav.jpg', '', 1),
(38, '[ISSN: 2377-6668]', '2016-04-20', '2016-04-20', 'Journal of Vaccine & Immunotechnology', 'journal-of-vaccine-immunotechnology', 20, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/vacccine_banner2.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/vaccine_sidenav.jpg', '', 1),
(39, '', '2016-04-20', '2016-04-20', 'Journal of Biowar & Biodefence', 'journal-of-biowar-biodefence', 30, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/biowar_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/biowar_sidenav.jpg', '', 1),
(40, '[ISSN: 2325-4653]', '2016-04-20', '2016-04-20', 'Journal of Cytology & Molecular Biology', 'journal-of-cytology-molecular-biology', 30, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/cytology_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/cytology_sidenav.jpg', '', 1),
(41, '[ISSN: 2471-4879]', '2016-04-20', '2016-04-20', 'Journal of Environmental Studies', 'journal-of-environmental-studies', 30, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/environmental_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/envyronmental_sidenav.jpg', '', 1),
(42, '[ISSN: 2331-8996]', '2016-04-20', '2016-04-20', 'Journal of Plant Biology & Soil Health', 'journal-of-plant-biology-soil-health', 30, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/plantbio_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/plantbio_sidenav.jpg', '', 1),
(43, '[ISSN: 2328-1723]', '2016-04-20', '2016-04-20', 'Journal of Toxins', 'journal-of-toxins', 30, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/toxic_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/toxic_sidenav.jpg', '', 1),
(44, '', '2016-04-20', '2016-04-20', 'Journal of Analytical & Molecular Techniques', 'journal-of-analytical-molecular-techniques', 40, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/analytical_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/analytical_sidenav.jpg', '', 1),
(45, '[ISSN: 2380-5021]', '2016-04-20', '2016-04-20', 'Journal of Chemistry and Applications', 'journal-of-chemistry-and-applications', 40, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/chemistry_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/chemistry_sidenav.jpg', '', 1),
(46, '[ISSN: 2327-204X]', '2016-04-20', '2016-04-20', 'Journal of Pharmaceutics & Pharmacology', 'journal-of-pharmaceutics-pharmacology', 40, '', '', 'http://www.avensonline.org/wp-content/uploads/2015/05/pharma_banner.jpg', 'http://www.avensonline.org/wp-content/uploads/2015/05/pharma_sidenav.jpg', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_journal_archives`
--

CREATE TABLE `wp_journal_archives` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `archive_desc` text NOT NULL,
  `archive_doi` text NOT NULL,
  `archive_year` int(10) NOT NULL,
  `archive_volume` text NOT NULL,
  `archive_fulltext` text NOT NULL,
  `archive_pdf` text NOT NULL,
  `archive_in` tinyint(4) NOT NULL COMMENT '1 means in Article In Press, 2 means in current issue, 3 means in archive',
  `journal_slug` text NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 means not deleted, 0 means deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_journal_archives`
--

INSERT INTO `wp_journal_archives` (`id`, `journal_id`, `category_id`, `archive_desc`, `archive_doi`, `archive_year`, `archive_volume`, `archive_fulltext`, `archive_pdf`, `archive_in`, `journal_slug`, `created_date`, `updated_date`, `deleted`) VALUES
(1, 1, 10, '<ul>\n<li><a href=\\\\\\"http://www.avensonline.org/wp-content/uploads/ADE-01-0001.pdf\\\\\\" target=\\\\\\"_blank\\\\\\">Diagnostic Value of Serum Adenosine Deaminase in Type II Saudi Diabetic Patients</a></li>\n</ul>\n<p><strong>Authors:</strong> Mohammed A. Al-Duais, Mohamed I. Sakran, Kamal A. Shalaby, Salem A. Habib and Abeer A. Khamis</p>ssss', '', 0, 'volume-1-issue-1', 'http://www.avensonline.org/fulltextarticles/ADE-01-0001.html', 'http://www.avensonline.org/wp-content/uploads/ADE-01-0001.pdf', 1, 'advances-in-diabetes-endocrinology', '2016-04-27', '2016-04-27', 1),
(2, 1, 10, '<a href=\\"http://www.avensonline.org/wp-content/uploads/ADE-01-0002.pdf\\" target=\\"_blank\\">Erk5 and P38 Kinase are Positive Regulators of Insulin and Tnf? – Stimulated Vcam-1 Expression in Rat Aorta Endothelial Cells</a>\r\n<p><strong>Authors:</strong> Gregory B. Pott, Mark Tsurudome, Jamie Bui and Marc L. Goalstone</p>', '', 0, 'volume-1-issue-1', 'http://www.avensonline.org/fulltextarticles/ADE-01-0002.html', 'http://www.avensonline.org/wp-content/uploads/ADE-01-0002.pdf', 1, 'advances-in-diabetes-endocrinology', '2016-04-27', '2016-04-27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_journal_main_categories`
--

CREATE TABLE `wp_journal_main_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 means not deleted, 0 means deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_journal_main_categories`
--

INSERT INTO `wp_journal_main_categories` (`category_id`, `category_name`, `created_date`, `updated_date`, `deleted`) VALUES
(10, 'Medical', '2016-04-17', '2016-04-17', 1),
(20, 'Biotechnolgy', '2016-04-17', '2016-04-17', 1),
(30, 'Pharmaseutical', '2016-04-17', '2016-04-17', 1),
(40, 'Biology', '2016-04-17', '2016-04-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_journal_posts`
--

CREATE TABLE `wp_journal_posts` (
  `id` int(11) NOT NULL,
  `post_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `post_slug` text NOT NULL,
  `journal_slug` text NOT NULL,
  `post_content` text NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wp_journal_posts`
--

INSERT INTO `wp_journal_posts` (`id`, `post_name`, `category_id`, `journal_id`, `post_slug`, `journal_slug`, `post_content`, `created_date`, `updated_date`, `deleted`) VALUES
(1, 'Home', 10, 1, 'home', 'advances-in-diabetes-endocrinology', 'Advances in Diabetes &amp; Endocrinology is an international Open Access peer-reviewed scientific publication encompassing the concepts related to diabetes and endocrinology. The journal is dedicated to provide recent advances and developments including the study of metabolism, endocrine glands, its secretions and related disorders, symptoms, causes, pathophysiology, diagnosis, treatment and prevention of diabetes.', '2016-04-27', '2016-04-27', 1),
(2, 'Aims & Scope', 10, 1, 'aims-scope', 'advances-in-diabetes-endocrinology', 'Advances in Diabetes & Endocrinology is an international Open Access peer-reviewed scientific publication encompassing the concepts related to diabetes and endocrinology. The journal is dedicated to provide recent advances and developments including the study of metabolism, endocrine glands, its secretions and related disorders, symptoms, causes, pathophysiology, diagnosis, treatment and prevention of diabetes.\r\n\r\nTopics covered in this Journal include, but are not limited to:\r\n\r\nMetabolic Disorders and Studies\r\nHormonal disorders and metabolic pathways\r\nRisk Assessment and Preventions\r\nAdvanced Molecular Studies and Results\r\nObesity and pituitary diseases\r\nEndocrine glands and its secretions\r\nMenstrual and sexual problems\r\nHypertension and lipid disorders\r\nCase Reports\r\n', '2016-04-27', '2016-04-27', 1),
(3, 'Editorial Board', 10, 1, 'editorial-board', 'advances-in-diabetes-endocrinology', '<div id=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"post-content\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n<h1><img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-3057\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/distefano.jpg.jpeg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /></h1>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<strong>Dr. DiStefano</strong> is a Senior Investigator &amp; Director of the Diabetes, Cardiovascular and Metabolic Diseases (DCM) Division at Translational Genomics Research Institute in Phoenix, Arizona. Her research focuses on the molecular mechanisms underlying susceptibility to complex metabolic diseases including obesity, renal complications of type 2 diabetes, diabetic dyslipidemia, and non alcoholic fatty liver disease.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-3226\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/edit1.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Barry I. Posner</strong> is a Professor in the Departments of Medicine &amp; Cell Biology, Director of the Polypeptide Hormone Laboratory at McGill University .His research led to the discovery of novel insulin target tissues including the brain and vascular endothelial cells, discovery of the endosomal system and its central role in signal transduction &amp; identification of genes responsible for type 2 diabetes.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-10130\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/Bin-Xu-pic-2.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Bin Xu</strong> is an Assistant Professor in the Department of Biochemistry at Virginia Polytechnic Institute and State University, USA. His current research focuses on biochemical, structural, molecular, and cellular studies on receptor-hormone binding, cell signaling, novel receptor discovery and ligand design that are relevant to diabetes, obesity, and inflammation.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-1730\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/Simon.png\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Simón Méndez-Ferrer</strong>, PhD, Universidad de Sevilla. His work characterized properties of carotid body of potential interest for neuroregenerative strategies based on biological delivery of catecholamines &amp; neurotrophic factors. He used nestin expression as a marker to identify self-renewing mesenchymal stem cells &amp; determined their crucial role in hematopoietic stem cell niche.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-1918\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/Reshma.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Reshma Ramracheya</strong> is a Diabetes UK RD Lawrence Research Fellowbased at the University of Oxford and the aim of her research is to investigate the mechanism by which GLP-1 inhibits glucagon secretion in human islets, characterise a novel receptor for GLP-1 and establish its tissue distribution and dissect the downstream signalling pathways involved.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-2625\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/doliba.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Nicolai M. Doliba</strong> is a Research Assistant Professor of Biochemistry and Biophysics at Translational Research Center, Perelman school of medicine, University of Pennsylvania. His research focuses on the role of bioenergetics, ion transport and metabolic coupling factors in nutrient- and drug-stimulated insulin release by pancreatic beta-cells at normal conditions and during diabetes mellitus.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-2652\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/H-Wu.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Hongju Wu</strong> received her Ph.D training in the University of Alabama at Birmingham. She is currently an Associate Professor in Department of Medicine, Endocrinology section in Tulane University, New Orleans. Her research is related to diabetes with a focus on islet cell biology, alpha and beta cell regeneration\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-3526\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/anisha-pic.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Guo Cai Huang</strong> is an senior lecturer in Department of Diabetes &amp; Endocrinology, the Rayne Institute, King’s College London. His research interest include improving human islet isolation to achieve more graftable human islets, enhancing transplanted islet survival by nanoencapsulation &amp; improving islet cell revascularisation, by preserving endothelial cells/cotransplant islet cells with endothelial cells.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"><img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-3579\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/Johan-W.-Jonker.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /><strong>Dr. Johan W. Jonker</strong> is an Associate Professor in the Department of Pediatrics, Center of Liver, Digestive and Metabolic Diseases, University Medical Center Groningen, The Netherlands. His current research focuses on the regulation of energy metabolism by the nuclear receptor family and to explore their therapeutic value in treating metabolic diseases.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-3327\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/biswa.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Biswa p. Choudhury </strong>is the Technical Director for Glycotechnology Research and Training Center, California. His research interest focuses on analysis of glycan architecture from cell or tissues from higher organisms &amp; pathogenic bacteria &amp; understanding the structure-function relationship of glycan and its impact on health and disease.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n\r\n<img class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"alignleft size-full wp-image-19325\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" title=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/wp-content/uploads/2012/09/Akankasha-Tiwari-pic.jpg\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" width=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" height=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" />\r\n\r\n<strong>Dr. Akankasha Tiwari</strong> is faculty in the Division of Endocrinology at Albert Einstein College of Medicine, New York. Her research focuses on understanding the multi-organ pathogenesis of type 2 diabetes mellitus, particularly malnutrition modulated diabetes mellitus and elucidating the effects of vitamin D repletion on insulin resistance and systemic inflammation.\r\n\r\n</div>\r\n<div class=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"eb-box\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"></div>\r\n</div>', '2016-04-27', '2016-04-27', 1),
(4, 'Instructions to Author', 10, 1, 'instructions-to-author', 'advances-in-diabetes-endocrinology', '<div id=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"post-content\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">\r\n<p>Advances in Diabetes &amp; Endocrinology (ADE) provides the rapid quarterly publication of articles in all areas related to Diabetic problems. ADE receives manuscripts that meet the general criteria of significance and scientific excellence. Articles accepted by Editors will be published immediately. All the published articles will be instantly available Open Access at Articles in Press until that Issue is released i.e approximately biannual.</p>\r\n<p>Submit manuscript at <a href=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"http://www.avensonline.org/submit-manuscript\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\">http://www.avensonline.org/submit-manuscript/</a></p>\r\n<p>(OR)</p>\r\n<p></p>\r\n<p>Submit manuscripts as an e-mail attachment to the Editorial Office at <a href=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"mailto:editor.ade@avenspublishers.com\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"> editor.ade@avenspublishers.com</a></p>\r\n<p></p>\r\n<p>A manuscript number will be e-mailed to the corresponding author within 72 hours.</p>\r\n<p></p>\r\n<p><strong>Avens Publishers Policy Regarding the NIH Mandate</strong></p>\r\n<p></p>\r\n<p>Avens Publishers will support authors by posting the published version of articles by NIH grant-holders to PubMed Central immediately after publication.</p>\r\n<p></p>\r\n<p><strong>Submission of an Article</strong></p>\r\n<p></p>\r\n<p>Submitted articles should have a summary/abstract, separate from the main text, of up to 300 words.<br>\r\nThis summary does not include references, numbers, abbreviations or measurements unless essential.<br>\r\nThe summary should provide a basic-level introduction to the field; a brief account of the background and principle of the work; a statement of the main conclusions; and 2-3 sentences that place the main findings into a general context. The text may contain a few short subheadings of not more than 40 characters each.\r\n</p>\r\n<p></p>\r\n<p><strong>Formats for Avens Publishers contributions: Avens Publishers accepts the following:</strong></p>\r\n<p>– Research Articles</p>\r\n<p>– Reviews Articles</p>\r\n<p>– Abstracts</p>\r\n<p>– Article Commentaries</p>\r\n<p>– Book Reviews</p>\r\n<p>– Rapid Communications</p>\r\n<p>– Letters to the Editor</p>\r\n<p>– Case Reports</p>\r\n<p>– Meeting Reports</p>\r\n<p>– Orations</p>\r\n<p>– Product Reviews</p>\r\n<p>– Hypotheses and Analyses.</p>\r\n<p></p>\r\n<p><strong>Manuscript Preparation Guidelines</strong></p>\r\n<p></p>\r\n<p><strong>Manuscripts should be divided into the following sections:</strong></p>\r\n<p>All submissions should be accompanied by a 500 word or less cover letter briefly stating the significance of the research, agreement of authors for publication, number of figures and tables, supporting manuscripts, and supplementary information.</p>\r\n<p>Also, include current telephone and fax numbers, as well as postal and E-mail address of corresponding author to maintain communication.</p>\r\n<p></p>\r\n<p><strong>Manuscript title</strong></p>\r\n<p>The title should be limited to 25 words or less and should not contain abbreviations. The title should be a brief phrase describing the contents of the paper.</p>\r\n<p></p>\r\n<p><strong>Author Information</strong></p>\r\n<p>Complete names and affiliation of all authors, including contact details of corresponding author (Telephone, Fax and E-mail address).</p>\r\n<p></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Abstract should be informative and completely self-explanatory, briefly present the topic, state the scope of the experiments, indicate significant data, and point out major findings and conclusions. The abstract should summarize the manuscript content in 300 words or less accommodating a description of the study background, methods, results and conclusion. Following the abstract, a list of keywords (3-10) and abbreviations should be included.</p>\r\n<p></p>\r\n<p><strong>Introduction</strong></p>\r\n<p>The introduction should set the tone of the paper by providing a clear statement of the study, the relevant literature on the study subject, and the proposed approach or solution. </p>\r\n<p></p>\r\n<p><strong>Materials and Methods</strong></p>\r\n<p>This section should provide a complete overview of the design of the study. Detailed descriptions of materials or participants, comparisons, interventions and types of analysis should be mentioned. However, only new procedures should be described in detail; previously published procedures should be cited, and important modifications of published procedures should be mentioned briefly. Capitalize trade names and include the manufacturer’s name and address.</p>\r\n<p></p>\r\n<p><strong>Results</strong></p>\r\n<p>The Results section should provide complete details of the experiment that are required to support the conclusion of the study. The results should be written in the past tense when describing findings in the authors’ experiments. Previously published findings should be written in the present tense. Results and Discussion may be combined or in a separate section.</p>\r\n<p></p>\r\n<p><strong>Acknowledgements</strong></p>\r\n<p>This section includes acknowledgment of people, grant details, funds, etc.</p>\r\n<p><strong>Note:</strong> If an author fails to submit his/her work as per the above instructions, they are pleased to maintain clear titles namely headings, subheading.</p>\r\n<p></p>\r\n<p><strong>References</strong></p>\r\n<p>Only published or accepted manuscripts should be included in the reference list. Meetings abstracts, conference talks, or papers that have been submitted but not yet accepted should not be cited. </p>\r\n<p></p>\r\n<p>Avens uses the numbered citation (citation-sequence) method. References are listed and numbered in the order that they appear in the text. In the text, citations should be indicated by the reference number in brackets. Multiple citations within a single set of brackets should be separated by commas. Where there are three or more sequential citations, they should be given as a range. Example: “… now enable biologists to simultaneously monitor the expression of thousands of genes in a single experiment [1,5-7,28].” </p>\r\n<p></p>\r\n<p>Authors are requested to provide at least one online link for each reference (preferably PubMed) as all references will be linked electronically as much as possible to the papers they cite. Please use the following style for the reference list:</p>\r\n<p><strong>Examples:</strong></p>\r\n<p><strong>Published Papers</strong></p>\r\n<p></p>\r\n<p>1. Laemmli UK (1970) Cleavage of structural proteins during the assembly of the head of bacteriophage T4. Nature 227: 680-685.</p>\r\n<p>2. Brusic V, Rudy G, Honeyman G, Hammer J, Harrison L (1998) Prediction of MHC class II-binding peptides using an evolutionary algorithm and artificial neural network. Bioinformatics 14: 121-130.</p>\r\n<p>3. Doroshenko V, Airich L, Vitushkina M, Kolokolova A, Livshits V, et al. (2007) YddG from Escherichia coli promotes export of aromatic amino acids. FEMS Microbiol Lett 275: 312-318.</p>\r\n<p></p>\r\n<p><strong>Note:</strong> Please list the first five authors and then add “et al.” if there are additional authors.</p>\r\n<p><strong>Books</strong></p>\r\n<p>1. Baggot JD (1999) Principles of drug disposition in domestic animals: The basis of Veterinary Clinical Pharmacology. (1stedn), W.B. Saunders company, Philadelphia, London, Toranto.</p>\r\n<p>2. Zhang Z (2006) Bioinformatics tools for differential analysis of proteomic expression profiling data from clinical samples. Taylor &amp; Francis CRC Press.</p>\r\n<p><strong>Conference</strong></p>\r\n<p>Hofmann T (1999) The Cluster-Abstraction Model: unsupervised learning of topic hierarchies from text data. Proceedings of the International Joint Conference on Artificial Intelligence.</p>\r\n<p><strong>Tables</strong></p>\r\n<p>These should be used at a minimum and designed as simple as possible. We strongly encourage author to submit tables as .doc format. Tables should be self-explanatory without reference to the text. Note: If the submission is in PDF format, the author is requested to retain the same in .doc format in order to aid in completion of process successfully.</p>\r\n<p><strong>Figures</strong></p>\r\n<p>The preferred file formats for photographic images are PNG, TIFF and JPEG.</p>\r\n<p>Use Arabic numerals to designate figures and upper case letters for their parts (Figure 1). Begin each legend with a title and include sufficient description so that the figure is understandable without reading the text of the manuscript. Information given in legends should not be repeated in the text.</p>\r\n<p><strong>Equations</strong></p>\r\n<p>Equations should be encoded in MathML format.</p>\r\n<p><strong>Supplementary Information</strong></p>\r\n<p>Discrete items of the Supplementary Information (for example, figures, tables) referred to at an appropriate point in the main text of the paper.</p>\r\n<p>Summary diagram/figure included as part of the Supplementary Information (optional).</p>\r\n<p>All Supplementary Information is supplied as a single PDF file, where possible. File size within the permitted limits for Supplementary Information. </p>\r\n<p><strong>Galley Proofs</strong></p>\r\n<p>Electronic proofs will be sent as an e-mail attachment to the corresponding author as a PDF file. Page proofs are considered to be the final version of the manuscript. With the exception of typographical or minor clerical errors, no changes will be made in the manuscript at the proof stage. </p>\r\n</div>', '2016-04-27', '2016-04-27', 1),
(5, 'Manuscript Work Flow', 10, 1, 'manuscript-work-flow', 'advances-in-diabetes-endocrinology', 'Once a manuscript is submitted, it is assigned to one of our Eminent Editorial Board members to check the genuinity, novelty and quality of research. The manuscript is evaluated by the respective editor within two days of submission. If the manuscript meets the standards of Avens, further proceeding of the manuscript is carried out. The status of acceptance/rejection will be intimated by the editorial office.\r\n\r\nThe accepted manuscripts are peer reviewed by the experts assigned by the editor. The time for peer review processing is 14 days. The comments given by the reviewer decides the fate of article towards the possible publication. If at least two reviewers support and ensure the quality and recommend for the publication, the article is processed and published without any changes with editor’s approval.\r\n\r\nIf the reviewer suggest for the revision (minor/major) the corresponding author will be notified to make the desirable changes in the manuscript towards publication.\r\n\r\nThe manuscript will be rejected if more than two reviewers express their disapproval towards the publication. However the editor approval is mandatory for the publication at any stage. Avens is committed to its 21 day rapid publication process.', '2016-04-27', '2016-04-27', 1),
(6, 'dsdsd', 20, 2, '', '', 'dddd', '2016-04-18', '2016-04-18', 0),
(7, 'Home', 10, 2, 'home', 'international-journal-of-otorhinolaryngology', '<div id=\\\\\\"post-content\\\\\\">\r\n<p>International Journal of Otorhinolaryngology is an international, Open Access peer-reviewed scientific publication embraces with clinical and experimental advances related to otolaryngology-head and neck surgery and its sub-specialties.</p>\r\n<p><font size=\\\\\\"3\\\\\\" color=\\\\\\"#CC5200\\\\\\"><strong>Indexed in: </strong></font></p>\r\n<li><a href=\\\\\\"http://journalseek.net/cgi-bin/journalseek/journalsearch.cgi?field=issn&amp;query=2380-0569\\\\\\" target=\\\\\\"_blank\\\\\\">Genamics JournalSeek</a></li>\r\n<li><a href=\\\\\\"http://jgateplus.com/search/footer-html/PublisherPartners.jsp\\\\\\" target=\\\\\\"_blank\\\\\\">J-Gate</a></li>\r\n<li><a href=\\\\\\"http://www.worldcat.org/title/international-journal-of-otorhinolaryngology/oclc/913744053&amp;referer=brief_results\\\\\\" target=\\\\\\"_blank\\\\\\">WorldCat</a></li>\r\n<li><a href=\\\\\\"http://www.sherpa.ac.uk/romeo/journals.php?la=en&amp;fIDnum=|&amp;mode=simple&amp;id=2458&amp;letter=ALL\\\\\\" target=\\\\\\"_blank\\\\\\">Sherpa/Romeo</a></li>\r\n<li><a href=\\\\\\"https://scholar.google.co.in/scholar?hl=en&amp;q=avensonline.org&amp;btnG= \\\\\\" target=\\\\\\"_blank\\\\\\">Google Scholar</a></li>\r\n<li><a href=\\\\\\"http://www.academickeys.com/\\\\\\" target=\\\\\\"_blank\\\\\\">AcademicKeys</a></li>\r\n<li><a href=\\\\\\"http://jandc.pubshub.com/Home\\\\\\" target=\\\\\\"_blank\\\\\\">PubsHub</a></li>\r\n<li><a href=\\\\\\"http://www.drji.org/BrowseAllJournals.aspx\\\\\\" target=\\\\\\"_blank\\\\\\">Directory of Research Journals Indexing</a></li>\r\n<li><a href=\\\\\\"http://miar.ub.edu/\\\\\\" target=\\\\\\"_blank\\\\\\">MIAR</a></li>\r\n							</div>', '2016-04-27', '2016-04-27', 1),
(8, 'Aims & Scope', 10, 2, 'aims-scope', 'international-journal-of-otorhinolaryngology', 'International Journal of Otorhinolaryngology is an international, Open access peer-reviewed scientific publication embraces with clinical and experimental advances related to otolaryngology-head and neck surgery and its sub-specialties.\r\n\r\nThe Journal covers the following fields, but not confined to:\r\n\r\nOtology/Neurotology\r\nRhinology\r\nHead & Neck Surgery\r\nLaryngology\r\nPlastic & Reconstructive Surgery\r\nHead & Neck Oncology\r\nPediatric and Geriatric Otolaryngology', '2016-04-27', '2016-04-27', 1),
(9, 'Editorial Board', 10, 2, 'editorial-board', 'international-journal-of-otorhinolaryngology', '<div id=\\\\\\"post-content\\\\\\"> \r\n				<div class=\\\\\\"eb-box\\\\\\"><img class=\\\\\\"alignleft size-full wp-image-10592\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/2.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"><strong>Dr. Rayleigh Ping-Ying Chiang</strong> is a Director, Sleep Technology SIG (Special Interest Group), INSIGHT (Innovation and Synergy for Intelligent Home and Living Technology) Center, National Taiwan University, Taiwan. His research interests include Upper Airway Resistance Syndrome, sleepy driver near misses may predict accident risks.</div>\r\n<div class=\\\\\\"eb-box\\\\\\"><img class=\\\\\\"alignleft size-full wp-image-13310\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/DSC3032-1.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"><strong>Dr. S. Mark Taylor</strong> is a Deputy Head &amp; Professor of Otolaryngology-Head &amp; Neck Surgery at Dalhousie University, Canada. His research interest includes subspecialty areas of Head &amp; Neck Oncologic Surgery, Facial Plastic &amp; Reconstructive Surgery.</div>\r\n<div class=\\\\\\"eb-box\\\\\\"><img class=\\\\\\"alignleft size-full wp-image-13310\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/vural-image.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"><br>\r\n<strong>Dr. Vural Fidan</strong> is a Deputy Director of Otorhinolaryngology, Department at Emre Government Hospital, Eskisehir, Turkey. His research focusses on otology, rhinology and sleep medicine. He has attended sleep training at TUTDER. Had published more than 20 articles which were published in SCI indexed journals.</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-16073\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/IMG_2688.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Jianhua Qiu</strong> is a Professor, Chief Physician at Xijing Hospital, the Fourth Military University, China. His research focuses on Otorhinolaryngology head and neck surgery, auditory implant, air cells injury and regeneration, cochlea stem cells.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-10581\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/My-photo-2.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. P. Satyanarayana Murthy</strong> is a Professor and HOD of ENT and Head &amp; Neck Surgery at Pinnamaneni Siddhartha Institute of Medical Sciences and Research Center, India. Research interests include Head and Neck Surgery, Endoscopic Sinus Surgery, Micro ear and Laryngeal Surgery, Rehabilitation of Head and Neck Cancer Patients, Rehabilitation of Hearing Impaired.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-16076\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/lueers_jan-christoffer_8089web.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Jan Christoffer Lüers</strong> is an Associate Professor of Otolaryngology, Head and Neck Surgery at the Department Of Otolaryngology, University of Cologne, Germany. Clinical and research focus on otology, ear surgery, salivary gland surgery (including sial endoscopy) and benign and malignant tumors of the head and neck.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-13355\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/bitar.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Mohamad A. Bitar</strong> is an Associate Professor of Otolaryngology at American University of Beirut School of Medicine. Involved in research &amp; teaching field, has published many studies pertaining to his subspecialty &amp; also participated in several national, regional and international meetings, workshops.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-12840\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/Lin-J-2-inch.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Jizhen Lin </strong>is an Associate Professor at the Department of Otolaryngology at University of Minnesota, USA. He has been engaged in otitis media research for years and established rat &amp; mouse middle ear epithelial cell lines for the otological research community.\r\n</p></div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-13316\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/jonathan.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. John E. Nathan</strong> is an Associate Professor of Clinical Otolaryngology, Department of Otolaryngology, Northwestern University. Research focuses on Child Behavioral Research involving both non-pharmacotherapeutic &amp; pharmacotherapeutic management of challenging child behavior in dental setting.\r\n</p></div>\r\n<div class=\\\\\\"eb-box\\\\\\"><img class=\\\\\\"alignleft size-full wp-image-9194\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/David-livingston.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"><br>\r\n<strong>Dr. David Livingstone Alves Figueiredo</strong> is an Associate Professor at UNICENTRO-University of Midwest-Brazil. His research interests include Molecular Biology of cancer, Thyroid, Larynx, Skin Cancer, craniomaxillofacial surgery.</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-13698\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/Leem-Ted-02-2x3-Color.jpeg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Ted H. Leem</strong> is an Assistant Professor at the University of Colorado School of Medicine, USA. Research interests include the outcomes of a minimally invasive head and neck surgery and targeted therapies in head and neck oncology.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-13343\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/Abbas-Younes-Pic.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Abbas A.Younes</strong> is an Assistant Professor in the Department of Otolaryngology-Head &amp; Neck Surgery at the University of Kentucky, USA. His research interests include Pediatric Airway &amp; obstructive sleep apnea management, in addition to Hearing loss in children.\r\n</p></div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-9522\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/Oren.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Liran Oren</strong> is an Assistant Professor in the Department of Otolaryngology at the University of Cincinnati, USA. His research interest is based on biomechanics, aeroelasticity, and aeroacoustics mechanisms in the vocal folds. Validation of CFD models used in modeling of Obstructive Sleep Apnea in Down Syndrome.\r\n</p></div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-9526\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/NJ-Photo1.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"101\\\\\\"></p>\r\n<p><strong>Dr. Nausheen Jamal</strong> is an Assistant Professor in the Department of Otolaryngology at Temple University’s School of Medicine in Philadelphia, USA. Her research interest includes Dysphagia, Laryngeal reinnervation, Spasmodic dysphonia, Vocal fold paralysis and paresis, Vocal nodules, polyps, cysts, Swallowing disorders, Airway disorders, Trans-oral laser microsurgery.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-10586\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/binoy_chandy-2.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Binoy Chandy</strong> is an Assistant Professor at Texas Children’s Hospital, Baylor College of Medicine, USA. He is also the fellowship director for the pediatric otolaryngology fellowship. His research interests are along the lines of pediatric nasal deformities and speech disorders.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-10590\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/jatanak-2.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong>Dr. Kris R. Jatana</strong> is an Assistant Professor in the Department of Otolaryngology-Head and Neck Surgery at The Ohio State University, USA. His research interests include complications of pediatric sinusitis, neonatal nasal CPAP use, tracheostomy care, benign &amp; malignant neoplasms of the head &amp; neck, cancer genetics, circulating tumor cells &amp; mechanisms of cancer metastasis.</p>\r\n</div>\r\n<div class=\\\\\\"eb-box\\\\\\"><img class=\\\\\\"alignleft size-full wp-image-16305\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/image2.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"><p></p>\r\n<p><strong>Dr. Seiji Nakagawa</strong> has been a Chief Senior Research Scientist at Advanced Industrial Science and Technology (AIST), Japan. He also serves as an Adjoint Professor at Nara Medical University and Kansai University. His current research interests are in the imaging of auditory function in humans and developments of medical and welfare equipments.</p></div>\r\n<div class=\\\\\\"eb-box\\\\\\">\r\n<p><img class=\\\\\\"alignleft size-full wp-image-9285\\\\\\" title=\\\\\\"\\\\\\" src=\\\\\\"http://www.avensonline.org/wp-content/uploads/2013/11/YubingDai.jpg\\\\\\" alt=\\\\\\"\\\\\\" width=\\\\\\"100\\\\\\" height=\\\\\\"100\\\\\\"></p>\r\n<p><strong> Dr. Yubing Dai</strong> is a Researcher at Center of Nuclear Receptors and Cell Signaling, University of Houston. He is also a Clinical surgeon of Otolaryngology-Head &amp; Neck. His research interest includes inflammation and nuclear receptor, Obstructive sleep apnea/hyponea syndrome, head and neck cancer.</p>\r\n</div>\r\n							</div>', '2016-04-27', '2016-04-27', 1),
(10, 'Instructions for Authors', 10, 2, 'instructions-for-authors', 'international-journal-of-otorhinolaryngology', '<div id=\\\\\\"post-content\\\\\\">\r\n<p>International Journal of Otorhinolaryngology  (JOT) provides biannual publication of articles in all areas related to Otorhinolaryngology. JOT receives manuscripts that meet the general criteria of significance and scientific excellence. Prior to publication, articles that are in press will be available in open access format at <a href=\\\\\\"http://www.avensonline.org/medical/international-journal-of-otorhinolaryngology/articles-in-press-33/\\\\\\">http://www.avensonline.org/medical/international-journal-of-otorhinolaryngology/articles-in-press-33/</a></p>\r\n<p>Submit manuscript online at <a href=\\\\\\"http://www.avensonline.org/submit-manuscript\\\\\\">www.avensonline.org/submit-manuscript/</a></p>\r\n<p>(OR)</p>\r\n<p></p>\r\n<p>Submit manuscripts as an e-mail attachment to the Editorial Office at <a href=\\\\\\"mailto:editor.jot@avensonline.org\\\\\\"> editor.jot@avensonline.org</a></p>\r\n<p></p>\r\n<p>A manuscript number will be e-mailed to the corresponding author within 72 hours.</p>\r\n<p></p>\r\n<p><strong>Avens Publishers Policy Regarding the NIH Mandate</strong></p>\r\n<p></p>\r\n<p>Avens Publishers will support authors by posting the published version of articles by NIH grant-holders to PubMed Central immediately after publication.</p>\r\n<p></p>\r\n<p><strong>Submission of an Article</strong></p>\r\n<p></p>\r\n<p>Submitted articles should have a summary/abstract, separate from the main text, of up to 300 words.<br>\r\nThis summary does not include references, numbers, abbreviations or measurements unless essential.<br>\r\nThe summary should provide a basic-level introduction to the field; a brief account of the background and principle of the work; a statement of the main conclusions; and 2-3 sentences that place the main findings into a general context. The text may contain a few short subheadings of not more than 40 characters each.\r\n</p>\r\n<p></p>\r\n<p><strong>Formats for Avens Publishers contributions: Avens Publishers accepts the following:</strong></p>\r\n<p>– Research Articles</p>\r\n<p>– Reviews Articles</p>\r\n<p>– Abstracts</p>\r\n<p>– Article Commentaries</p>\r\n<p>– Book Reviews</p>\r\n<p>– Rapid Communications</p>\r\n<p>– Letters to the Editor</p>\r\n<p>– Case Reports</p>\r\n<p>– Meeting Reports</p>\r\n<p>– Orations</p>\r\n<p>– Product Reviews</p>\r\n<p>– Hypotheses and Analyses.</p>\r\n<p></p>\r\n<p><strong>Manuscript Preparation Guidelines</strong></p>\r\n<p></p>\r\n<p><strong>Manuscripts should be divided into the following sections:</strong></p>\r\n<p>All submissions should be accompanied by a 500 words or less cover letter briefly stating the significance of the research, agreement of authors for publication, number of figures and tables, supporting manuscripts, and supporting files.</p>\r\n<p>Also, include current telephone and fax numbers, as well as postal and E-mail address of corresponding author to maintain communication.</p>\r\n<p></p>\r\n<p><strong>Manuscript title</strong></p>\r\n<p>The title should be limited to 25 words or less and should not contain abbreviations. The title should be a brief phrase describing the contents of the paper.</p>\r\n<p></p>\r\n<p><strong>Author Information</strong></p>\r\n<p>Complete names and affiliation of all authors, including contact details of corresponding author (Telephone, Fax and E-mail address).</p>\r\n<p></p>\r\n<p><strong>Abstract</strong></p>\r\n<p>The Abstract should be informative and completely self-explanatory, briefly present the topic, state the scope of the experiments, indicate significant data, and point out major findings and conclusions. The abstract should summarize the manuscript content in 300 words or less accommodating a description of the study background, methods, results and conclusion. Following the abstract, a list of keywords (3-10) and abbreviations should be included.</p>\r\n<p></p>\r\n<p><strong>Introduction</strong></p>\r\n<p>The introduction should set the tone of the paper by providing a clear statement of the study, the relevant literature on the study subject, and the proposed approach or solution. </p>\r\n<p></p>\r\n<p><strong>Materials and Methods</strong></p>\r\n<p>This section should provide a complete overview of the design of the study. Detailed descriptions of materials or participants, comparisons, interventions and types of analysis should be mentioned. However, only new procedures should be described in detail; previously published procedures should be cited, and important modifications of published procedures should be mentioned briefly. Capitalize trade names and include the manufacturer’s name and address.</p>\r\n<p></p>\r\n<p><strong>Results</strong></p>\r\n<p>The Results section should provide complete details of the experiment that are required to support the conclusion of the study. The results should be written in the past tense when describing findings in the authors’ experiments. Previously published findings should be written in the present tense. Results and Discussion may be combined or in a separate section.</p>\r\n<p></p>\r\n<p><strong>Acknowledgements</strong></p>\r\n<p>This section includes acknowledgment of people, grant details, funds, etc.</p>\r\n<p><strong>Note:</strong> If an author fails to submit his/her work as per the above instructions, they are pleased to maintain clear titles namely headings, subheading.</p>\r\n<p></p>\r\n<p><strong>References</strong></p>\r\n<p>Only published or accepted manuscripts should be included in the reference list. Meetings abstracts, conference talks, or papers that have been submitted but not yet accepted should not be cited. </p>\r\n<p></p>\r\n<p>Avens uses the numbered citation (citation-sequence) method. References are listed and numbered in the order that they appear in the text. In the text, citations should be indicated by the reference number in brackets. Multiple citations within a single set of brackets should be separated by commas. Where there are three or more sequential citations, they should be given as a range. Example: “… now enable biologists to simultaneously monitor the expression of thousands of genes in a single experiment [1,5-7,28].” </p>\r\n<p></p>\r\n<p>Authors are requested to provide at least one online link for each reference (preferably PubMed) as all references will be linked electronically as much as possible to the papers they cite. Please use the following style for the reference list:</p>\r\n<p><strong>Examples:</strong></p>\r\n<p><strong>Published Papers</strong></p>\r\n<p></p>\r\n<p>1. Laemmli UK (1970) Cleavage of structural proteins during the assembly of the head of bacteriophage T4. Nature 227: 680-685.</p>\r\n<p>2. Brusic V, Rudy G, Honeyman G, Hammer J, Harrison L (1998) Prediction of MHC class II-binding peptides using an evolutionary algorithm and artificial neural network. Bioinformatics 14: 121-130.</p>\r\n<p>3. Doroshenko V, Airich L, Vitushkina M, Kolokolova A, Livshits V, et al. (2007) YddG from <em>Escherichia coli</em> promotes export of aromatic amino acids. FEMS Microbiol Lett 275: 312-318.</p>\r\n<p></p>\r\n<p><strong>Note:</strong> Please list the first five authors and then add “et al.” if there are additional authors.</p>\r\n<p><strong>Books</strong></p>\r\n<p>1. Baggot JD (1999) Principles of drug disposition in domestic animals: The basis of Veterinary Clinical Pharmacology. (1stedn), W.B. Saunders company, Philadelphia, London, Toranto.</p>\r\n<p>2. Zhang Z (2006) Bioinformatics tools for differential analysis of proteomic expression profiling data from clinical samples. Taylor &amp; Francis CRC Press.</p>\r\n<p><strong>Conference</strong></p>\r\n<p>Hofmann T (1999) The Cluster-Abstraction Model: unsupervised learning of topic hierarchies from text data. Proceedings of the International Joint Conference on Artificial Intelligence.</p>\r\n<p><strong>Tables</strong></p>\r\n<p>These should be used at a minimum and designed as simple as possible. We strongly encourage authors to submit tables as .doc format. Tables should be self-explanatory without reference to the text. Note: If the submission is in PDF format, the author is requested to retain the same in .doc format in order to aid in completion of process successfully.</p>\r\n<p><strong>Figures</strong></p>\r\n<p>The preferred file formats for photographic images are PNG, TIFF and JPEG.</p>\r\n<p>Use Arabic numerals to designate figures and upper case letters for their parts (Figure 1). Begin each legend with a title and include sufficient description so that the figure is understandable without reading the text of the manuscript. Information given in legends should not be repeated in the text.</p>\r\n<p><strong>Equations</strong></p>\r\n<p>Equations should be encoded in MathML format.</p>\r\n<p><strong>Supplementary Information</strong></p>\r\n<p>Discrete items of the Supplementary Information (for example, figures, tables) referred to an appropriate point in the main text of the paper.</p>\r\n<p>Summary diagram/figure included as part of the Supplementary Information (optional).</p>\r\n<p>All Supplementary Information is supplied as a single PDF file, wherever applicable. File size within the permitted limits for Supplementary Information. </p>\r\n<p><strong>Galley Proofs</strong></p>\r\n<p>Electronic proofs will be sent as an e-mail attachment to the corresponding author as a PDF file. Page proofs are considered to be the final version of the manuscript. With the exception of typographical or minor clerical errors, no changes will be made in the manuscript at the proof stage. </p>\r\n							</div>', '2016-04-27', '2016-04-27', 1),
(11, 'Manuscript Work Flow', 10, 2, 'manuscript-work-flow', 'international-journal-of-otorhinolaryngology', 'Once a manuscript is submitted, it is assigned to one of our Eminent Editorial Board members to check the Genuinity, novelty and quality of research. The manuscript is evaluated by the respective editor with in two days of submission. If the manuscript meets the standards of Avens, further proceeding of the manuscript is carried out. The status of acceptance/rejection will be intimated by the editorial office.\r\n\r\nThe accepted manuscripts are peer reviewed by the experts assigned by the editor. The time for peer review processing is 14 days. The comments given by the reviewer decides the fate of article towards the possible publication. If at least two reviewers support and ensure the quality and recommend for the publication, the article is processed and published without any changes with editor’s approval.\r\n\r\nIf the reviewer suggest for the revision (minor/major) the corresponding author will be notified to make the desirable changes in the manuscript towards publication.\r\n\r\nThe manuscript will be rejected if more than two reviewers express their disapproval towards the publication. However, the editor approval is mandatory for the publication at any stage. Avens is committed to its 45 to 60 days publication process.', '2016-04-27', '2016-04-27', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_journals`
--
ALTER TABLE `wp_journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_journal_archives`
--
ALTER TABLE `wp_journal_archives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_journal_main_categories`
--
ALTER TABLE `wp_journal_main_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `wp_journal_posts`
--
ALTER TABLE `wp_journal_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_journals`
--
ALTER TABLE `wp_journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `wp_journal_archives`
--
ALTER TABLE `wp_journal_archives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_journal_main_categories`
--
ALTER TABLE `wp_journal_main_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `wp_journal_posts`
--
ALTER TABLE `wp_journal_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
