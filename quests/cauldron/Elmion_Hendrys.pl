#wood elf ranger dude
#npc - Elmion Hendrys
#zone - Dagnors Cauldron

sub EVENT_SAY {
   if ($text=~/hail/i) {
      if ($faction <= 7) {
         quest::say("How are you? Please rest. Have you [been wounded by the beasts] of this region.");
      }
      else {
         quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
      }
   }
   elsif ($text=~/wounded by the beasts/i) {
      if ($faction <= 7) {
         quest::say("Ah. Perhaps you should speak with Nyrien. Just inform him you [need to be healed].");
      }
      else {
         quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
      }
   }
   elsif ($text=~/faldor hendrys/i) {
      if ($faction <= 7) {
         quest::say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves' guild. Good luck finding him.");
      }
      else {
         quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
      }
   }
}

sub EVENT_SIGNAL {
   quest::say("Pipe down, Ghil!! We have no quarrel with this adventurer.");
}
