sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("ignores you.");
 }
}

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  # Set proximity
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_ENTER {
 if($class eq "Monk"){
  # Monk Epic 1.0
  quest::attack($name);
 }
}


# End of File