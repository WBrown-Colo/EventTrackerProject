-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cigarsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cigarsdb` ;

-- -----------------------------------------------------
-- Schema cigarsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cigarsdb` DEFAULT CHARACTER SET utf8 ;
USE `cigarsdb` ;

-- -----------------------------------------------------
-- Table `origin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `origin` ;

CREATE TABLE IF NOT EXISTS `origin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shape`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shape` ;

CREATE TABLE IF NOT EXISTS `shape` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `img_url` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cigar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cigar` ;

CREATE TABLE IF NOT EXISTS `cigar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `length_ring` VARCHAR(45) NULL,
  `shade` VARCHAR(45) NULL,
  `strength` VARCHAR(45) NULL,
  `single_price` DOUBLE NULL,
  `year_introduced` VARCHAR(45) NULL,
  `create_date` DATE NULL,
  `last_update` DATE NULL,
  `image_url` LONGTEXT NULL,
  `origin_id` INT NOT NULL,
  `shape_id` INT NOT NULL,
  `wrapper_origin_id` INT NOT NULL,
  `binder_origin_id` INT NOT NULL,
  `filler_origin_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cigar_origin1_idx` (`origin_id` ASC) VISIBLE,
  INDEX `fk_cigar_shape1_idx` (`shape_id` ASC) VISIBLE,
  INDEX `fk_cigar_origin2_idx` (`wrapper_origin_id` ASC) VISIBLE,
  INDEX `fk_cigar_origin3_idx` (`binder_origin_id` ASC) VISIBLE,
  INDEX `fk_cigar_origin4_idx` (`filler_origin_id` ASC) VISIBLE,
  CONSTRAINT `fk_cigar_origin1`
    FOREIGN KEY (`origin_id`)
    REFERENCES `origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cigar_shape1`
    FOREIGN KEY (`shape_id`)
    REFERENCES `shape` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cigar_origin2`
    FOREIGN KEY (`wrapper_origin_id`)
    REFERENCES `origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cigar_origin3`
    FOREIGN KEY (`binder_origin_id`)
    REFERENCES `origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cigar_origin4`
    FOREIGN KEY (`filler_origin_id`)
    REFERENCES `origin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory_item` ;

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `date_acquired` DATE NULL,
  `cigar_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_humidor_cigar1_idx` (`cigar_id` ASC) VISIBLE,
  CONSTRAINT `fk_humidor_cigar1`
    FOREIGN KEY (`cigar_id`)
    REFERENCES `cigar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS cigarcollector@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'cigarcollector'@'localhost' IDENTIFIED BY 'SD45';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'cigarcollector'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `origin`
