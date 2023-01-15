my $ProxDist = 30;

sub EVENT_SPAWN {

   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   quest::set_proximity($x - $ProxDist, $x + $ProxDist, $y - $ProxDist, $y + $ProxDist, $z - $ProxDist, $z + $ProxDist);
   
}


sub EVENT_ENTER {
	quest::emote("invades your thoughts: 'Beware mortal!  This land is marked by Veeshan, and is sacred to her brood.  None but Dragonkin are welcome here.  Your life is forteit if you proceed.  Ignore this message at your peril!'");
	quest::depop_withtimer();
}
