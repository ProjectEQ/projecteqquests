sub EVENT_SPAWN {
  $start_event = undef;
 quest::set_proximity($x-50,$x+50,$y-50,$y+50); 

}

sub EVENT_PROXIMITY_SAY {
if($start_event == undef) {
if(plugin::check_hasitem($client, 67415)) {
  if ($text=~/i wish to enter/i) {
     quest::movegrp(281,-1700, -1100, -4);
    quest::spawn2(281118,0,0,-1741,-1078,-4,197);
    $start_event = 1;
    }
  }
}
}
