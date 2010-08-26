sub EVENT_SPAWN {
  plugin::StraightPath(500,600);

}
sub EVENT_AGGRO {
  quest::say("In the name of the Rainkeeper, I strike at thee!!");
}

sub EVENT_DEATH {
  quest::say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
}