###Usage: plugin::ScaleAll($npc, $level);
###This will scale all stats of an NPC to provided level
sub ScaleAll {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    
    $originalLevel = $npc->GetLevel();

    $npc->SetLevel($level);
    ScaleLevel($npc, $level);
    ScaleAccuracy($npc, $level);
    ScaleSlowMitigation($npc, $level);
    ScaleAttack($npc, $level);
    ScaleStrength($npc, $level);
    ScaleStamina($npc, $level);
    ScaleDexterity($npc, $level);
    ScaleAgility($npc, $level);
    ScaleIntelligence($npc, $level);
    ScaleWisdom($npc, $level);
    ScaleCharisma($npc, $level);
    ScaleMagicResist($npc, $level);
    ScaleColdResist($npc, $level);
    ScaleFireResist($npc, $level);
    ScalePoisonResist($npc, $level);
    ScaleDiseaseResist($npc, $level);
    ScaleCorruptionResist($npc, $level);
    ScalePhysicalResist($npc, $level);
    ScaleMinDamage($npc, $level);
    ScaleMaxDamage($npc, $level);
    ScaleHPRegenRate($npc, $level);
    ScaleAttackDelay($npc, $level);
    ScaleAttackSpeed($npc, $level);
    ScaleSpellScale($npc, $level);
    ScaleHealScale($npc, $level);
    ScaleSpecialAbilities($npc, $level);
    ScaleAvoidance($npc, $level);
    ScaleAC($npc, $level);
    ScaleHP($npc, $level);
    ScaleSpells($npc, $level, $originalLevel);
    ScaleSpellEffects($npc, $level, $originalLevel);
}

###Usage: plugin::ScaleLevel($npc, $level);
###This will scale an NPC's Level to a provided level
sub ScaleLevel {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    $npc->ModifyNPCStat("level", $level);
}

###Usage: plugin::ScaleAC($npc, $level);
###This will scale an NPC's AC to a provided level
sub ScaleAC {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 16, 19, 22, 25, 28, 31, 34, 37, 40, 43, 46, 52, 59, 65, 72, 78, 85, 91, 95, 99, 103, 107, 111, 115, 119, 123, 127, 135, 142, 150, 158, 166, 173, 181, 189, 196, 204, 208, 212, 217, 221, 225, 229, 233, 237, 241, 245, 249, 253, 257, 261, 266, 270, 274, 278, 282, 286, 290, 294, 299, 303, 307, 311, 315, 319, 324, 328, 332, 336, 340, 344, 348, 352, 356, 360, 364, 368, 372, 376, 380, 384, 388, 392, 396, 400, 404, 408);
    $npc->ModifyNPCStat("ac", $stats[$level]);
}

