--Player

CREATE TABLE Player(
  player_num DECIMAL(12) PRIMARY KEY,
  player_name VARCHAR(64) NOT NULL
);

--rank

CREATE TABLE Rank(
  rank_num DECIMAL(12) PRIMARY KEY,
  rank_name VARCHAR(12) NOT NULL,
  rank_discount FLOAT(12) NOT NULL
);

--Account

CREATE TABLE Account(
  account_num DECIMAL(12) PRIMARY KEY,
  player_num DECIMAL(12) NOT NULL,
  password VARCHAR(64) NOT NULL,
  balance FLOAT(12) NOT NULL,
  rank_num DECIMAL(12) NOT NULL
);

ALTER TABLE Account ADD CONSTRAINT 
account_fk FOREIGN KEY(player_num) 
REFERENCES Player(player_num);

ALTER TABLE Account ADD CONSTRAINT
account_rank_fk FOREIGN KEY(rank_num)
REFERENCES Rank(rank_num);

--Studio

CREATE TABLE Studio(
  studio_num DECIMAL(12) PRIMARY KEY,
  studio_name VARCHAR(64) NOT NULL,
  studio_phone DECIMAL(12)
);

--Designer

CREATE TABLE Designer(
  designer_num DECIMAL(12) PRIMARY KEY,
  studio_num DECIMAL(12) NOT NULL,
  designer_name VARCHAR(64) NOT NULL
);

ALTER TABLE Designer ADD CONSTRAINT
designer_fk FOREIGN KEY(studio_num)
REFERENCES Studio(studio_num);

--Game

CREATE TABLE Game(
  game_num DECIMAL(12) PRIMARY KEY,
  studio_num DECIMAL(12) NOT NULL,
  game_name VARCHAR(64) NOT NULL,
  type VARCHAR(64) NOT NULL,
  console_name VARCHAR(64) NOT NULL,
  price FLOAT(12) NOT NULL
);

ALTER TABLE Game ADD CONSTRAINT
game_fk FOREIGN KEY(studio_num)
REFERENCES Studio(studio_num);

--Price history

CREATE TABLE Price_history(
  HISTORY_NUM NUMBER(12, 0) PRIMARY KEY,
  GAME_NUM NUMBER(12, 0) NOT NULL,
  OLD_PRICE FLOAT(12) NOT NULL,
  NEW_PRICE FLOAT(12) NOT NULL
);

ALTER TABLE Price_history ADD CONSTRAINT 
Price_history_game_fk FOREIGN KEY(GAME_NUM)
REFERENCES GAME(GAME_NUM);

--Shopping cart

CREATE TABLE Shopping_cart(
account_num DECIMAL(12),
game_num DECIMAL(12)
);

ALTER TABLE Shopping_cart ADD CONSTRAINT shopping_cart_pk
PRIMARY KEY(account_num, game_num);

ALTER TABLE Shopping_cart ADD CONSTRAINT cart_account_fk
FOREIGN KEY(account_num) REFERENCES ACCOUNT(account_num);

ALTER TABLE Shopping_cart ADD CONSTRAINT cart_game_fk
FOREIGN KEY(game_num) REFERENCES GAME(game_num);

--Shopping history

CREATE TABLE SHOPPING_HISTORY(
  SHOPPING_NUM NUMBER(12, 0) PRIMARY KEY, 
  TOTAL FLOAT(12) NOT NULL , 
  SHOPPING_DATE DATE NOT NULL , 
  ACCOUNT_NUM NUMBER(12, 0) NOT NULL
);

ALTER TABLE SHOPPING_HISTORY ADD CONSTRAINT 
SHOPPING_HISTORY_FK FOREIGN KEY(ACCOUNT_NUM)
REFERENCES ACCOUNT(ACCOUNT_NUM);

--Shopping detail

CREATE TABLE Shopping_detail(
  SHOPPING_NUM NUMBER(12, 0) NOT NULL, 
  GAME_NUM NUMBER(12, 0) NOT NULL, 
  PRICE_W_TAX FLOAT(12) NOT NULL 
)

ALTER TABLE SHOPPING_DETAIL ADD CONSTRAINT 
SHOPPING_DETAIL_FK1 FOREIGN KEY(SHOPPING_NUM)
REFERENCES SHOPPING_HISTORY(SHOPPING_NUM);

ALTER TABLE SHOPPING_DETAIL ADD CONSTRAINT 
SHOPPING_DETAIL_FK2 FOREIGN KEY(GAME_NUM)
REFERENCES GAME(GAME_NUM);
