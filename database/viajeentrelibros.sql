-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: us-cdbr-east-04.cleardb.com    Database: heroku_849b96c415420e5
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(45) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'adminPrincipal','v2001.ferman@gmail.com','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Romance',5),(15,'Aventura',5),(25,'Fantas??a',5),(35,'Terror',5);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlight`
--

DROP TABLE IF EXISTS `highlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlight` (
  `idhighlight` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) NOT NULL,
  `texto` varchar(3000) NOT NULL,
  `notas` varchar(200) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idhighlight`),
  KEY `idUsuariox_idx` (`idUsuario`),
  CONSTRAINT `idUsuarioh` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight`
--

LOCK TABLES `highlight` WRITE;
/*!40000 ALTER TABLE `highlight` DISABLE KEYS */;
INSERT INTO `highlight` VALUES (5,'Los 7 h??bitos de la gente altamente efectiva','Comenzar con un fin en mente','Primer h??bito',5),(15,'Los 7 h??bitos de la gente altamente efectiva','Poner primero lo primero','Segundo h??bito',5),(25,'Los 7 h??bitos de la gente altamente efectiva','Los 7 h??bitos no son un conjunto de partes independientes o f??rmulas fragmentadas','Conclusion del libro',5);
/*!40000 ALTER TABLE `highlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libreria`
--

DROP TABLE IF EXISTS `libreria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libreria` (
  `idlibreria` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) NOT NULL,
  `sinopsis` varchar(155) NOT NULL,
  `recomendacion` varchar(155) NOT NULL,
  `informacionDelAutor` varchar(155) NOT NULL,
  `contenido` varchar(3000) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idResumen` int(11) NOT NULL,
  PRIMARY KEY (`idlibreria`),
  KEY `idCategoria_idx` (`idCategoria`),
  KEY `idResumen_idx` (`idResumen`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idCategoriax` FOREIGN KEY (`idCategoria`) REFERENCES `resumen` (`idCategoria`),
  CONSTRAINT `idResumenx` FOREIGN KEY (`idResumen`) REFERENCES `resumen` (`id`),
  CONSTRAINT `idUsuariox` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libreria`
--

LOCK TABLES `libreria` WRITE;
/*!40000 ALTER TABLE `libreria` DISABLE KEYS */;
INSERT INTO `libreria` VALUES (75,'Los 7 h??bitos de la gente altamente efectiva','Nuestro car??cter est?? compuesto por h??bitos que son factores poderosos en nuestras vidas. Estos son pautas consistentes que crean efectividad.','Para todos aquellos en busca de crecimiento personal','Stephen Richards Covey fue un licenciado en administraci??n de empresas, escritor, conferenciante, religioso y profesor estadounidense.','Los 7 h??bitos de la gente altamente efectiva son los siguientes:\r\nEl h??bito de la proactividad nos da la libertad para poder escoger nuestra respuesta a los est??mulos del medioambiente. Nos faculta para responder de acuerdo con nuestros principios y valores. En esencia, es lo que nos hace humanos y nos permite afirmar que somos los arquitectos de nuestro propio destino.\r\nComenzar con un fin en mente hace posible que nuestra vida tenga raz??n de ser, pues la creaci??n de una visi??n de lo que queremos lograr permite que nuestras acciones est??n dirigidas a lo que verdaderamente es significativo en nuestras vidas.\r\nPoner primero lo primero nos permite liberarnos de la tiran??a de lo urgente para dedicar tiempo a las actividades que en verdad dan sentido a nuestras vidas. Es la disciplina de llevar a cabo lo importante, lo cual nos permite convertir en realidad la visi??n que forjamos en el h??bito 2.\r\nPensar en Ganar-Ganar nos permite desarrollar una mentalidad de abundancia material y espiritual, pues nos cuestiona la premisa de que la vida es un ???juego de suma cero??? donde para que yo gane alguien tiene que perder.\r\nBuscar entender primero y ser entendido despu??s es la esencia del respeto a los dem??s. La necesidad que tenemos de ser entendidos es uno de los sentimientos m??s intensos de todos los seres humanos. Este h??bito es la clave de las relaciones humanas efectivas y posibilita llegar a acuerdos de tipo Ganar-Ganar.\r\nSinergizar es el resultado de cultivar la habilidad y la actitud de valorar la diversidad. La s??ntesis de ideas divergentes produce ideas mejores y superiores a las ideas individuales. El logro del trabajo en equipo y la innovaci??n son el resultado de este h??bito.\r\nAfilar la sierra es usar la capacidad que tenemos para renovarnos f??sica, mental y espiritualmente. Es lo que nos permite establecer un equilibrio entre todas las dimensiones de nuestro ser, a fin de ser efectivos en los diferentes papeles (roles) que desempe??amos en nuestras vidas.\r\nLos 7 h??bitos no son un conjunto de partes independientes o f??rmulas fragmentadas. En armon??a con las leyes naturales del crecimiento, proporcionan un enfoque gradual, secuencial y altamente integrado del desarrollo de la efectividad personal e interpersonal.',5,15,5),(85,'Yo antes de ti','Will Traynor es un empresario exitoso que queda tetrapl??jico luego de un accidente de moto. Tras perder su empleo, Louisa es contratada por los padres del ','Para todos aquellos amantes del romance y la tragedia.','Paulie Sarah Jo Moyes, mejor conocida como Joj?? Moyes, es una periodista y escritora londinense, nacida en el a??o 1969.','La vida cambia de golpe\r\nEs el a??o 2007. Will Traynor se ha vestido para salir con su moto, pero debido a la lluvia decide tomar un taxi. Con el apuro para alcanzarlo, corre y se produce un accidente que lo deja cuadrapl??jico. Apenas tiene movilidad muy limitada en las extremidades superiores.\r\n\r\nWill hab??a sido hasta ese momento un empresario rico, joven, atractivo y aventurero. Le gustaba ir en moto, practicar deportes que le llenaban de adrenalina, como el submarinismo, por ejemplo. El accidente se lleva su movilidad y tambi??n sus ganas de vivir.\r\n\r\nEn 2009, Louisa Clark se queda desempleada. Tiene 26 a??os y no es particularmente ambiciosa. Su hermana es m??s joven, madre soltera, pero tambi??n est?? m??s preparada y ha tenido m??s ??xito, econ??micamente. Viven con sus padres y la noticia del trabajo perdido no ayuda en absoluto. No obstante, en un centro de empleo consiguen una opci??n para ella: cuidar a un hombre que va en silla de ruedas.\r\n\r\nTiempo para un intento\r\nLouisa obtiene el empleo. La madre de Will, Camilla Traynor, no solo busca a alguien que cuide de su hijo, sino tambi??n a una persona que le ayude a recuperar la alegr??a. La mansi??n Traynor tampoco es un ejemplo perfecto, precisamente, ya que el matrimonio est?? pasando por un mal momento: el padre de Will tiene una aventura.\r\n\r\nCuando Louisa se da cuenta de que Will tiene cicatrices en las mu??ecas, comprende mejor su misi??n. Will ha intentado suicidarse. Ahora manifiesta su deseo de practicarse la eutanasia en Suiza, pa??s en el que es posible realizar ese procedimiento, al que llaman ???morir con dignidad???.\r\n\r\nLa se??ora Camilla y otros familiares consiguen negociar con Will un per??odo de seis meses antes de que se vaya a Suiza; durante ese tiempo esperan poder convencerlo de reconsiderar su decisi??n. Louisa se entera de las intenciones de Will al escuchar, accidentalmente, una conversaci??n familiar-\r\n\r\nEntonces se dedica a buscar la manera de que Will abandone la idea. Le corta el cabello y le afeita la barba, detalles que ??l hab??a descuidado durante largo tiempo. Lo saca de paseo y lo llena de est??mulos, para hacer su d??a a d??a agradable y lleno de sorpresas.\r\n\r\nSin embargo, esto no es suficiente para Will. Por lo tanto, poco antes de que se cumpla el tiempo se??alado, Louisa renuncia. La se??ora Traynor la convence para que vuelva y entonces planifican un viaje a la Isla Mauricio, con el fin de alejarlo definitivamente de la idea del suicidio.\r\n\r\nLa noche antes de regresar, se besan. Louisa le confiesa que lo ama e intenta convencerlo de ser felices juntos. Sin embargo, ??l se muestra inflexible. No quiere vivir as??.\r\n\r\nLa generosidad de Will\r\nDurante el tiempo en que interact??an como paciente y asistente, Will nota que, debido a su condici??n econ??mica y su timidez, el mundo de Louisa es bastante limitado. Sus perspectivas de crecimiento son muy estrechas y apenas ha salido nunca de la ciudad. Ella es opuesta a lo que ??l hab??a sido.\r\n\r\nFinalmente, antes de su viaje a Suiza, Louisa y Will ',15,5,25),(95,'Lazarillo de Tormes','Esta novela gira en torno a L??zaro, un ni??o ingenuo que, debido a las adversidades que vive, se convierte en un joven p??caro que lucha por sobrevivir.','Para aquellos en busca de un historia de superaci??n y amor propio. Adem??s de ser un cl??sico de la literatura espa??ola.','Este considerado an??nimo. Sin embargo, Mercedes Agull?? present?? un trabajo donde defend??a que el autor del Lazarillo es Diego Hurtado de Mendoza.','Sus padres fueron encarcelados por varios cr??menes. L??zaro, al verse hu??rfano, busc?? la compa????a de alg??n amo y se hizo mozo de un ciego pero no dur?? mucho tiempo con ??l . El ciego ganaba mucho dinero, pero a ??l no le daba nada de comer y lo ten??a muerto de hambre . As?? que lo dej?? y fue a buscar otro. \r\nUn d??a, que iba mendigando, se encontr?? a un cl??rigo que le pregunt?? que si buscaba amo . L??zaro le dijo que s?? . El cl??rigo ten??a un arca y en el arca ten??a la comida: pan , agua , arroz ??? L??zaro aprovech?? que lleg?? a su casa un calderero y pidi?? la llave el arca para coger cosas para comer . Como el arca era vieja y ten??a agujeros el cl??rigo pens?? que eran los ratones los que mordisqueaban el pan. Cierto d??a, el cl??rigo se dio cuenta y le dijo que no se merec??a un criado tan listo. Lo ech?? y le dijo que buscara amo. \r\nL??zaro tuvo suerte de llegar a la gran ciudad de Toledo, pues all?? encontr?? de nuevo un amo. Este fue un escudero. El escudero ten??a pinta de ser muy rico pero era pobre . Al escudero le persegu??a la justicia porque no pagaba sus deudas . Y L??zaro no quiso estar con ??l. \r\nUnas mujeres que cuidaban a L??zaro le dijeron que se fuera con un fraile amigo de ellas. Pero L??zaro solo dur?? ocho d??as con ??l pues andaba mucho y a ??l no le gustaba andar. \r\nA los pocos d??as sirvi?? a un buldero. El buldero ten??a mucha experiencia para mentir y siempre , siempre se estaba peleando con un alguacil . Estuvo cuatro a??os con ??l pero como era muy mentiroso L??zaro decidi?? dejarlo. \r\nUn d??a que entr?? en la catedral uno de sus capellanes decidi?? contratarlo. Le hizo cargo de un burro, cuatro c??ntaros y un l??tigo y empez?? a vender agua por el pueblo. Y cuando reuni?? el dinero suficiente, se compr?? ropa nueva y dej?? al capell??n. \r\nDespu??s de esto sirvi?? a un alguacil con el que no dur?? mucho y tiempo porque ten??a un oficio muy peligroso. Un d??a unos delincuentes cogieron al alguacil y lo maltrataron, pero a L??zaro no lo pillaron . Y L??zaro sigui?? buscando amo. \r\nL??zaro consigui?? por ??ltimo un oficio real. Y a los pocos d??as un cura lo cas?? con una de sus criadas y le alquil?? una casa al lado de la suya. Vivieron felices.',5,15,55);
/*!40000 ALTER TABLE `libreria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idperfil`),
  KEY `iduserx_idx` (`iduser`),
  CONSTRAINT `iduserx` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (5,'Jason',19,'El Salvador',15),(45,'Lola',20,'Guatemala',5);
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `idrequest` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(45) NOT NULL,
  `User_email` varchar(45) NOT NULL,
  `Book_name` varchar(45) NOT NULL,
  `Book_year` int(11) NOT NULL,
  `Book_author` varchar(45) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`idrequest`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (5,'testUser','bal@bal.com','Harry Potter',1999,'J. K. Rowling','Muy buen libro'),(15,'Ver??nica Ferm??n','v@gmail.com','El arte de ser un desastre',2016,'Jennifer McCartney','Muy buen libro ');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumen`
--

DROP TABLE IF EXISTS `resumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) NOT NULL,
  `sinopsis` varchar(155) NOT NULL,
  `recomendaci??n` varchar(155) NOT NULL,
  `informacionDelAutor` varchar(155) NOT NULL,
  `contenido` varchar(3000) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria_idx` (`idCategoria`),
  KEY `idUsuarios_idx` (`idUsuario`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categories` (`id`),
  CONSTRAINT `idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumen`
--

LOCK TABLES `resumen` WRITE;
/*!40000 ALTER TABLE `resumen` DISABLE KEYS */;
INSERT INTO `resumen` VALUES (5,'Los 7 h??bitos de la gente altamente efectiva','Nuestro car??cter est?? compuesto por h??bitos que son factores poderosos en nuestras vidas. Estos son pautas consistentes que crean efectividad.','Para todos aquellos en busca de crecimiento personal','Stephen Richards Covey fue un licenciado en administraci??n de empresas, escritor, conferenciante, religioso y profesor estadounidense.','Los 7 h??bitos de la gente altamente efectiva son los siguientes:\r\nEl h??bito de la proactividad nos da la libertad para poder escoger nuestra respuesta a los est??mulos del medioambiente. Nos faculta para responder de acuerdo con nuestros principios y valores. En esencia, es lo que nos hace humanos y nos permite afirmar que somos los arquitectos de nuestro propio destino.\r\nComenzar con un fin en mente hace posible que nuestra vida tenga raz??n de ser, pues la creaci??n de una visi??n de lo que queremos lograr permite que nuestras acciones est??n dirigidas a lo que verdaderamente es significativo en nuestras vidas.\r\nPoner primero lo primero nos permite liberarnos de la tiran??a de lo urgente para dedicar tiempo a las actividades que en verdad dan sentido a nuestras vidas. Es la disciplina de llevar a cabo lo importante, lo cual nos permite convertir en realidad la visi??n que forjamos en el h??bito 2.\r\nPensar en Ganar-Ganar nos permite desarrollar una mentalidad de abundancia material y espiritual, pues nos cuestiona la premisa de que la vida es un ???juego de suma cero??? donde para que yo gane alguien tiene que perder.\r\nBuscar entender primero y ser entendido despu??s es la esencia del respeto a los dem??s. La necesidad que tenemos de ser entendidos es uno de los sentimientos m??s intensos de todos los seres humanos. Este h??bito es la clave de las relaciones humanas efectivas y posibilita llegar a acuerdos de tipo Ganar-Ganar.\r\nSinergizar es el resultado de cultivar la habilidad y la actitud de valorar la diversidad. La s??ntesis de ideas divergentes produce ideas mejores y superiores a las ideas individuales. El logro del trabajo en equipo y la innovaci??n son el resultado de este h??bito.\r\nAfilar la sierra es usar la capacidad que tenemos para renovarnos f??sica, mental y espiritualmente. Es lo que nos permite establecer un equilibrio entre todas las dimensiones de nuestro ser, a fin de ser efectivos en los diferentes papeles (roles) que desempe??amos en nuestras vidas.\r\nLos 7 h??bitos no son un conjunto de partes independientes o f??rmulas fragmentadas. En armon??a con las leyes naturales del crecimiento, proporcionan un enfoque gradual, secuencial y altamente integrado del desarrollo de la efectividad personal e interpersonal.',5,15),(15,'Alicia en el pa??s de las maravillas','En este libro se cuenta la historia de la joven Alicia quien cae en un mundo de fantas??a a trav??s de un agujero, donde encontrar?? criaturas y aventuras m??g','Para todos aquellos amantes de la aventura y el misterio.','Lewis carroll escritor ingl??s de ficci??n infantil.','Todo comienza cuando Alicia est?? descansando a la orilla del r??o en verano, cuando un Conejo vestido igual a ella. El Conejo saca un reloj de bolsillo y baja por una madriguera. Alicia sigue al Conejo y se encontrar?? con un excelente pasillo forrado de puertas. Ella encuentra una peque??a entrada quela lleva a una mesa cercana.\r\n\r\nAqu?? Alicia, ve un hermoso jard??n, y comienza a llorar porque se da cuenta que no cabe por la entrada. Ella encuentra una botella y se toma el contenido. Se encoge hasta caber por la entrada. Luego Alicia descubre un pastel de bodas que la hace crecer de tama??o. Alicia comienza a llorar una vez m??s, y sus enormes l??grimas forman una piscina a sus pies. Mientras llora, se encoge y cae en la piscina de l??grimas.\r\nLa piscina de l??grimas se convierte en un mar, donde luego aparece el rat??n que acompa??a a Alice a la orilla, en la que una cantidad de animales se re??nen en la orilla.\r\n\r\nConociendo a la duquesa\r\nLuego de un rato de paseo, Alicia come una planta que la hace volver a su tama??o normal, entonces se encuentra con una propiedad. Ella entra y encuentra a la duquesa, que est?? amamantando a un beb?? chill??n, y un gato de Cheshire sonriente, as?? como un cocinero que arroja niveles masivos de pimienta directamente en un caldero de sopa.\r\n\r\nLa duquesa se comporta groseramente con Alicia y se va para prepararse para encuentro con la Reina. El Gato de Cheshire le explica a Alicia que todos en el Pa??s de las Maravillas est??n locos, incluida la misma Alicia. El gato Cheshire da indicaciones para la propiedad de la Liebre de Marzo y se desvanece a s??lo una sonrisa flotante.\r\n\r\nLa liebre de marzo y el sobrero loco\r\nAlicia viaja a la propiedad de la Liebre de Marzo. Una vez aqu?? fue maltratada y descubre que han hecho da??o al Tiempo y por lo tanto est??n atrapados en la hora del t?? perpetuo. Despu??s de una descortes??a final, Alicia viaja al bosque y encuentra un ??rbol que usa para moverse a trav??s de ??l para conseguir la fant??stica sala de nuevo.\r\n\r\nDespu??s de salvar a muchos jardineros, Alicia se une a la Reina en una actividad muy extra??a de croquet. El patio de croquet es monta??oso, las bolas y mazos resultan ser son flamencos vivos y erizos, as?? como las l??grimas de la Reina. En medio de esta locura, Alicia se topa con el Gato de Cheshire una vez m??s, quien le pregunta c??mo est?? realmente. El Gobernante de Corazones interrumpe su discurso y se esfuerza por intimidar al Felino de Cheshire, quien despide al gobernante descaradamente.\r\nEl Rey se ofende y se arregla con la ejecuci??n del Gato de Cheshire, pero debido a que el Gato de Cheshire es una cabeza flotando en el aire ahora, nadie puede ponerse de acuerdo sobre c??mo decapitarlo exactamente.\r\n\r\nEl desenlace final\r\nLa duquesa se acerca a Alicia y se esfuerza por hacerse amiga de ella, pero esta ??ltima no est?? segura. La Reina de Corazones persigue a la duquesa y le muestra a Alicia que debe ir a la Falsa Tortuga para escuchar su relato. Alicia tiene extra??os encuentros con toda',5,25),(25,'Yo antes de ti','Will Traynor es un empresario exitoso que queda tetrapl??jico luego de un accidente de moto. Tras perder su empleo, Louisa es contratada por los padres del ','Para todos aquellos amantes del romance y la tragedia.','Paulie Sarah Jo Moyes, mejor conocida como Joj?? Moyes, es una periodista y escritora londinense, nacida en el a??o 1969.','La vida cambia de golpe\r\nEs el a??o 2007. Will Traynor se ha vestido para salir con su moto, pero debido a la lluvia decide tomar un taxi. Con el apuro para alcanzarlo, corre y se produce un accidente que lo deja cuadrapl??jico. Apenas tiene movilidad muy limitada en las extremidades superiores.\r\n\r\nWill hab??a sido hasta ese momento un empresario rico, joven, atractivo y aventurero. Le gustaba ir en moto, practicar deportes que le llenaban de adrenalina, como el submarinismo, por ejemplo. El accidente se lleva su movilidad y tambi??n sus ganas de vivir.\r\n\r\nEn 2009, Louisa Clark se queda desempleada. Tiene 26 a??os y no es particularmente ambiciosa. Su hermana es m??s joven, madre soltera, pero tambi??n est?? m??s preparada y ha tenido m??s ??xito, econ??micamente. Viven con sus padres y la noticia del trabajo perdido no ayuda en absoluto. No obstante, en un centro de empleo consiguen una opci??n para ella: cuidar a un hombre que va en silla de ruedas.\r\n\r\nTiempo para un intento\r\nLouisa obtiene el empleo. La madre de Will, Camilla Traynor, no solo busca a alguien que cuide de su hijo, sino tambi??n a una persona que le ayude a recuperar la alegr??a. La mansi??n Traynor tampoco es un ejemplo perfecto, precisamente, ya que el matrimonio est?? pasando por un mal momento: el padre de Will tiene una aventura.\r\n\r\nCuando Louisa se da cuenta de que Will tiene cicatrices en las mu??ecas, comprende mejor su misi??n. Will ha intentado suicidarse. Ahora manifiesta su deseo de practicarse la eutanasia en Suiza, pa??s en el que es posible realizar ese procedimiento, al que llaman ???morir con dignidad???.\r\n\r\nLa se??ora Camilla y otros familiares consiguen negociar con Will un per??odo de seis meses antes de que se vaya a Suiza; durante ese tiempo esperan poder convencerlo de reconsiderar su decisi??n. Louisa se entera de las intenciones de Will al escuchar, accidentalmente, una conversaci??n familiar-\r\n\r\nEntonces se dedica a buscar la manera de que Will abandone la idea. Le corta el cabello y le afeita la barba, detalles que ??l hab??a descuidado durante largo tiempo. Lo saca de paseo y lo llena de est??mulos, para hacer su d??a a d??a agradable y lleno de sorpresas.\r\n\r\nSin embargo, esto no es suficiente para Will. Por lo tanto, poco antes de que se cumpla el tiempo se??alado, Louisa renuncia. La se??ora Traynor la convence para que vuelva y entonces planifican un viaje a la Isla Mauricio, con el fin de alejarlo definitivamente de la idea del suicidio.\r\n\r\nLa noche antes de regresar, se besan. Louisa le confiesa que lo ama e intenta convencerlo de ser felices juntos. Sin embargo, ??l se muestra inflexible. No quiere vivir as??.\r\n\r\nLa generosidad de Will\r\nDurante el tiempo en que interact??an como paciente y asistente, Will nota que, debido a su condici??n econ??mica y su timidez, el mundo de Louisa es bastante limitado. Sus perspectivas de crecimiento son muy estrechas y apenas ha salido nunca de la ciudad. Ella es opuesta a lo que ??l hab??a sido.\r\n\r\nFinalmente, antes de su viaje a Suiza, Louisa y Will ',5,5),(35,'Harry Potter','ggg','ggg','ggg','gggg',5,15),(45,'Harry Potter','ggg','gggx','gggx','ggggx',5,15),(55,'Lazarillo de Tormes','Esta novela gira en torno a L??zaro, un ni??o ingenuo que, debido a las adversidades que vive, se convierte en un joven p??caro que lucha por sobrevivir.','Para aquellos en busca de un historia de superaci??n y amor propio. Adem??s de ser un cl??sico de la literatura espa??ola.','Este considerado an??nimo. Sin embargo, Mercedes Agull?? present?? un trabajo donde defend??a que el autor del Lazarillo es Diego Hurtado de Mendoza.','Sus padres fueron encarcelados por varios cr??menes. L??zaro, al verse hu??rfano, busc?? la compa????a de alg??n amo y se hizo mozo de un ciego pero no dur?? mucho tiempo con ??l . El ciego ganaba mucho dinero, pero a ??l no le daba nada de comer y lo ten??a muerto de hambre . As?? que lo dej?? y fue a buscar otro. \r\nUn d??a, que iba mendigando, se encontr?? a un cl??rigo que le pregunt?? que si buscaba amo . L??zaro le dijo que s?? . El cl??rigo ten??a un arca y en el arca ten??a la comida: pan , agua , arroz ??? L??zaro aprovech?? que lleg?? a su casa un calderero y pidi?? la llave el arca para coger cosas para comer . Como el arca era vieja y ten??a agujeros el cl??rigo pens?? que eran los ratones los que mordisqueaban el pan. Cierto d??a, el cl??rigo se dio cuenta y le dijo que no se merec??a un criado tan listo. Lo ech?? y le dijo que buscara amo. \r\nL??zaro tuvo suerte de llegar a la gran ciudad de Toledo, pues all?? encontr?? de nuevo un amo. Este fue un escudero. El escudero ten??a pinta de ser muy rico pero era pobre . Al escudero le persegu??a la justicia porque no pagaba sus deudas . Y L??zaro no quiso estar con ??l. \r\nUnas mujeres que cuidaban a L??zaro le dijeron que se fuera con un fraile amigo de ellas. Pero L??zaro solo dur?? ocho d??as con ??l pues andaba mucho y a ??l no le gustaba andar. \r\nA los pocos d??as sirvi?? a un buldero. El buldero ten??a mucha experiencia para mentir y siempre , siempre se estaba peleando con un alguacil . Estuvo cuatro a??os con ??l pero como era muy mentiroso L??zaro decidi?? dejarlo. \r\nUn d??a que entr?? en la catedral uno de sus capellanes decidi?? contratarlo. Le hizo cargo de un burro, cuatro c??ntaros y un l??tigo y empez?? a vender agua por el pueblo. Y cuando reuni?? el dinero suficiente, se compr?? ropa nueva y dej?? al capell??n. \r\nDespu??s de esto sirvi?? a un alguacil con el que no dur?? mucho y tiempo porque ten??a un oficio muy peligroso. Un d??a unos delincuentes cogieron al alguacil y lo maltrataron, pero a L??zaro no lo pillaron . Y L??zaro sigui?? buscando amo. \r\nL??zaro consigui?? por ??ltimo un oficio real. Y a los pocos d??as un cura lo cas?? con una de sus criadas y le alquil?? una casa al lado de la suya. Vivieron felices.',5,15);
/*!40000 ALTER TABLE `resumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'logTestUser','bal@bal.com','$2b$14$EYVgUbJyZBhV3Ze6GNklvuMjzFO3cfXDmSOi0QXuOj.Vgh5tUU3BS','$2b$14$EYVgUbJyZBhV3Ze6GNklvu'),(15,'stanley','stanley@gmail.com','$2b$14$WrmGWEOQQdNzJwphTDQ2R.v5tNyDV4fA/23IG5sBRe09WatdSdMl2','$2b$14$WrmGWEOQQdNzJwphTDQ2R.'),(25,'aaa','aaa@gmail.com','$2b$14$4O2M6/HOjXSq0OVgs74AvOdEuD6GYwDiNRzapi4UK05dOFrgqiANy','$2b$14$4O2M6/HOjXSq0OVgs74AvO'),(35,'js','js@gmail.com','$2b$14$KOREkHpMQ1RAd76AmaeXre.EEeT8BBwR9EagDaXisguDKi5ueJi4e','$2b$14$KOREkHpMQ1RAd76AmaeXre');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-09 21:23:11
