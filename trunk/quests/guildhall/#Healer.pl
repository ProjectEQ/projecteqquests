# Guild Hall Regen Pool Script - NPC Portion

# Set the distance for the proximity here
my $ProxDist = 30;

sub EVENT_SPAWN {

   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   quest::set_proximity($x - $ProxDist, $x + $ProxDist, $y - $ProxDist, $y + $ProxDist, $z - $ProxDist, $z + $ProxDist);
   
}


sub EVENT_ENTER {

   $npc->SignalClient($client, 1);

}

sub EVENT_EXIT {

   if($client) {   # Probably not required to check this here
      $npc->SignalClient($client, 2);
   }
   
}