sub EVENT_SPAWN {
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,82,-468,-27,506); # NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,-21,-454,-27,252); # NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,38,-452,-27,390); # NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,118,-530,-27,76); # NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,38,-515,-27,162); # NPC(s): a_shambling_exile (296031), a_blighted_exile (296032), a_dying_exile (296034)
}

sub EVENT_AGGRO {
  quest::shout("What?! How in the name of Trushar did you get to this cursed place? From the smug look on your face I can only imagine you think you can destroy us . . . We are already doomed, knaves!");
}

sub EVENT_DEATH_COMPLETE {
  my $instid = quest::GetInstanceID("inktuta",0);
  quest::setglobal($instid.'_inktuta_status',3,3,"H6");
}
