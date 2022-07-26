#gregtech
#prioty 1001

import mods.gregtech.recipe.RecipeMap;
import mods.mekanism.thermalevaporation;
import mods.mekanism.GasConversion;
import mods.mekanism.reaction;
import mods.mekanism.chemical.crystallizer;

val Cutter as RecipeMap = <recipemap:cutter>;
val ChemReactor as RecipeMap = <recipemap:chemical_reactor>;
val DistillationTower as RecipeMap = <recipemap:distillation_tower>;
val Mixer as RecipeMap = <recipemap:mixer>;
val Centrifuge as RecipeMap = <recipemap:centrifuge>;
val FluidHeater as RecipeMap = <recipemap:fluid_heater>;
val CrackingUnit as RecipeMap = <recipemap:cracker>;
val Elctrolyzer as RecipeMap = <recipemap:electrolyzer>;
val LargeChemReactor as RecipeMap = <recipemap:large_chemical_reactor>;
val VacuumFrz as RecipeMap = <recipemap:vacuum_freezer>;
val Extractor as RecipeMap = <recipemap:extractor>;
val Macerator as RecipeMap = <recipemap:macerator>;
val Arc as RecipeMap = <recipemap:arc_furnace>;
val BlastFurc as RecipeMap = <recipemap:electric_blast_furnace>;
val ForgeHammer as RecipeMap = <recipemap:forge_hammer>;
val
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
  LargeChemReactor.recipeBuilder()
    .inputFluids(<liquid:distabilazed_semicrystalizated_netherite_scrap_slury>)
    .inputs()
    .output([*for think:in crystal*])
    .outputFluids(<liquid:hyperclean_netherite_scrap_slurry>)
    .duration(2*60*20)
    .EUt(220)
    .buildAndRegister();
  //DistillationTower
  DistillationTower.recipeBuilder()
    .inputFluids(<liquid:hyperclean_netherite_scrap_slurry>)
    .outputFluids([<liquid:molten_cristaline_netherite>, <liquid:heavy_nether_oil>, <liquid:sulfuric_ardite_slurry>, *for think*])
    .duration(3*60*20+15*20)
    .EUt(720)
    .buildAndRegister();
  //VaccumMoltenCrytal
  VacuumFrz.recipeBuilder()
    .inputFluids(<liquid:molten_cristaline_netherite>)
    .outputFluids(<liquid:molten_stable_cristaline_netherite>)
    .duration(1*60*20)
    .EUt(320)
    .buildAndRegister();
  //Crystalization
  mods.mekanism.reaction.addRecipe(<liquid:molten_stable_cristaline_netherite>, <gas:argon>, <*for think*>, <gas:argoneted_stable_cristaline_netherite>, 560000, 6*20*60);
  mods.mekanism.chemical.crystallizer.addRecipe(<gas:argoneted_stable_cristaline_netherite>, <argoneted_netherite_crystal>);
  //Extraction
  Extractor.recipeBuilder()
    .inputs(<argoneted_netherite_crystal>)
    .outputs(<netherite_crystal>)
    .outputFluids(<gas:argon>)
    .duration(20*20)
    .EUt(120)
    .buildAndRegister();
  //Maceration
  Macerator.recipeBuilder()
    .inputs(<netherite_crystal>)
    .outputs(<netherite_substrate>)
    .duration(1*60*20)
    .EUt(120)
    .buildAndRegister();
  //Liquid Subtrate
  Arc.recipeBuilder()
    .inputs(<netherite_substrate>)
    .outputFluids(<liquid:liquid_netherite_substrate>)
    .duration(1*60*20)
    .EUt(520)
    .buildAndRegister();
  //Mixing with Gold
  Mixer.recipeBuilder();
    .inputFluids([<liquid:liquid_netherite_substrate>, <liquid:molten_gold>])
    .inputs(<carbonifilic_nhtcg2>)
    .outputFluids(<liquid:molten_netherite>)
    .duration(1*60*20)
    .EUt(520)
    .buildAndRegister();
  //VacuumFrz
  VacuumFrz.recipeBuilder()
    .inputFluids(<liquid:molten_netherite>)
    .output(<large_netherite_chunk>)
  //Cutting
  Cutter.recipeBuilder()
    .inputs(<large_netherite_chunk>)
    .inputsFluids(<liquid:highvelocitylubrificant>)
    .output(<cutted_netherite>*4)
    .duration(45*20)
    .EUt(320)
    .buildAndRegister();
  //blasiting
  BlastFurc.recipeBuilder()
    .inputs(<cutted_netherite>)
    .inputFluids(<liquid:molten_graphene>)
    .ouputs(<hot_dilated_netherite_ingot>)
  //Hammer
  ForgeHammer.recipeBuilder()
    .inputs(<hot_dilated_netherite_ingot>)
    .output(<hot_netherite_ingot>)
  //VacuumFrz
  VacuumFrz.recipeBuilder()
    .inputs(<hot_netherite_ingot>)
    .output(<netherite_ingot>)
  //Block
    
  
  
  
