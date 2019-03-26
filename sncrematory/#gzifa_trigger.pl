sub EVENT_SPAWN {
quest::set_proximity($x-50,$x+50,$y-50,$y+50); 
$counter = undef;
$event_started = 0;
}

sub EVENT_ENTER {
  if (defined $qglobals{sewers} && $qglobals{sewers} == 2) {
  if($event_started == 0) {
  if(plugin::check_hasitem($client, 55608)) {
  if(plugin::check_hasitem($client, 55609)) {
  if(plugin::check_hasitem($client, 55610)) {
  if(plugin::check_hasitem($client, 55611)) {
  quest::spawn2(288082,0,0,1320,-2551,15,174); # NPC: #Mabiki
  quest::spawn2(288083,0,0,1382,-2549,7,380); # NPC: #Ngozi
  quest::spawn2(288084,0,0,1331,-2605,7,508); # NPC: #Talakoi
  quest::spawn2(288085,0,0,1362,-2577,10,430); # NPC: #Yogundi
  $event_started = 1;
  }
}
}
}
}
}
}
sub EVENT_SIGNAL {
  if($signal == 1) { #signal 1 is from each of the remains
    $counter += 1;
      if($counter == 4) {
       quest::spawn2(288087,0,0,536,-2353,-60,128); # NPC: #Gzifa_the_Pure_One
 }
 }
 }
