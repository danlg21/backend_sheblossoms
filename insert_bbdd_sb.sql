
USE base_sheblossoms;

INSERT INTO `base_sheblossoms`.`user` (`name`, `email`, `password`, `role`, `reg_date`, `address`, `phone_number`)
VALUES 
  ('Ana Martínez', 'ana.martinez@example.com', 'password123', 'seller', NOW(), 'Calle Primavera 123, Ciudad A', '555-1234'),
  ('Beatriz Gómez', 'beatriz.gomez@example.com', 'password123', 'shopper', NOW(), 'Avenida Libertad 45, Ciudad B', '555-5678'),
  ('Carmen López', 'carmen.lopez@example.com', 'password123', 'admin', NOW(), 'Plaza Central 12, Ciudad C', '555-8765'),
  ('Diana Rodríguez', 'diana.rodriguez@example.com', 'password123', 'seller', NOW(), 'Calle Jardín 67, Ciudad D', '555-4321'),
  ('Elena Sánchez', 'elena.sanchez@example.com', 'password123', 'shopper', NOW(), 'Boulevard Sol 89, Ciudad E', '555-6543'),
  ('Fernanda Pérez', 'fernanda.perez@example.com', 'password123', 'seller', NOW(), 'Calle Luna 34, Ciudad F', '555-7890'),
  ('Gabriela Díaz', 'gabriela.diaz@example.com', 'password123', 'shopper', NOW(), 'Calle Estrella 56, Ciudad G', '555-9876'),
  ('Hilda Torres', 'hilda.torres@example.com', 'password123', 'admin', NOW(), 'Avenida Mar 90, Ciudad H', '555-3456'),
  ('Irene Fernández', 'irene.fernandez@example.com', 'password123', 'seller', NOW(), 'Calle Rosa 78, Ciudad I', '555-5674'),
  ('Julia Ramírez', 'julia.ramirez@example.com', 'password123', 'shopper', NOW(), 'Calle Valle 90, Ciudad J', '555-3459');

INSERT INTO `base_sheblossoms`.`user` (`name`, `email`, `password`, `role`, `reg_date`, `address`, `phone_number`)
VALUES 
  ('Emma Cruz', 'emma.cruz@example.com', 'password123', 'seller', NOW(), 'Calle Flores 123, Ciudad C', '555-5964');
  
SELECT * FROM `base_sheblossoms`.`user`;

INSERT INTO `base_sheblossoms`.`shops` (`idshops`, `store_name`, `store_description`, `reg_date_store`, `url_logo`, `shop_location`, `user_iduser`)
VALUES
  (1, 'La Nube de Algodón', 'Tienda especializada en peluches artesanales.', NOW(), 'https://example.com/logos/ana_peluches.png', 'Calle Primavera 123, Ciudad A', 1),
  (2, 'La Cintura de Venus', 'Venta de corsets personalizados y ropa íntima.', NOW(), 'https://example.com/logos/diana_corsets.png', 'Calle Jardín 67, Ciudad D', 4),
  (3, 'El Cofre de las Gemas', 'Boutique de joyería y accesorios para mujeres emprendedoras.', NOW(), 'https://example.com/logos/fernanda_joyeria.png', 'Calle Luna 34, Ciudad F', 6),
  (4, 'Adhesivo Mágico', 'Tienda de stickers y productos de diseño gráfico.', NOW(), 'https://example.com/logos/irene_stickers.png', 'Calle Rosa 78, Ciudad I', 9),
  (5, 'El Rincón de las Delicias', 'Tienda especializada en chocolates artesanales y gourmet.', NOW(), 'https://example.com/logos/emma_chocolates.png', 'Calle Flores 123, Ciudad C', 11);

SELECT * FROM `base_sheblossoms`.`shops`;

-- Peluches Ana (idshops = 1)
INSERT INTO `base_sheblossoms`.`product` (`idproduct`, `product_name`, `description`, `product_price`, `product_stock`, `product_category`, `add_date`, `url_img`, `shops_idshops`)
VALUES
  (1, 'Peluche de Capibara', 'Peluche suave en forma de capibara.', 20.00, 50, 'Peluches', NOW(), 'https://example.com/images/capibara.png', 1),
  (2, 'Peluche de Langosta', 'Peluche divertido en forma de langosta.', 15.00, 40, 'Peluches', NOW(), 'https://example.com/images/langosta.png', 1);

-- Corsets Diana (idshops = 2)
INSERT INTO `base_sheblossoms`.`product` (`idproduct`, `product_name`, `description`, `product_price`, `product_stock`, `product_category`, `add_date`, `url_img`, `shops_idshops`)
VALUES
  (3, 'Corset Clásico Negro', 'Corset negro de estilo clásico con encaje.', 50.00, 20, 'Corsets', NOW(), 'https://example.com/images/corset_negro.png', 2),
  (4, 'Corset Encaje Rojo', 'Corset rojo con detalles de encaje floral.', 55.00, 15, 'Corsets', NOW(), 'https://example.com/images/corset_rojo.png', 2);

-- Joyería Fernanda (idshops = 3)
INSERT INTO `base_sheblossoms`.`product` (`idproduct`, `product_name`, `description`, `product_price`, `product_stock`, `product_category`, `add_date`, `url_img`, `shops_idshops`)
VALUES
  (5, 'Collar de Mariposa', 'Collar con colgante de mariposa en plata.', 30.00, 25, 'Joyería', NOW(), 'https://example.com/images/collar_mariposa.png', 3),
  (6, 'Aretes de Flores', 'Aretes de plata con forma de flores delicadas.', 20.00, 30, 'Joyería', NOW(), 'https://example.com/images/aretes_flores.png', 3);

-- Stickers Irene (idshops = 4)
INSERT INTO `base_sheblossoms`.`product` (`idproduct`, `product_name`, `description`, `product_price`, `product_stock`, `product_category`, `add_date`, `url_img`, `shops_idshops`)
VALUES
  (7, 'Sticker Holográfico', 'Sticker holográfico con diseño abstracto.', 5.00, 100, 'Stickers', NOW(), 'https://example.com/images/sticker_holografico.png', 4),
  (8, 'Sticker de Perritos', 'Sticker de perritos adorables en diferentes poses.', 4.00, 120, 'Stickers', NOW(), 'https://example.com/images/sticker_perritos.png', 4);

-- Chocolates Emma (idshops = 5)
INSERT INTO `base_sheblossoms`.`product` (`idproduct`, `product_name`, `description`, `product_price`, `product_stock`, `product_category`, `add_date`, `url_img`, `shops_idshops`)
VALUES
  (9, 'Chocolate Oscuro Artesanal', 'Chocolate oscuro artesanal con 70% de cacao.', 7.00, 60, 'Chocolates', NOW(), 'https://example.com/images/chocolate_oscuro.png', 5),
  (10, 'Trufas de Chocolate Blanco', 'Trufas de chocolate blanco rellenas de frambuesa.', 8.00, 50, 'Chocolates', NOW(), 'https://example.com/images/trufas_chocolate_blanco.png', 5);

SELECT * FROM `base_sheblossoms`.`product`;

-- Categorías para Peluches 
INSERT INTO `base_sheblossoms`.`category` (`idcategory`, `category_name`, `category_description`, `shops_idshops`)
VALUES
  (1, 'Peluches', 'Juguetes de peluche suaves y adorables.', 1);

-- Categorías para Corsets 
INSERT INTO `base_sheblossoms`.`category` (`idcategory`, `category_name`, `category_description`, `shops_idshops`)
VALUES
  (2, 'Corsets', 'Ropa íntima y corsets personalizados.', 2);

-- Categorías para Joyería 
INSERT INTO `base_sheblossoms`.`category` (`idcategory`, `category_name`, `category_description`, `shops_idshops`)
VALUES
  (3, 'Joyería', 'Accesorios y joyas de diseño exclusivo.', 3);

-- Categorías para Stickers 
INSERT INTO `base_sheblossoms`.`category` (`idcategory`, `category_name`, `category_description`, `shops_idshops`)
VALUES
  (4, 'Stickers', 'Stickers de diseño gráfico y decorativos.', 4);

-- Categorías para Chocolates 
INSERT INTO `base_sheblossoms`.`category` (`idcategory`, `category_name`, `category_description`, `shops_idshops`)
VALUES
  (5, 'Chocolates', 'Chocolates artesanales y trufas gourmet.', 5);

SELECT * FROM `base_sheblossoms`.`category`;

-- Insertar órdenes para los usuarios con rol de shopper

-- Usuario 2: Beatriz Gómez (shopper)
INSERT INTO `base_sheblossoms`.`order` (`idorder`, `order_status`, `order_date`, `order_total`, `address`, `user_iduser`)
VALUES
  (1, 'Enviado', NOW(), 40.00, 'Avenida Libertad 45, Ciudad B', 2),
  (2, 'En tránsito', NOW(), 15.00, 'Avenida Libertad 45, Ciudad B', 2);

-- Usuario 5: Elena Sánchez (shopper)
INSERT INTO `base_sheblossoms`.`order` (`idorder`, `order_status`, `order_date`, `order_total`, `address`, `user_iduser`)
VALUES
  (3, 'Entregado', NOW(), 60.00, 'Boulevard Sol 89, Ciudad E', 5),
  (4, 'Enviado', NOW(), 55.00, 'Boulevard Sol 89, Ciudad E', 5);

-- Usuario 7: Gabriela Díaz (shopper)
INSERT INTO `base_sheblossoms`.`order` (`idorder`, `order_status`, `order_date`, `order_total`, `address`, `user_iduser`)
VALUES
  (5, 'En tránsito', NOW(), 21.00, 'Calle Estrella 56, Ciudad G', 7),
  (6, 'Entregado', NOW(), 40.00, 'Calle Estrella 56, Ciudad G', 7);

-- Usuario 10: Julia Ramírez (shopper)
INSERT INTO `base_sheblossoms`.`order` (`idorder`, `order_status`, `order_date`, `order_total`, `address`, `user_iduser`)
VALUES
  (9, 'Entregado', NOW(), 15.00, 'Calle Valle 90, Ciudad J', 10),
  (10, 'Enviado', NOW(), 8.00, 'Calle Valle 90, Ciudad J', 10);

SELECT * FROM `base_sheblossoms`.`order`;

-- Insertar detalles de las órdenes para los usuarios con rol de shopper

-- Ordenes para Beatriz Gómez (user_iduser = 2)
INSERT INTO `base_sheblossoms`.`orderdetails` 
(`idorderdetails`, `product_id`, `number_of_items`, `unit_price`, `description`, `order_total`, `address`, `order_idorder`, `order_user_iduser`)
VALUES
  (1, 1, 2, 20.00, 'Peluche de capibara', 40.00, 'Avenida Libertad 45, Ciudad B', 1, 2),
  (2, 7, 3, 5.00, 'Stickers holográficos', 15.00, 'Avenida Libertad 45, Ciudad B', 2, 2);

-- Ordenes para Elena Sánchez (user_iduser = 5)
INSERT INTO `base_sheblossoms`.`orderdetails` 
(`idorderdetails`, `product_id`, `number_of_items`, `unit_price`, `description`, `order_total`, `address`, `order_idorder`, `order_user_iduser`)
VALUES
  (3, 5, 2, 30.00, 'Collar de mariposa', 60.00, 'Boulevard Sol 89, Ciudad E', 3, 5),
  (4, 4, 1, 55.00, 'Corset encaje rojo', 55.00, 'Boulevard Sol 89, Ciudad E', 4, 5);

-- Ordenes para Gabriela Díaz (user_iduser = 7)
INSERT INTO `base_sheblossoms`.`orderdetails` 
(`idorderdetails`, `product_id`, `number_of_items`, `unit_price`, `description`, `order_total`, `address`, `order_idorder`, `order_user_iduser`)
VALUES
  (5, 9, 3, 7.00, 'Chocolate oscuro artesanal con 70% de cacao.', 21.00, 'Calle Estrella 56, Ciudad G', 5, 7),
  (6, 6, 2, 20.00, 'Aretes de flores', 40.00, 'Calle Estrella 56, Ciudad G', 6, 7);

-- Ordenes para Julia Ramírez (user_iduser = 10)
INSERT INTO `base_sheblossoms`.`orderdetails` 
(`idorderdetails`, `product_id`, `number_of_items`, `unit_price`, `description`, `order_total`, `address`, `order_idorder`, `order_user_iduser`)
VALUES
  (7, 2, 1, 15.00, 'Peluche de langosta', 15.00, 'Calle Valle 90, Ciudad J', 9, 10),
  (8, 10, 1, 8.00, 'Trufas de chocolate blanco', 8.00, 'Calle Valle 90, Ciudad J', 10, 10);
  
