sub EVENT_AGGRO {
  quest::settimer("eggs",40);
}

sub EVENT_TIMER {
  if($timer == "eggs") {
    if($npc->IsEngaged()) {
      quest::emote("The Murkglider Hivequeen  spews several slimy eggs unto the ground.  They begin to quiver almost immediately.");
      quest::spawn2(300083,0,0,($x + 10),$y,$z,$h);
      quest::spawn2(300083,0,0,($x + 10),$y,$z,$h);
      quest::spawn2(300083,0,0,($x + 10),$y,$z,$h);
      } else {
      quest::stoptimer("eggs");
    }
  }
}
