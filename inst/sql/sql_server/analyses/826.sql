-- 826	Number of observation records, by value_as_concept_id

--HINT DISTRIBUTE_ON_KEY(stratum_1)
select 826 as analysis_id, 
	   cast(value_as_concept_id AS varchar(255)) as stratum_1,
	   cast(null AS varchar(255)) as stratum_2,
	   cast(null as varchar(255)) as stratum_3, 
	   cast(null as varchar(255)) as stratum_4, 
	   cast(null as varchar(255)) as stratum_5,
	   count_big(*) as count_value
  into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_826
  from @cdmDatabaseSchema.observation
 group by value_as_concept_id;
 
 