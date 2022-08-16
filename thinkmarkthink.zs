#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

function MachineHandler(tier as string,
                        liquidProff as bool,
                        chemicalProff as bool,
                        TensionProff as bool){
  for i in 1 to 6 {
    val IncompleteCasing as Block = VanillaFactory.CreateBlock(tier~"_incomplete_machine_casing"~i, <blockmaterial:iron>);
    IncompleteCasing.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    IncompleteCasing.register();
  }
    val UnfixedMachineHull as Block = VanillaFactory.CreateBlock(tier~"_unfixed_machine_casing", <blockmaterial:iron>);
    UnfixedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnfixedMachineHull.register();
  if liquidProff == true {
    val UnweldedMachineHull as Block = VanillaFactory.CreateBlock(tier~"unwelded_machine_hull", <blockmaterial:iron>);
    UnweldedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnweldedMachineHull.register();
    val LiquidMachineHull as Block = VanillaFactory.CreateBlock(tier~"_liquid_machine_hull", <blockmaterial:iron>);
    LiquidMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    LiquidMachineHull.register();
    if chemicalProff == true {
      val UnweldedChemicalMachineHull as Block = VanillaFactory.CreateBlock(tier~"unwelded_chemical_machine_hull", <blockmaterial:iron>);
      UnweldedChemicalProffMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      UnweldedChemicalProffMachineHull.register();
      val ChemicalMachineHull as Block = VanillaFactory.CreateBlock(tier~"_chemical_machine_hull", <blockmaterial:iron>);
      ChemicalMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      ChemicalMachineHull.register();
    }
  }
  if TensionProff == true {
    val UnfixedTensionMachineHull as Block = VanillaFactory.CreateBlock(tier~"_unfixed_tension_machine_casing", <blockmaterial:iron>);
    UnfixedTensionMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnfixedTensionMachineHull.register();
    val TensionMachineHull as Block = VanillaFactory.CreateBlock(tier~"_tension_machine_casing", <blockmaterial:iron>);
    TensionMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    TensionMachineHull.register();
  }
}

//Function     tier           liquidProff         ChemicalProff
MachineHandler("ulv",           true,               false);
MachineHandler("lv",           true,               true);
MachineHandler("mv",           true,               true);
MachineHandler("hv",           true,               true);
MachineHandler("iv",           true,               true);
