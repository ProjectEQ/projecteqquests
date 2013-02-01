############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: November 9, 2007
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Thena_Lonnes
# ID: 9087
# TYPE: Monk Sparring Partner
# RACE: Human
# LEVEL: 35
#
############################################

sub EVENT_SPAWN {
   quest::settimer("spar2", 3);
}

sub EVENT_TIMER {
   if($timer eq "spar2") {
      # Random animations: Kick, Throw, Offhand Attack, Dragon Punch, Round Kick, Rude, Flying Kick, Tiger Claw, Eagle Strike
      my $anivar2 = quest::ChooseRandom(1, 5, 6, 7, 11, 30, 45, 46, 47);
      quest::doanim($anivar2);
   }
}
#END of FILE Zone:freportw  ID:9087 -- Thena_Lonnes 