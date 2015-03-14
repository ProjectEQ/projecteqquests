sub EVENT_SPAWN {
  quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
  quest::spawn2(294616,0,0,544,-264,-50,28);
  quest::spawn2(294616,0,0,632,-274,-50,211);
  quest::spawn2(294616,0,0,533,-178,-50,106);
  quest::spawn2(294616,0,0,632,-147,-50,155);
  quest::depop();
}      