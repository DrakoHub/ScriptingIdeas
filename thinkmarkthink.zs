#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

function MachineHandler(tier as string,
                        liquidProff as bool,
                        chemicalProff as bool){
  for i in 1 to 6 {
    val IncompleteCasing as Block = VanillaFactory.CreateBlock(tier~"incomplete_machine_casing"~i, <blockmaterial:iron>);
    IncompleteCasing.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    IncompleteCasing.register();
  }
    val UnfixedMachineHull as Block = VanillaFactory.CreateBlock(tier~"unfixed_machine_casing", <blockmaterial:iron>);
    UnfixedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnfixedMachineHull.register();
  if liquidProff == true {
    val UnweldedMachineHull as Block = VanillaFactory.CreateBlock(tier~"unwelded_machine_casing", <blockmaterial:iron>);
    UnweldedMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
    UnweldedMachineHull.register();
    if chemicalProff == true {
      val UnweldedChemicalProffMachineHull as Block = VanillaFactory.CreateBlock(tier~"unwelded_chemical_machine_casing", <blockmaterial:iron>);
      UnweldedChemicalProffMachineHull.textureLocation("gregtech:blocks/casings/voltage/"~tier~"/bottom");
      UnweldedChemicalProffMachineHull.register();
    }
  }
}

//Function     tier           liquidProff         ChemicalProff
MachineHandler("ulv",           true,               false);
MachineHandler("lv",           true,               true);
MachineHandler("mv",           true,               true);
MachineHandler("hv",           true,               true);
MachineHandler("iv",           true,               true);