-- -----------------------------------------------------
START TRANSACTION;
USE `cigarsdb`;
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (1, 'Cuba', 'Famous for premium cigar tobacco, particularly from the Pinar del Río region. Known for its Habano cigars.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (2, 'Dominican Republic', 'One of the largest producers of cigar tobacco. The Cibao Valley is a notable region for high-quality leaf production.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (3, 'Nicaragua', 'Grows some of the finest cigar tobaccos, especially in regions like Estelí, Condega, and Jalapa Valley.\nKnown for rich and full-bodied cigar profiles.\n');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (4, 'Honduras', 'Produces high-quality cigar tobacco, especially in the Jamastrán and Copán valleys.\nOften compared to Nicaraguan and Cuban tobacco.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (5, 'Jamaica', 'Historically significant in cigar production.\nThe Blue Mountain region produces aromatic tobacco.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (6, 'Brazil', 'Famous for Mata Fina and Mata Norte tobacco, used in cigar wrappers and fillers.\nProduces rich, dark tobacco leaves.\n');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (7, 'Connecticut (US)', 'Connecticut is famous for its Connecticut Shade and Broadleaf tobacco, often used as wrappers.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (8, 'Tennessee (US)', 'Tennessee produces dark-fired tobacco for certain cigar blends.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (9, 'Kentucky (US)', 'Kentucky produces dark-fired tobacco for certain cigar blends.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (10, 'Spain', 'Grows tobacco in the Canary Islands, particularly for local and boutique cigar production.\n');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (11, 'Indonesia', 'Known for Sumatra tobacco, particularly in Sumatra and Java.\nProduces mild and aromatic tobacco used in wrappers and fillers.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (12, 'Phillippines', 'Grows cigar tobacco primarily for domestic and international markets.\nFamous for milder tobacco blends.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (13, 'Cameroon', 'Produces world-renowned Cameroon wrapper tobacco.\nTobacco from this region is known for its smoothness and unique flavor.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (14, 'Mexico', 'San Andrés Valley: Renowned for producing rich, earthy tobacco often used in maduro wrappers.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (15, 'Ecuador', 'Benefiting from ideal cloud cover and climate, Ecuador produces high-quality wrapper leaves, including Connecticut Shade and Sumatra varieties.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (16, 'Italy', 'Produces cigar tobacco, particularly in the Tuscany region, known for its distinctive Toscano cigars.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (17, 'Greece', 'Cultivates tobacco used in both cigarettes and cigars, with certain regions specializing in aromatic varieties.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (18, 'Turkey', 'Known for producing Oriental tobacco, which is sometimes used in cigar blends for its aromatic qualities.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (19, 'Costa Rica', 'Produces high-quality cigar tobacco, often used in boutique cigar production.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (20, 'Panama', 'Cultivates cigar tobacco, contributing to the diversity of Central American cigar offerings.');
INSERT INTO `origin` (`id`, `name`, `description`) VALUES (21, 'Multiple Countries', 'Multiple leaf origins are used.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shape`
-- -----------------------------------------------------
START TRANSACTION;
USE `cigarsdb`;
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (1, 'Corona', 'Size: ~5.5 inches, 42–44 ring gauge\nA classic cigar size with a balanced smoking experience.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (2, 'Petit Corona', 'Size: ~4.5 inches, 40–42 ring gauge\nA smaller version of the Corona, ideal for a quicker smoke.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (3, 'Robusto', 'Size: ~5 inches, 50 ring gauge\nA popular size, known for a short, flavorful smoke.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (4, 'Churchill', 'Size: ~7 inches, 47–50 ring gauge\nNamed after Winston Churchill, offering a long and refined smoking session.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (5, 'Toro', 'Size: ~6 inches, 50–54 ring gauge\nA longer version of the Robusto, often preferred by seasoned smokers.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (6, 'Panetela', 'Size: ~6–7.5 inches, 34–38 ring gauge\nA thin and elegant cigar, offering a longer, slower smoke.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (7, 'Lancero', 'Size: ~7–7.5 inches, 38 ring gauge\nA narrow cigar, often associated with complex flavor delivery.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (8, 'Double Corona', 'Size: ~7.5–8 inches, 49–52 ring gauge\nA large, luxurious cigar for extended smoking sessions.\n', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (9, 'Lonsdale', 'Size: ~6.5 inches, 42 ring gauge\nSlightly longer than a Corona, offering a medium-length experience.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (10, 'Gordo (Gigante)', 'Size: ~6 inches, 60+ ring gauge\nThick cigars for those who prefer a long and hearty smoke.\n', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (11, 'Presidente (Gran Corona)', 'Size: ~8 inches, 52+ ring gauge\nA large and impressive cigar for celebratory occasions.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (12, 'Torpedo', 'Size: Varies; tapered at the head\nKnown for its distinct shape, which enhances flavor concentration.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (13, 'Perfecto', 'Size: Varies; tapered at both ends\nA classic shape with a unique draw and smoking experience.\n', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (14, 'Cigarillo', 'Size: ~3–4 inches, 26–34 ring gauge\nA very small cigar, often for a quick smoke.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (15, 'Cheroot', 'Size: ~4–6 inches, small ring gauge\nAn open-ended, rustic-style cigar.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (16, 'Half Corona', 'Size: ~3.5–4 inches, 42 ring gauge\nA smaller version of the classic Corona for shorter sessions.\n', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (17, 'Diadema', 'Size: ~8 inches, tapered head and foot\nA large and artistic cigar.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (18, 'Salomon', 'Size: ~7 inches, ~57 ring gauge at its widest\nA pointed foot and tapered shape for a unique experience.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (19, 'Pyramid', 'Size: Varies; tapered head\nSimilar to the Torpedo, but with a longer taper.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (20, 'Box Pressed', 'Flattened sides with a square or rectangular profile.\nThe edges can range from sharply squared to slightly rounded, depending on the pressing process.', NULL);
INSERT INTO `shape` (`id`, `name`, `description`, `img_url`) VALUES (21, 'Parejo', 'A parejo cigar is the most traditional and common shape of a cigar. It is characterized by its straight, cylindrical body, even sides, and rounded head. Parejos come in a variety of sizes, ranging from small to very large, and they represent the classic look and feel that many cigar enthusiasts associate with premium cigars.', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cigar`
-- -----------------------------------------------------
START TRANSACTION;
USE `cigarsdb`;
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (1, 'Padron', '1964 Anniversary Series', 'Padron 1964 Anniversary Series Presidente Tube Maduro cigars were introduced 2017 to add an extra dimension of luxury to this classic, top-rated brand. The 1964 Anniversary Series was first introduced in 1994 to celebrate the 30th anniversary of Padron Cigars, and after several years the blend is still a favorite among the most discerning of connoisseurs. These 6 x 50 box-pressed treats are made entirely with estate-grown Nicaraguan tobaccos that have been aged for over 4 years, including the top-shelf maduro wrapper. Each cigar is housed in unique rectangular tubes, protecting the cigars so they can always provide a rich, complex, and delightfully smooth medium-bodied bouquet of chocolate, espresso, pepper, baking spices, roasted nuts, and creamy tobacco sweetness. Padron 1964 Anniversary Series Presidente Tube Maduro cigars were introduced 2017 to add an extra dimension of luxury to this classic, top-rated brand. The 1964 Anniversary Series was first introduced in 1994 to celebrate the 30th anniversary of Padron Cigars, and after several years the blend is still a favorite among the most discerning of connoisseurs. These 6x50 box-pressed treats are made entirely with estate-grown Nicaraguan tobaccos that have been aged for over 4 years, including the top-shelf maduro wrapper. Each cigar is housed in unique rectangular tubes, protecting the cigars so they can always provide a rich, complex, and delightfully smooth medium-bodied bouquet of chocolate, espresso, pepper, baking spices, roasted nuts, and creamy tobacco sweetness.', '6 x 50', 'Maduro', 'Medium', 20.50, '2017', '2025-01-24', '2025-01-24', 'https://www.casademontecristo.com/dw/image/v2/BCZK_PRD/on/demandware.static/-/Sites-masterCatalog/default/dw5db5b71a/images/Cigars%20Master%20Skus%20Images/PD64PT3_Single_up.png?sw=450&sh=450&sm=fit&q=80', 3, 21, 3, 3, 3);
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (2, 'My Father', 'Flor De Las Antillas', 'A big-ring smoke brimming with rich, vibrant flavors, the My Father Flor de Las Antillas Toro Grande is a celebration of the famous Garcia family’s Cuban heritage. Flor de Las Antillas, which translates to “Flower of the Antilles” from Spanish, is an old nickname for the island of Cuba given for being the largest and most beautiful of the Greater Antilles. To capture the style of old-world Cuban blends, these stocky 6x60 gems feature Cuban-seed long filler and binder tobaccos that were grown and aged on the Garcia family’s Nicaraguan farms all dressed in a top-quality Nicaraguan Sun Grown wrapper. Complex medium-full bodied flavors of cocoa, baking spices, leather, white pepper, tobacco sweetness, and creaminess will completely coat your palate, and the big-ring format will provide satisfy smoke production with every puff.', '6 x 60', 'Medium Brown', 'Medium Full', 10, '2012', '2025-01-25', '2025-01-25', 'https://www.casademontecristo.com/dw/image/v2/BCZK_PRD/on/demandware.static/-/Sites-masterCatalog/default/dwb39b3787/images/Serious%20Master%20Images/MFFTGR_single_up.jpg?sw=450&sh=450&sm=fit&q=80', 3, 20, 3, 3, 3);
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (3, 'Habanos S.A.', 'Hoyo de Monterrey', 'Hoyo de Monterrey Double Corona is a wonderful, classic, Cuban-style cigar. This engaging one-hour smoke is overflowing with earth, spicy tobacco, dark roast coffee, and savory chocolate flavors. Never too strong to become overpowering or bitter, yet bold enough to stand up to any meal or adult beverage that I pair with it.', '6.75 x 48', 'Maduro', 'Medium-Full', 9, '2013', '2025-01-25', '2025-01-25', 'https://www.cigars.com/dw/image/v2/BCZK_PRD/on/demandware.static/-/Sites-masterCatalog/default/dw59ff3859/images/cigars/H/Hoyo%20de%20Monterrey/HMDC3_single_up.png?sw=450&sh=450&sm=fit&q=80', 4, 8, 7, 7, 21);
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (4, 'Cohiba', 'Esplendidos', 'The Cohiba brand is one of the best-known cigar brands in the world, and the big, stately Esplendido is one of its most familiar sizes. Created in 1989 as part of the Línea Clásica series (along with the chunky Robusto and diminutive Exquisito), The Churchill-sized smoke packs a considerable punch, and at its best it showcases a level of power and complexity that is hard to find anywhere else. Recent production Cohiba Esplendidos show off rich, full-bodied flavors, such as salted caramel, black cherry and baked apple. The cigars, which were once made only at the small El Laguito Factory, are now so popular that they are produced in many factories, making consistent performance somewhat of a problem.', '7 x 47', 'Maduro', 'Medium-Full', 135, '2014', '2025-01-25', '2025-01-25', 'https://mshanken.imgix.net/cao/ratings_extras/cigars/17763-H.jpg', 1, 4, 1, 1, 1);
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (5, 'Punch', 'Golden Era Lancero', 'This long, thin cigar burns slow and cool, producing a dense smoke with each puff. Sweet and leathery, the cigar also shows notes of caramel, white pepper and earth. The finish is oaky and sweet like a rum barrel.', '7 x 38', 'Natural', 'Medium-Full', 11, '2023', '2025-01-25', '2025-01-25', 'https://www.jrcigars.com/dw/image/v2/BCZK_PRD/on/demandware.static/-/Sites-masterCatalog/default/dwfc321932/images/Images%20for%20JR%20Master%20List/JR%20Master%20List%203/PUGELA_single_up_1.jpg?sw=220&sh=220&sm=fit&q=80', 4, 21, 4, 4, 4);
INSERT INTO `cigar` (`id`, `brand`, `name`, `description`, `length_ring`, `shade`, `strength`, `single_price`, `year_introduced`, `create_date`, `last_update`, `image_url`, `origin_id`, `shape_id`, `wrapper_origin_id`, `binder_origin_id`, `filler_origin_id`) VALUES (6, 'ACID', 'Blue Kuba Kuba', 'The famous Kuba Kuba was one of the first cigars to start the ACID revolution. This hearty Robusto contains Nicaraguan Cuban-seed long filler tobaccos that are covered in a handsome Connecticut Broadleaf maduro wrapper. The finished product is infused with herbs and oils for an astoundingly distinct flavor and sweet floral aroma.', '5 x 54', 'Maduro', 'Medium', 11, '2009', '2025-01-25', '2025-01-25', 'https://c647068.ssl.cf2.rackcdn.com/products/007-055-0030_2.9232.jpg', 3, 21, 7, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `cigarsdb`;
INSERT INTO `inventory_item` (`id`, `quantity`, `date_acquired`, `cigar_id`) VALUES (1, 14, '2023-11-18', 1);
INSERT INTO `inventory_item` (`id`, `quantity`, `date_acquired`, `cigar_id`) VALUES (2, 5, '2023-11-18', 2);
INSERT INTO `inventory_item` (`id`, `quantity`, `date_acquired`, `cigar_id`) VALUES (3, 9, '2024-06-2', 6);

COMMIT;

