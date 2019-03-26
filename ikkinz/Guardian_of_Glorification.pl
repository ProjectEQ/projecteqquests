sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60227 => 1 )) {
    quest::spawn2(294582,0,0,$x,$y,$z,$h); # NPC: #Guardian_of_Glorification
    quest::depop_withtimer();
	quest::ze(0,"Guardian of Glorification comes alive with the power of Kruxilitek!");
  }
}