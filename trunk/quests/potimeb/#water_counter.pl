my $wcounter;

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 80, $x + 80, $y - 60, $y + 60);
   $wcounter = 0;
}

sub EVENT_ENTER {
   $wcounter += 1;
}
if ($wcounter => 19) {
   quest::movepc(219,0,0,6.7);
   $client->Message(2,"This trial is currently full.");
} 

sub EVENT_EXIT {
   $wcounter -= 1;
} 

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
