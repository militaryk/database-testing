Select F.[EXPO_ID],[EXPO_GENDER],[EXPO_AGE], [EXPO_AGE_UNIT],
( Select TOP 1 [CODE_VALUE] FROM [dbo].[CodeValue] WHERE CODE_ID = F.EXPO_AGE_UNIT) Age_Unit,
( Select TOP 1 [CODE_VALUE] FROM [dbo].[CodeValue] WHERE CODE_ID = F.EXPO_GENDER) Gender,
( SELECT 1 FROM ExposureLock WHERE EXPO_ID = F.EXPO_ID) Lock,
( Select TOP 1 [CTR_INITIAL] FROM [dbo].[Centre] WHERE CTR_ID = F.CTR_ID) + Convert(varchar, F.[EXPO_ID]),
Convert(varchar,[EXPO_AGE]) + ' ' + ( Select TOP 1 [CODE_VALUE] FROM [dbo].[CodeValue] WHERE CODE_ID = F.EXPO_AGE_UNIT) Age,
[EXPO_FIRST]+ ' ' + [EXPO_LAST] Name,
F.[CTR_ID], D.SUB_NAME FROM [dbo].[Exposure] F LEFT JOIN [dbo].[Substance] D ON F.CTR_ID = D.CTR_ID AND F.CALL_ID = D.CALL_ID AND F.EXPO_ID = D.EXPO_ID
WHERE F.CALL_ID = 1208 AND D.SUB_ORDER = 1
