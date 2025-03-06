-------------------------------------
commit;
select * from vuumpet_rental;
select * from vuumpet_users;
select * from vuumpet_product;
select * from vuumpet_category;
select * from vuumpet_product_option;
select * from vuumpet_product_option_value;
select * from tab;
commit;
--초기 설정 ---
SET DEFINE OFF;
-- VUUMPET_CATEGORY 삽입
INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('전체', NULL);

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('신제품 드라이룸', './7thdryroom.jsp');

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('케어&기타소모품', NULL);

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('큐브드라이어&켄넬', NULL);

-- VUUMPET_PRODUCT 삽입
INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫드라이룸 단델리온', 
        '/vuumpet/uploads/1741152220920_product-img.jpg', 
        890000, 
        '<p><span style="font-family:ScoreDreamLight;font-size:13px;">10kg 내외 중형견  / 소형견 두마리 동시 사용 가능</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:1000/2385;" src="/vuumpet/uploads/1741152062361_1.webp" width="1000" height="2385"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2073;" src="/vuumpet/uploads/1741152062359_2.webp" width="1000" height="2073"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1614;" src="/vuumpet/uploads/1741152062360_3.webp" width="1000" height="1614"></figure><figure ]')
        || TO_CLOB(q'[class="image image-style-align-center"><img style="aspect-ratio:1000/1837;" src="/vuumpet/uploads/1741152062355_4.webp" width="1000" height="1837"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/453;" src="/vuumpet/uploads/1741152062347_5.webp" width="1000" height="453"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1251;" src="/vuumpet/uploads/1741152062355_6.webp" width="1000" height="1251"></figure><figure class="ima]')
        || TO_CLOB(q'[ge image-style-align-center"><img style="aspect-ratio:1000/714;" src="/vuumpet/uploads/1741152062355_7.webp" width="1000" height="714"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1418;" src="/vuumpet/uploads/1741152062362_8.webp" width="1000" height="1418"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062370_9.webp" width="1000" height="1036"></figure><figure class="image image-s]')
        || TO_CLOB(q'[tyle-align-center"><img style="aspect-ratio:1000/2147;" src="/vuumpet/uploads/1741152062376_10.webp" width="1000" height="2147"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1500;" src="/vuumpet/uploads/1741152062382_11.webp" width="1000" height="1500"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1986;" src="/vuumpet/uploads/1741152062391_12.webp" width="1000" height="1986"></figure><figure class="image image-style-]')
        || TO_CLOB(q'[align-center"><img style="aspect-ratio:1000/1359;" src="/vuumpet/uploads/1741152062400_13.webp" width="1000" height="1359"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1175;" src="/vuumpet/uploads/1741152062408_14.webp" width="1000" height="1175"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2474;" src="/vuumpet/uploads/1741152062420_15.webp" width="1000" height="2474"></figure><figure class="image image-style-align]')
        || TO_CLOB(q'[-center"><img style="aspect-ratio:1000/630;" src="/vuumpet/uploads/1741152062423_16.webp" width="1000" height="630"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1239;" src="/vuumpet/uploads/1741152062429_17.webp" width="1000" height="1239"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1534;" src="/vuumpet/uploads/1741152062439_18.webp" width="1000" height="1534"></figure><figure class="image image-style-align-center]')
        || TO_CLOB(q'["><img style="aspect-ratio:1000/2064;" src="/vuumpet/uploads/1741152062447_19.webp" width="1000" height="2064"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062454_20.webp" width="1000" height="1036"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1208;" src="/vuumpet/uploads/1741152062462_21.webp" width="1000" height="1208"></figure><figure class="image image-style-align-center"><im]')
        || TO_CLOB(q'[g style="aspect-ratio:1000/819;" src="/vuumpet/uploads/1741152062466_22.webp" width="1000" height="819"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1256;" src="/vuumpet/uploads/1741152062472_23.webp" width="1000" height="1256"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/770;" src="/vuumpet/uploads/1741152062477_24.webp" width="1000" height="770"></figure><figure class="image image-style-align-center"><img style="]')
        || TO_CLOB(q'[aspect-ratio:1000/937;" src="/vuumpet/uploads/1741152062481_25.webp" width="1000" height="937"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1323;" src="/vuumpet/uploads/1741152062494_26.webp" width="1000" height="1323"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3333;" src="/vuumpet/uploads/1741152062500_27.webp" width="1000" height="3333"></figure><figure class="image image-style-align-center"><img style="aspect-]')
        || TO_CLOB(q'[ratio:1000/2660;" src="/vuumpet/uploads/1741152062505_28.webp" width="1000" height="2660"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3121;" src="/vuumpet/uploads/1741152062520_29.webp" width="1000" height="3121"></figure>]'), 
        1, 
        2); -- '신제품 드라이룸'의 ID가 2로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫드라이룸 로투스', 
        '/vuumpet/uploads/1741152674561_product-img2.jpg', 
        1290000, 
        '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">10kg이상 중형견 / 20kg 내외 중대형견</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:1000/2385;" src="/vuumpet/uploads/1741152062361_1.webp" width="1000" height="2385"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2073;" src="/vuumpet/uploads/1741152062359_2.webp" width="1000" height="2073"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1614;" src="/vuumpet/uploads/1741152062360_3.webp" width="1000" height="1614"></figure><figure ]')
        || TO_CLOB(q'[class="image image-style-align-center"><img style="aspect-ratio:1000/1837;" src="/vuumpet/uploads/1741152062355_4.webp" width="1000" height="1837"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/453;" src="/vuumpet/uploads/1741152062347_5.webp" width="1000" height="453"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1251;" src="/vuumpet/uploads/1741152062355_6.webp" width="1000" height="1251"></figure><figure class="ima]')
        || TO_CLOB(q'[ge image-style-align-center"><img style="aspect-ratio:1000/714;" src="/vuumpet/uploads/1741152062355_7.webp" width="1000" height="714"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1418;" src="/vuumpet/uploads/1741152062362_8.webp" width="1000" height="1418"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062370_9.webp" width="1000" height="1036"></figure><figure class="image image-s]')
        || TO_CLOB(q'[tyle-align-center"><img style="aspect-ratio:1000/2147;" src="/vuumpet/uploads/1741152062376_10.webp" width="1000" height="2147"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1500;" src="/vuumpet/uploads/1741152062382_11.webp" width="1000" height="1500"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1986;" src="/vuumpet/uploads/1741152062391_12.webp" width="1000" height="1986"></figure><figure class="image image-style-]')
        || TO_CLOB(q'[align-center"><img style="aspect-ratio:1000/1359;" src="/vuumpet/uploads/1741152062400_13.webp" width="1000" height="1359"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1175;" src="/vuumpet/uploads/1741152062408_14.webp" width="1000" height="1175"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2474;" src="/vuumpet/uploads/1741152062420_15.webp" width="1000" height="2474"></figure><figure class="image image-style-align]')
        || TO_CLOB(q'[-center"><img style="aspect-ratio:1000/630;" src="/vuumpet/uploads/1741152062423_16.webp" width="1000" height="630"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1239;" src="/vuumpet/uploads/1741152062429_17.webp" width="1000" height="1239"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1534;" src="/vuumpet/uploads/1741152062439_18.webp" width="1000" height="1534"></figure><figure class="image image-style-align-center]')
        || TO_CLOB(q'["><img style="aspect-ratio:1000/2064;" src="/vuumpet/uploads/1741152062447_19.webp" width="1000" height="2064"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062454_20.webp" width="1000" height="1036"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1208;" src="/vuumpet/uploads/1741152062462_21.webp" width="1000" height="1208"></figure><figure class="image image-style-align-center"><im]')
        || TO_CLOB(q'[g style="aspect-ratio:1000/819;" src="/vuumpet/uploads/1741152062466_22.webp" width="1000" height="819"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1256;" src="/vuumpet/uploads/1741152062472_23.webp" width="1000" height="1256"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/770;" src="/vuumpet/uploads/1741152062477_24.webp" width="1000" height="770"></figure><figure class="image image-style-align-center"><img style="]')
        || TO_CLOB(q'[aspect-ratio:1000/937;" src="/vuumpet/uploads/1741152062481_25.webp" width="1000" height="937"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1323;" src="/vuumpet/uploads/1741152062494_26.webp" width="1000" height="1323"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3333;" src="/vuumpet/uploads/1741152062500_27.webp" width="1000" height="3333"></figure><figure class="image image-style-align-center"><img style="aspect-]')
        || TO_CLOB(q'[ratio:1000/2660;" src="/vuumpet/uploads/1741152062505_28.webp" width="1000" height="2660"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3121;" src="/vuumpet/uploads/1741152062520_29.webp" width="1000" height="3121"></figure>]'), 
        1, 
        2); -- '신제품 드라이룸'의 ID가 2로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫드라이룸 단델리온 듀얼', 
        '/vuumpet/uploads/1741155548726_product-img3.jpg', 
        1490000, 
        '<p><span style="font-family:ScoreDreamLight;font-size:13px;">최대 25kg / 다둥이 소형,중형견</span></p><p><span style="font-family:ScoreDreamLight;font-size:13px;">or 중대형견</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:1000/2385;" src="/vuumpet/uploads/1741152062361_1.webp" width="1000" height="2385"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2073;" src="/vuumpet/uploads/1741152062359_2.webp" width="1000" height="2073"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1614;" src="/vuumpet/uploads/1741152062360_3.webp" width="1000" height="1614"></figure><figure ]')
        || TO_CLOB(q'[class="image image-style-align-center"><img style="aspect-ratio:1000/1837;" src="/vuumpet/uploads/1741152062355_4.webp" width="1000" height="1837"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/453;" src="/vuumpet/uploads/1741152062347_5.webp" width="1000" height="453"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1251;" src="/vuumpet/uploads/1741152062355_6.webp" width="1000" height="1251"></figure><figure class="ima]')
        || TO_CLOB(q'[ge image-style-align-center"><img style="aspect-ratio:1000/714;" src="/vuumpet/uploads/1741152062355_7.webp" width="1000" height="714"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1418;" src="/vuumpet/uploads/1741152062362_8.webp" width="1000" height="1418"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062370_9.webp" width="1000" height="1036"></figure><figure class="image image-s]')
        || TO_CLOB(q'[tyle-align-center"><img style="aspect-ratio:1000/2147;" src="/vuumpet/uploads/1741152062376_10.webp" width="1000" height="2147"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1500;" src="/vuumpet/uploads/1741152062382_11.webp" width="1000" height="1500"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1986;" src="/vuumpet/uploads/1741152062391_12.webp" width="1000" height="1986"></figure><figure class="image image-style-]')
        || TO_CLOB(q'[align-center"><img style="aspect-ratio:1000/1359;" src="/vuumpet/uploads/1741152062400_13.webp" width="1000" height="1359"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1175;" src="/vuumpet/uploads/1741152062408_14.webp" width="1000" height="1175"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2474;" src="/vuumpet/uploads/1741152062420_15.webp" width="1000" height="2474"></figure><figure class="image image-style-align]')
        || TO_CLOB(q'[-center"><img style="aspect-ratio:1000/630;" src="/vuumpet/uploads/1741152062423_16.webp" width="1000" height="630"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1239;" src="/vuumpet/uploads/1741152062429_17.webp" width="1000" height="1239"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1534;" src="/vuumpet/uploads/1741152062439_18.webp" width="1000" height="1534"></figure><figure class="image image-style-align-center]')
        || TO_CLOB(q'["><img style="aspect-ratio:1000/2064;" src="/vuumpet/uploads/1741152062447_19.webp" width="1000" height="2064"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062454_20.webp" width="1000" height="1036"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1208;" src="/vuumpet/uploads/1741152062462_21.webp" width="1000" height="1208"></figure><figure class="image image-style-align-center"><im]')
        || TO_CLOB(q'[g style="aspect-ratio:1000/819;" src="/vuumpet/uploads/1741152062466_22.webp" width="1000" height="819"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1256;" src="/vuumpet/uploads/1741152062472_23.webp" width="1000" height="1256"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/770;" src="/vuumpet/uploads/1741152062477_24.webp" width="1000" height="770"></figure><figure class="image image-style-align-center"><img style="]')
        || TO_CLOB(q'[aspect-ratio:1000/937;" src="/vuumpet/uploads/1741152062481_25.webp" width="1000" height="937"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1323;" src="/vuumpet/uploads/1741152062494_26.webp" width="1000" height="1323"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3333;" src="/vuumpet/uploads/1741152062500_27.webp" width="1000" height="3333"></figure><figure class="image image-style-align-center"><img style="aspect-]')
        || TO_CLOB(q'[ratio:1000/2660;" src="/vuumpet/uploads/1741152062505_28.webp" width="1000" height="2660"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3121;" src="/vuumpet/uploads/1741152062520_29.webp" width="1000" height="3121"></figure>]'), 
        1, 
        2); -- '신제품 드라이룸'의 ID가 2로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫드라이룸 로투스 듀얼', 
        '/vuumpet/uploads/1741156680718_product-img4.jpg', 
        1990000, 
        '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">중형견 다둥이 가족 / 45kg 내외 대형견</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:1000/2385;" src="/vuumpet/uploads/1741152062361_1.webp" width="1000" height="2385"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2073;" src="/vuumpet/uploads/1741152062359_2.webp" width="1000" height="2073"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1614;" src="/vuumpet/uploads/1741152062360_3.webp" width="1000" height="1614"></figure><figure ]')
        || TO_CLOB(q'[class="image image-style-align-center"><img style="aspect-ratio:1000/1837;" src="/vuumpet/uploads/1741152062355_4.webp" width="1000" height="1837"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/453;" src="/vuumpet/uploads/1741152062347_5.webp" width="1000" height="453"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1251;" src="/vuumpet/uploads/1741152062355_6.webp" width="1000" height="1251"></figure><figure class="ima]')
        || TO_CLOB(q'[ge image-style-align-center"><img style="aspect-ratio:1000/714;" src="/vuumpet/uploads/1741152062355_7.webp" width="1000" height="714"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1418;" src="/vuumpet/uploads/1741152062362_8.webp" width="1000" height="1418"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062370_9.webp" width="1000" height="1036"></figure><figure class="image image-s]')
        || TO_CLOB(q'[tyle-align-center"><img style="aspect-ratio:1000/2147;" src="/vuumpet/uploads/1741152062376_10.webp" width="1000" height="2147"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1500;" src="/vuumpet/uploads/1741152062382_11.webp" width="1000" height="1500"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1986;" src="/vuumpet/uploads/1741152062391_12.webp" width="1000" height="1986"></figure><figure class="image image-style-]')
        || TO_CLOB(q'[align-center"><img style="aspect-ratio:1000/1359;" src="/vuumpet/uploads/1741152062400_13.webp" width="1000" height="1359"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1175;" src="/vuumpet/uploads/1741152062408_14.webp" width="1000" height="1175"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/2474;" src="/vuumpet/uploads/1741152062420_15.webp" width="1000" height="2474"></figure><figure class="image image-style-align]')
        || TO_CLOB(q'[-center"><img style="aspect-ratio:1000/630;" src="/vuumpet/uploads/1741152062423_16.webp" width="1000" height="630"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1239;" src="/vuumpet/uploads/1741152062429_17.webp" width="1000" height="1239"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1534;" src="/vuumpet/uploads/1741152062439_18.webp" width="1000" height="1534"></figure><figure class="image image-style-align-center]')
        || TO_CLOB(q'["><img style="aspect-ratio:1000/2064;" src="/vuumpet/uploads/1741152062447_19.webp" width="1000" height="2064"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1036;" src="/vuumpet/uploads/1741152062454_20.webp" width="1000" height="1036"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1208;" src="/vuumpet/uploads/1741152062462_21.webp" width="1000" height="1208"></figure><figure class="image image-style-align-center"><im]')
        || TO_CLOB(q'[g style="aspect-ratio:1000/819;" src="/vuumpet/uploads/1741152062466_22.webp" width="1000" height="819"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1256;" src="/vuumpet/uploads/1741152062472_23.webp" width="1000" height="1256"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/770;" src="/vuumpet/uploads/1741152062477_24.webp" width="1000" height="770"></figure><figure class="image image-style-align-center"><img style="]')
        || TO_CLOB(q'[aspect-ratio:1000/937;" src="/vuumpet/uploads/1741152062481_25.webp" width="1000" height="937"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/1323;" src="/vuumpet/uploads/1741152062494_26.webp" width="1000" height="1323"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3333;" src="/vuumpet/uploads/1741152062500_27.webp" width="1000" height="3333"></figure><figure class="image image-style-align-center"><img style="aspect-]')
        || TO_CLOB(q'[ratio:1000/2660;" src="/vuumpet/uploads/1741152062505_28.webp" width="1000" height="2660"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1000/3121;" src="/vuumpet/uploads/1741152062520_29.webp" width="1000" height="3121"></figure>]'), 
        1, 
        2); -- '신제품 드라이룸'의 ID가 2로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫 소프트 캐리어', 
        '/vuumpet/uploads/1741158425952_product-img5.jpg', 
        79000, 
        '<p><span style="font-family:ScoreDreamLight;font-size:13px;">↓  최대</span><span style="color:rgb(255,0,0);font-family:ScoreDreamLight;font-size:13px;"> 44<strong>%</strong></span><span style="font-family:ScoreDreamLight;font-size:13px;"> 할인</span></p><p><span style="font-family:ScoreDreamLight;font-size:13px;">4가지 사이즈 (S, M, L, XL)</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:940/6570;" src="/vuumpet/uploads/1741158377517_1.webp" width="940" height="6570"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:940/5585;" src="/vuumpet/uploads/1741158377533_2.webp" width="940" height="5585"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:940/626;" src="/vuumpet/uploads/1741158377537_3.webp" width="940" height="626"></figure><figure class="i]')
        || TO_CLOB(q'[mage image-style-align-center"><img style="aspect-ratio:940/7332;" src="/vuumpet/uploads/1741158377566_4.webp" width="940" height="7332"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:940/3500;" src="/vuumpet/uploads/1741158377572_5.webp" width="940" height="3500"></figure>]'), 
        1, 
        4); -- '큐브드라이어&켄넬'의 ID가 4로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫 아로마케어 패키지', 
        '/vuumpet/uploads/1741158564714_product-img.jpg', 
        24000, 
        '<p><span style="font-family:ScoreDreamLight;font-size:13px;">안티스트레스 | 릴렉스 | 비타민 | 발란스</span></p>', 
        '<figure class="image image-style-align-center"><img style="aspect-ratio:940/7135;" src="/vuumpet/uploads/1741158539209_1.webp" width="940" height="7135"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:940/5076;" src="/vuumpet/uploads/1741158539218_2.webp" width="940" height="5076"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:940/3500;" src="/vuumpet/uploads/1741158539228_3.webp" width="940" height="3500"></figure>', 
        1, 
        3); -- '케어&기타소모품'의 ID가 3으로 가정

