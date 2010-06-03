sub EVENT_SPAWN {
  $counter=0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Find the aged stonemites.  They are causing great trouble, come back and talk to me once you have solved the problem.");
    quest::spawn_condition($zonesn,2,1);
  }
  if ($text=~/hail/i) {
  if ($qglobals{sewers} == 1) {
     quest::say("Great job!");
     quest::setglobal("sewers", 2, 5, "F");
	$client->Message(4,"You receive a character flag!");
}
}
}
sub EVENT_SIGNAL {
if($signal == 1) { 
         $counter += 1;
}

  if($counter == 9) { 
    quest::spawn2(284097,0,0,-45,-1616,-87,190);

}
}


sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}