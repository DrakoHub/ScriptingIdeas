#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

function MachineHandler(tier as string,
                        NonAuto as bool,
                        liquidProff as bool,
                        chemicalProff as bool,
                        TensionProff as bool,
                        BiologicalProff as bool){
  if NonAuto == true {
    for i in 1 to 6 {
      val IncompleteCasing as Block = VanillaFactory.createBlock(tier~"_incomplete_machine_casing_"~i, <blockmaterial:iron>);
      IncompleteCasing.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      IncompleteCasing.register();
      if TensionProff == true {
        val IncompleteTensionMachineCasing as Block = VanillaFactory.createBlock(tier~"_incomplete_tension_casing_"~i, <blockmaterial:iron>);
        IncompleteTensionMachineCasing.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
        IncompleteTensionMachineCasing.register();
      }
    }
  }
    val UnfixedMachineHull as Block = VanillaFactory.createBlock(tier~"_unfixed_machine_casing", <blockmaterial:iron>);
    UnfixedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnfixedMachineHull.register();
  if liquidProff == true {
    val UnweldedMachineHull as Block = VanillaFactory.createBlock(tier~"unwelded_machine_hull", <blockmaterial:iron>);
    UnweldedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnweldedMachineHull.register();
    val LiquidMachineHull as Block = VanillaFactory.createBlock(tier~"_liquid_machine_hull", <blockmaterial:iron>);
    LiquidMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    LiquidMachineHull.register();
    if chemicalProff == true {
      val UnweldedChemicalMachineHull as Block = VanillaFactory.createBlock(tier~"unwelded_chemical_machine_hull", <blockmaterial:iron>);
      UnweldedChemicalProffMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      UnweldedChemicalProffMachineHull.register();
      val ChemicalMachineHull as Block = VanillaFactory.createBlock(tier~"_chemical_machine_hull", <blockmaterial:iron>);
      ChemicalMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      ChemicalMachineHull.register();
      if BiologicalProff == true {
        val UnweldedBiologicalMachineHull as Block = VanillaFactory.createBlock(tier~"unwelded_biological_machine_hull", <blockmaterial:iron>);
        UnweldedBiologicalProffMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
        UnweldedBiologicalProffMachineHull.register();
        val BiologicalMachineHull as Block = VanillaFactory.createBlock(tier~"_biological_machine_hull", <blockmaterial:iron>);
        BiologicalMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
        BiologicalMachineHull.register();
      }
    }
  }
  if TensionProff == true {
    val UnfixedTensionMachineHull as Block = VanillaFactory.createBlock(tier~"_unfixed_tension_machine_casing", <blockmaterial:iron>);
    UnfixedTensionMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnfixedTensionMachineHull.register();
    val TensionMachineHull as Block = VanillaFactory.createBlock(tier~"_tension_machine_casing", <blockmaterial:iron>);
    TensionMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    TensionMachineHull.register();
  }
}

//Function     tier           NonAuto             liquidProff         ChemicalProff        TensionProff     BiologicalProff
MachineHandler("ulv",          true,               true,               false,               false,          false);
MachineHandler("lv",           true,               true,                true,               false,          false);
MachineHandler("mv",           true,               true,                true,                true,          false);
MachineHandler("hv",          false,               true,                true,                true,          false);
val hyperVoltage =  ["ev", "iv", "luv", "zpm", "uv", "uhv"]as string[];
for string in hyperVoltage{
MachineHandler(string,        false,               true,                true,                true,           true);
}
  
