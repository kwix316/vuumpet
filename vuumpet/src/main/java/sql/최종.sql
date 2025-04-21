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
-- VUUMPET_CATEGORY
INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('전체', NULL);

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('신제품 드라이룸', './7thdryroom.jsp');

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('케어&기타소모품', NULL);

INSERT INTO VUUMPET_CATEGORY (CATEGORY_NAME, CATEGORY_LINK) 
VALUES ('큐브드라이어&켄넬', NULL);

-- VUUMPET_PRODUCT
INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫드라이룸 단델리온', 890000, '<p><span style="font-family:ScoreDreamLight;font-size:13px;">10kg 내외 중형견 / 소형견 두마리 동시 사용 가능</span></p>', 1, 2);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫드라이룸 로투스', 1290000, '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">10kg이상 중형견 / 20kg 내외 중대형견</span></p>', 1, 2);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫드라이룸 단델리온 듀얼', 1490000, '<p><span style="font-family:ScoreDreamLight;font-size:13px;">최대 25kg / 다둥이 소형,중형견</span></p><p><span style="font-family:ScoreDreamLight;font-size:13px;">or 중대형견</span></p>', 1, 2);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫드라이룸 로투스 듀얼', 1990000, '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">중형견 다둥이 가족 / 45kg 내외 대형견</span></p>', 1, 2);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫 소프트 캐리어', 79000, '<p><span style="font-family:ScoreDreamLight;font-size:13px;">↓ 최대</span><span style="color:rgb(255,0,0);font-family:ScoreDreamLight;font-size:13px;"> 44<strong>%</strong></span><span style="font-family:ScoreDreamLight;font-size:13px;"> 할인</span></p><p><span style="font-family:ScoreDreamLight;font-size:13px;">4가지 사이즈 (S, M, L, XL)</span></p>', 1, 4);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫 아로마케어 패키지', 24000, '<p><span style="font-family:ScoreDreamLight;font-size:13px;">안티스트레스 | 릴렉스 | 비타민 | 발란스</span></p>', 1, 3);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_INFO, PRODUCT_STOCK, CATEGORY_ID)
VALUES ('붐펫 캐빈필터(1개입)', 12000, '<p><span style="background-color:rgb(255,255,255);font-family:ScoreDreamLight;font-size:13px;">미세먼지 여과용 캐빈필터 (교체사용)</span></p>', 1, 3);

COMMIT;

-- 5. VUUMPET_PRODUCT_OPTION 데이터 삽입 (PRODUCT_ID는 VUUMPET_PRODUCT의 ID 참조)
INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED)
VALUES (1, '색상', 1);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED)
VALUES (2, '색상', 1);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED)
VALUES (3, '색상', 1);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED)
VALUES (4, '색상', 1);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION (PRODUCT_ID, PRODUCT_OPTION_NAME, IS_REQUIRED)
VALUES (5, '사이즈', 1);
COMMIT;

-- 6. VUUMPET_PRODUCT_OPTION_VALUE 데이터 삽입 (OPTION_ID는 VUUMPET_PRODUCT_OPTION의 ID 참조)
INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (1, '화이트', 1, 890000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (2, '화이트', 1, 1290000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (3, '화이트', 1, 1490000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (4, '화이트', 1, 1990000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (5, 'Small', 1, 79000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (5, 'Medium', 1, 99000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (5, 'Large', 1, 119000);

INSERT INTO C##DBEXAM.VUUMPET_PRODUCT_OPTION_VALUE (OPTION_ID, OPTION_VALUE, OPTION_STOCK, OPTION_PRICE)
VALUES (5, 'Extra Large', 1, 139000);
COMMIT;
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
-- 제품 문의 게시판 테이블 생성 (수정됨)
CREATE TABLE vuumpet_qna_board (
    qna_id          NUMBER          CONSTRAINT pk_qna_board PRIMARY KEY,
    user_id         VARCHAR2(255)   NOT NULL,
    qna_title       VARCHAR2(300)   NOT NULL,
    qna_content     CLOB            NOT NULL,
    qna_regdate     DATE            DEFAULT SYSDATE NOT NULL,
    qna_is_secret   NUMBER(1)       DEFAULT 0 NOT NULL CHECK (qna_is_secret IN (0, 1)),
    qna_is_notice   NUMBER(1)       DEFAULT 0 NOT NULL CHECK (qna_is_notice IN (0, 1)), -- ★ 공지사항 여부 컬럼 추가 (0: 일반, 1: 공지)
    CONSTRAINT fk_qna_user FOREIGN KEY (user_id) REFERENCES vuumpet_users(email)
);

---테이블 삭제-------------
DROP TABLE vuumpet_category CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product_option CASCADE CONSTRAINTS;
DROP TABLE vuumpet_product_option_value CASCADE CONSTRAINTS;
drop table vuumpet_users CASCADE CONSTRAINTS;  
drop table vuumpet_rental CASCADE CONSTRAINTS;  
drop table vuumpet_qna_board CASCADE CONSTRAINTS;  
-- 시퀀스 삭제
DROP SEQUENCE seq_vuumpet_category;
DROP SEQUENCE seq_vuumpet_product;
DROP SEQUENCE seq_vuumpet_product_option;
DROP SEQUENCE seq_vuumpet_product_option_value ;
DROP SEQUENCE seq_vuumpet_users;
DROP SEQUENCE seq_vuumpet_rental;
DROP SEQUENCE seq_vuumpet_qna_board;
-- 시퀀스 생성
CREATE SEQUENCE seq_vuumpet_category START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product_option START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_product_option_value START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_users START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_rental START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_vuumpet_qna_board START WITH 1 INCREMENT BY 1 NOCACHE;
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


CREATE OR REPLACE TRIGGER trg_vuumpet_qna_board
BEFORE INSERT ON vuumpet_qna_board
FOR EACH ROW
BEGIN
    -- :NEW.id 를 :NEW.qna_id 로 변경
    :NEW.qna_id := seq_vuumpet_qna_board.NEXTVAL;
END;
/


