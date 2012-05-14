#!/bin/bash
echo "Generating Items*.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Armor.gam  --csv-name Items_Armor csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary.gam  --csv-name Items_Legendary csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary_Other.gam  --csv-name Items_Legendary_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary_Weapons.gam  --csv-name Items_Legendary_Weapons csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Other.gam  --csv-name Items_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests_Beta.gam  --csv-name Items_Quest_Beta csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests.gam  --csv-name Items_Quest csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Weapons.gam  --csv-name Items_Weapons csv Items

