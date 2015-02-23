create schema empower_wk;

CREATE TABLE EMPOWER_WK.LN_CONDITIONS(
        LNKEY varchar(20) NOT NULL,
        IDX int NOT NULL,
        AUTHORITYLEVEL int NULL,
        CONDID int NULL,
        DATEADDED timestamp NULL,
        DESCRIPTION varchar(2000) NULL,
        PARTYID int NULL,
        STATUSID int NULL,
        TYPEID int NULL,
        MODIFIEDBY varchar(62) NULL,
        CATID int NULL,
        CONDITION_SOURCE int NULL
)
distributed by
(
        LNKEY ,
        IDX
);

