-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app01_bbs`
--

DROP TABLE IF EXISTS `app01_bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_bbs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `summary` varchar(256) DEFAULT NULL,
  `content` longtext NOT NULL,
  `views` int NOT NULL,
  `loves` int NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_bbs_author_id_ce8adb77_fk_ouser_bbs_user_id` (`author_id`),
  KEY `app01_bbs_category_id_92f3cacd_fk_app01_category_id` (`category_id`),
  CONSTRAINT `app01_bbs_author_id_ce8adb77_fk_ouser_bbs_user_id` FOREIGN KEY (`author_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `app01_bbs_category_id_92f3cacd_fk_app01_category_id` FOREIGN KEY (`category_id`) REFERENCES `app01_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_bbs`
--

LOCK TABLES `app01_bbs` WRITE;
/*!40000 ALTER TABLE `app01_bbs` DISABLE KEYS */;
INSERT INTO `app01_bbs` VALUES (1,'测试1','这是一个测试','天：这一部分主要是星学，也就是在风水术中占很大比重的天星风水，地分吉凶，星有善恶，看风水寻龙脉讲的就是上观天星、下审地脉。\r\n地：风水术的主体是相形度地，大道龙行自有真，星峰磊落是龙身，通过解读大地上山川河流的走向形势，判断龙脉的来去止伏，观取“龙、砂、穴、水”，这就是地字篇的内容。\r\n人：风水有阴阳宅之说，阴宅是墓地，是为死者准备的，而阳宅是活人的居所，对于阳宅的选择，一样也有极深的风水理论，又称“八宅明镜”之术。\r\n鬼：顾名思义，幽冥之说为鬼，这一篇主要是讲解古墓主人的情况。例如尸首和棺椁的摆放，殉葬者与陪葬品的位置，长明灯、长生烛的象征性等等，凡是墓中与死者有直接关联的，多在此卷之中。\r\n神：自古以来，渴望死后成仙，并沉迷此道之人不可胜数，尸解成仙的事情在风水中多有记载。同形势理气息息相关，如何在神仙穴中尸解羽化是这一篇的主要内容，不过就如同是“屠龙之术”，在大多数的情况下，“神仙穴中羽化眠”只是一套不切实际的空虚理论而已。\r\n佛：风水理论体系庞大繁杂，摸金校尉所擅长的风水秘术，都是以《易》为总纲，属于道家一脉，而其余的各个宗教也都有各自的风水理论，当然也许在那些宗教中并不称其为风水。但是其本质都是一样的。佛字一卷记载的是禅宗风水。\r\n魔：吉星之下无不吉，凶星之下凶所存，况是凶龙不入穴。只是闲行引身过。魔字篇中的内容，主说地脉天星之恶兆，使人远避地劫天祸，这是专门讲风水中凶恶征兆的一篇。\r\n畜：圣人有云，禽兽之流，不可以与之为伍，山川地貌都是大自然的鬼斧神工，有些奇山异石，自然造化生成百兽形态，这在风水中也大有名堂。举个例子来说，比如山体似牛，便有卧牛、眠牛、耕牛、屠牛、望月牛之分，姿态形势不同，吉凶各异，这一篇主要说的是风水形成的畜形。\r\n慑：分金定穴的精要内容，此术古称“观盘辨局之术”，不需要罗盘和金针的配合，便可精准无误地确认风水中的龙、砂、穴、水、向。是寻找古墓方位最重要的环节。\r\n镇：风水一道，其中最忌“煞”形，镇字卷主要记载着如何镇煞、避煞，不过镇字篇中，讲的最多的反而是“避”，而非“镇”，也不失为明哲保身之道。\r\n遁：古墓中的机关布局，殉葬沟的位置，可以通过地面封土、明楼之类的结构，推算出古墓地宫的轮廓方位等细节。最主要的当然是讲解机关埋伏，有很深的易理蕴藏在里边，如不精通五行生克的变化，也难以窥得其中门径。\r\n物：古有天气地运、天运地气之说，地运有推移，而天气从之；天运有旋转，地气而应之，自然环境的变化，导致风水形势的改变，在山川之中的一切灵性之物，会由于风水善恶的巨大转变，而产生异变，如果清浊阴阳混淆将产生一些非常可怕的事物，不合常理者，谓之妖，物字篇是描述因为风水而产生的妖异现象。\r\n化：化者乃变化之化，地师们眼中最艰难的改风水，小者改门户，大者变格局。古风水一道中，不主张人为“改动”风水形势。宇宙有大关合，山川有真性情，其气其运，安可妄动？“化”字卷是被模金校尉视为禁忌的一卷，但面对一些是通过改变格局营造风水宝地的古墓，“化”字卷便是它的克星。\r\n阳：此阴阳非阴阳术之阴阳，单纯从风水角度来说的阴阳，实际上就是“形势”，看得到的为阳，看不到的为阴，在风水一道中，什么是看得到的？一座山一条河呈现出的地形，便是看得到的，阳字卷是讲“形”的一卷。\r\n阴：看得到的为阳，世人不见之形为阴，何为不见之形？一座山一条河的地形，所蕴涵着的气与运，以及这种气与运呈现出的势态，这都是直接用肉眼看不到的精神气质，阴字卷是讲“势”的一卷。\r\n空：大象无形，大音稀声，风水秘术的最高境界，没有任何一个字的一篇，循序渐进研习到最后，大道已证，自然能领悟“空”之卷“造化之内、天人合一”的究极奥妙所在。',39,-4,'2020-05-05 11:30:40.061336','2020-05-17 02:08:56.880034',1,1),(2,'test2','this is a test','倒斗：这个词最早就是来源于摸金校尉对盗墓的一种生动描绘。中国大墓，除了修在山腹中的，多半上面都有封土堆，以秦陵为例，封土堆的形状就恰似一个量米用的斗，反过来扣在地上，明器地宫都在斗中，取出明器最简单的办法，就是把斗翻过来拿开，所以叫倒斗。\r\n倒腾：同倒斗。\r\n元良：对盗墓同行的尊称。\r\n粽子：发生“尸变”的尸体。也指墓里的尸体保存的比较完好，没有腐烂。\r\n大粽子：身上或身边有财宝的尸体。也指僵尸、恶鬼之类不干净的东西。\r\n干粽子：墓里的尸体烂得只剩下一堆白骨了。\r\n肉粽子：尸体身上值钱的东西多。\r\n僵尸：入土不安，即为僵尸。\r\n凶：身上长毛的僵尸。长黑毛与白毛分别被称为黑凶与白凶，带毒的尸妖则长绿毛。原理是尸菌受到生物电的刺激，而产生的加剧变化。\r\n煞：尸毛很长的凶尸。\r\n明器：陪葬品。',12,2,'2020-05-05 11:30:59.715654','2020-05-05 11:30:59.715654',2,1),(3,'测试3','这是一个测试3','三国时曹孟德为充军饷，特设发丘、摸金之职，其实中郎将校尉等军衔是曹操所设，然而摸金与发丘的名号，以及搬山、卸岭都是秦末汉初之时，便已存在于世间的四个倒斗门派，不过这些门派中的门人弟子，行事诡秘，世人多不知晓，史书上也无记载，时至明朝，发丘、搬山、卸岭三门几乎失传，只剩下摸金一门。发丘、摸金、搬山、卸岭，便囊括了世上以“风水、方术、外力”来盗墓的这三大体系，简言之可作“理、技、物”，也完全涵盖了盗墓之辈“济世、寻药、求财”这三种动机，余者皆民盗散盗，不乏鸡鸣狗盗之流，泥沙混杂难成气候，不足立说。\r\n摸金校尉：摸金的雏形始于战国时期，精通“寻龙诀”和“分金定穴”。门人有摸金符。\r\n发丘将军：又名发丘中郎将、发丘天官、发丘灵官。到了后汉才有，与摸金同出一脉，其手段和摸金校尉几乎完全一样，只是多了一枚铜印“发丘印”。\r\n搬山道人：始于西域孔雀河双黑山流域，其辈皆同宗同族。本为扎格拉玛后人，搬山者善独门“搬山分甲术”，此术可细分为“搬山填海术”并“分山掘子甲”两门，合称“搬山之术”。平时用道士的身份伪装，以“搬山道士”自居，以寻找“雮尘珠”为己任。\r\n卸岭力士：始自汉末农民军盗发帝陵，众力取利，分赃聚义，人数少则成百、多可千数。平日分散，各自为匪为盗或为官军，盗墓者中半官半匪者皆属此辈，彼此间有消息相通，中有盗魁，一呼百应，逢古墓巨冢，则聚众以图之。其行事不计后果，大铲大锄、牛牵马拽、药石土炮，无所不用其极，其辈所盗发之冢，即便斩山做廊、穿石为藏、土坚如铁、墓墙铜灌金箍，亦皆以外力破之。\r\n观山太保：少数人组成的不为人知的盗墓门派，起源于明代。',14,3,'2020-05-05 11:31:19.928807','2020-05-05 11:31:19.928807',1,1),(4,'test5','this is a test','<p>123456</p>',10,0,'2020-05-06 09:49:35.568105','2020-05-06 09:49:35.579076',3,1),(5,'test5','this is a test','<p><img alt=\"\" src=\"/media/upload/%25Y/%25m/%25d/2020/05/18/492fd807f49eee086b3a3e9da05e5872.png\" style=\"height:548px; width:536px\" />python<span style=\"color:#16a085\"> <u><strong>666<img alt=\"\" src=\"/media/upload/2020/05/18/492fd807f49eee086b3a3e9da05e5872.png\" style=\"height:548px; width:536px\" /></strong></u></span></p>',2,0,'2020-05-06 14:00:15.783129','2020-05-18 23:05:36.921569',3,2),(6,'bbs06','这是一个测试','<p>&middot; 2006年3月，作者天下霸唱在网上发表《鬼吹灯》。</p>\r\n\r\n<p>&middot; 2006年4月，起点中文，新浪读书开始大力推广，人气攀升。</p>\r\n\r\n<p>&middot; 2006年7月，北京某报整版报道并采访作者天下霸唱。</p>\r\n\r\n<p>&middot; 2006年9月，新浪网读书频道推出网友聊《鬼吹灯》节目。</p>\r\n\r\n<p>&middot; 2006年12月，荣登新浪读书风云榜：盗墓小说异军突起。</p>\r\n\r\n<p>&middot; 2007年6月，《鬼吹灯》第一部《精绝古城》漫画出版。</p>\r\n\r\n<p>&middot; 2007年7月，《鬼吹灯Ⅱ之一&middot;黄皮子坟》出版。</p>\r\n\r\n<p>&middot; 2007年8月，《鬼吹灯》影视权花落华映，杜琪峰出任监制。</p>\r\n\r\n<p>&middot; 2007年8月，《鬼吹灯》被传抄袭，作者新浪博客发表声明。</p>\r\n\r\n<p>&middot; 2008年1月，成都网友叫板杜琪峰，筹钱私拍《鬼吹灯》。</p>\r\n\r\n<p>&middot; 2015年9月，根据小说《鬼吹灯之精绝古城》改编的电影《九层妖塔》上映。</p>\r\n\r\n<p>&middot; 2015年12月，乌尔善执导的现实奇幻巨制鬼吹灯之《寻龙诀》公映。</p>',3,0,'2020-05-22 18:29:38.298871','2020-05-22 18:29:38.298871',1,1),(7,'bbs07','这是一个测试','<p>红犼：生活在蒙古草原上的猛兽，身硬如铁，喜欢在地下挖洞。</p>\r\n\r\n<p>达普鬼虫：透明瓢虫，有两个种类，蓝色的称为无量业火，能将接近的人烧成灰烬。白色的称为乃穷神冰，能将接近的人冻成冰块。但是在选定目标前都要在空中盘旋几圈。</p>\r\n\r\n<p>雪弥勒：原形是一种水生吸血水母。生存在雪山冰下，会潜伏进刚死不久的尸体，吸收尸体的血肉变得肥胖，远看上去像是胖乎乎的雪人，因此被称为雪弥勒。只敢夜晚出来，而且怕大盐。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/item/%E6%B3%B0%E5%9D%A6%E9%AD%94%E8%8A%8B%E8%8A%B1\" target=\"_blank\">泰坦魔芋花</a>：泰坦魔芋花 (Titan Arum) ，也称为&ldquo;尸花&rdquo;，这种花还有更形象的一个名字&ldquo;尸臭魔芋&rdquo;。此花生长于苏门答腊群岛，花龄为 150 年左右，成花预计可以高达 1.8 米 左右，是世界上体型最大的花。有着类似马铃薯一样的根茎。等到花冠展开后，呈红紫色的花朵将持续开放几天的时间，散发出的尸臭味也会急剧增加。当花朵凋落后，这株植物就又一次进入了休眠期。而这种植物散发出的像臭袜子或是腐烂尸体的味道，是想吸引苍蝇和以吃腐肉为生的甲虫前来授粉。这种花非常艳丽，比任何能想象到的东西都要美，然而这种美得出奇的花朵确实是生长在地球上的，依然还有存在于世界之中。</p>\r\n\r\n<p>而这种植物遥远的祖先&ldquo;尸香魔芋&rdquo;，早已灭绝千年之久，这种魔鬼之花，颜色妖艳，诡异的清香，制造出一个又一个由幻相所组成的陷阱，引诱着人们走向死亡。传说&ldquo;尸香魔芋花&rdquo;就是守护所罗门王宝藏的恶鬼。</p>\r\n\r\n<p><a href=\"https://baike.baidu.com/item/%E4%BA%BA%E9%9D%A2%E8%9C%98%E8%9B%9B\" target=\"_blank\">人面蜘蛛</a>：《鬼吹灯》人面蜘蛛主要隶属于deinopidae妖面蛛科和thomisidae蟹蛛科。一般来讲，所有的蜘蛛都有毒性，但是这种人面蜘蛛的毒性并不大，对人类也不会有什么危险，所以想要饲养人面蜘蛛应该没有什么禁忌。对于如何饲养这种人面蜘蛛，专家介绍，只要是在保湿的环境之下就可以了，其他并没有特殊的要求，一般来讲，这种人面蜘蛛应该是吃果蝇的。<strong>　</strong></p>\r\n\r\n<p><a href=\"https://baike.baidu.com/item/%E9%BB%91%E9%B3%9E%E9%B2%9B%E4%BA%BA\" target=\"_blank\">黑鳞鲛人</a>：所谓的黑鳞鲛人就是美人鱼。世界上已经有很多人发现人鱼的尸骨了，美国海军还曾捉到过一条活的。据说海中鲛人的油膏，不仅燃点很低，而且只要一滴便可以燃烧数月不灭，古时贵族墓中常有以其油脂作为万年灯的。东海鲛人其性最淫，嗜血，都聚居于海中一座死珊瑚形成的岛屿下，那岛下珊瑚洞，洞穴纵横交错，深不可知，东海鲛人在附近海域放出声色，吸引过往海船客商，遇害者全被吃得骨头也剩不下。有人捉到活的黑鳞鲛人，将其宰杀晾干，灌入这种生物的油膏，制成长生烛，价值金珠三千。</p>',1,0,'2020-05-22 18:30:10.901117','2020-05-22 18:30:10.901117',4,1),(8,'bbs08','这是一个测试','<p>作者写的《鬼吹灯》这部书前后两部（每部均为四册），共计八册，顺序依次是《鬼吹灯1精绝古城》《鬼吹灯2龙岭迷窟》《鬼吹灯3云南虫谷》《鬼吹灯4昆仑神宫》《鬼吹灯5黄皮子坟》《鬼吹灯6南海归墟》《鬼吹灯7怒晴湘西》《鬼吹灯8巫峡棺山》。</p>\r\n\r\n<p><strong>《精绝古城》</strong></p>\r\n\r\n<p>《鬼吹灯》第一部第一卷《精绝古城》，可以分为前后两个部分，前半部分截止到野人沟黑风口的地下军事要塞，主要是一个框架、平台的搭建，并没有什么与主线关系明确的线索。这半部是想写成民间传说、乡村野谈那种类型。所谓民间故事的类型，感觉大概就是僵尸和<a href=\"https://baike.baidu.com/item/%E9%BB%91%E9%A9%B4%E8%B9%84%E5%AD%90\" target=\"_blank\">黑驴蹄子</a>那种深山老林里的传说。</p>\r\n\r\n<p>从考古队进入沙漠寻找精绝古城开始，触及到了鲜明的地理文化元素，西域沙漠、<a href=\"https://baike.baidu.com/item/%E5%AD%94%E9%9B%80%E6%B2%B3\" target=\"_blank\">孔雀河</a>、双圣山、<a href=\"https://baike.baidu.com/item/%E4%B8%89%E5%8D%81%E5%85%AD%E5%9B%BD\" target=\"_blank\">三十六国</a>、<a href=\"https://baike.baidu.com/item/%E6%A5%BC%E5%85%B0%E5%A5%B3%E5%B0%B8\" target=\"_blank\">楼兰女尸</a>、敦煌壁画，提到这些元素，一股神秘的气息扑面而来，所以在精绝古城这部分，是将神秘感作为了故事核心，到最后精绝女王也没露面，算是神秘到底了。这一卷中涉及到了一些考古解谜之类的元素。</p>\r\n\r\n<p>作为最初的一卷，现在来看最大的缺陷，就是有些部分写得过于简单和潦草了，逻辑比较松散，随写随编，完全没有考虑后面的故事如何展开；满意的地方是描写和叙述比较真实、生动。</p>\r\n\r\n<p>看起来很真实很乡野很神秘的风格，是在写第一卷的时候，最想表现的内容。</p>\r\n\r\n<p><strong>《龙岭迷窟》</strong></p>\r\n\r\n<p>《鬼吹灯》第一部第二卷《龙岭迷窟》，实际上这卷故事，分为了三个部分，一是龙岭倒斗发现西周<a href=\"https://baike.baidu.com/item/%E5%B9%BD%E7%81%B5%E5%86%A2\" target=\"_blank\">幽灵冢</a>，二是摸金校尉<a href=\"https://baike.baidu.com/item/%E9%BB%91%E6%B0%B4%E5%9F%8E\" target=\"_blank\">黑水城</a>寻宝，三是石碑店棺材铺献王<a href=\"https://baike.baidu.com/item/%E7%97%8B%E6%9C%AF\" target=\"_blank\">痋术</a>浮出水面。虽然一卷中有三个故事，但在本卷中，作者主要想突出惊悚这一核心元素。也许有人说《鬼吹灯》是惊悚小说，其实作者觉得完全不是，整体上和&ldquo;恐怖&rdquo;关系不大。如果说到惊悚，这只是本书诸多元素之一，并非主要元素。悬念迭出的只有《龙岭迷窟》这一卷，到处是传统话本令人窒息的扣子，这是耸人听闻的一卷。</p>\r\n\r\n<p><strong>《云南虫谷》</strong></p>\r\n\r\n<p>《鬼吹灯》第一部第三卷《云南虫谷》，写这卷故事的时候正好是在看世界杯，印象尤其深刻，是对精力、体力、毅志品质的一次严峻考验。云南献王墓这一卷中以探险作为核心。作者很喜欢看电影，曾经非常喜欢《深渊》和《异形》。所谓的探险，是探索加冒险，后来看到翻拍版《金刚》的预告片，有一段探险队利用转盘式冲锋枪，同山谷里蜈蚣恶战的桥段，超级喜欢这种场面。老式装备的探险队，皮划艇漂流、坠毁的空军飞机残骸、幽灵般的摩尔斯信号、<a href=\"https://baike.baidu.com/item/%E8%8A%9D%E5%8A%A0%E5%93%A5%E6%89%93%E5%AD%97%E6%9C%BA\" target=\"_blank\">芝加哥打字机</a>、千万年不死的巨型昆虫、吞噬万物的尸洞效应、在自然环境恶劣的丛林和化石洞穴中披荆斩棘，于是云南虫谷就启动了，完全是藏宝图式的传统探险元素，里面加有一引起奇怪的灵异和科幻色彩，这是新旧冒险元素相互结合的一卷。</p>\r\n\r\n<p>在《云南虫谷》中，故事类型全面转向&ldquo;探险&rdquo;。本卷出场人物较少，主要篇幅用于讲述险恶的地形和各种诡异的陷阱。对于陈瞎子贡献的人皮地图，开始的时候在作者脑中并没有什么概念，觉得怎么离奇就怎么安排了，随着写作的推进，把这一个个谜团揭开，自己也觉得有些惊讶，最早设计的献王墓，是一个只有在天崩时才会被人进入的古墓。还曾异想天开，有一架大型客机坠毁在摸金小队面前，从而撞开了古墓的大们，但后来一想到还有许多朋友今后要坐飞机出门，这么写可能不太好；加上在幽灵信号一段中，使用了抗战时期美国援华空军的运输机，所以最后就把天崩描述成几十年前附毁的轰炸机了，这种情节上的重力感和命运感也无法提前预测的。</p>\r\n\r\n<p><strong>《昆仑神宫》</strong></p>\r\n\r\n<p>《鬼吹灯》第一部第四卷《昆仑神宫》充满了神话色彩。中国地大物博，不同的地域，孕育出不同的文化与传说。凡是<a href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E7%A5%9E%E8%AF%9D\" target=\"_blank\">中国神话</a>必定离不开<a href=\"https://baike.baidu.com/item/%E6%98%86%E4%BB%91%E5%B1%B1\" target=\"_blank\">昆仑山</a>，昆仑山是天地的脊骨、祖龙发源之地、西王母的神宫、北方妖魔的巢穴，昆仑离开了神话传说似乎就不能称之为昆仑了。古籍上记载着昆仑<a href=\"https://baike.baidu.com/item/%E8%A5%BF%E7%8E%8B%E6%AF%8D\" target=\"_blank\">西王母</a>的真实形象是个怪物，按照作者个人想象可能是条大鱼，曾在自然博物馆中看过世界上最大的淡水鱼，感觉真的像龙一样。</p>\r\n\r\n<p>这一卷的情节涉及到格萨尔王传说。制敌宝珠的英雄大王史诗，本身就是一篇神话色彩很强烈的说唱长诗，所以在昆仑山这一篇中，揉入了许多接近神话的另类元素。风蚀湖的鱼王、无量<a href=\"https://baike.baidu.com/item/%E4%B8%9A%E7%81%AB\" target=\"_blank\">业火</a>、乃穷神冰、大黑天击雷山、<a href=\"https://baike.baidu.com/item/%E6%B0%B4%E6%99%B6%E8%87%AA%E5%9C%A8%E5%B1%B1\" target=\"_blank\">水晶自在山</a>、恶罗海城、灾难之门，这场冒险光怪陆离如同进入了幻界。《昆仑神宫》是如同在神界中冒险的一卷，虽然神话元素众多，但还是保持了一贯的原则，尽量向真实世界靠拢，当然不会有飞天入地、长生不死、神仙符咒那种真正的神话。</p>\r\n\r\n<p>由于时间安排与合同的原因，《鬼吹灯》的第一部在《昆仑神宫》后，就算结束了，最后的结局处是在北京的北海公园，属于完美大结局。起点中文网最后一章234章中完整收录了全部内容，实体书更是完璧无缺，当然这个大结局只属于第一部。</p>\r\n\r\n<p>在《鬼吹灯》第一部的前四册中，个人最喜欢的情节，就出现在西藏，但出于篇幅的问题，那部分被收录在了实体书云南卷的最后，是描写胡八一参军不久，在西藏月夜下的荒废寺庙中，同铁棒喇嘛恶战狼群的一部分，其实这几章无论如何都应该算在最后的西藏之卷里。</p>\r\n\r\n<p><strong>《黄皮子坟》</strong></p>\r\n\r\n<p>如果按照最初的计划，还是要在《鬼吹灯》第二部的四册中，描写四种不同的重点元素，这所以要写前传，主要是想活络一下思路和文字，使自己不会因过于僵化的时间线索失去耐心。</p>\r\n\r\n<p>《黄皮子坟》是年代背景非常强烈的一卷，核心元素是关于黄鼠狼的种种诡异传说，和非人生物的墓穴和棺椁，以及东北地区特有的江湖体系，都是作者非常感兴趣的元素。但由于年代背景比较特殊，许多词语和内容难免要受限制，不同于思想活跃的八十年代，这一时期的主人公尚不成熟，但满腔的热情却是什么困难都挡不住的。</p>\r\n\r\n<p>作者曾在<a href=\"https://baike.baidu.com/item/%E6%B5%B7%E6%8B%89%E5%B0%94\" target=\"_blank\">海拉尔</a>和大连，参观过日军侵华战争时期的遗址，包括焚尸炉、监狱、欧洲风格的医院和研究所等建筑，对其印象深刻，所以将故事的背景设置在其中。在这一卷中，作者觉得写得比较满意的，是对于黄皮子读心术和焚化间的描写，以及老羊皮死后被<a href=\"https://baike.baidu.com/item/%E9%9B%B7%E7%81%AB\" target=\"_blank\">雷火</a>击中的诡异事件，很有沉重感，单就实物来讲，觉得怪汤这一段很离奇又很真实。比较大的缺陷在于有些很有意思的东西忘了写进去，人熊那部分也处理得太草率了。</p>\r\n\r\n<p><strong>《南海归墟》</strong></p>\r\n\r\n<p>作为第一部故事的延续，在前边几卷中，对于摸金倒斗的描写，作者觉得中国传统行业中，有许多风险很大的职业，风险性最高的，当属在海中采珠的疍民。南海采珠的疍民原型出自广西北海地区，秦汉时期就已有龙户和獭家赴水采珠屠蚌，但是似乎很少有人来写。</p>\r\n\r\n<p>所以在这一卷中，海中采珠和这一行业的传说是重点元素。有观点认为，灿烂辉煌一时的玛雅文化，是中国西周时期渡海的先民所建，因为两者相似之处极多，射日神话更是华夏文明中十分重要的内容。</p>\r\n\r\n<p>曾想把海底的神箭，描写成一种真正的巨型兵器，迷失在<a href=\"https://baike.baidu.com/item/%E5%BD%92%E5%A2%9F\" target=\"_blank\">归墟</a>这片混沌之海内的摸金校尉和蛋民们，最终开动了震惊百时的神箭，射破了头顶的大海，从而逃出生天，可后来写的时候，把这个构思给忘了，但借助过龙兵这一海上的真实奇观逃生，也是十分惊心动魄的冒险。</p>\r\n\r\n<p>关于用装填了石灰的西瓜杀死水中恶鱼，并依靠司天鱼在茫茫无际的大海上航行，这些事情并非是虚构的。以前在中国南方，确实存在着。对于本卷中比较满意的，是对海岛上的黑市描写，有一些关于海难的桥段也觉得不错，例如乾坤一跳等等；感到最不满意的是海柳底舱中海匪的尸体，这段粗糙了，应该有很大发挥的余地。珠母海里的事情也应该展开来写，但每卷书的篇幅和字数也是一个很难克服的限制，情节和内容既不能多，也不能少，在没有整体大纲的情况下，很难控制，业余和专业的水平可能就在于此了。</p>\r\n\r\n<p><strong>《怒晴湘西》</strong></p>\r\n\r\n<p>在这一卷时，作者的工作时间非常宽松，时间多了相对就会写得比较从容，所以单从文字上来讲，作者觉得《怒晴湘西》是八卷中最精致的一卷，因为关于现代题材的限制越来越多，所以决定把前传倒回民国时期，放开手脚狠狠开挖。</p>\r\n\r\n<p>以前曾图着顺口，随意编了发丘摸金、搬山、卸岭这三大体系，随着故事情节的不断展开，就逐渐勾勒出了这些行业的来历、掌故、传说、手法，因为以前几本都以望风水盗墓为主，导致许多人，甚至连跟风写所谓盗墓小说的人，都只知道看风水找龙脉，却不知民间有许多稀奇古怪的盗墓方式。</p>\r\n\r\n<p>所以在这一卷中，把望字诀以外的盗墓手段作为核心。在民国传说式的故事，一要有说书的语感、二是要有侠盗般的人物，再加上各种黑话切口，充满了历史民间故事的色彩，才会有趣。以前写<a href=\"https://baike.baidu.com/item/%E9%BB%91%E6%B0%B4%E5%9F%8E\" target=\"_blank\">黑水城</a>一段，是试探性的，没敢往大处写，但有了以前的经验，写起来自然驾轻就熟，其中编了一套全新的概念性暗语，也就是山经，包括常胜山和月亮门等体系，完全是虚构的。</p>\r\n\r\n<p><strong>《巫峡棺山》</strong></p>\r\n\r\n<p>作为全书的最后一卷，《巫峡棺山》这一卷的任务比较重，最要命的是字数，根据合同约定的字数来算，第二卷的前三册，第一册少了三万字左右，只好都加到最后一卷中，所以本卷是超长篇，足足多了半本书，但即使是这样，最后一卷的篇幅也显得不够用。</p>\r\n\r\n<p>在计划中作为全书主线的四枚铜符，象征着通过不同形式存在于天地间的四种生命状态，想每部引出一符，但那样一来，就需要至少五册，只好简化了一些情节。</p>\r\n\r\n<p>另外也打算在这一卷中，把《<a href=\"https://baike.baidu.com/item/%E5%8D%81%E5%85%AD%E5%AD%97%E9%98%B4%E9%98%B3%E9%A3%8E%E6%B0%B4%E7%A7%98%E6%9C%AF/10747178\" target=\"_blank\">十六字阴阳风水秘术</a>》成为残书的真实原因，以及摸金符上代主人的故事做出交代。《鬼吹灯》全书起于《十六字阴阳风水秘术》残卷，最后也将终于《十六字阴阳风水秘术》当年被毁的往事，除了地仙村探险的内容，最后一卷中还包括了这些情节。</p>',1,0,'2020-05-22 18:30:38.309828','2020-05-22 18:30:38.309828',2,1),(9,'bbs09','这是一个测试','<p>bbs09</p>',0,0,'2020-05-22 21:31:06.907248','2020-05-22 21:31:06.907248',4,1),(10,'bbs10','这是一个测试','<p>bbs10</p>',0,0,'2020-05-22 21:31:26.581493','2020-05-22 21:31:26.581493',2,1),(11,'bbs11','这是一个测试','<p>bbs11</p>',0,0,'2020-05-22 21:31:41.163960','2020-05-22 21:31:41.163960',3,1),(12,'bbs12','这是一个测试','<p>bbs12</p>',0,0,'2020-05-22 21:31:55.449457','2020-05-22 21:31:55.449457',3,1),(13,'bbs13','这是一个测试','<p>bbs13</p>',1,0,'2020-05-22 21:32:08.370069','2020-05-22 21:32:08.370069',4,1),(14,'bbs14','这是一个测试','<p>55555555555555555555555555555555555</p>',1,0,'2020-05-22 21:32:34.471992','2020-05-22 21:32:34.471992',2,1),(15,'bbs15','这是一个测试','<p>66666666666666666666666</p>',4,0,'2020-05-22 21:32:52.086663','2020-05-22 21:32:52.086663',3,1),(16,'test16','这是一个测试','<p><img alt=\"\" src=\"/media/upload/2020/05/30/img_2564.JPG\" style=\"height:400px; width:300px\" />bbs16</p>',22,0,'2020-05-22 21:33:09.177048','2020-05-30 13:25:00.560757',2,1),(17,'bbs17','这是一个测试','<p>biubiubiu<img alt=\"wink\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" style=\"height:23px; width:23px\" title=\"wink\" /></p>',0,0,'2020-05-30 14:42:21.542965','2020-05-30 22:15:49.287191',1,1),(21,'test18','this is a test','<p><img alt=\"\" src=\"/media/upload/2020/05/30/img_2203.JPG\" style=\"height:375px; width:500px\" /></p>',5,0,'2020-05-30 15:01:08.695236','2020-05-30 15:01:08.700191',1,1),(23,'test20','本人甚懒，不想填写','<p><img alt=\"\" src=\"/media/upload/2020/06/01/v2-332de3f0d2ce6e6c060479fe69a2dbd9_720w.jpg\" style=\"height:700px; width:700px\" /></p>',1,0,'2020-06-01 17:59:11.092309','2020-06-01 17:59:11.098292',3,1),(24,'test python','本人甚懒，不想填写','<p><img alt=\"\" src=\"/media/upload/2020/06/01/82abaf35e5dde7113f7f26cbadefce1b9c1661a3.jpg\" style=\"height:679px; width:580px\" /><img alt=\"devil\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/devil_smile.png\" style=\"height:23px; width:23px\" title=\"devil\" /></p>',0,0,'2020-06-01 18:10:26.351166','2020-06-01 18:10:26.357221',4,2),(25,'django test','本人甚懒，不想填写','<p><img alt=\"\" src=\"/media/upload/2020/06/01/timg-1.jpg\" style=\"height:104px; width:300px\" /></p>\r\n\r\n<p>test</p>\r\n\r\n<p><img alt=\"mail\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/envelope.png\" style=\"height:23px; width:23px\" title=\"mail\" /></p>',5,0,'2020-06-01 18:40:48.959941','2020-06-01 18:40:48.965964',4,2),(26,'git 基础命令','本人甚懒，不想填写','<p>git 基础命令：待编辑</p>',0,0,'2020-06-03 22:39:52.268944','2020-06-03 22:39:52.276904',1,2);
/*!40000 ALTER TABLE `app01_bbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_bbs_keywords`
--

DROP TABLE IF EXISTS `app01_bbs_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_bbs_keywords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bbs_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_bbs_keywords_bbs_id_keyword_id_071b1e28_uniq` (`bbs_id`,`keyword_id`),
  KEY `app01_bbs_keywords_keyword_id_edc008d7_fk_app01_keyword_id` (`keyword_id`),
  CONSTRAINT `app01_bbs_keywords_bbs_id_0d51c94a_fk_app01_bbs_id` FOREIGN KEY (`bbs_id`) REFERENCES `app01_bbs` (`id`),
  CONSTRAINT `app01_bbs_keywords_keyword_id_edc008d7_fk_app01_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `app01_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_bbs_keywords`
--

LOCK TABLES `app01_bbs_keywords` WRITE;
/*!40000 ALTER TABLE `app01_bbs_keywords` DISABLE KEYS */;
INSERT INTO `app01_bbs_keywords` VALUES (1,1,1),(2,2,2),(3,3,1),(4,5,1),(5,6,2),(6,7,1),(7,8,2),(8,9,2),(9,10,1),(10,11,2),(11,12,1),(12,13,2),(13,14,1),(14,15,2),(15,16,1);
/*!40000 ALTER TABLE `app01_bbs_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_bbs_tag`
--

DROP TABLE IF EXISTS `app01_bbs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_bbs_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bbs_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_bbs_tag_bbs_id_tag_id_41b93135_uniq` (`bbs_id`,`tag_id`),
  KEY `app01_bbs_tag_tag_id_09ed4ce5_fk_app01_tag_id` (`tag_id`),
  CONSTRAINT `app01_bbs_tag_bbs_id_e7dcb5b5_fk_app01_bbs_id` FOREIGN KEY (`bbs_id`) REFERENCES `app01_bbs` (`id`),
  CONSTRAINT `app01_bbs_tag_tag_id_09ed4ce5_fk_app01_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `app01_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_bbs_tag`
--

LOCK TABLES `app01_bbs_tag` WRITE;
/*!40000 ALTER TABLE `app01_bbs_tag` DISABLE KEYS */;
INSERT INTO `app01_bbs_tag` VALUES (1,1,1),(2,2,2),(3,3,2),(4,5,1),(5,6,1),(6,7,1),(7,8,2),(8,9,2),(9,10,1),(10,11,1),(11,12,2),(12,13,2),(13,14,1),(14,15,2),(15,16,1);
/*!40000 ALTER TABLE `app01_bbs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_bigcategory`
--

DROP TABLE IF EXISTS `app01_bigcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_bigcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_bigcategory_admin_id_584482d9_fk_ouser_bbs_user_id` (`admin_id`),
  CONSTRAINT `app01_bigcategory_admin_id_584482d9_fk_ouser_bbs_user_id` FOREIGN KEY (`admin_id`) REFERENCES `ouser_bbs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_bigcategory`
--

LOCK TABLES `app01_bigcategory` WRITE;
/*!40000 ALTER TABLE `app01_bigcategory` DISABLE KEYS */;
INSERT INTO `app01_bigcategory` VALUES (1,'测试',1),(2,'技术交流',1),(3,'生活点滴',1),(4,'运动健身',1),(5,'挥斥方遒',1);
/*!40000 ALTER TABLE `app01_bigcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_category`
--

DROP TABLE IF EXISTS `app01_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `admin_id` int NOT NULL,
  `bigcategory_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_category_admin_id_c98fcf1c_fk_ouser_bbs_user_id` (`admin_id`),
  KEY `app01_category_bigcategory_id_1a3d690c_fk_app01_bigcategory_id` (`bigcategory_id`),
  CONSTRAINT `app01_category_admin_id_c98fcf1c_fk_ouser_bbs_user_id` FOREIGN KEY (`admin_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `app01_category_bigcategory_id_1a3d690c_fk_app01_bigcategory_id` FOREIGN KEY (`bigcategory_id`) REFERENCES `app01_bigcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_category`
--

LOCK TABLES `app01_category` WRITE;
/*!40000 ALTER TABLE `app01_category` DISABLE KEYS */;
INSERT INTO `app01_category` VALUES (1,'测试01',1,1),(2,'python',1,2),(3,'健身打卡',2,4),(4,'行走纪事',1,3),(5,'bbb',2,5);
/*!40000 ALTER TABLE `app01_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_keyword`
--

DROP TABLE IF EXISTS `app01_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_keyword`
--

LOCK TABLES `app01_keyword` WRITE;
/*!40000 ALTER TABLE `app01_keyword` DISABLE KEYS */;
INSERT INTO `app01_keyword` VALUES (1,'测试'),(2,'test');
/*!40000 ALTER TABLE `app01_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_lovecount`
--

DROP TABLE IF EXISTS `app01_lovecount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_lovecount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `like_num` int NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_lovecount_content_type_id_00082022_fk_django_co` (`content_type_id`),
  CONSTRAINT `app01_lovecount_content_type_id_00082022_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `app01_lovecount_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_lovecount`
--

LOCK TABLES `app01_lovecount` WRITE;
/*!40000 ALTER TABLE `app01_lovecount` DISABLE KEYS */;
INSERT INTO `app01_lovecount` VALUES (1,1,1,6),(2,4,0,6),(3,2,1,6),(4,3,0,6),(5,5,0,6),(6,6,0,6),(7,11,0,6),(8,16,0,6),(9,14,0,6),(10,13,0,6),(11,15,1,6),(12,20,0,6),(13,21,1,6),(14,17,0,6),(15,7,0,6),(16,8,0,6),(17,24,0,6),(18,23,0,6),(19,25,0,6);
/*!40000 ALTER TABLE `app01_lovecount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_loverecord`
--

DROP TABLE IF EXISTS `app01_loverecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_loverecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `love_date` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app01_loverecord_content_type_id_49141949_fk_django_co` (`content_type_id`),
  KEY `app01_loverecord_user_id_497532df_fk_ouser_bbs_user_id` (`user_id`),
  CONSTRAINT `app01_loverecord_content_type_id_49141949_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `app01_loverecord_user_id_497532df_fk_ouser_bbs_user_id` FOREIGN KEY (`user_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `app01_loverecord_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_loverecord`
--

LOCK TABLES `app01_loverecord` WRITE;
/*!40000 ALTER TABLE `app01_loverecord` DISABLE KEYS */;
INSERT INTO `app01_loverecord` VALUES (9,2,'2020-05-17 08:27:10.132488',6,4),(11,1,'2020-05-19 22:21:33.708878',6,3),(17,15,'2020-05-29 21:00:50.437323',6,3),(19,21,'2020-05-30 21:18:57.814759',6,1);
/*!40000 ALTER TABLE `app01_loverecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_tag`
--

DROP TABLE IF EXISTS `app01_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app01_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_tag`
--

LOCK TABLES `app01_tag` WRITE;
/*!40000 ALTER TABLE `app01_tag` DISABLE KEYS */;
INSERT INTO `app01_tag` VALUES (1,'测试'),(2,'test');
/*!40000 ALTER TABLE `app01_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add bbs',6,'add_bbs'),(22,'Can change bbs',6,'change_bbs'),(23,'Can delete bbs',6,'delete_bbs'),(24,'Can view bbs',6,'view_bbs'),(25,'Can add big category',7,'add_bigcategory'),(26,'Can change big category',7,'change_bigcategory'),(27,'Can delete big category',7,'delete_bigcategory'),(28,'Can view big category',7,'view_bigcategory'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add keyword',9,'add_keyword'),(34,'Can change keyword',9,'change_keyword'),(35,'Can delete keyword',9,'delete_keyword'),(36,'Can view keyword',9,'view_keyword'),(37,'Can add tag',10,'add_tag'),(38,'Can change tag',10,'change_tag'),(39,'Can delete tag',10,'delete_tag'),(40,'Can view tag',10,'view_tag'),(41,'Can add 用户',11,'add_bbs_user'),(42,'Can change 用户',11,'change_bbs_user'),(43,'Can delete 用户',11,'delete_bbs_user'),(44,'Can view 用户',11,'view_bbs_user'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add love record',13,'add_loverecord'),(50,'Can change love record',13,'change_loverecord'),(51,'Can delete love record',13,'delete_loverecord'),(52,'Can view love record',13,'view_loverecord'),(53,'Can add love count',14,'add_lovecount'),(54,'Can change love count',14,'change_lovecount'),(55,'Can delete love count',14,'delete_lovecount'),(56,'Can view love count',14,'view_lovecount'),(57,'Can add notification',15,'add_notification'),(58,'Can change notification',15,'change_notification'),(59,'Can delete notification',15,'delete_notification'),(60,'Can view notification',15,'view_notification'),(61,'Can add captcha store',16,'add_captchastore'),(62,'Can change captcha store',16,'change_captchastore'),(63,'Can delete captcha store',16,'delete_captchastore'),(64,'Can view captcha store',16,'view_captchastore'),(65,'Can add follow',17,'add_follow'),(66,'Can change follow',17,'change_follow'),(67,'Can delete follow',17,'delete_follow'),(68,'Can view follow',17,'view_follow');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (84,'WVIW','wviw','53cd54ce7bb51c4eb1a5fbb6cf068a081bc3e644','2020-06-02 22:31:18.769238'),(85,'IQJX','iqjx','706368f8fc6d12464bdabba584ba69771a45fd40','2020-06-02 22:31:25.806632');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_comment` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `parent_comment_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `reply_to_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_article_id_3cc364fc_fk_app01_bbs_id` (`article_id`),
  KEY `comment_comment_reply_to_id_e0adcef8_fk_ouser_bbs_user_id` (`reply_to_id`),
  KEY `comment_comment_user_id_6078e57b_fk_ouser_bbs_user_id` (`user_id`),
  KEY `comment_comment_root_id_28721811_fk_comment_comment_id` (`root_id`),
  KEY `comment_comment_parent_comment_id_7dde2864_fk_comment_comment_id` (`parent_comment_id`),
  CONSTRAINT `comment_comment_article_id_3cc364fc_fk_app01_bbs_id` FOREIGN KEY (`article_id`) REFERENCES `app01_bbs` (`id`),
  CONSTRAINT `comment_comment_parent_comment_id_7dde2864_fk_comment_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_ouser_bbs_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_ouser_bbs_user_id` FOREIGN KEY (`user_id`) REFERENCES `ouser_bbs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (1,'哦嚯，哦豁，哦吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼','2020-05-07 04:58:28.286236',1,NULL,4,NULL,NULL),(2,'what the fuck','2020-05-07 04:58:54.654649',1,1,3,4,1),(3,'2020/5/7，hhhhhhhhhhhhhhhhhh','2020-05-07 04:59:28.611418',1,NULL,2,NULL,NULL),(4,'1111111111111111','2020-05-07 06:18:27.792212',1,NULL,3,NULL,NULL),(5,'6666666666666666','2020-05-07 06:18:37.414141',1,NULL,3,NULL,NULL),(6,'1','2020-05-07 14:32:15.804262',1,NULL,3,NULL,NULL),(8,'try again','2020-05-07 14:37:39.317077',1,NULL,3,NULL,NULL),(9,'first','2020-05-07 14:38:41.245433',2,NULL,3,NULL,NULL),(10,'254368','2020-05-08 12:57:31.812145',1,NULL,3,NULL,NULL),(11,'hahhhahahahaahahahahhaa','2020-05-08 14:27:13.183082',1,2,1,1,2),(12,'hiheieheiiheieheieheiee','2020-05-08 14:27:33.048913',1,11,2,1,11),(13,'prprprprprprprprprprpr','2020-05-08 14:27:47.001896',1,12,3,2,12),(14,'bubuubbubububububuubub','2020-05-08 14:27:57.483379',1,13,4,3,NULL),(15,'second','2020-05-15 13:51:22.681406',2,NULL,3,NULL,NULL),(16,'second','2020-05-15 13:52:37.867714',2,NULL,3,NULL,NULL),(17,'second','2020-05-15 14:01:41.180112',2,NULL,3,NULL,NULL),(18,'second','2020-05-15 14:02:26.088256',2,NULL,3,NULL,NULL),(19,'second','2020-05-15 14:03:15.118253',2,NULL,3,NULL,NULL),(20,'third','2020-05-15 14:07:17.601773',2,NULL,3,NULL,NULL),(21,'test1','2020-05-15 14:17:30.188742',2,NULL,3,NULL,NULL),(22,'test2','2020-05-15 14:17:59.423713',2,NULL,3,NULL,NULL),(23,'test3','2020-05-15 14:18:31.682484',2,NULL,3,NULL,NULL),(24,'沙发','2020-05-17 08:42:27.527846',3,NULL,4,NULL,NULL),(25,'啦啦啦','2020-05-17 08:44:32.942949',3,NULL,4,NULL,NULL),(26,'三楼','2020-05-17 13:35:15.766634',3,NULL,4,NULL,NULL),(27,'四楼','2020-05-17 13:36:28.835379',3,NULL,4,NULL,NULL),(28,'五楼','2020-05-17 21:41:20.380376',3,NULL,4,NULL,NULL),(29,'沙发','2020-05-18 22:04:50.239249',4,NULL,3,NULL,NULL),(30,'二楼','2020-05-18 22:37:58.982631',4,NULL,3,NULL,NULL),(31,'<p>三楼</p>','2020-05-19 21:39:01.387842',4,NULL,3,NULL,NULL),(32,'<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>','2020-05-19 21:39:12.689287',4,NULL,3,NULL,NULL),(33,'<p>123</p>','2020-05-19 22:11:49.655086',4,NULL,3,NULL,NULL),(34,'<p>六楼</p>','2020-05-19 22:45:42.939613',3,NULL,3,NULL,NULL),(35,'<p>六楼</p>','2020-05-19 22:46:59.359640',3,NULL,3,NULL,NULL),(36,'<p>六楼</p>','2020-05-19 22:47:07.202288',3,NULL,3,NULL,NULL),(37,'<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /></p>','2020-05-19 22:53:41.358419',3,NULL,3,NULL,NULL),(38,'<p><img alt=\"heart\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/heart.png\" title=\"heart\" width=\"23\" /></p>','2020-05-19 22:56:05.334968',3,NULL,3,NULL,NULL),(39,'<p>哈哈哈</p>','2020-05-20 13:01:12.639330',4,NULL,3,NULL,NULL),(40,'<p>七楼</p>','2020-05-20 13:06:05.920141',4,NULL,3,NULL,NULL),(41,'<p>1</p>','2020-05-20 13:08:55.625368',4,NULL,3,NULL,NULL),(42,'<p><img alt=\"sad\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/sad_smile.png\" title=\"sad\" width=\"23\" /><img alt=\"wink\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" title=\"wink\" width=\"23\" /></p>','2020-05-20 13:16:34.069592',4,NULL,3,NULL,NULL),(43,'<p>再来一次</p>','2020-05-20 21:15:39.183954',1,NULL,3,NULL,NULL),(44,'<p><img alt=\"yes\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/thumbs_up.png\" title=\"yes\" width=\"23\" /></p>','2020-05-20 22:12:25.735674',3,NULL,3,NULL,NULL),(45,'<p>123</p>','2020-05-20 22:25:49.147772',3,NULL,3,NULL,NULL),(46,'<p>111</p>','2020-05-20 22:34:41.741998',3,NULL,3,NULL,NULL),(47,'<p>123</p>','2020-05-20 22:35:19.195787',3,NULL,3,NULL,NULL),(48,'<p>321</p>','2020-05-20 22:36:34.810692',3,NULL,3,NULL,NULL),(49,'<p>666</p>','2020-05-20 22:37:48.989827',3,NULL,3,NULL,NULL),(50,'<p>888</p>','2020-05-20 22:40:57.210307',3,NULL,3,NULL,NULL),(51,'<p><img alt=\"smiley\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" title=\"smiley\" width=\"23\" /><img alt=\"sad\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/sad_smile.png\" title=\"sad\" width=\"23\" /><img alt=\"wink\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" title=\"wink\" width=\"23\" /></p>','2020-05-21 13:57:17.590472',4,NULL,4,NULL,NULL),(52,'<p>111111</p>','2020-05-22 12:26:01.069348',4,NULL,3,NULL,NULL),(53,'<p>111111</p>','2020-05-22 12:27:28.871548',4,29,3,3,NULL),(54,'<p>楼中楼</p>','2020-05-22 12:34:13.107053',4,30,4,3,30),(55,'<p>666</p>','2020-05-22 13:00:05.242526',4,54,4,4,30),(56,'<p>芜湖呼呼呼呼</p>','2020-05-22 13:00:44.481784',4,55,4,4,30),(57,'<p>起飞~~~~~~~~~~</p>','2020-05-22 13:02:30.530459',4,56,4,4,30),(58,'<p>3333333333333333333333333</p>','2020-05-22 13:26:34.318486',4,31,4,3,31),(59,'<p>123321</p>','2020-05-22 13:29:34.292390',4,58,4,4,31),(60,'<p>555555</p>','2020-05-22 13:32:21.893041',4,59,4,4,31),(61,'<p>66666666666666</p>','2020-05-22 13:33:36.741075',4,60,4,4,31),(62,'<p><img alt=\"sad\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/sad_smile.png\" title=\"sad\" width=\"23\" /></p>','2020-05-22 13:38:02.699692',4,32,4,3,32),(63,'<p>fffffff</p>','2020-05-24 14:06:09.895942',2,9,3,3,9),(64,'<p>十一楼？？？</p>','2020-05-24 14:06:31.578035',2,9,3,3,9),(65,'<p>111</p>','2020-05-24 14:10:41.316278',2,23,3,3,23),(66,'<p>111</p>','2020-05-24 14:10:51.992196',2,23,3,3,23),(67,'<p>？？？</p>','2020-05-24 14:32:24.879383',2,64,3,3,9),(68,'<p>123</p>','2020-05-24 14:32:32.953353',2,64,3,3,9),(69,'<p><img alt=\"laugh\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/teeth_smile.png\" title=\"laugh\" width=\"23\" /></p>','2020-05-24 14:33:25.850013',2,63,3,3,9),(70,'<p><img alt=\"kiss\" height=\"23\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/kiss.png\" title=\"kiss\" width=\"23\" /></p>','2020-05-24 14:35:53.619012',2,15,3,3,15),(71,'<p>123</p>','2020-05-24 16:38:39.879971',4,29,3,3,29),(72,'<p>11</p>','2020-05-24 16:47:12.509980',4,NULL,3,NULL,NULL),(73,'<p>123</p>','2020-05-24 16:47:47.624137',4,72,3,3,72),(74,'<p>321</p>','2020-05-24 16:47:53.795841',4,NULL,3,NULL,NULL),(75,'<p>一楼</p>','2020-05-24 16:48:13.940565',16,NULL,3,NULL,NULL),(76,'<p>111</p>','2020-05-24 16:49:52.318658',16,75,3,3,75),(77,'<p>222</p>','2020-05-24 16:50:01.614134',16,76,3,3,75),(78,'<p>二楼</p>','2020-05-24 16:50:08.744062',16,NULL,3,NULL,NULL),(79,'<p>三楼</p>','2020-05-24 16:51:29.364393',16,NULL,3,NULL,NULL),(80,'<p>四楼</p>','2020-05-24 16:59:35.704072',16,NULL,3,NULL,NULL),(81,'<p>222</p>','2020-05-24 17:01:24.974431',16,78,3,3,78),(82,'<p>五楼</p>','2020-05-24 17:01:34.103603',16,NULL,3,NULL,NULL),(83,'<p>六楼</p>','2020-05-24 17:02:52.835173',16,NULL,3,NULL,NULL),(84,'<p>七楼</p>','2020-05-24 17:03:57.496132',16,NULL,3,NULL,NULL),(85,'<p>八楼</p>','2020-05-24 17:06:37.589999',16,NULL,3,NULL,NULL),(86,'<p>九楼</p>','2020-05-24 17:10:01.355180',16,NULL,3,NULL,NULL),(87,'<p>十楼</p>','2020-05-24 17:13:07.979092',16,NULL,3,NULL,NULL),(88,'<p>333</p>','2020-05-24 17:13:24.612407',16,77,3,3,75),(89,'<p>十一</p>','2020-05-24 17:18:54.874116',16,NULL,3,NULL,NULL),(90,'<p>11</p>','2020-05-24 17:19:02.225175',16,89,3,3,89),(91,'<p>评论测试</p>','2020-05-28 14:00:33.893464',15,NULL,3,NULL,NULL),(92,'<p>评论测试</p>','2020-05-28 14:00:37.592525',15,NULL,3,NULL,NULL),(93,'<p>测试评论</p>','2020-05-28 14:05:10.435913',15,NULL,3,NULL,NULL),(94,'<p>消息通知</p>','2020-05-28 14:05:38.092476',15,91,3,3,91),(95,'<p>消息通知1</p>','2020-05-28 21:09:16.403535',15,94,3,3,91),(96,'<p>消息通知测试</p>','2020-05-28 21:24:40.309693',15,NULL,3,NULL,NULL),(97,'<p>消息通知测试1</p>','2020-05-28 21:26:15.422918',15,96,3,3,96),(98,'<p>消息通知测试2</p>','2020-05-28 21:30:53.975468',15,NULL,3,NULL,NULL),(99,'<p>消息通知测试3</p>','2020-05-28 21:33:49.205451',15,NULL,3,NULL,NULL),(100,'<p>消息通知测试4</p>','2020-05-28 21:37:48.573586',15,NULL,3,NULL,NULL),(101,'<p>消息通知测试5</p>','2020-05-28 21:44:51.569865',15,NULL,3,NULL,NULL),(102,'<p>666</p>','2020-05-28 21:44:59.040424',15,101,3,3,101),(103,'<p>站内消息通知</p>','2020-05-29 13:28:14.597080',15,NULL,3,NULL,NULL),(104,'<p>站内消息</p>','2020-05-29 13:33:08.306842',15,NULL,3,NULL,NULL),(105,'<p>测试1</p>','2020-05-29 13:42:48.927292',15,NULL,3,NULL,NULL),(106,'<p>111</p>','2020-05-29 13:45:29.170221',15,NULL,3,NULL,NULL),(107,'<p>111</p>','2020-05-29 13:46:01.365254',15,NULL,3,NULL,NULL),(108,'<p>123</p>','2020-05-29 13:46:07.891453',15,NULL,3,NULL,NULL),(109,'<p>321</p>','2020-05-29 13:46:37.969199',15,NULL,3,NULL,NULL),(110,'<p>测试again</p>','2020-05-29 13:53:23.466411',15,NULL,3,NULL,NULL),(111,'<p>测试again</p>','2020-05-29 14:01:29.514905',15,NULL,3,NULL,NULL),(112,'<p>test again</p>','2020-05-29 14:08:47.189737',15,NULL,3,NULL,NULL),(113,'<p>message</p>','2020-05-29 20:37:42.917814',15,NULL,3,NULL,NULL),(114,'<p>message2</p>','2020-05-29 20:39:11.788930',15,NULL,3,NULL,NULL),(115,'<p>message1</p>','2020-05-29 20:39:28.309399',15,113,3,3,113),(116,'<p>回复一条</p>','2020-05-29 20:41:00.997106',15,93,3,3,93),(117,'<p>一条回复</p>','2020-05-29 21:40:47.736729',15,92,3,3,92),(118,'<p>test</p>','2020-05-29 21:59:39.554517',15,95,3,3,91),(119,'<p>一条</p>','2020-05-29 22:06:52.725571',15,117,3,3,92),(120,'<p>111</p>','2020-05-29 22:13:00.499694',15,118,3,3,91),(121,'<p>嘿嘿</p>','2020-05-29 22:23:18.041776',15,116,3,3,93);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ouser_bbs_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ouser_bbs_user_id` FOREIGN KEY (`user_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-05 11:26:22.646237','2','admin01',1,'[{\"added\": {}}]',11,1),(2,'2020-05-05 11:26:40.324557','1','wjc',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u5934\\u50cf\"]}}]',11,1),(3,'2020-05-05 11:27:17.496439','2','admin01',2,'[{\"changed\": {\"fields\": [\"\\u5934\\u50cf\"]}}]',11,1),(4,'2020-05-05 11:27:40.643086','1','测试',1,'[{\"added\": {}}]',7,1),(5,'2020-05-05 11:27:48.151143','2','技术交流',1,'[{\"added\": {}}]',7,1),(6,'2020-05-05 11:27:56.286253','3','生活点滴',1,'[{\"added\": {}}]',7,1),(7,'2020-05-05 11:28:00.109762','4','运动健身',1,'[{\"added\": {}}]',7,1),(8,'2020-05-05 11:28:21.586715','5','挥斥方遒',1,'[{\"added\": {}}]',7,1),(9,'2020-05-05 11:28:36.844643','1','测试01',1,'[{\"added\": {}}]',8,1),(10,'2020-05-05 11:28:44.333487','2','p',1,'[{\"added\": {}}]',8,1),(11,'2020-05-05 11:28:48.989546','2','python',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]',8,1),(12,'2020-05-05 11:29:05.101753','3','健身打卡',1,'[{\"added\": {}}]',8,1),(13,'2020-05-05 11:29:15.716020','4','行走纪事',1,'[{\"added\": {}}]',8,1),(14,'2020-05-05 11:29:36.809560','5','bbb',1,'[{\"added\": {}}]',8,1),(15,'2020-05-05 11:29:45.333463','1','测试',1,'[{\"added\": {}}]',9,1),(16,'2020-05-05 11:29:52.170017','2','test',1,'[{\"added\": {}}]',9,1),(17,'2020-05-05 11:29:58.332031','1','测试',1,'[{\"added\": {}}]',10,1),(18,'2020-05-05 11:30:02.476471','2','test',1,'[{\"added\": {}}]',10,1),(19,'2020-05-05 11:30:40.070312','1','测试1',1,'[{\"added\": {}}]',6,1),(20,'2020-05-05 11:30:59.720639','2','test2',1,'[{\"added\": {}}]',6,1),(21,'2020-05-05 11:31:19.933794','3','测试3',1,'[{\"added\": {}}]',6,1),(22,'2020-05-07 04:58:28.294294','1','哦嚯，哦豁，哦吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼',1,'[{\"added\": {}}]',12,1),(23,'2020-05-07 04:58:54.658637','2','what the fuck',1,'[{\"added\": {}}]',12,1),(24,'2020-05-07 04:59:28.615357','3','2020/5/7，hhhhhhhhhhhhhhhhhh',1,'[{\"added\": {}}]',12,1),(25,'2020-05-07 14:33:33.812893','7','1',3,'',12,1),(26,'2020-05-08 14:26:48.711157','4','ched_yu',2,'[{\"changed\": {\"fields\": [\"Last login\", \"\\u5934\\u50cf\"]}}]',11,1),(27,'2020-05-08 14:27:13.184083','11','hahhhahahahaahahahahhaa',1,'[{\"added\": {}}]',12,1),(28,'2020-05-08 14:27:33.053921','12','hiheieheiiheieheieheiee',1,'[{\"added\": {}}]',12,1),(29,'2020-05-08 14:27:47.006882','13','prprprprprprprprprprpr',1,'[{\"added\": {}}]',12,1),(30,'2020-05-08 14:27:57.488367','14','bubuubbubububububuubub',1,'[{\"added\": {}}]',12,1),(31,'2020-05-18 22:51:24.191591','5','test5',2,'[{\"changed\": {\"fields\": [\"Content\", \"\\u5173\\u952e\\u8bcd\", \"\\u6807\\u7b7e\"]}}]',6,1),(32,'2020-05-18 23:03:55.834717','5','test5',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',6,1),(33,'2020-05-18 23:05:37.664330','5','test5',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',6,1),(34,'2020-05-21 21:42:35.469274','2','what the fuck',2,'[{\"changed\": {\"fields\": [\"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(35,'2020-05-21 21:42:44.743703','2','what the fuck',2,'[{\"changed\": {\"fields\": [\"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(36,'2020-05-21 21:45:48.923661','2','what the fuck',2,'[{\"changed\": {\"fields\": [\"\\u6839\\u6e90\\u8bc4\\u8bba\"]}}]',12,1),(37,'2020-05-21 21:48:46.751177','11','hahhhahahahaahahahahhaa',2,'[{\"changed\": {\"fields\": [\"\\u6839\\u6e90\\u8bc4\\u8bba\", \"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(38,'2020-05-21 21:49:00.804678','12','hiheieheiiheieheieheiee',2,'[{\"changed\": {\"fields\": [\"\\u6839\\u6e90\\u8bc4\\u8bba\", \"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(39,'2020-05-21 21:49:17.849339','13','prprprprprprprprprprpr',2,'[{\"changed\": {\"fields\": [\"\\u6839\\u6e90\\u8bc4\\u8bba\", \"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(40,'2020-05-21 21:49:27.128264','14','bubuubbubububububuubub',2,'[{\"changed\": {\"fields\": [\"\\u4e0a\\u7ea7\\u8bc4\\u8bba\\u7528\\u6237\"]}}]',12,1),(41,'2020-05-22 18:29:39.087600','6','bbs06',1,'[{\"added\": {}}]',6,1),(42,'2020-05-22 18:30:11.523927','7','bbs07',1,'[{\"added\": {}}]',6,1),(43,'2020-05-22 18:30:38.683553','8','bbs08',1,'[{\"added\": {}}]',6,1),(44,'2020-05-22 21:31:07.653647','9','bbs09',1,'[{\"added\": {}}]',6,1),(45,'2020-05-22 21:31:26.609418','10','bbs10',1,'[{\"added\": {}}]',6,1),(46,'2020-05-22 21:31:42.090870','11','bbs11',1,'[{\"added\": {}}]',6,1),(47,'2020-05-22 21:31:55.478362','12','bbs12',1,'[{\"added\": {}}]',6,1),(48,'2020-05-22 21:32:08.395949','13','bbs13',1,'[{\"added\": {}}]',6,1),(49,'2020-05-22 21:32:34.522856','14','bbs14',1,'[{\"added\": {}}]',6,1),(50,'2020-05-22 21:32:52.117543','15','bbs15',1,'[{\"added\": {}}]',6,1),(51,'2020-05-22 21:33:10.105566','16','test16',1,'[{\"added\": {}}]',6,1),(52,'2020-05-27 21:43:17.146083','5','admin007',3,'',11,1),(53,'2020-05-28 22:51:57.828680','1','admin02 admin02评论了《bbs15》 8 小时，46 分钟 ago',2,'[{\"changed\": {\"fields\": [\"Unread\", \"Actor object id\"]}}]',15,1),(54,'2020-05-28 22:52:04.282713','2','admin02 admin02回复了你的评论“评论测试” 8 小时，47 分钟 ago',2,'[{\"changed\": {\"fields\": [\"Unread\", \"Actor object id\"]}}]',15,1),(55,'2020-05-29 13:23:58.617936','16','admin02 admin02 点赞了你的《bbs15》 LoveRecord object (16) 15 小时，20 分钟 ago',3,'',15,1),(56,'2020-05-29 13:23:58.622923','15','admin02 admin02回复了你的评论“消息通知测试5” 15 小时，38 分钟 ago',3,'',15,1),(57,'2020-05-29 13:23:58.626912','14','admin02 admin02评论了《bbs15》 15 小时，39 分钟 ago',3,'',15,1),(58,'2020-05-29 13:23:58.631899','13','admin02 admin02评论了《bbs15》 15 小时，46 分钟 ago',3,'',15,1),(59,'2020-05-29 13:23:58.635888','12','admin02 admin02评论了《bbs15》 15 小时，46 分钟 ago',3,'',15,1),(60,'2020-05-29 13:23:58.639878','11','admin02 admin02评论了《bbs15》 15 小时，50 分钟 ago',3,'',15,1),(61,'2020-05-29 13:23:58.643867','10','admin02 admin02评论了《bbs15》 15 小时，50 分钟 ago',3,'',15,1),(62,'2020-05-29 13:23:58.647856','9','admin02 admin02评论了《bbs15》 15 小时，53 分钟 ago',3,'',15,1),(63,'2020-05-29 13:23:58.652843','8','admin02 admin02评论了《bbs15》 15 小时，53 分钟 ago',3,'',15,1),(64,'2020-05-29 13:23:58.655835','7','admin02 admin02回复了你的评论“消息通知测试” 15 小时，57 分钟 ago',3,'',15,1),(65,'2020-05-29 13:23:58.658827','6','admin02 admin02评论了《bbs15》 15 小时，57 分钟 ago',3,'',15,1),(66,'2020-05-29 13:23:58.662818','5','admin02 admin02评论了《bbs15》 15 小时，59 分钟 ago',3,'',15,1),(67,'2020-05-29 13:23:58.666808','4','admin02 admin02评论了《bbs15》 15 小时，59 分钟 ago',3,'',15,1),(68,'2020-05-29 13:23:58.670795','3','admin02 admin02回复了你的评论“消息通知” 16 小时，14 分钟 ago',3,'',15,1),(69,'2020-05-29 13:23:58.674785','2','admin02 admin02回复了你的评论“评论测试” 23 小时，18 分钟 ago',3,'',15,1),(70,'2020-05-29 13:23:58.678782','1','admin02 admin02评论了《bbs15》 23 小时，18 分钟 ago',3,'',15,1),(71,'2020-05-29 13:24:34.027247','91','<p>评论测试</p>',3,'',12,1),(72,'2020-05-29 13:24:34.036541','92','<p>评论测试</p>',3,'',12,1),(73,'2020-05-29 13:24:34.040211','93','<p>测试评论</p>',3,'',12,1),(74,'2020-05-29 13:24:34.045206','94','<p>消息通知</p>',3,'',12,1),(75,'2020-05-29 13:24:34.048189','95','<p>消息通知1</p>',3,'',12,1),(76,'2020-05-29 13:24:34.052180','96','<p>消息通知测试</p>',3,'',12,1),(77,'2020-05-29 13:24:34.056187','97','<p>消息通知测试1</p>',3,'',12,1),(78,'2020-05-29 13:24:34.059160','98','<p>消息通知测试2</p>',3,'',12,1),(79,'2020-05-29 13:24:34.063149','99','<p>消息通知测试3</p>',3,'',12,1),(80,'2020-05-29 13:24:34.066141','100','<p>消息通知测试4</p>',3,'',12,1),(81,'2020-05-29 13:24:34.071132','101','<p>消息通知测试5</p>',3,'',12,1),(82,'2020-05-29 13:25:40.623772','101','<p>消息通知测试5</p>',3,'',12,1),(85,'2020-05-30 13:25:00.568677','16','test16',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',6,1),(86,'2020-05-30 20:46:59.424016','20','bbs17',3,'',6,1),(87,'2020-05-30 20:46:59.433937','19','bbs17',3,'',6,1),(88,'2020-05-30 20:46:59.436933','18','bbs17',3,'',6,1),(89,'2020-05-31 21:54:28.629675','3','admin02',2,'[{\"changed\": {\"fields\": [\"Last login\", \"Staff status\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'app01','bbs'),(7,'app01','bigcategory'),(8,'app01','category'),(9,'app01','keyword'),(14,'app01','lovecount'),(13,'app01','loverecord'),(10,'app01','tag'),(3,'auth','group'),(2,'auth','permission'),(16,'captcha','captchastore'),(12,'comment','comment'),(4,'contenttypes','contenttype'),(15,'notifications','notification'),(11,'ouser','bbs_user'),(17,'ouser','follow'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-05 11:22:53.526121'),(2,'contenttypes','0002_remove_content_type_name','2020-05-05 11:22:53.694669'),(3,'auth','0001_initial','2020-05-05 11:22:53.832301'),(4,'auth','0002_alter_permission_name_max_length','2020-05-05 11:22:54.300075'),(5,'auth','0003_alter_user_email_max_length','2020-05-05 11:22:54.307056'),(6,'auth','0004_alter_user_username_opts','2020-05-05 11:22:54.315070'),(7,'auth','0005_alter_user_last_login_null','2020-05-05 11:22:54.322044'),(8,'auth','0006_require_contenttypes_0002','2020-05-05 11:22:54.326005'),(9,'auth','0007_alter_validators_add_error_messages','2020-05-05 11:22:54.333984'),(10,'auth','0008_alter_user_username_max_length','2020-05-05 11:22:54.340966'),(11,'auth','0009_alter_user_last_name_max_length','2020-05-05 11:22:54.347946'),(12,'auth','0010_alter_group_name_max_length','2020-05-05 11:22:54.367893'),(13,'auth','0011_update_proxy_permissions','2020-05-05 11:22:54.375873'),(14,'ouser','0001_initial','2020-05-05 11:22:54.522481'),(15,'admin','0001_initial','2020-05-05 11:22:55.167755'),(16,'admin','0002_logentry_remove_auto_add','2020-05-05 11:22:55.397141'),(17,'admin','0003_logentry_add_action_flag_choices','2020-05-05 11:22:55.408111'),(18,'app01','0001_initial','2020-05-05 11:22:55.676394'),(19,'app01','0002_auto_20200505_1922','2020-05-05 11:22:56.730575'),(20,'comment','0001_initial','2020-05-05 11:22:57.507498'),(21,'comment','0002_comment_user','2020-05-05 11:22:57.872522'),(22,'sessions','0001_initial','2020-05-05 11:22:57.919396'),(23,'app01','0003_auto_20200517_1055','2020-05-17 02:55:58.277473'),(24,'comment','0003_auto_20200517_2135','2020-05-17 13:36:03.447813'),(25,'app01','0004_auto_20200518_2247','2020-05-18 22:47:58.052845'),(26,'app01','0005_auto_20200518_2302','2020-05-18 23:02:16.843608'),(27,'comment','0004_auto_20200521_2121','2020-05-21 21:21:39.249099'),(28,'comment','0005_auto_20200521_2133','2020-05-21 21:33:50.270583'),(29,'app01','0006_auto_20200523_1332','2020-05-23 13:32:23.636117'),(30,'notifications','0001_initial','2020-05-27 23:01:29.095595'),(31,'notifications','0002_auto_20150224_1134','2020-05-27 23:01:29.631498'),(32,'notifications','0003_notification_data','2020-05-27 23:01:29.668399'),(33,'notifications','0004_auto_20150826_1508','2020-05-27 23:01:29.683359'),(34,'notifications','0005_auto_20160504_1520','2020-05-27 23:01:29.699579'),(35,'notifications','0006_indexes','2020-05-27 23:01:29.840172'),(36,'notifications','0007_add_timestamp_index','2020-05-27 23:01:29.882059'),(37,'notifications','0008_index_together_recipient_unread','2020-05-27 23:01:29.922950'),(38,'captcha','0001_initial','2020-06-01 21:17:46.894393'),(39,'comment','0006_auto_20200601_2117','2020-06-01 21:17:46.911346'),(40,'ouser','0002_follow','2020-06-02 22:15:11.445932');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bcam7rlzttbr9thcqt4ng0hwmbntqq74','NjRkYzA5MTEyZDE4YmZkMzVmMzY2MDQ1Y2E1ZGRhZmIwNGUwMzVhOTp7ImlzX3JlYWRfMjMiOjE1OTEwMjMzNDcuNDIxNzY3LCJpc19yZWFkXzIxIjoxNTkxMDIzNjk4LjUwOTE5NCwiaXNfcmVhZF8yNSI6MTU5MTAyMzczNC44NzIyMDUzLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWYzNTViNjc2M2VlNmZlYjY3N2M4N2QzN2EwNDhlMTkxNTE4MGMyNyIsInVzZXJuYW1lYWRtaW4wMiI6ImFkbWluMDIiLCJ1aWRhZG1pbjAyIjozLCJuaWNrIjpudWxsLCJ0aWQiOm51bGx9','2020-06-16 12:13:21.010519'),('ozoa41yfwr1ok7wzxxsubbrs89v11xw9','YTgzOTc1Nzk1ZTFhNWVhOGZkZjY2ZDQ4NWZlNzEyOWI0NDUyMDRiZjp7ImlzX3JlYWRfMTYiOjE1OTAzMjUzMDcuOTg3MzE1MiwiaXNfcmVhZF8yMSI6MTU5MDkxMDgyMy41MDIzNTh9','2020-06-14 15:40:23.727753'),('qd6tg1za0hm2ahalen9l8zj4ttzvprk6','OGFkYjUxYzVhZTAwN2E2OGQ2MTAyMWQ0MzRiYzVjMDhkMTVlNDNlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MWU4OGNhY2ExYzEwN2Y3YjY2NWE2NzgyNDU1MDZhMDI5NGEwNzYxIiwiaXNfcmVhZF8yNSI6MTU5MTE5MzQwNC4zNDg0ODY3fQ==','2020-06-17 22:10:04.610591'),('ss8sseq0294vcwvunyzttng4j6gs2j1v','YzBjZTJmNzdkZjgwZDFkY2I3NjFlYjJkN2NiMWRhNjQyZTg5MWZiOTp7ImlzX3JlYWRfMjUiOjE1OTExMDM3NDcuNjM0ODY4MSwiaXNfcmVhZF82IjoxNTkxMTA1NDk3Ljk4MDA4MDZ9','2020-06-16 21:44:58.035475');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_notification`
--

DROP TABLE IF EXISTS `notifications_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `actor_object_id` varchar(255) NOT NULL,
  `verb` varchar(255) NOT NULL,
  `description` longtext,
  `target_object_id` varchar(255) DEFAULT NULL,
  `action_object_object_id` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `action_object_content_type_id` int DEFAULT NULL,
  `actor_content_type_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `target_content_type_id` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `emailed` tinyint(1) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co` (`action_object_content_type_id`),
  KEY `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co` (`actor_content_type_id`),
  KEY `notifications_notifi_target_content_type__ccb24d88_fk_django_co` (`target_content_type_id`),
  KEY `notifications_notification_deleted_b32b69e6` (`deleted`),
  KEY `notifications_notification_emailed_23a5ad81` (`emailed`),
  KEY `notifications_notification_public_1bc30b1c` (`public`),
  KEY `notifications_notification_unread_cce4be30` (`unread`),
  KEY `notifications_notification_timestamp_6a797bad` (`timestamp`),
  KEY `notifications_notification_recipient_id_unread_253aadc9_idx` (`recipient_id`,`unread`),
  CONSTRAINT `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co` FOREIGN KEY (`action_object_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co` FOREIGN KEY (`actor_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notifications_notifi_recipient_id_d055f3f0_fk_ouser_bbs` FOREIGN KEY (`recipient_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `notifications_notifi_target_content_type__ccb24d88_fk_django_co` FOREIGN KEY (`target_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_notification`
--

LOCK TABLES `notifications_notification` WRITE;
/*!40000 ALTER TABLE `notifications_notification` DISABLE KEYS */;
INSERT INTO `notifications_notification` VALUES (25,'info',0,'3','admin02回复了你的评论“评论测试”','/article/15/',NULL,NULL,'2020-05-29 21:40:47.751689',1,NULL,11,3,NULL,0,0,NULL),(26,'info',0,'3','admin02回复了你的评论“消息通知1”','/article/15/',NULL,NULL,'2020-05-29 21:59:39.571440',1,NULL,11,3,NULL,0,0,NULL),(27,'info',0,'3','admin02回复了你的评论“一条回复”','/article/15/',NULL,NULL,'2020-05-29 22:06:52.743524',1,NULL,11,3,NULL,0,0,NULL),(28,'info',0,'3','admin02回复了你的评论“test”','/article/15/',NULL,NULL,'2020-05-29 22:13:00.516638',1,NULL,11,3,NULL,0,0,NULL),(29,'info',0,'3','admin02回复了你的评论“回复一条”','/article/15/',NULL,NULL,'2020-05-29 22:23:18.053699',1,NULL,11,3,NULL,0,0,NULL),(30,'info',1,'3','admin02回复了你的评论“消息通知测试2”','/article/15/',NULL,NULL,'2020-05-29 22:27:10.389152',1,NULL,11,3,NULL,0,0,NULL);
/*!40000 ALTER TABLE `notifications_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouser_bbs_user`
--

DROP TABLE IF EXISTS `ouser_bbs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ouser_bbs_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `signature` varchar(128) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouser_bbs_user`
--

LOCK TABLES `ouser_bbs_user` WRITE;
/*!40000 ALTER TABLE `ouser_bbs_user` DISABLE KEYS */;
INSERT INTO `ouser_bbs_user` VALUES (1,'pbkdf2_sha256$180000$1O5hFScoIGA0$S78doWEbzychognllyf5RXLWiHTVsCdbAviHvo8ceZE=','2020-06-03 22:00:47.694163',1,'wjc','','','970884043@qq.com',1,1,'2020-05-05 11:24:00.000000','此人甚懒','avatar/2020/05/05/xz.jpg'),(2,'9696jcjc',NULL,0,'admin01','','','',0,1,'2020-05-05 11:25:00.000000','此人甚懒','avatar/2020/05/05/xz_D01Z77U.jpg'),(3,'pbkdf2_sha256$180000$ftn2B6TtPxTg$N3s8h0NZwg/Ko7jsaEDbGv1Fcw7MOkIhyLMXvvoO3to=','2020-06-02 22:26:35.700806',0,'admin02','','','1000460543@smail.com',1,1,'2020-05-05 12:54:00.000000','此人甚懒','avatar/2020/06/01/v2-f34fc9f2ad7c6705decc00bac0d0b962_720w.jpg'),(4,'pbkdf2_sha256$180000$VvOfUO6t0B7f$FaiEWQeANQxQm/dAurTrlUXDmoIxS16w9N74m59nWGw=','2020-06-01 18:09:37.901825',0,'ched_yu','','','1769049720@qq.com',0,1,'2020-05-07 04:48:00.000000','此人甚懒','avatar/2020/05/08/1142366-20180816104523744-509861422.png'),(6,'pbkdf2_sha256$180000$v43HLOQ138LZ$m6K87tRx7AoR2ku+4J/R/hiVO/UWn3wQpKB2h5gRoqc=','2020-05-27 22:03:08.155694',0,'admin007','','','jcjc_jjc@163.com',0,1,'2020-05-27 22:03:07.780287','此人甚懒','avatar/default.png');
/*!40000 ALTER TABLE `ouser_bbs_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouser_bbs_user_groups`
--

DROP TABLE IF EXISTS `ouser_bbs_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ouser_bbs_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bbs_user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ouser_bbs_user_groups_bbs_user_id_group_id_f0d7bf64_uniq` (`bbs_user_id`,`group_id`),
  KEY `ouser_bbs_user_groups_group_id_f9d01e69_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ouser_bbs_user_groups_bbs_user_id_1a98b878_fk_ouser_bbs_user_id` FOREIGN KEY (`bbs_user_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `ouser_bbs_user_groups_group_id_f9d01e69_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouser_bbs_user_groups`
--

LOCK TABLES `ouser_bbs_user_groups` WRITE;
/*!40000 ALTER TABLE `ouser_bbs_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ouser_bbs_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouser_bbs_user_user_permissions`
--

DROP TABLE IF EXISTS `ouser_bbs_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ouser_bbs_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bbs_user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ouser_bbs_user_user_perm_bbs_user_id_permission_i_579812d0_uniq` (`bbs_user_id`,`permission_id`),
  KEY `ouser_bbs_user_user__permission_id_a88e4d32_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ouser_bbs_user_user__bbs_user_id_94834b25_fk_ouser_bbs` FOREIGN KEY (`bbs_user_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `ouser_bbs_user_user__permission_id_a88e4d32_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouser_bbs_user_user_permissions`
--

LOCK TABLES `ouser_bbs_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `ouser_bbs_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ouser_bbs_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ouser_follow`
--

DROP TABLE IF EXISTS `ouser_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ouser_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `followed_id` int NOT NULL,
  `follower_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ouser_follow_followed_id_098acb60_fk_ouser_bbs_user_id` (`followed_id`),
  KEY `ouser_follow_follower_id_6cc93496_fk_ouser_bbs_user_id` (`follower_id`),
  CONSTRAINT `ouser_follow_followed_id_098acb60_fk_ouser_bbs_user_id` FOREIGN KEY (`followed_id`) REFERENCES `ouser_bbs_user` (`id`),
  CONSTRAINT `ouser_follow_follower_id_6cc93496_fk_ouser_bbs_user_id` FOREIGN KEY (`follower_id`) REFERENCES `ouser_bbs_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ouser_follow`
--

LOCK TABLES `ouser_follow` WRITE;
/*!40000 ALTER TABLE `ouser_follow` DISABLE KEYS */;
INSERT INTO `ouser_follow` VALUES (6,'2020-06-02 23:13:19.313047',3,3),(7,'2020-06-02 23:14:28.091973',3,1);
/*!40000 ALTER TABLE `ouser_follow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-04 21:15:59
