#!/bin/bash
echo "Generating Items*.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Armor.gam  --csv-name Items_Armor csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Weapons.gam  --csv-name Items_Weapons csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Other.gam  --csv-name Items_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests_Beta.gam  --csv-name Items_Quest_Beta csv Items

echo "Generating ItemTypes.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/ItemTypes.gam csv ItemTypes

echo "Generating AffixList.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/AffixList.gam csv AffixList

echo "Generating Actor.csv ..."
d3_mpq --csv-input extracted_mpqs/Actor/ csv Actor

echo "Generating StringList.csv ..."
d3_mpq --csv-input extracted_mpqs/StringList/ --locale enUS csv StringList
