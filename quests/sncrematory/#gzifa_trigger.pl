sub EVENT_SPAWN {
quest::set_proximity(0, 100, 0, 100, 0, 20);
$counter = undef;
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 55608)) {
  if(plugin::check_hasitem($client, 55609)) {
  if(plugin::check_hasitem($client, 55610)) {
  if(plugin::check_hasitem($client, 55611)) {
  quest::spawn2(288082,0,0,1320,-2551,15,87);
  quest::spawn2(288083,0,0,1382,-2549,7,190);
  quest::spawn2(288084,0,0,1331,-2605,7,254);
  quest::spawn2(288085,0,0,1362,-2577,10,215);
}
}
}
}
}
sub EVENT_SIGNAL {
  if($signal == 1) { #signal 1 is from each of the remains
         $counter += 1;
}
 if($counter == 4) {
 quest::spawn2(288086,0,0,1320,-2551,15,87);
 quest::spawn2(288086,0,0,1382,-2549,7,190);
 quest::spawn2(288086,0,0,1331,-2605,7,254);
 quest::spawn2(288086,0,0,1362,-2577,10,215);
 }
 if($counter == 8) {
 quest::spawn2(288087,0,0,577,-2352,-59,193);
 }
 }