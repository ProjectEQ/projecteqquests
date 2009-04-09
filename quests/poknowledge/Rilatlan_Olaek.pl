#Just basic code to have this NPC sit a few seconds after spawning.

sub EVENT_SPAWN {
 quest::settimer(1,10);
}

sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}

#Submitted by Jim Mills