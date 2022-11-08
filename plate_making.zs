#loader gregtech

import mods.gregtech.recipe.RecipeMap;

import mods.gregtech.ore.OrePrefix;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.material.Material;

import mods.gregtech.recipe.Utils;
import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.ore.OrePrefix;

import moretweaker.railcraft.RollingMachine;
import mods.gregtech.recipe.RecipeMap;
import mods.pyrotech.MechanicalCompactor;
import mods.TinkersForging.Anvil;

val compressor as RecipeMap = <recipemap:compressor>;

val plate as OrePrefix = OrePrefix.getPrefix("plate");
val block as OrePrefix = OrePrefix.getPrefix("block");
val hotIngot = OrePrefix.getPrefix("ingotHot");

val sheet as OrePrefix = OrePrefix.registerOrePrefix("sheet", 1, 1);
val sheetDouble as OrePrefix = OrePrefix.registerOrePrefix("sheetDouble", 2, 1);


hotIngot.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasIngot();
} as IMaterialPredicate);

sheet.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    // Horse Press
    mods.horsepower.Press.add(Utils.ore(hotIngot, material)*2, Utils.item(orePrefix, material));
    // Anvil
    Anvil.addRecipe(Utils.ore("ingot", material), Utils.item(orePrefix, material), "hit_any", "hit_second_last", "hit_third_last");
} as IOreRecipeHandler););

sheetDouble.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    // Horse Press
    mods.horsepower.Press.add(Utils.ore(sheet, material)*2, Utils.item(orePrefix, material));
    // Anvil
    Anvil.addRecipe(Utils.ore(sheet, material)*2, Utils.item(orePrefix, material), "bend_any", "punch_second_last", "bend_third_last");
} as IOreRecipeHandler););

plate.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    // Anvil
    Anvil.addRecipe(Utils.ore(sheetDouble, material), Utils.item(orePrefix, material), "draw_any", "draw_second_last", "draw_third_last");
    // Horse Press
    mods.horsepower.Press.add(Utils.ore(hotIngot, material), Utils.item(orePrefix, <material:copper>));
    // Rolling Machine
    RollingMachine.addShapeless(Utils.item(orePrefix, material), [Utils.ore(hotIngot, material), Utils.ore(hotIngot, material)], 1200);
} as IOreRecipeHandler););

block.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    // Horse Press
    mods.horsepower.Press.add(Utils.ore(hotIngot, material)*9, Utils.item(orePrefix, material));
    // Compressor
    compressor.findRecipe(null, [Utils.item(orePrefix, material)], null).remove();
    compressor.recipeBuilder()
        .inputs(Utils.ore(hotIngot, material)*9)
        .output(Utils.item(orePrefix, material))
        .duration(40)
        .EUt(120)
        .buildAndRegister();
} as IOreRecipeHandler););
