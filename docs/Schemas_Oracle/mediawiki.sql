--------------------------------------------------------
--  File created - Sunday-July-05-2015   
--------------------------------------------------------
DROP TABLE "MWARCHIVE";
DROP TABLE "MWCATEGORY";
DROP TABLE "MWCATEGORYLINKS";
DROP TABLE "MWCHANGE_TAG";
DROP TABLE "MWEXTERNALLINKS";
DROP TABLE "MWFILEARCHIVE";
DROP TABLE "MWHITCOUNTER";
DROP TABLE "MWIMAGE";
DROP TABLE "MWIMAGELINKS";
DROP TABLE "MWINTERWIKI";
DROP TABLE "MWIPBLOCKS";
DROP TABLE "MWIWLINKS";
DROP TABLE "MWJOB";
DROP TABLE "MWL10N_CACHE";
DROP TABLE "MWLANGLINKS";
DROP TABLE "MWLOGGING";
DROP TABLE "MWLOG_SEARCH";
DROP TABLE "MWMODULE_DEPS";
DROP TABLE "MWMSG_RESOURCE";
DROP TABLE "MWMSG_RESOURCE_LINKS";
DROP TABLE "MWMWUSER";
DROP TABLE "MWOBJECTCACHE";
DROP TABLE "MWOLDIMAGE";
DROP TABLE "MWPAGE";
DROP TABLE "MWPAGECONTENT";
DROP TABLE "MWPAGELINKS";
DROP TABLE "MWPAGE_PROPS";
DROP TABLE "MWPAGE_RESTRICTIONS";
DROP TABLE "MWPROTECTED_TITLES";
DROP TABLE "MWQUERYCACHE";
DROP TABLE "MWQUERYCACHETWO";
DROP TABLE "MWQUERYCACHE_INFO";
DROP TABLE "MWRECENTCHANGES";
DROP TABLE "MWREDIRECT";
DROP TABLE "MWREVISION";
DROP TABLE "MWSEARCHINDEX";
DROP TABLE "MWSITES";
DROP TABLE "MWSITE_IDENTIFIERS";
DROP TABLE "MWSITE_STATS";
DROP TABLE "MWTAG_SUMMARY";
DROP TABLE "MWTEMPLATELINKS";
DROP TABLE "MWTRANSCACHE";
DROP TABLE "MWUPDATELOG";
DROP TABLE "MWUPLOADSTASH";
DROP TABLE "MWUSER_FORMER_GROUPS";
DROP TABLE "MWUSER_GROUPS";
DROP TABLE "MWUSER_NEWTALK";
DROP TABLE "MWUSER_PROPERTIES";
DROP TABLE "MWVALID_TAG";
DROP TABLE "MWWATCHLIST";
DROP SEQUENCE "ARCHIVE_AR_ID_SEQ";
DROP SEQUENCE "CATEGORY_CAT_ID_SEQ";
DROP SEQUENCE "EXTERNALLINKS_EL_ID_SEQ";
DROP SEQUENCE "FILEARCHIVE_FA_ID_SEQ";
DROP SEQUENCE "IPBLOCKS_IPB_ID_SEQ";
DROP SEQUENCE "JOB_JOB_ID_SEQ";
DROP SEQUENCE "LOGGING_LOG_ID_SEQ";
DROP SEQUENCE "PAGE_PAGE_ID_SEQ";
DROP SEQUENCE "PAGE_RESTRICTIONS_PR_ID_SEQ";
DROP SEQUENCE "RECENTCHANGES_RC_ID_SEQ";
DROP SEQUENCE "REVISION_REV_ID_SEQ";
DROP SEQUENCE "SITES_SITE_ID_SEQ";
DROP SEQUENCE "TEXT_OLD_ID_SEQ";
DROP SEQUENCE "UPLOADSTASH_US_ID_SEQ";
DROP SEQUENCE "USER_USER_ID_SEQ";
--------------------------------------------------------
--  DDL for Sequence ARCHIVE_AR_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ARCHIVE_AR_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CATEGORY_CAT_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CATEGORY_CAT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EXTERNALLINKS_EL_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EXTERNALLINKS_EL_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FILEARCHIVE_FA_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FILEARCHIVE_FA_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence IPBLOCKS_IPB_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "IPBLOCKS_IPB_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JOB_JOB_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JOB_JOB_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGGING_LOG_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOGGING_LOG_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PAGE_PAGE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PAGE_PAGE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PAGE_RESTRICTIONS_PR_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PAGE_RESTRICTIONS_PR_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RECENTCHANGES_RC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RECENTCHANGES_RC_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REVISION_REV_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REVISION_REV_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SITES_SITE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SITES_SITE_ID_SEQ"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TEXT_OLD_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEXT_OLD_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UPLOADSTASH_US_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "UPLOADSTASH_US_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_USER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "USER_USER_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table MWARCHIVE
--------------------------------------------------------

  CREATE TABLE "MWARCHIVE" 
   (    "AR_ID" NUMBER, 
	"AR_NAMESPACE" NUMBER DEFAULT 0, 
	"AR_TITLE" VARCHAR2(255), 
	"AR_TEXT" CLOB, 
	"AR_COMMENT" VARCHAR2(255), 
	"AR_USER" NUMBER DEFAULT 0, 
	"AR_USER_TEXT" VARCHAR2(255), 
	"AR_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"AR_MINOR_EDIT" CHAR(1) DEFAULT '0', 
	"AR_FLAGS" VARCHAR2(255), 
	"AR_REV_ID" NUMBER, 
	"AR_TEXT_ID" NUMBER, 
	"AR_DELETED" CHAR(1) DEFAULT '0', 
	"AR_LEN" NUMBER, 
	"AR_PAGE_ID" NUMBER, 
	"AR_PARENT_ID" NUMBER, 
	"AR_SHA1" VARCHAR2(32), 
	"AR_CONTENT_MODEL" VARCHAR2(32), 
	"AR_CONTENT_FORMAT" VARCHAR2(64)
   ) ;
