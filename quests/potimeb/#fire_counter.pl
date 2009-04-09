my $fcounter;

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 80, $x + 80, $y - 60, $y + 60);
   $fcounter = 0;
}

sub EVENT_ENTER {
   $fcounter += 1;
}
if ($fcounter => 19) {
   quest::movepc(219,0,0,6.7);
   $client->Message(2,"This trial is currently full.");
} 

sub EVENT_EXIT {
   $fcounter -= 1;
} 

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
