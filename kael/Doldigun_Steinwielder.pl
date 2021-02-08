# items: 18172
sub EVENT_AGGRO {
  quest::emote("calls for help and scurries off.");
  quest::spawn2(113554,28,0,1130.3,-933.2,-125.6,253.2); # NPC: #Grondon_Zekkin
  quest::spawn2(113555,29,0,1130.3,-749.6,-125.6,253.2); # NPC: #Kromzog_Zekkin
  quest::depop_withtimer();
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18172 => 1)) {
    quest::emote("calls for help and scurries off.");
    quest::spawn2(113443,28,0,1130.3,-933.2,-125.6,253.2); # NPC: Grondon_Zekkin
    quest::spawn2(113548,29,0,1130.3,-749.6,-125.6,253.2); # NPC: Kromzog_Zekkin
    quest::depop_withtimer();
  }
}
