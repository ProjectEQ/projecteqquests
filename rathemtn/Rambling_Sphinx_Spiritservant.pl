sub EVENT_SPAWN {
  quest::emote("has a dark glow in its eye as it rushes toward you. ");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("babbles incoherently as the glow in its eyes is extinguished");
  quest::spawn2(50230,0,0,-3241,3550,39,1224); # needs_heading_validation

}