INSERT INTO VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_THUMBNAIL, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_DETAILS, PRODUCT_STOCK, CATEGORY_ID) 
VALUES ('붐펫 캐빈필터(1개입)', 
        '/vuumpet/uploads/1741158664072_product-img2.jpg', 
        12000, 
        '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">미세먼지 여과용 캐빈필터 (교체사용)</span></p>', 
        TO_CLOB(q'[<figure class="image image-style-align-center"><img style="aspect-ratio:1250/889;" src="/vuumpet/uploads/1741158651717_1.webp" width="1250" height="889"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1250/540;" src="/vuumpet/uploads/1741158651722_2.webp" width="1250" height="540"></figure><figure class="image image-style-align-center"><img style="aspect-ratio:1250/938;" src="/vuumpet/uploads/1741158651728_3.webp" width="1250" height="938"></figure><figure class=]')
        || TO_CLOB(q'["image image-style-align-center"><img style="aspect-ratio:940/3500;" src="/vuumpet/uploads/1741158651740_4.webp" width="940" height="3500"></figure>]'), 
        1, 
        3); -- '케어&기타소모품'의 ID가 3으로 가정

-- VUUMPET_PRODUCT_OPTION 삽입
INSERT INTO VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED) 
VALUES (1, '색상', 1);

