sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223187,14050,0);
    quest::say("What madness is this? How could I have been defeated? I beg of you Xegony, please forgive my weakness.");
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
