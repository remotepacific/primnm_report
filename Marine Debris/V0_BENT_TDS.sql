--------------------------------------------------------
--  DDL for View V0_BENT_TDS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GISDAT"."V0_BENT_TDS" ("ROUNDID", "MISSIONID", "REGION", "REGION_NAME", "SUBREGION", "ISLAND", "OBS_YEAR", "DATE_", "DIVEID", "SEGMENTID", "REEF_ZONE", "DIVER1", "DIVER2", "METHODCODE", "NO_OBS", "CALIBRATION", "SEGMENT", "DOMINANT_HABITAT", "COMPVALUE", "LIVE_CORAL_MID", "STRESSED_CORAL_MID", "DEAD_CORAL_MID", "SOFT_CORAL_MID", "SAND_MID", "RUBBLE_MID", "PAVE_MID", "ROCK_MID", "ALGAE_MID", "MACROALGAE_MID", "CORALLINE_MID", "CROWN_OF_THORN", "URCHIN", "BORING_URCHIN", "FREE_URCHIN", "SEA_CUCUMBER", "GIANT_CLAM", "PEARL_OYSTER", "LOBSTER", "OCTOPUS", "NET_LINE", "MUNITION", "WRECK", "MANMADE_OBJECT", "MANMADE_NOTE", "BENTHIC_CORISID") AS 
  SELECT ROUND.ROUNDID
, ROUND.MISSIONID
, LIST_OF_REGIONS.REGION
, LIST_OF_REGIONS.REGION_NAME
, LIST_OF_ISLANDS.SUBREGION
, LIST_OF_ISLANDS.ISLAND
, ISLANDVISIT.YEAR OBS_YEAR
, TOW.DATE_
, TO_NUMBER(TOW.DIVEID) DIVEID
, TO_NUMBER(TOW.DIVEID || TO_CHAR(BENTHICTDS_SEGMENT_OBS.SEGMENT, 'fm09')) SEGMENTID
, TOW.REEF_ZONE
, TOW.DIVER1
, TOW.DIVER2
, BENTHICTDS_SEGMENT_OBS.METHODCODE
, BENTHICTDS_SEGMENT_OBS.NO_OBS
, BENTHICTDS_SEGMENT_OBS.CALIBRATION
, BENTHICTDS_SEGMENT_OBS.SEGMENT
, BENTHICTDS_SEGMENT_OBS.DOMINANT_HABITAT
, LIST_OF_TDS_COMPLEXITYBINS.COMPVALUE
, LIST_OF_TDS_BINMIDPOINTS_0.MIDPOINT LIVE_CORAL_MID
, LIST_OF_TDS_BINMIDPOINTS_1.MIDPOINT STRESSED_CORAL_MID
, LIST_OF_TDS_BINMIDPOINTS_2.MIDPOINT DEAD_CORAL_MID
, LIST_OF_TDS_BINMIDPOINTS_3.MIDPOINT SOFT_CORAL_MID
, LIST_OF_TDS_BINMIDPOINTS_4.MIDPOINT SAND_MID
, LIST_OF_TDS_BINMIDPOINTS_5.MIDPOINT RUBBLE_MID
, LIST_OF_TDS_BINMIDPOINTS_6.MIDPOINT PAVE_MID
, LIST_OF_TDS_BINMIDPOINTS_7.MIDPOINT ROCK_MID
, LIST_OF_TDS_BINMIDPOINTS_8.MIDPOINT ALGAE_MID
, LIST_OF_TDS_BINMIDPOINTS_9.MIDPOINT MACROALGAE_MID
, LIST_OF_TDS_BINMIDPOINTS_10.MIDPOINT CORALLINE_MID
, BENTHICTDS_SEGMENT_OBS.CROWN_OF_THORN
, BENTHICTDS_SEGMENT_OBS.URCHIN
, BENTHICTDS_SEGMENT_OBS.BORING_URCHIN
, BENTHICTDS_SEGMENT_OBS.FREE_URCHIN
, BENTHICTDS_SEGMENT_OBS.SEA_CUCUMBER
, BENTHICTDS_SEGMENT_OBS.GIANT_CLAM
, BENTHICTDS_SEGMENT_OBS.PEARL_OYSTER
, BENTHICTDS_SEGMENT_OBS.LOBSTER
, BENTHICTDS_SEGMENT_OBS.OCTOPUS
, BENTHICTDS_SEGMENT_OBS.NET_LINE
, BENTHICTDS_SEGMENT_OBS.MUNITION
, BENTHICTDS_SEGMENT_OBS.WRECK
, BENTHICTDS_SEGMENT_OBS.MANMADE_OBJECT
, BENTHICTDS_SEGMENT_OBS.MANMADE_NOTE
, ISLANDVISIT.BENTHIC_CORISID 
FROM LIST_OF_REGIONS
, LIST_OF_ISLANDS
, ROUND
, ISLANDVISIT
, TOW
, BENTHICTDS_SEGMENT_OBS
, LIST_OF_TDS_COMPLEXITYBINS
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_0
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_1
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_2
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_3
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_4
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_5
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_6
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_7
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_8
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_9
, LIST_OF_TDS_BINMIDPOINTS LIST_OF_TDS_BINMIDPOINTS_10 
WHERE LIST_OF_REGIONS.REGION = LIST_OF_ISLANDS.REGION
  AND LIST_OF_ISLANDS.ISLAND = ISLANDVISIT.ISLAND
  AND ROUND.ROUNDID = ISLANDVISIT.ROUNDID
  AND ISLANDVISIT.ISLANDVISITID = TOW.ISLANDVISITID
  AND TOW.TOWKEY = BENTHICTDS_SEGMENT_OBS.TOWKEY (+)
  AND BENTHICTDS_SEGMENT_OBS.COMPLEXITY = LIST_OF_TDS_COMPLEXITYBINS.COMPLEXITY (+)
  AND BENTHICTDS_SEGMENT_OBS.LIVE_CORAL = LIST_OF_TDS_BINMIDPOINTS_0.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.STRESSED_CORAL = LIST_OF_TDS_BINMIDPOINTS_1.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.DEAD_CORAL = LIST_OF_TDS_BINMIDPOINTS_2.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.SOFT_CORAL = LIST_OF_TDS_BINMIDPOINTS_3.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.SAND = LIST_OF_TDS_BINMIDPOINTS_4.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.RUBBLE = LIST_OF_TDS_BINMIDPOINTS_5.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.PAVEMENT = LIST_OF_TDS_BINMIDPOINTS_6.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.ROCK = LIST_OF_TDS_BINMIDPOINTS_7.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.ALGAE = LIST_OF_TDS_BINMIDPOINTS_8.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.MACRO_ALGAE = LIST_OF_TDS_BINMIDPOINTS_9.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.CORALLINE_ALGAE = LIST_OF_TDS_BINMIDPOINTS_10.BIN (+)
  AND BENTHICTDS_SEGMENT_OBS.NO_OBS = 0
  AND BENTHICTDS_SEGMENT_OBS.CALIBRATION = 0;

   COMMENT ON TABLE "GISDAT"."V0_BENT_TDS"  IS 'Object Comments:
Benthic towed-diver foundational view

Join Comments:


Where Comments: 


Group By Comments: 


Having Comments: 


Order By Comments: 
';