INSERT INTO VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED) 
VALUES (2, '색상', 1);

INSERT INTO VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED) 
VALUES (3, '색상', 1);

INSERT INTO VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED) 
VALUES (4, '색상', 1);

INSERT INTO VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED) 
VALUES (5, '사이즈', 1);

-- VUUMPET_PRODUCT_OPTION_VALUE 삽입
INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (1, '화이트', 1, 890000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (2, '화이트', 1, 1290000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (3, '화이트', 1, 1490000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (4, '화이트', 1, 1990000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (5, 'Small', 1, 79000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (5, 'Medium', 1, 99000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (5, 'Large', 1, 119000);

INSERT INTO VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE) 
VALUES (5, 'Extra Large', 1, 139000);
-- 시퀀스 생성
CREATE SEQUENCE seq_vuumpet_category START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product_option START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product_option_value START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_users START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_rental START WITH 1 INCREMENT BY 1 NOCACHE;
--- 테이블 생성 ---
CREATE TABLE vuumpet_category (
    id NUMBER PRIMARY KEY,
    category_name VARCHAR2(255) NOT NULL,
    category_link VARCHAR2(4000)
);

CREATE TABLE vuumpet_product (
    id NUMBER PRIMARY KEY,
    product_name VARCHAR2(255) NOT NULL,
    product_thumbnail CLOB,
    product_price NUMBER NOT NULL CHECK (product_price >= 0),
    product_info VARCHAR2(1000),
    product_details CLOB,
    product_stock NUMBER DEFAULT 0 NOT NULL CHECK (product_stock >= 0),
    category_id NUMBER NOT NULL,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES vuumpet_category(id)
);

CREATE TABLE vuumpet_product_option (
    id NUMBER PRIMARY KEY,
    product_id NUMBER NOT NULL,
    product_option_name VARCHAR2(255) NOT NULL,
    is_required NUMBER DEFAULT 0 NOT NULL CHECK (is_required IN (0, 1)),
    CONSTRAINT fk_option_product FOREIGN KEY (product_id) REFERENCES vuumpet_product(id)
);

CREATE TABLE vuumpet_product_option_value (
    id NUMBER PRIMARY KEY,
    option_id NUMBER NOT NULL,
    option_value VARCHAR2(255) NOT NULL,
    option_stock NUMBER DEFAULT 0 NOT NULL CHECK (option_stock >= 0),
    option_price NUMBER DEFAULT 0 NOT NULL CHECK (option_price >= 0),
    CONSTRAINT fk_option_value_option FOREIGN KEY (option_id) REFERENCES vuumpet_product_option(id) ON DELETE CASCADE
);

CREATE TABLE vuumpet_users (
    id NUMBER PRIMARY KEY,
    email VARCHAR2(255) NOT NULL CONSTRAINT uq_users_email UNIQUE,
    password VARCHAR2(255) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    detail_address VARCHAR2(255),
    phone VARCHAR2(20) NOT NULL,
    sms_opt_in NUMBER DEFAULT 0 CHECK (sms_opt_in IN (0, 1)),
    regdate DATE DEFAULT SYSDATE
);

CREATE TABLE vuumpet_rental (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    phone VARCHAR2(255) NOT NULL,
    product VARCHAR2(255) NOT NULL,
    time VARCHAR2(255) NOT NULL
);
---테이블 삭제-------------
DROP TABLE vuumpet_category CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product_option CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product_option_value CASCADE CONSTRAINTS;
drop table vuumpet_users CASCADE CONSTRAINTS;  
drop table vuumpet_rental CASCADE CONSTRAINTS;  
--- 트리거 생성 ---
GRANT CREATE TRIGGER TO C##dbexam;
CREATE OR REPLACE TRIGGER trg_vuumpet_category
BEFORE INSERT ON vuumpet_category
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_category.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_vuumpet_product
BEFORE INSERT ON vuumpet_product
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_product.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_vuumpet_product_option
BEFORE INSERT ON vuumpet_product_option
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_product_option.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_vuumpet_product_option_value
BEFORE INSERT ON vuumpet_product_option_value
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_product_option_value.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_vuumpet_users
BEFORE INSERT ON vuumpet_users
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_users.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_vuumpet_rental
BEFORE INSERT ON vuumpet_rental
FOR EACH ROW
BEGIN
    :NEW.id := seq_vuumpet_rental.NEXTVAL;
END;
/

