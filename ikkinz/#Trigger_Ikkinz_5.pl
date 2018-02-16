sub EVENT_SPAWN {
  quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
  quest::spawn2(294616,0,0,544,-264,-50,56);
  quest::spawn2(294616,0,0,632,-274,-50,422);
  quest::spawn2(294616,0,0,533,-178,-50,212);
  quest::spawn2(294616,0,0,632,-147,-50,310);
  quest::depop();
}      
