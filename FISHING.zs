
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

for s in 0 to 5 {for r in 0 to 5 {for a in 0 to 5 {
  var Fish as Item = VanillaFactory.createItem("Fish");
  Fish.maxStackSize = 1;
    if s > 2 | r > 2 | a > 2 {Fish.rarity = "COMMON";}
    elseif s = 2 | r = 2 | a = 2 {Fish.rarity = "UNCOMMON";}
    elseif s = 3 | r = 3 | a = 3 {Fish.rarity = "RARE";}
    elseif s =< 4 | r =< 4 | a =< 4 {Fish.rarity = "EPIC";}
  Fish.register();
}}}
