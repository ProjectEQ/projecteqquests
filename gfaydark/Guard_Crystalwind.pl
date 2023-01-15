#npc - Gfaydark Guard Protectors
#zone - Gfaydark

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      my $target = $npc->GetHateTop();
      if ($target) {
        quest::say("Time to die " . $target->GetCleanName() . ".");
      }
   }
}