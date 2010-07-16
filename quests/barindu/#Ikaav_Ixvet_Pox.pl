sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Be gone. I've no interest in your fruits today.");
    quest::signalwith(283047,1,10);
}
  if($signal == 2) {
  quest::say("What have you done, slave! Try to poison me? You will pay for your insolence!");
  quest::attacknpctype(283081);
  quest::signalwith(283047,3,1);
  quest::depop();
  quest::spawn2(283162,0,0,$x,$y,$z,$h);
}
}
