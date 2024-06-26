CREATE OR REPLACE PROCEDURE SIMP_BOM.BMATHUB_BASE.LOAD_DATE()
  RETURNS STRING
  LANGUAGE SQL
  EXECUTE AS CALLER
AS
$$
BEGIN
    -- INSERT & UPDATE ITEM_LOCATION DATA
    MERGE INTO SIMP_BOM.BMATHUB_BASE.T_ITEM_DETAILS_ROOT AS target
    USING SIMP_BOM.MASTER_DATA.T_MASTER_DATA_ITEM_DETAILS_ROOT AS source
    ON target.ITEM_ID = source.ITEM_ID
    WHEN MATCHED THEN
      UPDATE SET 
        target.ITEM_CLASS_NM = source.ITEM_CLASS_NM,
        target.ITEM_DSC = source.ITEM_DSC,
        target.DELETE_IND = source.DELETE_IND
    WHEN NOT MATCHED THEN
      INSERT (ITEM_ID, ITEM_CLASS_NM, ITEM_DSC, DELETE_IND) 
      VALUES (source.ITEM_ID, source.ITEM_CLASS_NM, source.ITEM_DSC, source.DELETE_IND);

    --INSERT & UPDATE LOCATION DATA 
    MERGE INTO SIMP_BOM.BMATHUB_BASE.T_LOCATION_ROOT AS target
    USING SIMP_BOM.MASTER_DATA.T_MASTER_DATA_LOCATION AS source
    ON target.LOCATION_ID = source.LOCATION_ID  
    WHEN MATCHED THEN
      UPDATE SET  
        target.ITEM_ID = source.ITEM_ID,
        target.ITEM_CLASS_NM = source.ITEM_CLASS_NM
    WHEN NOT MATCHED THEN
      INSERT (ITEM_ID, ITEM_CLASS_NM, LOCATION_ID) 
      VALUES (source.ITEM_ID, source.ITEM_CLASS_NM, source.LOCATION_ID);

    -- INSERT & UPDATE ORIG_BOM DATA 
    MERGE INTO SIMP_BOM.BMATHUB_BASE.T_ORIG_BOM_ROOT AS target
    USING SIMP_BOM.MASTER_DATA.T_MASTER_DATA_ORIG_BOM AS source
    ON target.INPUT_ITEM_ID = source.INPUT_ITEM_ID
    WHEN MATCHED THEN
      UPDATE SET 
        target.ITEM_CLASS_NM = source.ITEM_CLASS_NM,
        target.OUTPUT_ITEM_ID = source.OUTPUT_ITEM_ID,
        target.LOC = source.LOC
    WHEN NOT MATCHED THEN
      INSERT (INPUT_ITEM_ID, ITEM_CLASS_NM, OUTPUT_ITEM_ID, LOC) 
      VALUES (source.INPUT_ITEM_ID, source.ITEM_CLASS_NM, source.OUTPUT_ITEM_ID, source.LOC);

  RETURN 'Merge operation completed successfully';
END;
$$;

CALL SIMP_BOM.BMATHUB_BASE.LOAD_DATE();