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
 if(($class eq "Monk") && ($ulevel>=46)) {
  # Monk Epic 1.0
  quest::attack($name);
 }
}

sub EVENT_DEATH_COMPLETE {
  # MonkEpic 1.0
  quest::say("Foolish mortal! you think you have defeated me? Now, witness the true power of Rallos Zek!");
  # Spawn: Xenevorash
  quest::spawn(85208,0,0,-542,-807,79.12);
}
# End of File