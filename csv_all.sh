#!/bin/bash
echo "Generating Items*.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Armor.gam  --csv-name Items_Armor csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Weapons.gam  --csv-name Items_Weapons csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Other.gam  --csv-name Items_Other csv Items
d3_mpq --csv-input extracted_mpqs/GameBalance/Items_Quests_Beta.gam  --csv-name Items_Quest_Beta csv Items

echo "Generating ItemTypes.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/ItemTypes.gam csv ItemTypes

echo "Generating ItemEnhancements.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/ItemEnhancements.gam csv ItemEnhancements

echo "Generating SetItemBonuses.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/SetItemBonuses.gam csv SetItemBonuses

echo "Generating RareNames.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/RareNames.gam csv RareNames

echo "Generating Recipes*.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesBlacksmith.gam  --csv-name RecipesBlacksmith csv Recipes
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesJeweler.gam  --csv-name RecipesJeweler csv Recipes
d3_mpq --csv-input extracted_mpqs/GameBalance/RecipesMystic.gam  --csv-name RecipesMystic csv Recipes
d3_mpq --csv-input extracted_mpqs/Recipe/ csv RecipeDetails

echo "Generating AffixList.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/AffixList.gam csv AffixList

echo "Generating Actor.csv ..."
d3_mpq --csv-input extracted_mpqs/Actor/ csv Actor

echo "Generating StringList.csv ..."
d3_mpq --csv-input extracted_mpqs/StringList/ --locale enUS csv StringList

echo "Generating SocketedEffects.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/SocketedEffects.gam csv SocketedEffects

echo "Generating PowerFormulaTables.csv ..."
d3_mpq --csv-input extracted_mpqs/GameBalance/PowerFormulaTables.gam csv PowerFormulaTables

