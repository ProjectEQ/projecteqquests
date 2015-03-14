sub EVENT_SPAWN {
  quest::set_proximity($x - 208, $x + 208, $y - 242, $y + 242, $z - 5, $z + 400);
}

sub EVENT_ENTER {
  if($status<80){
    if(!plugin::check_hasitem($client, 19719) && !$client->KeyRingCheck(19719)) {
      quest::movepc(162,0,0,2.2,65);
    }
  }
}