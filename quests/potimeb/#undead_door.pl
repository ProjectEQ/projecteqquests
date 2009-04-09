sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 8, $x + 8, $y - 60, $y + 60);
   quest::signalwith(223177,10,0);
}

sub EVENT_ENTER {
   quest::signalwith(223177,10,0);
   quest::clear_proximity();
}   

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }