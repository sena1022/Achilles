-- 1020	Number of drug era records by drug era start month

--HINT DISTRIBUTE_ON_KEY(stratum_1)
WITH rawData AS (
  select
    YEAR(condition_era_start_date)*100 + month(condition_era_start_date) as stratum_1,
    COUNT_BIG(PERSON_ID) as count_value
  from
  @cdmDatabaseSchema.condition_era ce1
  group by YEAR(condition_era_start_date)*100 + month(condition_era_start_date)
)
SELECT
  1020 as analysis_id,
  CAST(stratum_1 AS VARCHAR(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_1020
FROM rawData;