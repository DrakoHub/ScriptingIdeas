#gregtech
#prioty 1001

import mods.gregtech.recipe.RecipeMap;
import mods.mekanism.thermalevaporation;

val Cutter as RecipeMap = <recipemap:cutter>;
val ChemReactor as RecipeMap = <recipemap:chemical_reactor>;
val RefinaryTower as RecipeMap = <recipemap:distillation_tower>;
val Mixer as RecipeMap = <recipemap:mixer>;
val Centrifuge as RecipeMap = <recipemap:centrifuge>;
val FluidHeater as RecipeMap = <recipemap:fluid_heater>;
val CrackingUnit as RecipeMap = <recipemap:cracker>;
val Elctrolyzer as RecipeMap = <recipemap:electrolyzer>;
val LargeChemReactor as RecipeMap = <recipemap:large_chemical_reactor>;

//Netherite Production
  //DebrisCutting
  Cutter.recipeBuilder()
    .inputs(<ancientDebrisBlock>)
    .inputsFluids(<liquid:highvelocitylubrificant>)
    .output(<netheriteScrap>*2)
    .chancedOutput(<netheriteScrapPileOfDust>, 100, 60)
    .duration(3*60*20)
    .EUt(560)
    .buildAndRegister();
  Cutter.recipeBuilder()
    .inputs(<ancientDebrisBlock>)
    .inputsFluids(<liquid:highvelocitylubrificant>)
    .output(<netheriteScrap>*5)
    .chancedOutput(<netheriteScrapPileOfDust>, 100, 60)
    .duration(45*20)
    .EUt(320)
    .buildAndRegister();
#-------------------------OreProcessing-------------------------#
  //ChemicaltoSlurry
  ChemReactor.recipeBuilder()
    .inputs(<netheriteScrapDust>)
    .inputFluids(<liquid:sulfuric_acid>)
    .outputFluids(<liquid:sulfuric_netherite_scrap_slurry>)
    .duration(30*20)
    .EUt(120)
    .buildAndRegister();
  //WashedSlurry
  Mixer.recipeBuilder();
    .inputFluids([<liquid:sulfuric_netherite_scrap_slurry>, <liquid:water>])
    .outputFluids(<liquid:washed_netherite_scrap_slurry>)
    .duration(15*20)
    .EUt(460)
    .buildAndRegister();
  //CleanSlurry
  mods.mekanism.thermalevaporation.addRecipe(<liquid:washed_netherite_scrap_slurry>*1000, <liquid:clean_netherite_scrap_slurry>*333);
  //HeatingFluid
  FluidHeater.recipeBuilder()
    .inputFluids(<liquid:clean_netherite_scrap_slurry>)
    .outputFluids(<liquid:heated_netherite_scrap_slurry>)
    .duration(40*20)
    .EUt(560)
    .buildAndRegister();
  //CrakingUnit
  CrackingUnit.recipeBuilder()
    .inputFluids([<liquid:heated_netherite_scrap_slurry>, <liquid:water>])
    .outputFluids([<liquid:semiCrytalizated_netherite_scrap_slurry>, <liquid:steam>])
    .duration(1*60*20+25*20)
    .EUt(20)
    .buildAndRegister();
  //Distabilization
  Electrolizer.recipeBuilder()
    .inputFluids(<liquid:semicrytalizated_netherite_scrap_slurry>)
    .input(<*for think*>)
    .outputFluids(<liquid:distabilazed_semicrystalizated_netherite_scrap_slury>)
    .duration(1*60*20)
    .EUt(320)
    .buildAndRegister();
  //RemoveTheCrystals
  LargeChemReactor.recipeBuilde()
    .inputFluids(<liquid:distabilazed_semicrystalizated_netherite_scrap_slury>)
    .inputs()
    .output([*for think:in crystal*])
    .outputFluids(<liquid:hyperclean_netherite_scrap_slurry>)
    .duration(2*60*20)
    .EUt(220)
    .buildAndRegister();
