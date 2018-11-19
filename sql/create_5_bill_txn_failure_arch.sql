Prompt drop TABLE BILL_TXN_FAILURE;
ALTER TABLE BILL_TXN_FAILURE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE BILL_TXN_FAILURE CASCADE CONSTRAINTS
/

Prompt Table BILL_TXN_FAILURE;
--
-- BILL_TXN_FAILURE  (Table) 
--
CREATE TABLE BILL_TXN_FAILURE
(
  TXN_ID       INTEGER,
  SEQ_ID       NUMBER(3),
  MESSAGE      VARCHAR2(1024 BYTE),
  FREETEXT     VARCHAR2(1024 BYTE),
  MESSAGE_AUX  VARCHAR2(1024 BYTE),
  KEY          VARCHAR2(512 BYTE),
  VERSION      NUMBER(18)
) TABLESPACE tables_arch
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


Prompt Index IDX_BILL_TXN_FAILURE_PK;
--
-- IDX_BILL_TXN_FAILURE_PK  (Index) 
--
CREATE UNIQUE INDEX IDX_BILL_TXN_FAILURE_PK ON BILL_TXN_FAILURE
(TXN_ID, SEQ_ID)
LOGGING
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table BILL_TXN_FAILURE 
-- 
Prompt Non-Foreign Key Constraints on Table BILL_TXN_FAILURE;
ALTER TABLE BILL_TXN_FAILURE ADD (
  CONSTRAINT IDX_BILL_TXN_FAILURE_PK
  PRIMARY KEY
  (TXN_ID, SEQ_ID)
  USING INDEX IDX_BILL_TXN_FAILURE_PK
  ENABLE VALIDATE)
/

-- 
-- Foreign Key Constraints for Table BILL_TXN_FAILURE 
-- 
Prompt Foreign Key Constraints on Table BILL_TXN_FAILURE;
ALTER TABLE BILL_TXN_FAILURE ADD (
  CONSTRAINT IDX_BILL_TXN_FAILURE_FK 
  FOREIGN KEY (TXN_ID, SEQ_ID) 
  REFERENCES BILL_TXN (TXN_ID,SEQ_ID)
  ENABLE NOVALIDATE)
/
