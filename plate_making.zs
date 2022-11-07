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

val hotIngot = OrePrefix.getPrefix("ingotHot");

hotIngot.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasIngot();
} as IMaterialPredicate);

val deformedPlate as OrePrefix = OrePrefix.registerOrePrefix("plateDeformed", 1);

deformedPlate.generateRecipes(function(orePrefix as OrePrefix, material as Material) {
    mods.horsepower.Press.add(Utils.ore("ingotHot", material), Utils.item(orePrefix, <material:copper>));
} as IOreRecipeHandler););
