# EPIC CLERIC (Timorous deep)


sub EVENT_ITEM {
  # 28049 : Orb of Frozen Water
  # 28048 : Orb of Clear Water
  # 28050 : Orb of Vapor
  if (plugin::check_handin(\%itemcount,28048=>1,28049=>1,28050=>1)) { 
    quest::emote("kneels in the sand and places the three orbs into a large abalone shell bowl. A blue glow surrounds his hands as he waves them over the orbs resting in the bowl. The orbs crack and fall apart, releasing their contents, then reform into a single glowing orb. Jhassad Oceanson gently removes the Orb of the Triumvirate and places it in your hands.");
    quest::say("The Avatar of Water approaches. You must hand him the Orb of the Triumvirate and it will be decided if it is your destiny to wield the Nem Ankh Sprinkler."); 
    quest::summonitem(28023); # Orb of the triumvirate
    quest::unique_spawn(96086,0,0,$x+10,$y+1,$z); # Avatar of water
    quest::depop();
  } 
  
}

#End of File, Zone:timorous  NPC:96074 -- Jhassad Oceanson