sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 90, $x + 90, $y - 60, $y + 60);
   $ecounter = 0;
}

sub EVENT_ENTER {
      $ecounter += 1;
   }
   if ($ecounter => 19) {
      quest::movepc(219,0,0,6.7);
      $client->Message(2,"This trial is currently full.");
   } 

sub EVENT_EXIT {
   $ecounter -= 1;
} 

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
