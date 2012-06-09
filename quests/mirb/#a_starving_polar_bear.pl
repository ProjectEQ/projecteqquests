sub EVENT_SPAWN {
  quest::settimer("Bite", quest::ChooseRandom(10,15,20,25));
}

#send signal to Sharalla's Warder(237772) that this animal is biting Sharalla's corpse
sub EVENT_TIMER {
  if ($timer=="Bite") {
    quest::signalwith(237772,1,1);
    quest::settimer("Bite", quest::ChooseRandom(10,15,20,25));
  }
}

#send signal to Sharalla's Warder(237772) that a famished leopard has died

sub EVENT_DEATH {
  quest::signalwith(237772,2,1);
}