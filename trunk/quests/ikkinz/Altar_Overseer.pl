sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
  quest::signalwith(294605,1,0);
  quest::setnexthpevent(47);
  quest::emote("motions for one of the Altar Monuments to come forth and aid in the attack!");
  }
  if($hpevent == 47) {
  quest::signalwith(294606,1,0);
  quest::setnexthpevent(26);
  quest::emote("motions for one of the Altar Monuments to come forth and aid in the attack!");
  }
  if($hpevent == 26) {
  quest::signalwith(294607,1,0);
  quest::emote("motions for one of the Altar Monuments to come forth and aid in the attack!");
  }
}
sub EVENT_DEATH {
  quest::depopall(294608);
  quest::spawn2(294607,0,0,309,-595,2,154);
  quest::spawn2(294607,0,0,355,-644,2,181);
  quest::spawn2(294607,0,0,348,-714,2,203);
  quest::spawn2(294607,0,0,205,-589,2,97);
  quest::spawn2(294605,0,0,153,-643,2,73);
  quest::spawn2(294606,0,0,316,-778,2,224);
  quest::spawn2(294606,0,0,201,-776,2,29);
  quest::spawn2(294606,0,0,161,-717,2,52);
}