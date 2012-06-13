my $ProxDist = 30;

sub EVENT_SPAWN {

   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   quest::set_proximity($x - $ProxDist, $x + $ProxDist, $y - $ProxDist, $y + $ProxDist, $z - $ProxDist, $z + $ProxDist);
   
}


sub EVENT_ENTER {
	if ($x == 1298 && $y == -2028) {
		quest::emote("turn the corner, you catch glimse of a beast beyond, mangled and twisted by decades of decay.");
	}
	if ($x == 624 && $y == -975) {
		quest::emote("turn the corner, you bear witness to a frigid creature down the hall, waiting for you to come closer so that it might show you misery.");
	}
}

sub EVENT_EXIT {
	quest::clear_proximity();
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   quest::set_proximity($x - $ProxDist, $x + $ProxDist, $y - $ProxDist, $y + $ProxDist, $z - $ProxDist, $z + $ProxDist);	
}