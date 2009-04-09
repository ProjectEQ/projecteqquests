sub EVENT_AGGRO {
        quest::say("For the defeat of my daughter, I shall make sure you know fear as none have ever experienced it before!");
}

sub EVENT_DEATH {
        quest::signalwith(223158,13010,0);
        quest::say("Noooo. . . fear. . . shall never die. . .");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }