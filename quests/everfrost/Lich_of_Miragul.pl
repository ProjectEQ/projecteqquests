sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Areeeeewwwww"); }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19072 => 1)){# handin phlactery 
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(30094, 0, 0, $x, $y, $z, $h); # Spawn Miragul
    quest::depop_withtimer();
  }
}

#END of FILE Zone:everfrost  ID:3233 -- Lich_of_Miragul 

