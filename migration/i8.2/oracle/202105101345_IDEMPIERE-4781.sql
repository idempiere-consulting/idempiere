SET SQLBLANKLINES ON
SET DEFINE OFF

-- May 10, 2021, 1:50:01 PM CEST
UPDATE AD_Tab SET IsAdvancedTab='Y',Updated=TO_DATE('2021-05-10 13:50:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=50010
;

-- May 10, 2021, 1:50:09 PM CEST
UPDATE AD_Tab SET IsAdvancedTab='Y',Updated=TO_DATE('2021-05-10 13:50:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=200112
;

-- May 10, 2021, 1:50:17 PM CEST
UPDATE AD_Tab SET IsAdvancedTab='Y',Updated=TO_DATE('2021-05-10 13:50:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=53372
;

SELECT register_migration_script('202105101345_IDEMPIERE-4781.sql') FROM dual
;
