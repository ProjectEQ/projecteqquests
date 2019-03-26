sub EVENT_SPAWN {
  quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
  quest::spawn2(294616,0,0,544,-264,-50,56); # NPC: #Lesser_Altar_Construct
  quest::spawn2(294616,0,0,632,-274,-50,422); # NPC: #Lesser_Altar_Construct
  quest::spawn2(294616,0,0,533,-178,-50,212); # NPC: #Lesser_Altar_Construct
  quest::spawn2(294616,0,0,632,-147,-50,310); # NPC: #Lesser_Altar_Construct
  quest::depop();
}      
