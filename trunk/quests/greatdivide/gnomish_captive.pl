#Zone: Great Divide
#Short Name: greatdivide
#Zone ID: 118
#
#NPC Name: gnomish captive
#NPC ID: 118154
#

sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
  quest::say("Please, somebody help me. This bear won't let me leave.");
  quest::emote("tries to hide from Bloodmaw deeper in the cave.");
  quest::clear_proximity();
  quest::depop();
}

#END of FILE Zone: greatdivide  ID:118154 -- gnomish_captive

