sub EVENT_SPAWN {
  quest::set_proximity($x - 2000, $x + 2000, $y - 2000, $y + 2000,$z - 200, $z + 1);
}

sub EVENT_ENTER {
  quest::movepc(10,-1570,-25,20,231);
}