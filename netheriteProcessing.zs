import mods.gregtech.recipe.RecipeMap;

val Cutter as RecipeMap = <recipemap:cutter>;
val ChemReactor as RecipeMap = <recipemap:chemical_reactor>;

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
    .EUt(420)
    .buildAndRegister();
  //ChemicaltoSlurry
  
    
