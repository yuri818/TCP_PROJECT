CREATE TABLE YURIPJ.CHATLOG
(
  ROOMNUM    NVARCHAR2(1000)    NOT NULL,
  NICKNAME   VARCHAR2(40 BYTE),
  CHAT_MSG   VARCHAR2(40 BYTE),
  CHAT_DATE  VARCHAR2(40 BYTE)  NOT NULL,
  CHAT_TIME  VARCHAR2(40 BYTE) NOT NULL
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX YURIPJ.PK_ROOMNUM ON YURIPJ.CHATLOG
(ROOMNUM)
LOGGING
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE YURIPJ.CHATLOG ADD (
  CONSTRAINT PK_CHATLOG
  PRIMARY KEY
  (ROOMNUM)
  USING INDEX YURIPJ.PK_ROOMNUM
  ENABLE VALIDATE);

ALTER TABLE YURIPJ.CHATLOG ADD (
  CONSTRAINT FK_NICKNAME 
  FOREIGN KEY (NICKNAME) 
  REFERENCES YURIPJ.MEMBER (ID)
  ENABLE VALIDATE);
