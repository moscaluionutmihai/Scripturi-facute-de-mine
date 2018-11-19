Prompt drop TABLE AUTH_TXN;
ALTER TABLE AUTH_TXN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE AUTH_TXN CASCADE CONSTRAINTS
/

Prompt Table AUTH_TXN;
--
-- AUTH_TXN  (Table) 
--
CREATE TABLE AUTH_TXN
(
  TXN_ID     NUMBER,
  SEQ_ID     NUMBER(3),
  TIMESTAMP  DATE                               NOT NULL,
  STATUS     VARCHAR2(10 BYTE)                  NOT NULL,
  TYPE       VARCHAR2(20 BYTE)                  NOT NULL,
  SRC_ID     VARCHAR2(64 BYTE)                  NOT NULL,
  SRC_TYPE   NUMBER(3)                          NOT NULL,
  SRC_REF    VARCHAR2(64 BYTE),
  CHANNEL    VARCHAR2(16 BYTE)                  NOT NULL,
  REFERENCE  VARCHAR2(512 BYTE),
  PROD_ID    VARCHAR2(64 BYTE),
  FREETEXT   VARCHAR2(128 BYTE),
  MULTIMODE  VARCHAR2(64 BYTE),
  VERSION    NUMBER(18),
  IP_ADDR    VARCHAR2(15 BYTE),
  FLAGS      NUMBER(18)
) TABLESPACE tables_arch
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


Prompt Index IDX_AUTH_TXN_ARCH_PK;
--
-- IDX_AUTH_TXN_ARCH_PK  (Index) 
--
CREATE UNIQUE INDEX IDX_AUTH_TXN_ARCH_PK ON AUTH_TXN
(TXN_ID, SEQ_ID)
LOGGING
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table AUTH_TXN 
-- 
Prompt Non-Foreign Key Constraints on Table AUTH_TXN;
ALTER TABLE AUTH_TXN ADD (
  CONSTRAINT IDX_AUTH_TXN_ARCH_PK
  PRIMARY KEY
  (TXN_ID, SEQ_ID)
  USING INDEX IDX_AUTH_TXN_ARCH_PK
  ENABLE VALIDATE)
/
