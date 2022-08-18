import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.ItemFood;

val Coce = VanillaFactory.createItem("Coce");
Coce.maxStackSize = 8;
Coce.saturation = 0.8;
Coce.alwaysEdible = true;
Coce.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(60, 1));
    }
};
Coce.register();