###Usage: plugin::ScaleHP($npc, $level);
###This will scale an NPC's HP to a provided level
sub ScaleHP {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 11, 27, 43, 59, 75, 100, 125, 150, 175, 200, 234, 268, 302, 336, 381, 426, 471, 516, 561, 606, 651, 712, 800, 845, 895, 956, 1100, 1140, 1240, 1350, 1450, 1550, 1650, 1750, 1850, 1950, 2100, 2350, 2650, 2900, 3250, 3750, 4250, 5000, 5600, 6000, 6500, 7500, 8500, 10000, 11700, 13400, 15100, 16800, 18500, 20200, 21900, 23600, 25300, 27000, 28909, 30818, 32727, 34636, 36545, 38455, 40364, 42273, 44182, 46091, 48000, 49909, 51818, 53727, 55636, 75000, 90000, 113000, 130000, 140000, 240000, 340000, 440000, 445000, 450000, 455000, 460000, 465000, 470000, 475000);
    $npc->ModifyNPCStat("max_hp", $stats[$level]);
}
###Usage: plugin::ScaleAccuracy($npc, $level);
###This will scale an NPC's Accuracy to a provided level
sub ScaleAccuracy {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 42, 44, 46, 48, 50, 50, 50, 50, 50, 50, 53, 56, 59, 62, 65, 68, 71, 74, 77, 80, 85, 91, 96, 102, 107, 113, 118, 124, 129, 135, 140, 143, 145, 148, 150, 160, 170, 180, 190, 200, 300, 400, 410, 420, 430, 440, 450, 460, 470, 480);
    $npc->ModifyNPCStat("accuracy", $stats[$level]);
}
###Usage: plugin::ScaleSlowMitigation($npc, $level);
###This will scale an NPC's SlowMitigation to a provided level
sub ScaleSlowMitigation {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10, 10, 20, 20, 20, 20, 20, 25, 25, 25, 25, 25, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30);
    $npc->ModifyNPCStat("slow_mitigation", $stats[$level]);
}
###Usage: plugin::ScaleAttack($npc, $level);
###This will scale an NPC's Attack to a provided level
sub ScaleAttack {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 42, 44, 46, 48, 50, 50, 50, 50, 50, 50, 53, 56, 59, 62, 65, 68, 71, 74, 77, 80, 84, 87, 91, 95, 98, 102, 105, 109, 113, 116, 120, 128, 135, 143, 150, 160, 170, 180, 190, 200, 300, 400, 410, 420, 430, 440, 450, 460, 470, 480);
    $npc->ModifyNPCStat("atk", $stats[$level]);
}
###Usage: plugin::ScaleStrength($npc, $level);
###This will scale an NPC's Strength to a provided level
sub ScaleStrength {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("str", $stats[$level]);
}
###Usage: plugin::ScaleStamina($npc, $level);
###This will scale an NPC's Stamina to a provided level
sub ScaleStamina {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("sta", $stats[$level]);
}
###Usage: plugin::ScaleDexterity($npc, $level);
###This will scale an NPC's Dexterity to a provided level
sub ScaleDexterity {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("dex", $stats[$level]);
}
###Usage: plugin::ScaleAgility($npc, $level);
###This will scale an NPC's Agility to a provided level
sub ScaleAgility {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("agi", $stats[$level]);
}
###Usage: plugin::ScaleIntelligence($npc, $level);
###This will scale an NPC's Intelligence to a provided level
sub ScaleIntelligence {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("int", $stats[$level]);
}
###Usage: plugin::ScaleWisdom($npc, $level);
###This will scale an NPC's Wisdom to a provided level
sub ScaleWisdom {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("wis", $stats[$level]);
}
###Usage: plugin::ScaleCharisma($npc, $level);
###This will scale an NPC's Charisma to a provided level
sub ScaleCharisma {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 85, 88, 91, 94, 97, 104, 110, 117, 123, 130, 137, 143, 150, 156, 163, 166, 169, 173, 176, 179, 182, 185, 188, 191, 194, 197, 200, 203, 206, 210, 213, 216, 219, 222, 225, 228, 231, 234, 237, 240, 244, 247, 250, 253, 256, 259, 262, 265, 268, 271, 274, 277, 280, 283, 286, 289, 292, 295, 298, 301, 304, 307, 310, 313, 316);
    $npc->ModifyNPCStat("cha", $stats[$level]);
}
###Usage: plugin::ScaleMagicResist($npc, $level);
###This will scale an NPC's MagicResist to a provided level
sub ScaleMagicResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
    $npc->ModifyNPCStat("mr", $stats[$level]);
}
###Usage: plugin::ScaleColdResist($npc, $level);
###This will scale an NPC's ColdResist to a provided level
sub ScaleColdResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
    $npc->ModifyNPCStat("cr", $stats[$level]);
}
###Usage: plugin::ScaleFireResist($npc, $level);
###This will scale an NPC's FireResist to a provided level
sub ScaleFireResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
    $npc->ModifyNPCStat("fr", $stats[$level]);
}
###Usage: plugin::ScalePoisonResist($npc, $level);
###This will scale an NPC's PoisonResist to a provided level
sub ScalePoisonResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
    $npc->ModifyNPCStat("pr", $stats[$level]);
}
###Usage: plugin::ScaleDiseaseResist($npc, $level);
###This will scale an NPC's DiseaseResist to a provided level
sub ScaleDiseaseResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 14, 15, 16, 17, 17, 18, 19, 20, 21, 22, 22, 23, 23, 24, 24, 25, 25, 26, 26, 27, 27, 28, 28, 29, 29, 30, 30, 31, 31, 32, 32, 33, 33, 34, 34, 35, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
    $npc->ModifyNPCStat("dr", $stats[$level]);
}
###Usage: plugin::ScaleCorruptionResist($npc, $level);
###This will scale an NPC's CorruptionResist to a provided level
sub ScaleCorruptionResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 8, 9, 10, 10, 11, 11, 12, 12, 13, 14, 14, 15, 16, 16, 17, 18, 18, 19, 20, 22, 23, 25, 26, 27, 29, 30, 32, 33, 34, 35, 35, 36, 37, 38, 39, 39, 40, 41, 42, 43, 43, 44, 45, 46, 47, 47, 48, 49, 50, 51, 51, 52, 53, 54, 55, 56, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77);
    $npc->ModifyNPCStat("cor", $stats[$level]);
}
###Usage: plugin::ScalePhysicalResist($npc, $level);
###This will scale an NPC's PhysicalResist to a provided level
sub ScalePhysicalResist {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136, 140);
    $npc->ModifyNPCStat("phr", $stats[$level]);
}
###Usage: plugin::ScaleMinDamage($npc, $level);
###This will scale an NPC's MinDamage to a provided level
sub ScaleMinDamage {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 4, 6, 7, 7, 8, 8, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 33, 34, 34, 35, 36, 44, 51, 59, 66, 74, 78, 81, 85, 89, 93, 96, 100, 104, 107, 111, 128, 145, 162, 179, 196, 213, 230, 247, 264, 281, 298, 305, 312, 318, 325, 400, 500, 594, 650, 720, 800, 900, 1275, 1300, 1359, 1475, 1510, 1610, 1650, 1700);
    $npc->ModifyNPCStat("min_hit", $stats[$level]);
}
###Usage: plugin::ScaleMaxDamage($npc, $level);
###This will scale an NPC's MaxDamage to a provided level
sub ScaleMaxDamage {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 27, 30, 32, 35, 37, 39, 41, 42, 44, 46, 48, 50, 52, 55, 57, 59, 61, 64, 66, 68, 74, 79, 85, 90, 96, 102, 107, 113, 118, 124, 127, 130, 133, 136, 139, 152, 165, 178, 191, 204, 231, 258, 284, 311, 338, 365, 392, 418, 445, 472, 536, 599, 663, 727, 790, 854, 917, 981, 1045, 1108, 1172, 1193, 1214, 1235, 1256, 1600, 2050, 2323, 2500, 2799, 3599, 4599, 4904, 5100, 5292, 5578, 5918, 6200, 6275, 6350);
    $npc->ModifyNPCStat("max_hit", $stats[$level]);
}
###Usage: plugin::ScaleHPRegenRate($npc, $level);
###This will scale an NPC's HPRegenRate to a provided level
sub ScaleHPRegenRate {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 10, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 23, 26, 29, 32, 37, 42, 50, 56, 60, 65, 75, 85, 100, 117, 134, 151, 168, 185, 202, 219, 236, 253, 270, 289, 308, 327, 346, 365, 384, 403, 422, 441, 460, 480, 499, 518, 537, 556, 750, 900, 1130, 1300, 1140, 2400, 3400, 4400, 4450, 4500, 4550, 4600, 4650, 4700, 4750);
    $npc->ModifyNPCStat("hp_regen", $stats[$level]);
}
###Usage: plugin::ScaleAttackDelay($npc, $level);
###This will scale an NPC's AttackDelay to a provided level
sub ScaleAttackDelay {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 29, 28, 27, 25, 24, 23, 22, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 20, 20, 20, 20, 20, 20, 19, 19, 19, 19, 19, 18, 18, 18, 18, 18, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16);
    $npc->ModifyNPCStat("attack_delay", $stats[$level]);
}
###Usage: plugin::ScaleAttackSpeed($npc, $level);
###This will scale an NPC's AttackSpeed to a provided level
sub ScaleAttackSpeed {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    $npc->ModifyNPCStat("attack_speed", 0);
}
###Usage: plugin::ScaleSpellScale($npc, $level);
###This will scale an NPC's SpellScale to a provided level
sub ScaleSpellScale {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
    $npc->ModifyNPCStat("spell_scale", $stats[$level]);
}
###Usage: plugin::ScaleHealScale($npc, $level);
###This will scale an NPC's HealScale to a provided level
sub ScaleHealScale {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = (0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
    $npc->ModifyNPCStat("heal_scale", $stats[$level]);
}
###Usage: plugin::ScaleSpecialAbilities($npc, $level);
###This will scale an NPC's SpecialAbilities to a provided level
sub ScaleSpecialAbilities {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    @stats = ("21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "21,1", "8,1", "8,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1", "8,1^21,1");
    $npc->ModifyNPCStat("special_abilities", $stats[$level]);
}
###Usage: plugin::ScaleAvoidance($npc, $level);
###This will scale an NPC's Avoidance to a provided level
sub ScaleAvoidance {
    $npc = shift;
    $level = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    $npc->ModifyNPCStat("avoidance", 0);
}
###Usage: plugin::ScaleSpells($npc, $level, $originalLevel);
###This will scale an NPC's Spells to a provided level
sub ScaleSpells {
    $npc = shift;
    $level = shift;
    $originalLevel = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }
    # if less than 10, remove spells
    if ($level < 10) {
        $npc->ModifyNPCStat("npc_spells_id", 0);
        return;
    }

    # if within 5 levels of the original NPC, use original npc spells.
    if ($originalLevel >= $level-5 && $originalLevel < $level+5 && $npc->GetNPCSpellsID() > 0) {
        $npc->ModifyNPCStat("npc_spells_id", $npc->GetNPCSpellsID());
        return;
    }
    
    # fallback, determine spells to use by npc's class
    $spell_id = 0;
    if ($npc->GetClass() == 2) { $spell_id = 1; } #cleric 
    if ($npc->GetClass() == 12) { $spell_id = 2; } #wizard
    if ($npc->GetClass() == 11) { $spell_id = 3; } #necro
    if ($npc->GetClass() == 13) { $spell_id = 4; } #mage
    if ($npc->GetClass() == 14) { $spell_id = 5; } #enchanter
    if ($npc->GetClass() == 10) { $spell_id = 6; } #shaman
    if ($npc->GetClass() == 6) { $spell_id = 7; } #druid
    if ($npc->GetClass() == 3) { $spell_id = 8; } #paladin
    if ($npc->GetClass() == 5) { $spell_id = 9; } #shadowknight
    if ($npc->GetClass() == 4) { $spell_id = 10; } #ranger
    if ($npc->GetClass() == 8) { $spell_id = 11; } #bard
    if ($npc->GetClass() == 15) { $spell_id = 12; } #beastlord

    $npc->ModifyNPCStat("npc_spells_id", $spell_id);
}
###Usage: plugin::ScaleSpellEffects($npc, $level, $originalLevel);
###This will scale an NPC's SpellEffects to a provided level
sub ScaleSpellEffects {
    $npc = shift;
    $level = shift;
    $originalLevel = shift;
    if ($level < 1) {
        return;
    }
    if ($level > 90) {
        return;
    }
    if (!$npc) {
        return;
    }

    # if less than 10, ignore effects
    if ($level < 10) {
        $npc->ModifyNPCStat("npc_spells_effects_id", 0);
        return;
    }

    # if within 5 levels of npc's normal level, don't remove
    if ($originalLevel >= $level-5 && $originalLevel < $level+5) {
        return;
    }

    # if higher than original level, keep effects id
    if ($level > $originalLevel) {
        return;
    }

    $npc->ModifyNPCStat("npc_spells_effects_id", 0);    
}