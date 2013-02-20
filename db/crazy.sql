-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 22 Janvier 2013 à 18:41
-- Version du serveur: 5.1.44
-- Version de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `crazy`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `descr` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `descr`) VALUES
(1, 'photo', 'tous les APN du monde'),
(2, 'TV/vidéo', 'La télé, la vidéo'),
(4, 'mobilité', 'le numérique mobile'),
(5, 'loisirs', 'les loisirs numériques'),
(3, 'audio', 'produits audio : chaines hifi, sonorisation');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `nom` varchar(128) NOT NULL,
  `marque` varchar(128) DEFAULT NULL,
  `descr` text,
  `photo_path` varchar(128) DEFAULT NULL,
  `code_t` tinyint(4) DEFAULT NULL,
  `id_categ` int(11) DEFAULT '0',
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id`, `ref`, `nom`, `marque`, `descr`, `photo_path`, `code_t`, `id_categ`, `stock`) VALUES
(49, 'HX20V', 'Sony Cyber-shot HX20V', 'sony', 'Le HX20V est un bien bel appareil, complet et performant, qui délivre de belles images pour qui supporte son traitement très poussé. Reste une piste d''amélioration : l''homogénéité de l''objectif, pas meilleure (et ponctuellement moins bonne) que sur le HX10V et certains concurrents.', 'HX20V_200.jpg', 1, 1, 3),
(51, 'EOS-M', 'Canon EOS M', 'canon', 'Canon lance, bon dernier parmi les grandes marques, son premier compact à objectifs interchangeables. Ce nouvel EOS M est donc attendu au tournant : il doit non seulement assurer la qualité habituelle à la marque (l''électronique issue de l''EOS 650D devrait aider), mais aussi pénétrer un marché désormais installé où Sony et les µ4/3 règnent, sans compter sur une distinction technique comme les Nikon 1.', 'canon-eos-m.jpg', 2, 1, 3),
(56, 'nex-6', 'nex6', 'sony', 'null', 'sony-nex-6_1346838983_2.jpg', 2, 1, 3),
(63, 'eos 600D', 'Canon EOS 600 D', 'Canon', 'CANON EOS 600D + EF-S 18-55 mm IS II : S''appuyant sur les acquis techniques du 550D, l''EOS 600D est le nouveau fer de lance des réflex numériques Canon. D''excellente facture optique, le 600D gagne en ergonomie et en confort d''utilisation en s''offrant l''écran articulé du 60D et le pilotage du flash sans fil. Jouissant d''un héritage sans fausse note, le 600D reprend à son compte les principaux atouts de ses prédécesseurs, et c''est là sa force, son intérêt. Une puissante combinaison qui mérite toute notre attention !\r\n\r\nGrâce à une résolution haut de gamme de 18 millions de pixels, à un design convivial et à la compatibilité avec l''intégralité de la gamme EOS d''objectifs et d''accessoires, l''EOS 600D ouvre d''énormes possibilité en créativité photographiques.', 'canon_EOS600D_1.jpeg', 3, 1, 2),
(57, 'ip-m', 'ipad mini', 'apple', 'Doté d''une finition remarquable, d''une bonne réactivité, d''un design à l''avenant et d''une prise en main d''apparence moins pratique que certains concurrents mais finalement intelligemment réfléchie, l''iPad Mini est sur de nombreux points une réussite. Un tableau gâché par l''intégration d''un écran qui ne fait pas mouche, surtout au regard de ce que proposent Google/Asus ou Amazon pour 100 euros de moins. Les possesseurs d''iPad 3 peuvent tout à fait passer leur chemin, quitte à patienter pour un iPad Mini Retina. Les autres devront faire avec un écran qui va à l''encontre de l''évolution produit amorcée par Apple en début d''année.', 'apple-ipad-mini_1351022830.jpg', 1, 4, 6),
(59, 'GN-10.1', 'Galaxy Note 10.1', 'Samsung', 'Plutôt unique dans son genre, la Galaxy Note 10.1 mérite toute votre attention si vous cherchez spécifiquement un outil très mobile pour la retouche, la saisie de notes et l''expression de votre créativité. Parfaite pour un étudiant ou un professionnel du design ayant besoin d''un outil d''appoint, cette ardoise vaut donc surtout pour ses "petits trucs en plus" que sont son stylet et son interaction poussée avec l''utilisateur. Si vous cherchez au contraire une simple tablette 10,1 pouces, on trouve bien moins cher ailleurs (ou chez Samsung) pour une puissance équivalente ou presque. Un produit de niche mais qui l''habite fort bien en somme.', 'note-10-accueil.jpg', 2, 4, 4),
(60, 'TW-6000', 'Video projecteur EH-TW6000W', 'Epson', 'Même si l’image du EH-TW6000W est perfectible, il n’en est pas moins un excellent vidéoprojecteur pour le grand public. C’est l’un des seuls à ne pas nécessiter de réglages. Il suffit de le poser, il s''adaptera automatiquement à la luminosité de pièce.', 'TW6000_page.jpg', 4, 2, 2),
(62, 'A-300', 'PopCorn Hour A-300', 'Syabas', 'Syabas confirme son statut d''acteur sérieux du marché des boîtiers multimédias en signant ici une excellente réalisation et en simplifiant grandement l''utilisation de ses produits. S''il ne s''agit que d''un simple rafraîchissement du précédent modèle, les nouveautés sont appréciables et le jukebox intégré une réelle plus-value.', 'popcorn-A300-354_12002_2.jpg', 1, 2, 4),
(64, 'EOS 5D', 'CANON EOS 5D Mark II', 'Canon', 'Après avoir révolutionné le monde du réflex numérique avec l''EOS 5D, Canon revient avec une nouvelle déclinaison, à la pointe de la technologie photographique.\r\n\r\nGagnant du prix "Meilleur reflex numérique" aux TIPA Awards et du prix du "Meilleur appareil photo reflex" aux EISA 2009-2010, l''EOS 5D Mark II s''avère aussi indispensable pour les photographes de terrain que de studio. Son boîtier robuste, étanche à la poussière et à l''eau, abrite en effet un fabuleux capteur CMOS 24 x 36 mm de 21,1 mégapixels effectifs. Il produit ainsi des images de 5 616 sur 3 744 pixels, et le nouveau processeur DIGIC 4 lui permet d''atteindre des sensibilités de 25 600 ISO. Il peut alors vous accompagner partout et s''affranchir des conditions de prise de vue les plus contraignantes sans effort.\r\n\r\nCANON EOS 5D Mark II + objectif EF 24-105mm f/4L IS USM \r\n\r\nLe confort d''utilisation du 5D Mark II est également renforcé par un grand écran de 7,6 cm de haute résolution à luminosité ajustable et revêtement anti-reflet. Celui-ci offre d''ailleurs un mode Live View et une prise HDMI pour cadrer vos images plus précisément sur un téléviseur.', 'canon_EOS5D_Mark_II.jpg', 4, 1, 1),
(65, 'D600', 'Nikon D600', 'Nikon', 'NIKON D600 + 24-70 + 70-200 - \r\n\r\nPassez à un niveau supérieur avec le D600. \r\nUn capteur plein format dans un boîtier ultra compact, tel est le Nikon D600, un superbe reflex numérique qui apporte une nouvelle dimension à la photographie, pour le plus grand plaisir des amateurs passionnés. \r\n\r\nLe capteur au format FX de 24.3 millions de pixels et le système autofocus à sensibilité élevée permettent des images d''une grande clarté et une acquisition du sujet optimisée, et ce, même dans des conditions d''éclairage difficiles. \r\n\r\nGrâce à la fonction D-Movie en Full HD, vous pouvez créer des vidéos d''une excellente qualité de diffusion. D''autres fonctions, telles que l''intervallomètre et le mode HDR intégré, vous permettent de laisser libre cours à votre créativité. \r\n\r\nCapteur CMOS au format FX (plein format) de 24,3 millions de pixels avec un excellent rapport signal/bruit et une plage dynamique étendue. Permet d''obtenir des images nettes avec des dégradés subtils. \r\n\r\nSystème AF 39 points Multi-CAM4800 avec autofocus ultra-sensible : offre une couverture rapide et précise sur l''ensemble du cadre. Sensibilité jusqu''à -1 IL et compatibilité jusqu''à f/8. \r\n', 'D600.jpg', 4, 1, 1),
(66, 'cx260V', 'camescope HDR-CX260V - noir', 'Sony', 'Le caméscope Handycam HDR-CX260V de Sony enregistre des vidéos en qualité HD sur sa mémoire interne de 16 Go ou sur cartes mémoire SD ou Memory Stick.\r\nSon capteur CMOS de 2,23 mégapixel effectifs en vidéo filme des images en qualité AVCHD jusqu''à 1920 x 1080 pixels. Ce même capteur offre une résolution de 8,9 mégapixels en mode photo.\r\n\r\nPrécis et puissant, le HDR CX260V utilise un zoom optique 30x. Avec un tel indice, vous vous rapprochez au plus près de vos sujets et saissisez les moindres détails. De même, son processeur d''image BIONZ, son programme x.v.Colour et son stabilisateur optique actif améliorent la qualité de vos images vidéo.', 'cx260.jpg', 2, 2, 5),
(67, 'cx740', 'caméscope HDR-CX740V ', 'Sony', 'Le caméscope Handycam HDR-CX740V de Sony enregistre des vidéos en qualité HD sur sa mémoire interne de 32 Go ou sur cartes mémoire SD ou Memory Stick.\r\nSon capteur CMOS de 6,1 mégapixel effectifs en vidéo filme des images en qualité AVCHD jusqu''à 1920 x 1080 pixels. Ce même capteur offre une résolution de 24,1 mégapixels en mode photo.\r\n\r\nPrécis et puissant, le HDR CX740V utilise un zoom optique 10x. Avec un tel indice, vous vous rapprochez au plus près de vos sujets et saissisez les moindres détails. De même, son processeur d''image BIONZ, son programme x.v.Colour et son stabilisateur optique améliorent la qualité de vos images vidéo.\r\n\r\nSONY HDR-CX740V - Caméscope Full HD avec une qualité d''image et une créativité exceptionnelles\r\n\r\nLes plus belles images Full HD\r\n\r\nDes performances à couper le souffle, jusqu''à 13 h d''enregistrement Full HD sur mémoire interne 32 Go, encore plus sur carte mémoire en option. Technologies optiques de pointe et fonctions avancées pour des photos et des vidéos d''une grande netteté pour un contrôle et une créativité sans limites.', 'cx740.jpg', 3, 2, 2),
(68, 'GL 1005', 'GPS Go Live 1005', 'TomTom', 'TomTom - Système de navigation GPS - Ecran tactile 5" - Bluetooth/ USB - Carte du Monde (66 pays)', 'GL1005.jpg', 2, 4, 6),
(69, 'ps3', 'PS3 Noire 12 Go', 'Sony', 'Pack PS3 Noire 12 Go + LittleBigPlanet : Karting\r\n\r\nLe pack qui va vite !', 'ps3.jpg', 2, 5, 6),
(70, 'xbox', 'Xbox 360', 'Microsoft', 'Xbox 360 - console de jeux - 4 Go flash - noir mat - avec Kinect\r\n\r\neux fournis: Kinect Adventures, NIKE+ Kinect Training\r\nMémoire interne: 4 Go flash\r\nType de support: DVD\r\nRéseau: 802.11b/g/n\r\nCouleur: Noir mat\r\n\r\nManette de jeu\r\nType: Manette sans fil pour Xbox 360 - sans fil\r\nCommandes: Gâchette droite, gâchette gauche, bouton RB, bouton LB, deux joysticks analogiques, bouton Précédent, bouton Start, bouton Guide, bouton A, bouton B, pavé directionnel, bouton X, bouton Y\r\n\r\nSortie vidéo\r\nConnexion TV: HDMI, vidéo composante, vidéo composite', 'xbox.jpg', 2, 5, 6),
(71, 'NXT-F', 'Kit Robot Lego NXT', 'Lego', 'Kit Robot Lego NXT \r\nPack Football robotique Lego NXT\r\n\r\nCe pack Football robotique Lego NXT contient :\r\n\r\n1 x Kit robotique Lego Mindstorms NXT\r\n1 x Licence de programmation RobotC\r\n1 x Balle électronique infrarouge\r\n1 x Détecteur de lumière infrarouge\r\nLe principe de fonctionnement est simple : la balle émet de la lumière infrarouge modulée à grâce à ses 20 led infrarouges. Cette lumière infrarouge est détectée par le capteur-détecteur de lumière infrarouge. A partir de là, à vous de jouer et de programmer votre pack Lego robotique afin qu''il suive la balle, court après, dribble, vise et tire !!!!!', 'pack-foot-lego-robotique-2.jpg', 2, 5, 3),
(72, 'AR.D 2.0', 'AR.Drone 2.0', 'Parrot', 'Le drone Parrot AR.Drone 2.0 est la toute dernière évolution du célèbre drone personnel pilotable par smartphone ou tablette tactile. Après avoir rendu les drones personnels accessibles au grand public, la société française Parrot a amélioré son concept ainsi que les technologies embarquées sur l''AR.Drone pour plus de sensations dans son utilisation.', 'parrot-ar-drone-2-0-bleu.jpg', 1, 5, 6),
(73, 'R-Dwin', 'Robot DARwIn-OP ', 'Robotics', 'DARwIn-OP est un robot humanoïde programmable réalisé par la société Robotis bien connue dans le monde de la robotique personnelle. Le robot DARwIn-OP a été créé à la base par l''université américaine de Virginie. Ce robot humanoïde, entièrement open-source, tant au niveau matériel que logiciel est proposé au grand public par Robotis, en collaboration avec le laboratoire Romela (Robotics & Mechanisms Lab) de l''université de Virginie. \r\n\r\nLe robot humanoïde DARwIn-OP est une plate-forme idéale pour l''enseignement et la recherche.', 'robot-darwin.jpg', 5, 5, 1),
(74, 'PA-01', 'peignoir Captain America !', 'geek fashion', 'Glissez-vous dès votre réveil dans la peau de Captain America, le premier des Avengers, avec ce magnifique peignoir Captain America !\r\n\r\nCaractéristiques :\r\n\r\n \r\n\r\n- Peignoir avec ceinture et deux poches\r\n\r\n- Logos Captain America en tissu sur la poitrine et au dos\r\n\r\n- Taille unique : environ 122 cm de long et 134 cm de tour de poitrine\r\n\r\n- Coupe ample\r\n\r\n- Licence officielle Marvel', 'peignoir-captain-america.jpg', 1, 5, 1),
(75, 'PR-01', 'Peignoir R2-D2', 'geek fashion', 'Avec ce peignoir R2-D2, vous pourrez vous mettre de la peau du robot le plus célèbre de la saga Star Wars !\r\n\r\n\r\n\r\nLa capuche du peignoir ressemble à la tête du droïde tandis que son dos imite le blindage de R2-D2. Il y a même le symbole de l''Alliance rebelle qui est brodé sur la poitrine.\r\n\r\n\r\n\r\nLibre à vous quand vous le porterez de faire tous les sifflements que vous voudrez !\r\n', 'peignoir-r2-d2.jpg', 1, 5, 1),
(76, 'DF-109', 'Chaine HIFI DF 109', 'Denon', 'DENON remet une nouvelle fois son ouvrage sur le métier. En apportant de nombreuses nouveautés à l''excellente D-F107, DENON fait de la D-F109 une micro-chaine alliant une qualité sonore exceptionnelle, connectivité étendue et compacité. et avec le lecteur DNP-F109 reliez votre chaine au reste de votre réseau domestique ou Internet.', 'Denon-DF-109.jpg', 3, 3, 2),
(77, 'VT50', 'TV PLASMA 3D VT50 55" ', 'Panasonic', 'Le nec plus ultra des téléviseurs à écrans plats est de retour avec la série VT50. Le téléviseur plasma Panasonic TX-P55VT50E avec sa diagonale de 140 cm redéfinit la qualité d’image. Le processeur « dual core PRO4 Chip » intégré offre une interface intuitive performante et une connectivité de premier ordre (accès internet…).\r\n\r\nUne excellente qualité d’image :\r\nLe téléviseur plasma Panasonic TX-P55VT50E est équipé d’une dalle plasma Full HD Neo PDP infinit black ultra qui profite du traitement d’image 2500Hz FFD (Backlight Scanning) pour des scènes d’action nettes, fluides et détaillées. Le nouveau filtre High Contrast Filter Pro offre des contrastes saisissants et des noirs inégalés.', 'pana-vt50.jpg', 4, 2, 2),
(78, 'HT-S9', 'Home cinéma HT-S9405', 'Onkyo', 'Pour les passionnés qui souhaitent un système home cinema complet et polyvalent, le nouveau HT-S9405THX est un excellent choix. Le HT-S9405THX est certifié "THX Integrated Plus System", assurant des performances de haut vol dans les petits environnements home cinéma. Il est le seul système de la gamme Onkyo à posséder cette certification !\r\nLa fonction réseau de l’ampli du HT-S9405THX permet de gérer l’audio du PC et les radios Internet. Les fichiers audio MP3 sont supportés, ainsi que les formats WMA, WMA Lossless, FLAC, WAV, Ogg Vorbis, AAC, et LPCM. La compatibilité DLNA de l’ampli offre de nouvelles possibilités pour l''intégration d’appareils audio supplémentaires à la maison.', 'HT-S9.jpg', 4, 2, 3),
(79, 'M-CR603', 'Chaine HIFI CR-603', 'Marantz', 'Fidèle à son savoir faire, Marantz nous dévoile avec la M-CR603 sa seconde génération de chaines "Marantz Melodie Music". La grande nouveauté réside dans l’intégration de la fonction passerelle audio UPnP (DLNA) associée au port Ethernet pour accéder aux fichiers stockés sur un ordinateur ou un disque dur Nas. Vous apprécierez sa radio numérique (DAB) et si votre région ne le permet pas, vous pourrez utiliser les radios du Web !\r\n\r\nEnceintes KEF Q300 Noires\r\nLauréate de nombreux prix, la série Q a toujours illustré la conviction de KEF. Toute dernière création de la marque, la nouvelle gamme va vous plonger dans un univers d’images acoustiques en trois dimensions à la richesse et à la clarté jusqu’à présent réservées à des haut-parleurs bien plus onéreux. Dotées d''un son riche, spacieux et précis, Les enceintes KEF Q300, sont équipées d’un ensemble de haut-parleurs de 165 mm Uni-Q et dévoile une image sonore plus précise qui se disperse de manière plus homogène dans toute la pièce.', 'cr603.jpg', 4, 3, 3),
(80, 'DJ-697', 'Pack Sono IBIZA SOUND DJ-697-S', 'IBIZA', 'Pack de sonorisation livré prêt à l’emploi en quelques instants. Dans le flight case régie tout sera parfaitement positionné (éléments à monter dans le flight-case par vos soins). A disposition : un lecteur double CD MP3 avec port USB et lecteur de carte SD pour le Mix analogique et numérique, une magnifique table de mixage laquée noire à 4 voies avec équaliseur et section d’effets spéciaux, un amplificateur musclé de puissance de 2 x 480 W. Les enceintes de 600 W chacune et leurs boomers de 30 cm assurent un son de qualité et des basses percutantes. ', 'DJ-690-S-2-1-v.jpg', 4, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tarifs`
--

CREATE TABLE IF NOT EXISTS `tarifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(32) NOT NULL,
  `tarif_j` decimal(10,0) NOT NULL,
  `tarif_we` decimal(10,0) NOT NULL,
  `tarif_s` decimal(10,0) NOT NULL,
  `descr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `tarifs`
--

INSERT INTO `tarifs` (`id`, `ref`, `tarif_j`, `tarif_we`, `tarif_s`, `descr`) VALUES
(1, 'TS-1', 8, 12, 40, 'tarif 1er prix : apn compact, lecteur CD ...'),
(2, 'TS-2', 11, 18, 56, 'tarif camescope/compact expert/TV small'),
(3, 'TS-3', 15, 25, 75, 'tarif APN reflex et hybride / TV large / consoles '),
(4, 'TS-4', 20, 30, 100, 'tarif video-projecteur, home cinema, APN pro'),
(5, 'TS-5', 100, 180, 500, 'Tarif produits haut de gamme');
