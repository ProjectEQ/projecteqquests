# EPIC CLERIC (Timorous deep)

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28048 => 1, 28049 => 1, 28050 => 1)) { #Orb of Clear Water, Orb of Frozen Water, Orb of Vapor
    quest::emote("kneels in the sand and places the three orbs into a large abalone shell bowl. A blue glow surrounds his hands as he waves them over the orbs resting in the bowl. The orbs crack and fall apart, releasing their contents, then reform into a single glowing orb. Jhassad Oceanson gently removes the Orb of the Triumvirate and places it in your hands.");
    quest::say("The Avatar of Water approaches. You must hand him the Orb of the Triumvirate and it will be decided if it is your destiny to wield the Nem Ankh Sprinkler."); 
    quest::summonitem(28023); # Orb of the triumvirate
    quest::unique_spawn(96086,21,0,-1886,-11661,1,192); #Avatar of water
    quest::depop();
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }  
}
#End of File, Zone:timorous  NPC:96074 -- Jhassad Oceanson