SELECT * FROM `base_sheblossoms`.`orderdetails`;

-- Insertar métodos de pago para las órdenes de los usuarios con rol de shopper

-- Ordenes para Beatriz Gómez (user_iduser = 2)
INSERT INTO `base_sheblossoms`.`paymentmethods` 
(`idpayment`, `payment_method`, `payment_date`, `payment_amount`, `order_idorder`, `order_user_iduser`)
VALUES
  (1, 'Tarjeta', NOW(), 40.00, 1, 2),
  (2, 'Efectivo', NOW(), 15.00, 2, 2);

-- Ordenes para Elena Sánchez (user_iduser = 5)
INSERT INTO `base_sheblossoms`.`paymentmethods` 
(`idpayment`, `payment_method`, `payment_date`, `payment_amount`, `order_idorder`, `order_user_iduser`)
VALUES
  (3, 'Efectivo', NOW(), 60.00, 3, 5),
  (4, 'Tarjeta', NOW(), 55.00, 4, 5);

-- Ordenes para Gabriela Díaz (user_iduser = 7)
INSERT INTO `base_sheblossoms`.`paymentmethods` 
(`idpayment`, `payment_method`, `payment_date`, `payment_amount`, `order_idorder`, `order_user_iduser`)
VALUES
  (5, 'Tarjeta', NOW(), 21.00, 5, 7),
  (6, 'Efectivo', NOW(), 40.00, 6, 7);

-- Ordenes para Julia Ramírez (user_iduser = 10)
INSERT INTO `base_sheblossoms`.`paymentmethods` 
(`idpayment`, `payment_method`, `payment_date`, `payment_amount`, `order_idorder`, `order_user_iduser`)
VALUES
  (7, 'Efectivo', NOW(), 15.00, 9, 10),
  (8, 'Tarjeta', NOW(), 8.00, 10, 10);
  
SELECT * FROM `base_sheblossoms`.`paymentmethods`;

-- Insertar reseñas para los productos comprados

-- Reseñas 
-- Producto: Peluche de capibara 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (1, '¡Me encanta este peluche! Muy suave y de buena calidad.', NOW(), 1, 1),
  (2, 'Un peluche muy tierno, pero llegó un poco tarde.', NOW(), 1, 1);

-- Producto: Stickers holográficos 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (3, 'Los stickers son increíbles y brillan mucho.', NOW(), 7, 4),
  (4, 'Calidad excelente, aunque el paquete llegó ligeramente arrugado.', NOW(), 7, 4);

-- Producto: Collar de mariposa 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (5, 'El collar es precioso, exactamente como en la foto.', NOW(), 5, 3),
  (6, 'Muy elegante, pero la cadena es un poco corta.', NOW(), 5, 3);

-- Producto: Corset rojo 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (7, 'El corset es ajustado y de buen material.', NOW(), 4, 2),
  (8, 'Me gustó mucho, pero el color es un poco más oscuro que en la imagen.', NOW(), 4, 2);

-- Producto: Chocolates artesanales 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (9, 'Deliciosos chocolates, muy recomendables.', NOW(), 9, 5),
  (10, 'Buen sabor, pero un poco caros.', NOW(), 9, 5),
  (11, 'La presentación es excelente y los chocolates están bien elaborados.', NOW(), 9, 5);

-- Producto: Aretes de flores 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (12, 'Aretes muy bonitos y bien hechos.', NOW(), 6,3),
  (13, 'Me gustaron mucho, pero el color no era exactamente lo que esperaba.', NOW(), 6, 3);

-- Producto: Peluche de langosta
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (14, 'El peluche es adorable y bien hecho.', NOW(), 2,1),
  (15, 'Buena calidad, aunque el color es más oscuro que en la imagen.', NOW(), 2,1);

-- Producto: Trufas de chocolate blanco 
INSERT INTO `base_sheblossoms`.`productreviews` 
(`idproductreviews`, `productreview`, `review_date`, `product_idproduct`, `product_shops_idshops`)
VALUES
  (16, 'Excelente sabor, los chocolates son muy gourmet.', NOW(), 10,5),
  (17, 'Muy buenos chocolates, aunque el precio es alto.', NOW(), 10,5);
  
SELECT * FROM `base_sheblossoms`.`productreviews`;






