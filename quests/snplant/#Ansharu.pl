sub EVENT_SPAWN {
  $counter=0;
}

sub EVENT_SAY {
if ($text=~/hail/i) {
  if ($qglobals{sewers} == 1) {
     quest::say("Great job!");
     quest::setglobal("sewers", 2, 5, "F");
	$client->Message(4,"You receive a character flag!");
}
}

 elsif ($text=~/hail/i) {
    quest::say("Find the aged stonemites.  They are causing great trouble, come back and talk to me once you have solved the problem.");
    quest::spawn2(287021,0,0,-96,-1679,-89,207);
    quest::spawn2(287021,0,0,-41,-1685,-89,211);
    quest::spawn2(287021,0,0,2,-1658,-89,198);
    quest::spawn2(287021,0,0,18,-1614,-89,191);
    quest::spawn2(287021,0,0,5,-1559,-89,170);
    quest::spawn2(287021,0,0,-12,-1517,-89,159);
    quest::spawn2(287021,0,0,-56,-1484,-89,134);
    quest::spawn2(287021,0,0,-53,-1586,-87,180);
    quest::spawn2(287021,0,0,-120,-1573,-89,135);    
  }
  
}
sub EVENT_SIGNAL {
if($signal == 1) { 
         $counter += 1;
}

  if($counter == 9) { 
    quest::spawn2(287145,0,0,-45,-1616,-87,190);

}
}


sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}