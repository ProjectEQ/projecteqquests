# NPC for the plate cycle in Kael. The proximity and echo will need to be replaced when NPC listening to commands when not targeted is implemented.
sub EVENT_SPAWN {  
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 30, $x + 30, $y - 30, $y +30);
  quest::enable_proximity_say();
}

sub EVENT_PROXIMITY_SAY {
  if($text=~/dain/i) {
    quest::spawn2(113440,0,0,1126.4,-840.6,-118.3,62.6); #Doldigun, non-loot version
  }
}

sub EVENT_SIGNAL {
  if ($dwarf == 1) {
    quest::spawn2(113508,29,0,1130.3,-933.2,-125.6,63.4);
    $dwarf = 0
  }
  elsif ($dwarf != 1) {
    $dwarf = 1;
  }
}
