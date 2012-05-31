#!/bin/bash
echo -e "\nGenerating Items*.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Armor.gam  --csv-name Items_Armor csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary.gam  --csv-name Items_Legendary csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary_Other.gam  --csv-name Items_Legendary_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Legendary_Weapons.gam  --csv-name Items_Legendary_Weapons csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Other.gam  --csv-name Items_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests_Beta.gam  --csv-name Items_Quest_Beta csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests.gam  --csv-name Items_Quest csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Weapons.gam  --csv-name Items_Weapons csv Items

echo -e "\nGenerating ItemTypes.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/ItemTypes.gam csv ItemTypes

echo -e "\nGenerating ItemEnhancements.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/ItemEnhancements.gam csv ItemEnhancements

echo -e "\nGenerating SetItemBonuses.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/SetItemBonuses.gam csv SetItemBonuses

echo -e "\nGenerating RareNames.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/RareNames.gam csv RareNames

echo -e "\nGenerating Recipes*.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesBlacksmith.gam  --csv-name RecipesBlacksmith csv Recipes
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesJeweler.gam  --csv-name RecipesJeweler csv Recipes
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesMystic.gam  --csv-name RecipesMystic csv Recipes
d3_mpq --csv-input extracted_mpqs/Recipe/ csv RecipeDetails

echo -e "\nGenerating AffixList.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/AffixList.gam csv AffixList

echo -e "\nGenerating Actor.csv"
d3_mpq --csv-input extracted_mpqs/Actor/ csv Actor

echo -e "\nGenerating StringList.csv (enUS)"
d3_mpq --csv-input extracted_mpqs/StringList/ --locale enUS csv StringList

echo -e "\nGenerating StringList.csv (deDE)"
d3_mpq --csv-input extracted_mpqs/StringList/ --locale deDE csv StringList

echo -e "\nGenerating SocketedEffects.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/SocketedEffects.gam csv SocketedEffects

echo -e "\nGenerating PowerFormulaTables.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/PowerFormulaTables.gam csv PowerFormulaTables

echo -e "\nGenerating MonsterNames.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/MonsterNames.gam csv MonsterNames

echo -e "\nGenerating MonsterAffixes.csv"
d3_mpq --csv-input extracted_mpqs/GameBalance/MonsterAffixes.gam csv MonsterAffixes

