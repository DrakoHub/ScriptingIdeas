#loader gregtech

import mods.gregtech.ore.OrePrefix;
import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.recipe.Utils;

import mods.gregtech.MaterialFlag;
import mods.gregtech.MaterialFlagBuilder;

val AddFlags = [] as string[];
val FlagSufixes = ["curvedx", "curvedy", "curvedxy", "curved_doublex", "curved_doubley"] as string[];
val FlagPrefixes = ["", "_dense", "_large", "_light", "_heavy"] as string[];

val DegreeLoop = 30
for i, FlagPrefix in FlagPrefixes {
  for i, FlagSufix in FlagSufixes {
    if (DegreeLoop < 135) {
      AddFlags += "plate_"~FlagPrefix~"_"~FlagSufix~DegreeLoop).build();
      DegreeLoop += 15;
    }
    MaterialFlagBuilder.create("generate"~FlagPrefix~"_plate_"~FlagSufixes).build();
    OrePrefix.getPrefix(AddFlags).setGenerationPredicate(function(mat as Material) as bool {
              return mat.hasFlag("generate"~FlagPrefix~"_plate_"~FlagSufixes);
              ########### Possible Flags ###########
              # ⚫ generate_plate_curvedx
              # ⚫ generate_plate_curvedy
              # ⚫ generate_plate_curvedxy
              # ⚫ generate_plate_curved_doublex
              # ⚫ generate_plate_curved_doubley
              #
              # ⚫ generate_dense_plate_curvedx
              # ⚫ generate_dense_plate_curvedy
              # ⚫ generate_dense_plate_curvedxy
              # ⚫ generate_dense_plate_curved_doublex
              # ⚫ generate_dense_plate_curved_doubley
              #
              # ⚫ generate_large_plate_curvedx
              # ⚫ generate_large_plate_curvedy
              # ⚫ generate_large_plate_curvedxy
              # ⚫ generate_large_plate_curved_doublex
              # ⚫ generate_large_plate_curved_doubley
              #
              # ⚫ generate_light_plate_curvedx
              # ⚫ generate_light_plate_curvedy
              # ⚫ generate_light_plate_curvedxy
              # ⚫ generate_light_plate_curved_doublex
              # ⚫ generate_light_plate_curved_doubley
              #
              # ⚫ generate_heavy_plate_curvedx
              # ⚫ generate_heavy_plate_curvedy
              # ⚫ generate_heavy_plate_curvedxy
              # ⚫ generate_heavy_plate_curved_doublex
              # ⚫ generate_heavy_plate_curved_doubley
              ######################################
    } as IMaterialPredicate);
  }
}