--------------------------------------------------------
--  DDL for Table MWCATEGORY
--------------------------------------------------------

  CREATE TABLE "MWCATEGORY" 
   (	"CAT_ID" NUMBER, 
	"CAT_TITLE" VARCHAR2(255), 
	"CAT_PAGES" NUMBER DEFAULT 0, 
	"CAT_SUBCATS" NUMBER DEFAULT 0, 
	"CAT_FILES" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MWCATEGORYLINKS
--------------------------------------------------------

  CREATE TABLE "MWCATEGORYLINKS" 
   (	"CL_FROM" NUMBER, 
	"CL_TO" VARCHAR2(255), 
	"CL_SORTKEY" VARCHAR2(230), 
	"CL_SORTKEY_PREFIX" VARCHAR2(255), 
	"CL_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"CL_COLLATION" VARCHAR2(32), 
	"CL_TYPE" VARCHAR2(6) DEFAULT 'page'
   ) ;
--------------------------------------------------------
--  DDL for Table MWCHANGE_TAG
--------------------------------------------------------

  CREATE TABLE "MWCHANGE_TAG" 
   (	"CT_RC_ID" NUMBER, 
	"CT_LOG_ID" NUMBER, 
	"CT_REV_ID" NUMBER, 
	"CT_TAG" VARCHAR2(255), 
	"CT_PARAMS" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWEXTERNALLINKS
--------------------------------------------------------

  CREATE TABLE "MWEXTERNALLINKS" 
   (	"EL_ID" NUMBER, 
	"EL_FROM" NUMBER, 
	"EL_TO" VARCHAR2(2048), 
	"EL_INDEX" VARCHAR2(2048)
   ) ;
--------------------------------------------------------
--  DDL for Table MWFILEARCHIVE
--------------------------------------------------------

  CREATE TABLE "MWFILEARCHIVE" 
   (	"FA_ID" NUMBER, 
	"FA_NAME" VARCHAR2(255), 
	"FA_ARCHIVE_NAME" VARCHAR2(255), 
	"FA_STORAGE_GROUP" VARCHAR2(16), 
	"FA_STORAGE_KEY" VARCHAR2(64), 
	"FA_DELETED_USER" NUMBER DEFAULT 0, 
	"FA_DELETED_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"FA_DELETED_REASON" CLOB, 
	"FA_SIZE" NUMBER DEFAULT 0, 
	"FA_WIDTH" NUMBER DEFAULT 0, 
	"FA_HEIGHT" NUMBER DEFAULT 0, 
	"FA_METADATA" CLOB, 
	"FA_BITS" NUMBER DEFAULT 0, 
	"FA_MEDIA_TYPE" VARCHAR2(32) DEFAULT NULL, 
	"FA_MAJOR_MIME" VARCHAR2(32) DEFAULT 'unknown', 
	"FA_MINOR_MIME" VARCHAR2(100) DEFAULT 'unknown', 
	"FA_DESCRIPTION" VARCHAR2(255), 
	"FA_USER" NUMBER DEFAULT 0, 
	"FA_USER_TEXT" VARCHAR2(255), 
	"FA_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"FA_DELETED" NUMBER DEFAULT 0, 
	"FA_SHA1" VARCHAR2(32)
   ) ;
--------------------------------------------------------
--  DDL for Table MWHITCOUNTER
--------------------------------------------------------

  CREATE TABLE "MWHITCOUNTER" 
   (	"HC_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table MWIMAGE
--------------------------------------------------------

  CREATE TABLE "MWIMAGE" 
   (	"IMG_NAME" VARCHAR2(255), 
	"IMG_SIZE" NUMBER DEFAULT 0, 
	"IMG_WIDTH" NUMBER DEFAULT 0, 
	"IMG_HEIGHT" NUMBER DEFAULT 0, 
	"IMG_METADATA" CLOB, 
	"IMG_BITS" NUMBER DEFAULT 0, 
	"IMG_MEDIA_TYPE" VARCHAR2(32), 
	"IMG_MAJOR_MIME" VARCHAR2(32) DEFAULT 'unknown', 
	"IMG_MINOR_MIME" VARCHAR2(100) DEFAULT 'unknown', 
	"IMG_DESCRIPTION" VARCHAR2(255), 
	"IMG_USER" NUMBER DEFAULT 0, 
	"IMG_USER_TEXT" VARCHAR2(255), 
	"IMG_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"IMG_SHA1" VARCHAR2(32)
   ) ;
--------------------------------------------------------
--  DDL for Table MWIMAGELINKS
--------------------------------------------------------

  CREATE TABLE "MWIMAGELINKS" 
   (	"IL_FROM" NUMBER, 
	"IL_TO" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWINTERWIKI
--------------------------------------------------------

  CREATE TABLE "MWINTERWIKI" 
   (	"IW_PREFIX" VARCHAR2(32), 
	"IW_URL" VARCHAR2(127), 
	"IW_API" BLOB, 
	"IW_WIKIID" VARCHAR2(64), 
	"IW_LOCAL" CHAR(1), 
	"IW_TRANS" CHAR(1) DEFAULT '0'
   ) ;
--------------------------------------------------------
--  DDL for Table MWIPBLOCKS
--------------------------------------------------------

  CREATE TABLE "MWIPBLOCKS" 
   (	"IPB_ID" NUMBER, 
	"IPB_ADDRESS" VARCHAR2(255), 
	"IPB_USER" NUMBER DEFAULT 0, 
	"IPB_BY" NUMBER DEFAULT 0, 
	"IPB_BY_TEXT" VARCHAR2(255), 
	"IPB_REASON" VARCHAR2(255), 
	"IPB_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"IPB_AUTO" CHAR(1) DEFAULT '0', 
	"IPB_ANON_ONLY" CHAR(1) DEFAULT '0', 
	"IPB_CREATE_ACCOUNT" CHAR(1) DEFAULT '1', 
	"IPB_ENABLE_AUTOBLOCK" CHAR(1) DEFAULT '1', 
	"IPB_EXPIRY" TIMESTAMP (6) WITH TIME ZONE, 
	"IPB_RANGE_START" VARCHAR2(255), 
	"IPB_RANGE_END" VARCHAR2(255), 
	"IPB_DELETED" CHAR(1) DEFAULT '0', 
	"IPB_BLOCK_EMAIL" CHAR(1) DEFAULT '0', 
	"IPB_ALLOW_USERTALK" CHAR(1) DEFAULT '0', 
	"IPB_PARENT_BLOCK_ID" NUMBER DEFAULT NULL
   ) ;
--------------------------------------------------------
--  DDL for Table MWIWLINKS
--------------------------------------------------------

  CREATE TABLE "MWIWLINKS" 
   (	"IWL_FROM" NUMBER DEFAULT 0, 
	"IWL_PREFIX" VARCHAR2(20), 
	"IWL_TITLE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWJOB
--------------------------------------------------------

  CREATE TABLE "MWJOB" 
   (	"JOB_ID" NUMBER, 
	"JOB_CMD" VARCHAR2(60), 
	"JOB_NAMESPACE" NUMBER DEFAULT 0, 
	"JOB_TITLE" VARCHAR2(255), 
	"JOB_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"JOB_PARAMS" CLOB, 
	"JOB_RANDOM" NUMBER DEFAULT 0, 
	"JOB_TOKEN" VARCHAR2(32), 
	"JOB_TOKEN_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"JOB_SHA1" VARCHAR2(32), 
	"JOB_ATTEMPTS" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MWL10N_CACHE
--------------------------------------------------------

  CREATE TABLE "MWL10N_CACHE" 
   (	"LC_LANG" VARCHAR2(32), 
	"LC_KEY" VARCHAR2(255), 
	"LC_VALUE" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWLANGLINKS
--------------------------------------------------------

  CREATE TABLE "MWLANGLINKS" 
   (	"LL_FROM" NUMBER, 
	"LL_LANG" VARCHAR2(20), 
	"LL_TITLE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWLOGGING
--------------------------------------------------------

  CREATE TABLE "MWLOGGING" 
   (	"LOG_ID" NUMBER, 
	"LOG_TYPE" VARCHAR2(10), 
	"LOG_ACTION" VARCHAR2(10), 
	"LOG_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"LOG_USER" NUMBER DEFAULT 0, 
	"LOG_USER_TEXT" VARCHAR2(255), 
	"LOG_NAMESPACE" NUMBER DEFAULT 0, 
	"LOG_TITLE" VARCHAR2(255), 
	"LOG_PAGE" NUMBER, 
	"LOG_COMMENT" VARCHAR2(255), 
	"LOG_PARAMS" CLOB, 
	"LOG_DELETED" CHAR(1) DEFAULT '0'
   ) ;
--------------------------------------------------------
--  DDL for Table MWLOG_SEARCH
--------------------------------------------------------

  CREATE TABLE "MWLOG_SEARCH" 
   (	"LS_FIELD" VARCHAR2(32), 
	"LS_VALUE" VARCHAR2(255), 
	"LS_LOG_ID" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MWMODULE_DEPS
--------------------------------------------------------

  CREATE TABLE "MWMODULE_DEPS" 
   (	"MD_MODULE" VARCHAR2(255), 
	"MD_SKIN" VARCHAR2(32), 
	"MD_DEPS" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWMSG_RESOURCE
--------------------------------------------------------

  CREATE TABLE "MWMSG_RESOURCE" 
   (	"MR_RESOURCE" VARCHAR2(255), 
	"MR_LANG" VARCHAR2(32), 
	"MR_BLOB" BLOB, 
	"MR_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWMSG_RESOURCE_LINKS
--------------------------------------------------------

  CREATE TABLE "MWMSG_RESOURCE_LINKS" 
   (	"MRL_RESOURCE" VARCHAR2(255), 
	"MRL_MESSAGE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWMWUSER
--------------------------------------------------------

  CREATE TABLE "MWMWUSER" 
   (	"USER_ID" NUMBER, 
	"USER_NAME" VARCHAR2(255), 
	"USER_REAL_NAME" VARCHAR2(512), 
	"USER_PASSWORD" VARCHAR2(255), 
	"USER_NEWPASSWORD" VARCHAR2(255), 
	"USER_NEWPASS_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"USER_TOKEN" VARCHAR2(32), 
	"USER_EMAIL" VARCHAR2(255), 
	"USER_EMAIL_TOKEN" VARCHAR2(32), 
	"USER_EMAIL_TOKEN_EXPIRES" TIMESTAMP (6) WITH TIME ZONE, 
	"USER_EMAIL_AUTHENTICATED" TIMESTAMP (6) WITH TIME ZONE, 
	"USER_OPTIONS" CLOB, 
	"USER_TOUCHED" TIMESTAMP (6) WITH TIME ZONE, 
	"USER_REGISTRATION" TIMESTAMP (6) WITH TIME ZONE, 
	"USER_EDITCOUNT" NUMBER, 
	"USER_PASSWORD_EXPIRES" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWOBJECTCACHE
--------------------------------------------------------

  CREATE TABLE "MWOBJECTCACHE" 
   (	"KEYNAME" VARCHAR2(255), 
	"VALUE" BLOB, 
	"EXPTIME" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWOLDIMAGE
--------------------------------------------------------

  CREATE TABLE "MWOLDIMAGE" 
   (	"OI_NAME" VARCHAR2(255) DEFAULT 0, 
	"OI_ARCHIVE_NAME" VARCHAR2(255), 
	"OI_SIZE" NUMBER DEFAULT 0, 
	"OI_WIDTH" NUMBER DEFAULT 0, 
	"OI_HEIGHT" NUMBER DEFAULT 0, 
	"OI_BITS" NUMBER DEFAULT 0, 
	"OI_DESCRIPTION" VARCHAR2(255), 
	"OI_USER" NUMBER DEFAULT 0, 
	"OI_USER_TEXT" VARCHAR2(255), 
	"OI_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"OI_METADATA" CLOB, 
	"OI_MEDIA_TYPE" VARCHAR2(32) DEFAULT NULL, 
	"OI_MAJOR_MIME" VARCHAR2(32) DEFAULT 'unknown', 
	"OI_MINOR_MIME" VARCHAR2(100) DEFAULT 'unknown', 
	"OI_DELETED" NUMBER DEFAULT 0, 
	"OI_SHA1" VARCHAR2(32)
   ) ;
--------------------------------------------------------
--  DDL for Table MWPAGE
--------------------------------------------------------

  CREATE TABLE "MWPAGE" 
   (	"PAGE_ID" NUMBER, 
	"PAGE_NAMESPACE" NUMBER DEFAULT 0, 
	"PAGE_TITLE" VARCHAR2(255), 
	"PAGE_RESTRICTIONS" VARCHAR2(255), 
	"PAGE_COUNTER" NUMBER DEFAULT 0, 
	"PAGE_IS_REDIRECT" CHAR(1) DEFAULT '0', 
	"PAGE_IS_NEW" CHAR(1) DEFAULT '0', 
	"PAGE_RANDOM" NUMBER(15,14), 
	"PAGE_TOUCHED" TIMESTAMP (6) WITH TIME ZONE, 
	"PAGE_LINKS_UPDATED" TIMESTAMP (6) WITH TIME ZONE, 
	"PAGE_LATEST" NUMBER DEFAULT 0, 
	"PAGE_LEN" NUMBER DEFAULT 0, 
	"PAGE_CONTENT_MODEL" VARCHAR2(32)
   ) ;
--------------------------------------------------------
--  DDL for Table MWPAGECONTENT
--------------------------------------------------------

  CREATE TABLE "MWPAGECONTENT" 
   (	"OLD_ID" NUMBER, 
	"OLD_TEXT" CLOB, 
	"OLD_FLAGS" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWPAGELINKS
--------------------------------------------------------

  CREATE TABLE "MWPAGELINKS" 
   (	"PL_FROM" NUMBER, 
	"PL_NAMESPACE" NUMBER DEFAULT 0, 
	"PL_TITLE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWPAGE_PROPS
--------------------------------------------------------

  CREATE TABLE "MWPAGE_PROPS" 
   (	"PP_PAGE" NUMBER, 
	"PP_PROPNAME" VARCHAR2(60), 
	"PP_VALUE" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWPAGE_RESTRICTIONS
--------------------------------------------------------

  CREATE TABLE "MWPAGE_RESTRICTIONS" 
   (	"PR_ID" NUMBER, 
	"PR_PAGE" NUMBER, 
	"PR_TYPE" VARCHAR2(255), 
	"PR_LEVEL" VARCHAR2(255), 
	"PR_CASCADE" NUMBER, 
	"PR_USER" NUMBER, 
	"PR_EXPIRY" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWPROTECTED_TITLES
--------------------------------------------------------

  CREATE TABLE "MWPROTECTED_TITLES" 
   (	"PT_NAMESPACE" NUMBER DEFAULT 0, 
	"PT_TITLE" VARCHAR2(255), 
	"PT_USER" NUMBER, 
	"PT_REASON" VARCHAR2(255), 
	"PT_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"PT_EXPIRY" VARCHAR2(14), 
	"PT_CREATE_PERM" VARCHAR2(60)
   ) ;
--------------------------------------------------------
--  DDL for Table MWQUERYCACHE
--------------------------------------------------------

  CREATE TABLE "MWQUERYCACHE" 
   (	"QC_TYPE" VARCHAR2(32), 
	"QC_VALUE" NUMBER DEFAULT 0, 
	"QC_NAMESPACE" NUMBER DEFAULT 0, 
	"QC_TITLE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWQUERYCACHETWO
--------------------------------------------------------

  CREATE TABLE "MWQUERYCACHETWO" 
   (	"QCC_TYPE" VARCHAR2(32), 
	"QCC_VALUE" NUMBER DEFAULT 0, 
	"QCC_NAMESPACE" NUMBER DEFAULT 0, 
	"QCC_TITLE" VARCHAR2(255), 
	"QCC_NAMESPACETWO" NUMBER DEFAULT 0, 
	"QCC_TITLETWO" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWQUERYCACHE_INFO
--------------------------------------------------------

  CREATE TABLE "MWQUERYCACHE_INFO" 
   (	"QCI_TYPE" VARCHAR2(32), 
	"QCI_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWRECENTCHANGES
--------------------------------------------------------

  CREATE TABLE "MWRECENTCHANGES" 
   (	"RC_ID" NUMBER, 
	"RC_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"RC_CUR_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"RC_USER" NUMBER DEFAULT 0, 
	"RC_USER_TEXT" VARCHAR2(255), 
	"RC_NAMESPACE" NUMBER DEFAULT 0, 
	"RC_TITLE" VARCHAR2(255), 
	"RC_COMMENT" VARCHAR2(255), 
	"RC_MINOR" CHAR(1) DEFAULT '0', 
	"RC_BOT" CHAR(1) DEFAULT '0', 
	"RC_NEW" CHAR(1) DEFAULT '0', 
	"RC_CUR_ID" NUMBER DEFAULT 0, 
	"RC_THIS_OLDID" NUMBER DEFAULT 0, 
	"RC_LAST_OLDID" NUMBER DEFAULT 0, 
	"RC_TYPE" CHAR(1) DEFAULT '0', 
	"RC_SOURCE" VARCHAR2(16), 
	"RC_PATROLLED" CHAR(1) DEFAULT '0', 
	"RC_IP" VARCHAR2(15), 
	"RC_OLD_LEN" NUMBER, 
	"RC_NEW_LEN" NUMBER, 
	"RC_DELETED" CHAR(1) DEFAULT '0', 
	"RC_LOGID" NUMBER DEFAULT 0, 
	"RC_LOG_TYPE" VARCHAR2(255), 
	"RC_LOG_ACTION" VARCHAR2(255), 
	"RC_PARAMS" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWREDIRECT
--------------------------------------------------------

  CREATE TABLE "MWREDIRECT" 
   (	"RD_FROM" NUMBER, 
	"RD_NAMESPACE" NUMBER DEFAULT 0, 
	"RD_TITLE" VARCHAR2(255), 
	"RD_INTERWIKI" VARCHAR2(32), 
	"RD_FRAGMENT" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWREVISION
--------------------------------------------------------

  CREATE TABLE "MWREVISION" 
   (	"REV_ID" NUMBER, 
	"REV_PAGE" NUMBER, 
	"REV_TEXT_ID" NUMBER, 
	"REV_COMMENT" VARCHAR2(255), 
	"REV_USER" NUMBER DEFAULT 0, 
	"REV_USER_TEXT" VARCHAR2(255), 
	"REV_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"REV_MINOR_EDIT" CHAR(1) DEFAULT '0', 
	"REV_DELETED" CHAR(1) DEFAULT '0', 
	"REV_LEN" NUMBER, 
	"REV_PARENT_ID" NUMBER DEFAULT NULL, 
	"REV_SHA1" VARCHAR2(32), 
	"REV_CONTENT_MODEL" VARCHAR2(32), 
	"REV_CONTENT_FORMAT" VARCHAR2(64)
   ) ;
--------------------------------------------------------
--  DDL for Table MWSEARCHINDEX
--------------------------------------------------------

  CREATE TABLE "MWSEARCHINDEX" 
   (	"SI_PAGE" NUMBER, 
	"SI_TITLE" VARCHAR2(255), 
	"SI_TEXT" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWSITES
--------------------------------------------------------

  CREATE TABLE "MWSITES" 
   (	"SITE_ID" NUMBER, 
	"SITE_GLOBAL_KEY" VARCHAR2(32), 
	"SITE_TYPE" VARCHAR2(32), 
	"SITE_GROUP" VARCHAR2(32), 
	"SITE_SOURCE" VARCHAR2(32), 
	"SITE_LANGUAGE" VARCHAR2(32), 
	"SITE_PROTOCOL" VARCHAR2(32), 
	"SITE_DOMAIN" VARCHAR2(255), 
	"SITE_DATA" BLOB, 
	"SITE_FORWARD" NUMBER(1,0), 
	"SITE_CONFIG" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWSITE_IDENTIFIERS
--------------------------------------------------------

  CREATE TABLE "MWSITE_IDENTIFIERS" 
   (	"SI_SITE" NUMBER, 
	"SI_TYPE" VARCHAR2(32), 
	"SI_KEY" VARCHAR2(32)
   ) ;
--------------------------------------------------------
--  DDL for Table MWSITE_STATS
--------------------------------------------------------

  CREATE TABLE "MWSITE_STATS" 
   (	"SS_ROW_ID" NUMBER, 
	"SS_TOTAL_VIEWS" NUMBER DEFAULT 0, 
	"SS_TOTAL_EDITS" NUMBER DEFAULT 0, 
	"SS_GOOD_ARTICLES" NUMBER DEFAULT 0, 
	"SS_TOTAL_PAGES" NUMBER DEFAULT -1, 
	"SS_USERS" NUMBER DEFAULT -1, 
	"SS_ACTIVE_USERS" NUMBER DEFAULT -1, 
	"SS_IMAGES" NUMBER DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table MWTAG_SUMMARY
--------------------------------------------------------

  CREATE TABLE "MWTAG_SUMMARY" 
   (	"TS_RC_ID" NUMBER, 
	"TS_LOG_ID" NUMBER, 
	"TS_REV_ID" NUMBER, 
	"TS_TAGS" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWTEMPLATELINKS
--------------------------------------------------------

  CREATE TABLE "MWTEMPLATELINKS" 
   (	"TL_FROM" NUMBER, 
	"TL_NAMESPACE" NUMBER DEFAULT 0, 
	"TL_TITLE" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWTRANSCACHE
--------------------------------------------------------

  CREATE TABLE "MWTRANSCACHE" 
   (	"TC_URL" VARCHAR2(255), 
	"TC_CONTENTS" CLOB, 
	"TC_TIME" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWUPDATELOG
--------------------------------------------------------

  CREATE TABLE "MWUPDATELOG" 
   (	"UL_KEY" VARCHAR2(255), 
	"UL_VALUE" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWUPLOADSTASH
--------------------------------------------------------

  CREATE TABLE "MWUPLOADSTASH" 
   (	"US_ID" NUMBER, 
	"US_USER" NUMBER DEFAULT 0, 
	"US_KEY" VARCHAR2(255), 
	"US_ORIG_PATH" VARCHAR2(255), 
	"US_PATH" VARCHAR2(255), 
	"US_SOURCE_TYPE" VARCHAR2(50), 
	"US_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE, 
	"US_STATUS" VARCHAR2(50), 
	"US_CHUNK_INX" NUMBER, 
	"US_SIZE" NUMBER, 
	"US_SHA1" VARCHAR2(32), 
	"US_MIME" VARCHAR2(255), 
	"US_MEDIA_TYPE" VARCHAR2(32) DEFAULT NULL, 
	"US_IMAGE_WIDTH" NUMBER, 
	"US_IMAGE_HEIGHT" NUMBER, 
	"US_IMAGE_BITS" NUMBER, 
	"US_PROPS" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWUSER_FORMER_GROUPS
--------------------------------------------------------

  CREATE TABLE "MWUSER_FORMER_GROUPS" 
   (	"UFG_USER" NUMBER DEFAULT 0, 
	"UFG_GROUP" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWUSER_GROUPS
--------------------------------------------------------

  CREATE TABLE "MWUSER_GROUPS" 
   (	"UG_USER" NUMBER DEFAULT 0, 
	"UG_GROUP" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWUSER_NEWTALK
--------------------------------------------------------

  CREATE TABLE "MWUSER_NEWTALK" 
   (	"USER_ID" NUMBER DEFAULT 0, 
	"USER_IP" VARCHAR2(40), 
	"USER_LAST_TIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Table MWUSER_PROPERTIES
--------------------------------------------------------

  CREATE TABLE "MWUSER_PROPERTIES" 
   (	"UP_USER" NUMBER, 
	"UP_PROPERTY" VARCHAR2(255), 
	"UP_VALUE" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table MWVALID_TAG
--------------------------------------------------------

  CREATE TABLE "MWVALID_TAG" 
   (	"VT_TAG" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  DDL for Table MWWATCHLIST
--------------------------------------------------------

  CREATE TABLE "MWWATCHLIST" 
   (	"WL_USER" NUMBER, 
	"WL_NAMESPACE" NUMBER DEFAULT 0, 
	"WL_TITLE" VARCHAR2(255), 
	"WL_NOTIFICATIONTIMESTAMP" TIMESTAMP (6) WITH TIME ZONE
   ) ;
--------------------------------------------------------
--  DDL for Index MWARCHIVE_I01
--------------------------------------------------------

  CREATE INDEX "MWARCHIVE_I01" ON "MWARCHIVE" ("AR_NAMESPACE", "AR_TITLE", SYS_EXTRACT_UTC("AR_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWARCHIVE_I02
--------------------------------------------------------

  CREATE INDEX "MWARCHIVE_I02" ON "MWARCHIVE" ("AR_USER_TEXT", SYS_EXTRACT_UTC("AR_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWARCHIVE_I03
--------------------------------------------------------

  CREATE INDEX "MWARCHIVE_I03" ON "MWARCHIVE" ("AR_REV_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWARCHIVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWARCHIVE_PK" ON "MWARCHIVE" ("AR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORYLINKS_I01
--------------------------------------------------------

  CREATE INDEX "MWCATEGORYLINKS_I01" ON "MWCATEGORYLINKS" ("CL_TO", "CL_TYPE", "CL_SORTKEY", "CL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORYLINKS_I02
--------------------------------------------------------

  CREATE INDEX "MWCATEGORYLINKS_I02" ON "MWCATEGORYLINKS" ("CL_TO", SYS_EXTRACT_UTC("CL_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORYLINKS_I03
--------------------------------------------------------

  CREATE INDEX "MWCATEGORYLINKS_I03" ON "MWCATEGORYLINKS" ("CL_COLLATION") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORYLINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCATEGORYLINKS_U01" ON "MWCATEGORYLINKS" ("CL_FROM", "CL_TO") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORY_I01
--------------------------------------------------------

  CREATE INDEX "MWCATEGORY_I01" ON "MWCATEGORY" ("CAT_PAGES") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCATEGORY_PK" ON "MWCATEGORY" ("CAT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWCATEGORY_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCATEGORY_U01" ON "MWCATEGORY" ("CAT_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWCHANGE_TAG_I01
--------------------------------------------------------

  CREATE INDEX "MWCHANGE_TAG_I01" ON "MWCHANGE_TAG" ("CT_TAG", "CT_RC_ID", "CT_REV_ID", "CT_LOG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWCHANGE_TAG_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCHANGE_TAG_U01" ON "MWCHANGE_TAG" ("CT_RC_ID", "CT_TAG") 
  ;
--------------------------------------------------------
--  DDL for Index MWCHANGE_TAG_U02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCHANGE_TAG_U02" ON "MWCHANGE_TAG" ("CT_LOG_ID", "CT_TAG") 
  ;
--------------------------------------------------------
--  DDL for Index MWCHANGE_TAG_U03
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWCHANGE_TAG_U03" ON "MWCHANGE_TAG" ("CT_REV_ID", "CT_TAG") 
  ;
--------------------------------------------------------
--  DDL for Index MWEXTERNALLINKS_I01
--------------------------------------------------------

  CREATE INDEX "MWEXTERNALLINKS_I01" ON "MWEXTERNALLINKS" ("EL_FROM", "EL_TO") 
  ;
--------------------------------------------------------
--  DDL for Index MWEXTERNALLINKS_I02
--------------------------------------------------------

  CREATE INDEX "MWEXTERNALLINKS_I02" ON "MWEXTERNALLINKS" ("EL_TO", "EL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWEXTERNALLINKS_I03
--------------------------------------------------------

  CREATE INDEX "MWEXTERNALLINKS_I03" ON "MWEXTERNALLINKS" ("EL_INDEX") 
  ;
--------------------------------------------------------
--  DDL for Index MWEXTERNALLINKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWEXTERNALLINKS_PK" ON "MWEXTERNALLINKS" ("EL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_I01
--------------------------------------------------------

  CREATE INDEX "MWFILEARCHIVE_I01" ON "MWFILEARCHIVE" ("FA_NAME", SYS_EXTRACT_UTC("FA_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_I02
--------------------------------------------------------

  CREATE INDEX "MWFILEARCHIVE_I02" ON "MWFILEARCHIVE" ("FA_STORAGE_GROUP", "FA_STORAGE_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_I03
--------------------------------------------------------

  CREATE INDEX "MWFILEARCHIVE_I03" ON "MWFILEARCHIVE" (SYS_EXTRACT_UTC("FA_DELETED_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_I04
--------------------------------------------------------

  CREATE INDEX "MWFILEARCHIVE_I04" ON "MWFILEARCHIVE" ("FA_USER_TEXT", SYS_EXTRACT_UTC("FA_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_I05
--------------------------------------------------------

  CREATE INDEX "MWFILEARCHIVE_I05" ON "MWFILEARCHIVE" ("FA_SHA1") 
  ;
--------------------------------------------------------
--  DDL for Index MWFILEARCHIVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWFILEARCHIVE_PK" ON "MWFILEARCHIVE" ("FA_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGELINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIMAGELINKS_U01" ON "MWIMAGELINKS" ("IL_FROM", "IL_TO") 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGELINKS_U02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIMAGELINKS_U02" ON "MWIMAGELINKS" ("IL_TO", "IL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGE_I01
--------------------------------------------------------

  CREATE INDEX "MWIMAGE_I01" ON "MWIMAGE" ("IMG_USER_TEXT", SYS_EXTRACT_UTC("IMG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGE_I02
--------------------------------------------------------

  CREATE INDEX "MWIMAGE_I02" ON "MWIMAGE" ("IMG_SIZE") 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGE_I03
--------------------------------------------------------

  CREATE INDEX "MWIMAGE_I03" ON "MWIMAGE" (SYS_EXTRACT_UTC("IMG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGE_I04
--------------------------------------------------------

  CREATE INDEX "MWIMAGE_I04" ON "MWIMAGE" ("IMG_SHA1") 
  ;
--------------------------------------------------------
--  DDL for Index MWIMAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIMAGE_PK" ON "MWIMAGE" ("IMG_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index MWINTERWIKI_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWINTERWIKI_U01" ON "MWINTERWIKI" ("IW_PREFIX") 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_I01
--------------------------------------------------------

  CREATE INDEX "MWIPBLOCKS_I01" ON "MWIPBLOCKS" ("IPB_USER") 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_I02
--------------------------------------------------------

  CREATE INDEX "MWIPBLOCKS_I02" ON "MWIPBLOCKS" ("IPB_RANGE_START", "IPB_RANGE_END") 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_I03
--------------------------------------------------------

  CREATE INDEX "MWIPBLOCKS_I03" ON "MWIPBLOCKS" (SYS_EXTRACT_UTC("IPB_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_I04
--------------------------------------------------------

  CREATE INDEX "MWIPBLOCKS_I04" ON "MWIPBLOCKS" (SYS_EXTRACT_UTC("IPB_EXPIRY")) 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_I05
--------------------------------------------------------

  CREATE INDEX "MWIPBLOCKS_I05" ON "MWIPBLOCKS" ("IPB_PARENT_BLOCK_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIPBLOCKS_PK" ON "MWIPBLOCKS" ("IPB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWIPBLOCKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIPBLOCKS_U01" ON "MWIPBLOCKS" ("IPB_ADDRESS", "IPB_USER", "IPB_AUTO", "IPB_ANON_ONLY") 
  ;
--------------------------------------------------------
--  DDL for Index MWIWLINKS_UI01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIWLINKS_UI01" ON "MWIWLINKS" ("IWL_FROM", "IWL_PREFIX", "IWL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWIWLINKS_UI02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWIWLINKS_UI02" ON "MWIWLINKS" ("IWL_PREFIX", "IWL_TITLE", "IWL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_I01
--------------------------------------------------------

  CREATE INDEX "MWJOB_I01" ON "MWJOB" ("JOB_CMD", "JOB_NAMESPACE", "JOB_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_I02
--------------------------------------------------------

  CREATE INDEX "MWJOB_I02" ON "MWJOB" (SYS_EXTRACT_UTC("JOB_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_I03
--------------------------------------------------------

  CREATE INDEX "MWJOB_I03" ON "MWJOB" ("JOB_SHA1") 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_I04
--------------------------------------------------------

  CREATE INDEX "MWJOB_I04" ON "MWJOB" ("JOB_CMD", "JOB_TOKEN", "JOB_RANDOM") 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_I05
--------------------------------------------------------

  CREATE INDEX "MWJOB_I05" ON "MWJOB" ("JOB_ATTEMPTS") 
  ;
--------------------------------------------------------
--  DDL for Index MWJOB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWJOB_PK" ON "MWJOB" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWL10N_CACHE_U01
--------------------------------------------------------

  CREATE INDEX "MWL10N_CACHE_U01" ON "MWL10N_CACHE" ("LC_LANG", "LC_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWLANGLINKS_I01
--------------------------------------------------------

  CREATE INDEX "MWLANGLINKS_I01" ON "MWLANGLINKS" ("LL_LANG", "LL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWLANGLINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWLANGLINKS_U01" ON "MWLANGLINKS" ("LL_FROM", "LL_LANG") 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I01
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I01" ON "MWLOGGING" ("LOG_TYPE", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I02
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I02" ON "MWLOGGING" ("LOG_USER", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I03
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I03" ON "MWLOGGING" ("LOG_NAMESPACE", "LOG_TITLE", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I04
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I04" ON "MWLOGGING" (SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I05
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I05" ON "MWLOGGING" ("LOG_TYPE", "LOG_ACTION", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I06
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I06" ON "MWLOGGING" ("LOG_USER_TEXT", "LOG_TYPE", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_I07
--------------------------------------------------------

  CREATE INDEX "MWLOGGING_I07" ON "MWLOGGING" ("LOG_USER_TEXT", SYS_EXTRACT_UTC("LOG_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWLOGGING_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWLOGGING_PK" ON "MWLOGGING" ("LOG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWLOG_SEARCH_I01
--------------------------------------------------------

  CREATE INDEX "MWLOG_SEARCH_I01" ON "MWLOG_SEARCH" ("LS_LOG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWMODULE_DEPS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWMODULE_DEPS_U01" ON "MWMODULE_DEPS" ("MD_MODULE", "MD_SKIN") 
  ;
--------------------------------------------------------
--  DDL for Index MWMSG_RESOURCE_LINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWMSG_RESOURCE_LINKS_U01" ON "MWMSG_RESOURCE_LINKS" ("MRL_MESSAGE", "MRL_RESOURCE") 
  ;
--------------------------------------------------------
--  DDL for Index MWMSG_RESOURCE_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWMSG_RESOURCE_U01" ON "MWMSG_RESOURCE" ("MR_RESOURCE", "MR_LANG") 
  ;
--------------------------------------------------------
--  DDL for Index MWMWUSER_I01
--------------------------------------------------------

  CREATE INDEX "MWMWUSER_I01" ON "MWMWUSER" ("USER_EMAIL_TOKEN") 
  ;
--------------------------------------------------------
--  DDL for Index MWMWUSER_I02
--------------------------------------------------------

  CREATE INDEX "MWMWUSER_I02" ON "MWMWUSER" ("USER_EMAIL", "USER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index MWMWUSER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWMWUSER_PK" ON "MWMWUSER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWMWUSER_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWMWUSER_U01" ON "MWMWUSER" ("USER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index MWOBJECTCACHE_I01
--------------------------------------------------------

  CREATE INDEX "MWOBJECTCACHE_I01" ON "MWOBJECTCACHE" (SYS_EXTRACT_UTC("EXPTIME")) 
  ;
--------------------------------------------------------
--  DDL for Index MWOLDIMAGE_I01
--------------------------------------------------------

  CREATE INDEX "MWOLDIMAGE_I01" ON "MWOLDIMAGE" ("OI_USER_TEXT", SYS_EXTRACT_UTC("OI_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWOLDIMAGE_I02
--------------------------------------------------------

  CREATE INDEX "MWOLDIMAGE_I02" ON "MWOLDIMAGE" ("OI_NAME", SYS_EXTRACT_UTC("OI_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWOLDIMAGE_I03
--------------------------------------------------------

  CREATE INDEX "MWOLDIMAGE_I03" ON "MWOLDIMAGE" ("OI_NAME", "OI_ARCHIVE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index MWOLDIMAGE_I04
--------------------------------------------------------

  CREATE INDEX "MWOLDIMAGE_I04" ON "MWOLDIMAGE" ("OI_SHA1") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGECONTENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGECONTENT_PK" ON "MWPAGECONTENT" ("OLD_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGELINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGELINKS_U01" ON "MWPAGELINKS" ("PL_FROM", "PL_NAMESPACE", "PL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGELINKS_U02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGELINKS_U02" ON "MWPAGELINKS" ("PL_NAMESPACE", "PL_TITLE", "PL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_I01
--------------------------------------------------------

  CREATE INDEX "MWPAGE_I01" ON "MWPAGE" ("PAGE_RANDOM") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_I02
--------------------------------------------------------

  CREATE INDEX "MWPAGE_I02" ON "MWPAGE" ("PAGE_LEN") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_I03
--------------------------------------------------------

  CREATE INDEX "MWPAGE_I03" ON "MWPAGE" ("PAGE_IS_REDIRECT", "PAGE_NAMESPACE", "PAGE_LEN") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGE_PK" ON "MWPAGE" ("PAGE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_PROPS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGE_PROPS_U01" ON "MWPAGE_PROPS" ("PP_PAGE", "PP_PROPNAME") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_RESTRICTIONS_I01
--------------------------------------------------------

  CREATE INDEX "MWPAGE_RESTRICTIONS_I01" ON "MWPAGE_RESTRICTIONS" ("PR_TYPE", "PR_LEVEL") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_RESTRICTIONS_I02
--------------------------------------------------------

  CREATE INDEX "MWPAGE_RESTRICTIONS_I02" ON "MWPAGE_RESTRICTIONS" ("PR_LEVEL") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_RESTRICTIONS_I03
--------------------------------------------------------

  CREATE INDEX "MWPAGE_RESTRICTIONS_I03" ON "MWPAGE_RESTRICTIONS" ("PR_CASCADE") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_RESTRICTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGE_RESTRICTIONS_PK" ON "MWPAGE_RESTRICTIONS" ("PR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_RESTRICTIONS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGE_RESTRICTIONS_U01" ON "MWPAGE_RESTRICTIONS" ("PR_PAGE", "PR_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MWPAGE_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPAGE_U01" ON "MWPAGE" ("PAGE_NAMESPACE", "PAGE_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWPROTECTED_TITLES_I01
--------------------------------------------------------

  CREATE INDEX "MWPROTECTED_TITLES_I01" ON "MWPROTECTED_TITLES" (SYS_EXTRACT_UTC("PT_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWPROTECTED_TITLES_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWPROTECTED_TITLES_U01" ON "MWPROTECTED_TITLES" ("PT_NAMESPACE", "PT_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWQUERYCACHETWO_I01
--------------------------------------------------------

  CREATE INDEX "MWQUERYCACHETWO_I01" ON "MWQUERYCACHETWO" ("QCC_TYPE", "QCC_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index MWQUERYCACHETWO_I02
--------------------------------------------------------

  CREATE INDEX "MWQUERYCACHETWO_I02" ON "MWQUERYCACHETWO" ("QCC_TYPE", "QCC_NAMESPACE", "QCC_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWQUERYCACHETWO_I03
--------------------------------------------------------

  CREATE INDEX "MWQUERYCACHETWO_I03" ON "MWQUERYCACHETWO" ("QCC_TYPE", "QCC_NAMESPACETWO", "QCC_TITLETWO") 
  ;
--------------------------------------------------------
--  DDL for Index MWQUERYCACHE_INFO_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWQUERYCACHE_INFO_U01" ON "MWQUERYCACHE_INFO" ("QCI_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MWQUERYCACHE_U01
--------------------------------------------------------

  CREATE INDEX "MWQUERYCACHE_U01" ON "MWQUERYCACHE" ("QC_TYPE", "QC_VALUE") 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I01
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I01" ON "MWRECENTCHANGES" (SYS_EXTRACT_UTC("RC_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I02
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I02" ON "MWRECENTCHANGES" ("RC_NAMESPACE", "RC_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I03
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I03" ON "MWRECENTCHANGES" ("RC_CUR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I04
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I04" ON "MWRECENTCHANGES" ("RC_NEW", "RC_NAMESPACE", SYS_EXTRACT_UTC("RC_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I05
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I05" ON "MWRECENTCHANGES" ("RC_IP") 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I06
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I06" ON "MWRECENTCHANGES" ("RC_NAMESPACE", "RC_USER_TEXT") 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_I07
--------------------------------------------------------

  CREATE INDEX "MWRECENTCHANGES_I07" ON "MWRECENTCHANGES" ("RC_USER_TEXT", SYS_EXTRACT_UTC("RC_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWRECENTCHANGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWRECENTCHANGES_PK" ON "MWRECENTCHANGES" ("RC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWREDIRECT_I01
--------------------------------------------------------

  CREATE INDEX "MWREDIRECT_I01" ON "MWREDIRECT" ("RD_NAMESPACE", "RD_TITLE", "RD_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_I01
--------------------------------------------------------

  CREATE INDEX "MWREVISION_I01" ON "MWREVISION" (SYS_EXTRACT_UTC("REV_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_I02
--------------------------------------------------------

  CREATE INDEX "MWREVISION_I02" ON "MWREVISION" ("REV_PAGE", SYS_EXTRACT_UTC("REV_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_I03
--------------------------------------------------------

  CREATE INDEX "MWREVISION_I03" ON "MWREVISION" ("REV_USER", SYS_EXTRACT_UTC("REV_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_I04
--------------------------------------------------------

  CREATE INDEX "MWREVISION_I04" ON "MWREVISION" ("REV_USER_TEXT", SYS_EXTRACT_UTC("REV_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_I05
--------------------------------------------------------

  CREATE INDEX "MWREVISION_I05" ON "MWREVISION" ("REV_PAGE", "REV_USER", SYS_EXTRACT_UTC("REV_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWREVISION_PK" ON "MWREVISION" ("REV_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWREVISION_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWREVISION_U01" ON "MWREVISION" ("REV_PAGE", "REV_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWSEARCHINDEX_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWSEARCHINDEX_U01" ON "MWSEARCHINDEX" ("SI_PAGE") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I01
--------------------------------------------------------

  CREATE INDEX "MWSITES_I01" ON "MWSITES" ("SITE_TYPE") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I02
--------------------------------------------------------

  CREATE INDEX "MWSITES_I02" ON "MWSITES" ("SITE_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I03
--------------------------------------------------------

  CREATE INDEX "MWSITES_I03" ON "MWSITES" ("SITE_SOURCE") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I04
--------------------------------------------------------

  CREATE INDEX "MWSITES_I04" ON "MWSITES" ("SITE_LANGUAGE") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I05
--------------------------------------------------------

  CREATE INDEX "MWSITES_I05" ON "MWSITES" ("SITE_PROTOCOL") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I06
--------------------------------------------------------

  CREATE INDEX "MWSITES_I06" ON "MWSITES" ("SITE_DOMAIN") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_I07
--------------------------------------------------------

  CREATE INDEX "MWSITES_I07" ON "MWSITES" ("SITE_FORWARD") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWSITES_PK" ON "MWSITES" ("SITE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITES_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWSITES_U01" ON "MWSITES" ("SITE_GLOBAL_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITE_IDENTIFIERS_I01
--------------------------------------------------------

  CREATE INDEX "MWSITE_IDENTIFIERS_I01" ON "MWSITE_IDENTIFIERS" ("SI_SITE") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITE_IDENTIFIERS_I02
--------------------------------------------------------

  CREATE INDEX "MWSITE_IDENTIFIERS_I02" ON "MWSITE_IDENTIFIERS" ("SI_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITE_IDENTIFIERS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWSITE_IDENTIFIERS_U01" ON "MWSITE_IDENTIFIERS" ("SI_TYPE", "SI_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWSITE_STATS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWSITE_STATS_U01" ON "MWSITE_STATS" ("SS_ROW_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWSI_TEXT_IDX
--------------------------------------------------------

  CREATE INDEX "MWSI_TEXT_IDX" ON "MWSEARCHINDEX" ("SI_TEXT") 
   INDEXTYPE IS "CTXSYS"."CONTEXT" ;
--------------------------------------------------------
--  DDL for Index MWSI_TITLE_IDX
--------------------------------------------------------

  CREATE INDEX "MWSI_TITLE_IDX" ON "MWSEARCHINDEX" ("SI_TITLE") 
   INDEXTYPE IS "CTXSYS"."CONTEXT" ;
--------------------------------------------------------
--  DDL for Index MWTAG_SUMMARY_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTAG_SUMMARY_U01" ON "MWTAG_SUMMARY" ("TS_RC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWTAG_SUMMARY_U02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTAG_SUMMARY_U02" ON "MWTAG_SUMMARY" ("TS_LOG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWTAG_SUMMARY_U03
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTAG_SUMMARY_U03" ON "MWTAG_SUMMARY" ("TS_REV_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWTEMPLATELINKS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTEMPLATELINKS_U01" ON "MWTEMPLATELINKS" ("TL_FROM", "TL_NAMESPACE", "TL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWTEMPLATELINKS_U02
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTEMPLATELINKS_U02" ON "MWTEMPLATELINKS" ("TL_NAMESPACE", "TL_TITLE", "TL_FROM") 
  ;
--------------------------------------------------------
--  DDL for Index MWTRANSCACHE_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWTRANSCACHE_U01" ON "MWTRANSCACHE" ("TC_URL") 
  ;
--------------------------------------------------------
--  DDL for Index MWUPDATELOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUPDATELOG_PK" ON "MWUPDATELOG" ("UL_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWUPLOADSTASH_I01
--------------------------------------------------------

  CREATE INDEX "MWUPLOADSTASH_I01" ON "MWUPLOADSTASH" ("US_USER") 
  ;
--------------------------------------------------------
--  DDL for Index MWUPLOADSTASH_I02
--------------------------------------------------------

  CREATE INDEX "MWUPLOADSTASH_I02" ON "MWUPLOADSTASH" (SYS_EXTRACT_UTC("US_TIMESTAMP")) 
  ;
--------------------------------------------------------
--  DDL for Index MWUPLOADSTASH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUPLOADSTASH_PK" ON "MWUPLOADSTASH" ("US_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWUPLOADSTASH_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUPLOADSTASH_U01" ON "MWUPLOADSTASH" ("US_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_FORMER_GROUPS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUSER_FORMER_GROUPS_U01" ON "MWUSER_FORMER_GROUPS" ("UFG_USER", "UFG_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_GROUPS_I01
--------------------------------------------------------

  CREATE INDEX "MWUSER_GROUPS_I01" ON "MWUSER_GROUPS" ("UG_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_GROUPS_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUSER_GROUPS_U01" ON "MWUSER_GROUPS" ("UG_USER", "UG_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_NEWTALK_I01
--------------------------------------------------------

  CREATE INDEX "MWUSER_NEWTALK_I01" ON "MWUSER_NEWTALK" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_NEWTALK_I02
--------------------------------------------------------

  CREATE INDEX "MWUSER_NEWTALK_I02" ON "MWUSER_NEWTALK" ("USER_IP") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_PROPERTIES_I01
--------------------------------------------------------

  CREATE INDEX "MWUSER_PROPERTIES_I01" ON "MWUSER_PROPERTIES" ("UP_PROPERTY") 
  ;
--------------------------------------------------------
--  DDL for Index MWUSER_PROPERTIES_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWUSER_PROPERTIES_U01" ON "MWUSER_PROPERTIES" ("UP_USER", "UP_PROPERTY") 
  ;
--------------------------------------------------------
--  DDL for Index MWVALID_TAG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWVALID_TAG_PK" ON "MWVALID_TAG" ("VT_TAG") 
  ;
--------------------------------------------------------
--  DDL for Index MWWATCHLIST_I01
--------------------------------------------------------

  CREATE INDEX "MWWATCHLIST_I01" ON "MWWATCHLIST" ("WL_NAMESPACE", "WL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index MWWATCHLIST_U01
--------------------------------------------------------

  CREATE UNIQUE INDEX "MWWATCHLIST_U01" ON "MWWATCHLIST" ("WL_USER", "WL_NAMESPACE", "WL_TITLE") 
  ;
--------------------------------------------------------
--  DDL for Index LOG_SEARCH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOG_SEARCH_PK" ON "MWLOG_SEARCH" ("LS_FIELD", "LS_VALUE", "LS_LOG_ID") 
  ;
--------------------------------------------------------
--  Constraints for Table MWARCHIVE
--------------------------------------------------------

  ALTER TABLE "MWARCHIVE" ADD CONSTRAINT "MWARCHIVE_PK" PRIMARY KEY ("AR_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_MINOR_EDIT" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_USER" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWARCHIVE" MODIFY ("AR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWCATEGORY
--------------------------------------------------------

  ALTER TABLE "MWCATEGORY" ADD CONSTRAINT "MWCATEGORY_PK" PRIMARY KEY ("CAT_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWCATEGORY" MODIFY ("CAT_FILES" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORY" MODIFY ("CAT_SUBCATS" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORY" MODIFY ("CAT_PAGES" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORY" MODIFY ("CAT_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORY" MODIFY ("CAT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWCATEGORYLINKS
--------------------------------------------------------

  ALTER TABLE "MWCATEGORYLINKS" MODIFY ("CL_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORYLINKS" MODIFY ("CL_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORYLINKS" MODIFY ("CL_TO" NOT NULL ENABLE);
  ALTER TABLE "MWCATEGORYLINKS" MODIFY ("CL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWCHANGE_TAG
--------------------------------------------------------

  ALTER TABLE "MWCHANGE_TAG" MODIFY ("CT_TAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWEXTERNALLINKS
--------------------------------------------------------

  ALTER TABLE "MWEXTERNALLINKS" ADD CONSTRAINT "MWEXTERNALLINKS_PK" PRIMARY KEY ("EL_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWEXTERNALLINKS" MODIFY ("EL_INDEX" NOT NULL ENABLE);
  ALTER TABLE "MWEXTERNALLINKS" MODIFY ("EL_TO" NOT NULL ENABLE);
  ALTER TABLE "MWEXTERNALLINKS" MODIFY ("EL_FROM" NOT NULL ENABLE);
  ALTER TABLE "MWEXTERNALLINKS" MODIFY ("EL_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWFILEARCHIVE
--------------------------------------------------------

  ALTER TABLE "MWFILEARCHIVE" ADD CONSTRAINT "MWFILEARCHIVE_PK" PRIMARY KEY ("FA_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_USER" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_BITS" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_HEIGHT" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_WIDTH" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_SIZE" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_DELETED_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_DELETED_USER" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_NAME" NOT NULL ENABLE);
  ALTER TABLE "MWFILEARCHIVE" MODIFY ("FA_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWHITCOUNTER
--------------------------------------------------------

  ALTER TABLE "MWHITCOUNTER" MODIFY ("HC_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWIMAGE
--------------------------------------------------------

  ALTER TABLE "MWIMAGE" ADD CONSTRAINT "MWIMAGE_PK" PRIMARY KEY ("IMG_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_USER" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_BITS" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_HEIGHT" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_WIDTH" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_SIZE" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGE" MODIFY ("IMG_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWIMAGELINKS
--------------------------------------------------------

  ALTER TABLE "MWIMAGELINKS" MODIFY ("IL_TO" NOT NULL ENABLE);
  ALTER TABLE "MWIMAGELINKS" MODIFY ("IL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWINTERWIKI
--------------------------------------------------------

  ALTER TABLE "MWINTERWIKI" MODIFY ("IW_TRANS" NOT NULL ENABLE);
  ALTER TABLE "MWINTERWIKI" MODIFY ("IW_LOCAL" NOT NULL ENABLE);
  ALTER TABLE "MWINTERWIKI" MODIFY ("IW_API" NOT NULL ENABLE);
  ALTER TABLE "MWINTERWIKI" MODIFY ("IW_URL" NOT NULL ENABLE);
  ALTER TABLE "MWINTERWIKI" MODIFY ("IW_PREFIX" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWIPBLOCKS
--------------------------------------------------------

  ALTER TABLE "MWIPBLOCKS" ADD CONSTRAINT "MWIPBLOCKS_PK" PRIMARY KEY ("IPB_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_ALLOW_USERTALK" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_BLOCK_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_EXPIRY" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_ENABLE_AUTOBLOCK" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_CREATE_ACCOUNT" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_ANON_ONLY" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_AUTO" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_REASON" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_BY" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_USER" NOT NULL ENABLE);
  ALTER TABLE "MWIPBLOCKS" MODIFY ("IPB_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWIWLINKS
--------------------------------------------------------

  ALTER TABLE "MWIWLINKS" MODIFY ("IWL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWJOB
--------------------------------------------------------

  ALTER TABLE "MWJOB" ADD CONSTRAINT "MWJOB_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWJOB" MODIFY ("JOB_ATTEMPTS" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_RANDOM" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_PARAMS" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_CMD" NOT NULL ENABLE);
  ALTER TABLE "MWJOB" MODIFY ("JOB_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWL10N_CACHE
--------------------------------------------------------

  ALTER TABLE "MWL10N_CACHE" MODIFY ("LC_VALUE" NOT NULL ENABLE);
  ALTER TABLE "MWL10N_CACHE" MODIFY ("LC_KEY" NOT NULL ENABLE);
  ALTER TABLE "MWL10N_CACHE" MODIFY ("LC_LANG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWLANGLINKS
--------------------------------------------------------

  ALTER TABLE "MWLANGLINKS" MODIFY ("LL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWLOGGING
--------------------------------------------------------

  ALTER TABLE "MWLOGGING" ADD CONSTRAINT "MWLOGGING_PK" PRIMARY KEY ("LOG_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_USER" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_ACTION" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWLOGGING" MODIFY ("LOG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWLOG_SEARCH
--------------------------------------------------------

  ALTER TABLE "MWLOG_SEARCH" ADD CONSTRAINT "LOG_SEARCH_PK" PRIMARY KEY ("LS_FIELD", "LS_VALUE", "LS_LOG_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWLOG_SEARCH" MODIFY ("LS_LOG_ID" NOT NULL ENABLE);
  ALTER TABLE "MWLOG_SEARCH" MODIFY ("LS_VALUE" NOT NULL ENABLE);
  ALTER TABLE "MWLOG_SEARCH" MODIFY ("LS_FIELD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWMODULE_DEPS
--------------------------------------------------------

  ALTER TABLE "MWMODULE_DEPS" MODIFY ("MD_DEPS" NOT NULL ENABLE);
  ALTER TABLE "MWMODULE_DEPS" MODIFY ("MD_SKIN" NOT NULL ENABLE);
  ALTER TABLE "MWMODULE_DEPS" MODIFY ("MD_MODULE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWMSG_RESOURCE
--------------------------------------------------------

  ALTER TABLE "MWMSG_RESOURCE" MODIFY ("MR_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWMSG_RESOURCE" MODIFY ("MR_BLOB" NOT NULL ENABLE);
  ALTER TABLE "MWMSG_RESOURCE" MODIFY ("MR_LANG" NOT NULL ENABLE);
  ALTER TABLE "MWMSG_RESOURCE" MODIFY ("MR_RESOURCE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWMSG_RESOURCE_LINKS
--------------------------------------------------------

  ALTER TABLE "MWMSG_RESOURCE_LINKS" MODIFY ("MRL_MESSAGE" NOT NULL ENABLE);
  ALTER TABLE "MWMSG_RESOURCE_LINKS" MODIFY ("MRL_RESOURCE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWMWUSER
--------------------------------------------------------

  ALTER TABLE "MWMWUSER" ADD CONSTRAINT "MWMWUSER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWMWUSER" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "MWMWUSER" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWOBJECTCACHE
--------------------------------------------------------

  ALTER TABLE "MWOBJECTCACHE" MODIFY ("EXPTIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWOLDIMAGE
--------------------------------------------------------

  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_USER" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_BITS" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_HEIGHT" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_WIDTH" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_SIZE" NOT NULL ENABLE);
  ALTER TABLE "MWOLDIMAGE" MODIFY ("OI_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPAGE
--------------------------------------------------------

  ALTER TABLE "MWPAGE" ADD CONSTRAINT "MWPAGE_PK" PRIMARY KEY ("PAGE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_LEN" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_LATEST" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_RANDOM" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_IS_NEW" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_IS_REDIRECT" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_COUNTER" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE" MODIFY ("PAGE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPAGECONTENT
--------------------------------------------------------

  ALTER TABLE "MWPAGECONTENT" ADD CONSTRAINT "MWPAGECONTENT_PK" PRIMARY KEY ("OLD_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWPAGECONTENT" MODIFY ("OLD_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPAGELINKS
--------------------------------------------------------

  ALTER TABLE "MWPAGELINKS" MODIFY ("PL_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGELINKS" MODIFY ("PL_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGELINKS" MODIFY ("PL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPAGE_PROPS
--------------------------------------------------------

  ALTER TABLE "MWPAGE_PROPS" MODIFY ("PP_VALUE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_PROPS" MODIFY ("PP_PROPNAME" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_PROPS" MODIFY ("PP_PAGE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPAGE_RESTRICTIONS
--------------------------------------------------------

  ALTER TABLE "MWPAGE_RESTRICTIONS" ADD CONSTRAINT "MWPAGE_RESTRICTIONS_PK" PRIMARY KEY ("PR_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWPAGE_RESTRICTIONS" MODIFY ("PR_CASCADE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_RESTRICTIONS" MODIFY ("PR_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_RESTRICTIONS" MODIFY ("PR_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_RESTRICTIONS" MODIFY ("PR_PAGE" NOT NULL ENABLE);
  ALTER TABLE "MWPAGE_RESTRICTIONS" MODIFY ("PR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWPROTECTED_TITLES
--------------------------------------------------------

  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_CREATE_PERM" NOT NULL ENABLE);
  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_EXPIRY" NOT NULL ENABLE);
  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_USER" NOT NULL ENABLE);
  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWPROTECTED_TITLES" MODIFY ("PT_NAMESPACE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWQUERYCACHE
--------------------------------------------------------

  ALTER TABLE "MWQUERYCACHE" MODIFY ("QC_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHE" MODIFY ("QC_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHE" MODIFY ("QC_VALUE" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHE" MODIFY ("QC_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWQUERYCACHETWO
--------------------------------------------------------

  ALTER TABLE "MWQUERYCACHETWO" MODIFY ("QCC_NAMESPACETWO" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHETWO" MODIFY ("QCC_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHETWO" MODIFY ("QCC_VALUE" NOT NULL ENABLE);
  ALTER TABLE "MWQUERYCACHETWO" MODIFY ("QCC_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWQUERYCACHE_INFO
--------------------------------------------------------

  ALTER TABLE "MWQUERYCACHE_INFO" MODIFY ("QCI_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWRECENTCHANGES
--------------------------------------------------------

  ALTER TABLE "MWRECENTCHANGES" ADD CONSTRAINT "MWRECENTCHANGES_PK" PRIMARY KEY ("RC_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_LOGID" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_PATROLLED" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_LAST_OLDID" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_THIS_OLDID" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_CUR_ID" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_NEW" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_BOT" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_MINOR" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_USER" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWRECENTCHANGES" MODIFY ("RC_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWREDIRECT
--------------------------------------------------------

  ALTER TABLE "MWREDIRECT" MODIFY ("RD_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWREDIRECT" MODIFY ("RD_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWREDIRECT" MODIFY ("RD_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWREVISION
--------------------------------------------------------

  ALTER TABLE "MWREVISION" ADD CONSTRAINT "MWREVISION_PK" PRIMARY KEY ("REV_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWREVISION" MODIFY ("REV_DELETED" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_MINOR_EDIT" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_USER_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_USER" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_PAGE" NOT NULL ENABLE);
  ALTER TABLE "MWREVISION" MODIFY ("REV_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWSEARCHINDEX
--------------------------------------------------------

  ALTER TABLE "MWSEARCHINDEX" MODIFY ("SI_TEXT" NOT NULL ENABLE);
  ALTER TABLE "MWSEARCHINDEX" MODIFY ("SI_PAGE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWSITES
--------------------------------------------------------

  ALTER TABLE "MWSITES" ADD CONSTRAINT "MWSITES_PK" PRIMARY KEY ("SITE_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWSITES" MODIFY ("SITE_CONFIG" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_FORWARD" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_DATA" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_DOMAIN" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_PROTOCOL" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_SOURCE" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_GROUP" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_GLOBAL_KEY" NOT NULL ENABLE);
  ALTER TABLE "MWSITES" MODIFY ("SITE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWSITE_IDENTIFIERS
--------------------------------------------------------

  ALTER TABLE "MWSITE_IDENTIFIERS" MODIFY ("SI_KEY" NOT NULL ENABLE);
  ALTER TABLE "MWSITE_IDENTIFIERS" MODIFY ("SI_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MWSITE_IDENTIFIERS" MODIFY ("SI_SITE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWSITE_STATS
--------------------------------------------------------

  ALTER TABLE "MWSITE_STATS" MODIFY ("SS_ROW_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWTAG_SUMMARY
--------------------------------------------------------

  ALTER TABLE "MWTAG_SUMMARY" MODIFY ("TS_TAGS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWTEMPLATELINKS
--------------------------------------------------------

  ALTER TABLE "MWTEMPLATELINKS" MODIFY ("TL_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWTEMPLATELINKS" MODIFY ("TL_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWTEMPLATELINKS" MODIFY ("TL_FROM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWTRANSCACHE
--------------------------------------------------------

  ALTER TABLE "MWTRANSCACHE" MODIFY ("TC_TIME" NOT NULL ENABLE);
  ALTER TABLE "MWTRANSCACHE" MODIFY ("TC_CONTENTS" NOT NULL ENABLE);
  ALTER TABLE "MWTRANSCACHE" MODIFY ("TC_URL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUPDATELOG
--------------------------------------------------------

  ALTER TABLE "MWUPDATELOG" ADD CONSTRAINT "MWUPDATELOG_PK" PRIMARY KEY ("UL_KEY")
  USING INDEX  ENABLE;
  ALTER TABLE "MWUPDATELOG" MODIFY ("UL_KEY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUPLOADSTASH
--------------------------------------------------------

  ALTER TABLE "MWUPLOADSTASH" ADD CONSTRAINT "MWUPLOADSTASH_PK" PRIMARY KEY ("US_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_SHA1" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_SIZE" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_STATUS" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_PATH" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_ORIG_PATH" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_KEY" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_USER" NOT NULL ENABLE);
  ALTER TABLE "MWUPLOADSTASH" MODIFY ("US_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUSER_FORMER_GROUPS
--------------------------------------------------------

  ALTER TABLE "MWUSER_FORMER_GROUPS" MODIFY ("UFG_GROUP" NOT NULL ENABLE);
  ALTER TABLE "MWUSER_FORMER_GROUPS" MODIFY ("UFG_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUSER_GROUPS
--------------------------------------------------------

  ALTER TABLE "MWUSER_GROUPS" MODIFY ("UG_GROUP" NOT NULL ENABLE);
  ALTER TABLE "MWUSER_GROUPS" MODIFY ("UG_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUSER_NEWTALK
--------------------------------------------------------

  ALTER TABLE "MWUSER_NEWTALK" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWUSER_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "MWUSER_PROPERTIES" MODIFY ("UP_PROPERTY" NOT NULL ENABLE);
  ALTER TABLE "MWUSER_PROPERTIES" MODIFY ("UP_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWVALID_TAG
--------------------------------------------------------

  ALTER TABLE "MWVALID_TAG" ADD CONSTRAINT "MWVALID_TAG_PK" PRIMARY KEY ("VT_TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "MWVALID_TAG" MODIFY ("VT_TAG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MWWATCHLIST
--------------------------------------------------------

  ALTER TABLE "MWWATCHLIST" MODIFY ("WL_TITLE" NOT NULL ENABLE);
  ALTER TABLE "MWWATCHLIST" MODIFY ("WL_NAMESPACE" NOT NULL ENABLE);
  ALTER TABLE "MWWATCHLIST" MODIFY ("WL_USER" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MWARCHIVE
--------------------------------------------------------

  ALTER TABLE "MWARCHIVE" ADD CONSTRAINT "MWARCHIVE_FK1" FOREIGN KEY ("AR_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWCATEGORYLINKS
--------------------------------------------------------

  ALTER TABLE "MWCATEGORYLINKS" ADD CONSTRAINT "MWCATEGORYLINKS_FK1" FOREIGN KEY ("CL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWEXTERNALLINKS
--------------------------------------------------------

  ALTER TABLE "MWEXTERNALLINKS" ADD CONSTRAINT "MWEXTERNALLINKS_FK1" FOREIGN KEY ("EL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWFILEARCHIVE
--------------------------------------------------------

  ALTER TABLE "MWFILEARCHIVE" ADD CONSTRAINT "MWFILEARCHIVE_FK1" FOREIGN KEY ("FA_DELETED_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "MWFILEARCHIVE" ADD CONSTRAINT "MWFILEARCHIVE_FK2" FOREIGN KEY ("FA_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWIMAGE
--------------------------------------------------------

  ALTER TABLE "MWIMAGE" ADD CONSTRAINT "MWIMAGE_FK1" FOREIGN KEY ("IMG_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWIMAGELINKS
--------------------------------------------------------

  ALTER TABLE "MWIMAGELINKS" ADD CONSTRAINT "MWIMAGELINKS_FK1" FOREIGN KEY ("IL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWIPBLOCKS
--------------------------------------------------------

  ALTER TABLE "MWIPBLOCKS" ADD CONSTRAINT "MWIPBLOCKS_FK1" FOREIGN KEY ("IPB_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "MWIPBLOCKS" ADD CONSTRAINT "MWIPBLOCKS_FK2" FOREIGN KEY ("IPB_BY")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWLANGLINKS
--------------------------------------------------------

  ALTER TABLE "MWLANGLINKS" ADD CONSTRAINT "MWLANGLINKS_FK1" FOREIGN KEY ("LL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWLOGGING
--------------------------------------------------------

  ALTER TABLE "MWLOGGING" ADD CONSTRAINT "MWLOGGING_FK1" FOREIGN KEY ("LOG_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWOLDIMAGE
--------------------------------------------------------

  ALTER TABLE "MWOLDIMAGE" ADD CONSTRAINT "MWOLDIMAGE_FK1" FOREIGN KEY ("OI_NAME")
	  REFERENCES "MWIMAGE" ("IMG_NAME") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "MWOLDIMAGE" ADD CONSTRAINT "MWOLDIMAGE_FK2" FOREIGN KEY ("OI_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWPAGELINKS
--------------------------------------------------------

  ALTER TABLE "MWPAGELINKS" ADD CONSTRAINT "MWPAGELINKS_FK1" FOREIGN KEY ("PL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWPAGE_RESTRICTIONS
--------------------------------------------------------

  ALTER TABLE "MWPAGE_RESTRICTIONS" ADD CONSTRAINT "MWPAGE_RESTRICTIONS_FK1" FOREIGN KEY ("PR_PAGE")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWRECENTCHANGES
--------------------------------------------------------

  ALTER TABLE "MWRECENTCHANGES" ADD CONSTRAINT "MWRECENTCHANGES_FK1" FOREIGN KEY ("RC_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "MWRECENTCHANGES" ADD CONSTRAINT "MWRECENTCHANGES_FK2" FOREIGN KEY ("RC_CUR_ID")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWREDIRECT
--------------------------------------------------------

  ALTER TABLE "MWREDIRECT" ADD CONSTRAINT "MWREDIRECT_FK1" FOREIGN KEY ("RD_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWREVISION
--------------------------------------------------------

  ALTER TABLE "MWREVISION" ADD CONSTRAINT "MWREVISION_FK1" FOREIGN KEY ("REV_PAGE")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
  ALTER TABLE "MWREVISION" ADD CONSTRAINT "MWREVISION_FK2" FOREIGN KEY ("REV_USER")
	  REFERENCES "MWMWUSER" ("USER_ID");
--------------------------------------------------------
--  Ref Constraints for Table MWTEMPLATELINKS
--------------------------------------------------------

  ALTER TABLE "MWTEMPLATELINKS" ADD CONSTRAINT "MWTEMPLATELINKS_FK1" FOREIGN KEY ("TL_FROM")
	  REFERENCES "MWPAGE" ("PAGE_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWUPLOADSTASH
--------------------------------------------------------

  ALTER TABLE "MWUPLOADSTASH" ADD CONSTRAINT "MWUPLOADSTASH_FK1" FOREIGN KEY ("US_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWUSER_FORMER_GROUPS
--------------------------------------------------------

  ALTER TABLE "MWUSER_FORMER_GROUPS" ADD CONSTRAINT "MWUSER_FORMER_GROUPS_FK1" FOREIGN KEY ("UFG_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWUSER_GROUPS
--------------------------------------------------------

  ALTER TABLE "MWUSER_GROUPS" ADD CONSTRAINT "MWUSER_GROUPS_FK1" FOREIGN KEY ("UG_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWUSER_NEWTALK
--------------------------------------------------------

  ALTER TABLE "MWUSER_NEWTALK" ADD CONSTRAINT "MWUSER_NEWTALK_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MWWATCHLIST
--------------------------------------------------------

  ALTER TABLE "MWWATCHLIST" ADD CONSTRAINT "MWWATCHLIST_FK1" FOREIGN KEY ("WL_USER")
	  REFERENCES "MWMWUSER" ("USER_ID") ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED ENABLE;
