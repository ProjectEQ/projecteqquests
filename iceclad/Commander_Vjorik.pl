# Name: Commander Vjorik
# NPC ID: 110096, 110109

sub EVENT_SIGNAL {
   # Ambush 1 shout for shawl 8
   if ($signal == 102) {
      quest::shout("The tracking wolves have found the Coldain! To the South West, Charge him!");
   }
}