#!/bin/bash
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Armor.gam  --csv-name Items_Armor csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Weapons.gam  --csv-name Items_Weapons csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Other.gam  --csv-name Items_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests_Beta.gam  --csv-name Items_Quest_Beta csv Items
