#####################################
# ZONE: Lavastorm Mountains (lavastorm)
# DATABASE: PEQ
# Developer: ATTEMPT37
#
# **NPC INFORMATION**
#
# NAME: Eejag
# 
#
# **ITEMS GIVEN OR TAKEN**
#
#
# **QUESTS INVOLVED**
#
# Celestial Fists (Monk epic 1.0)
#
#
#####################################

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  #Set proximity
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
  quest::shout("What imbecile dares challenge a Celestial Fist?! Do you even know who you are challenging? HA! You are nothing but an insect! I will enjoy crushing you, I have not charred the flesh of an idiot in decades! If you truly wish to fight me, the battle shall be held in my own element. Come, challenger, come down to the pits of flowing fire.");
}

sub EVENT_ENTER {
 if(($class eq "Monk") && ($ulevel >= 46)){
  # Monk Epic 1.0
  quest::attack($name);
 }
}
# End of File