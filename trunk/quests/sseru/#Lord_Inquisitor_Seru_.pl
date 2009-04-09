sub EVENT_SPAWN {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer == 1 && ($x < -353 || $x > -109 || $y < -549 || $y > -310)) {
    quest::shout("No! I must not leave the time chamber! If I do, I'll age and die!");
    $npc->GMMove(-231.464005,-432.937469,202.375946,.125);
 }
}

sub EVENT_DEATH {
  quest::stoptimer(1);
}