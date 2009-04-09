sub EVENT_AGGRO {
  quest::emote("snarls with determined fury, then rushes directly at you!");
}

sub EVENT_DEATH {
  quest::signalwith(223154,11050,0);
  quest::emote("stumbles and lies prone, taking breaths in punctuated gasping snorts. Its eyes slowly close as it ceases breathing.");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
