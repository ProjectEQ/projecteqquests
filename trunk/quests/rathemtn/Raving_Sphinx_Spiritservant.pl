sub EVENT_SPAWN {
   quest::emote("has a dark glow in its eye as it rushes toward you. ");
}

sub EVENT_DEATH {
  quest::say("babbles incoherently as the glow in its eyes is extinguished");
  quest::spawn2(50231,0,0,-3304,3476,28,1180);

}
