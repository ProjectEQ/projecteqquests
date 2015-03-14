sub EVENT_DEATH_COMPLETE {
  quest::me("A nimbus of light floods throughs the crypt in one magnificent wave as an earth shattering howl is heard. The bringer of plagues, lord of all disease and decay, Bertoxxulous has been defeated. Suddenly an urgent whisper fills your head simply saying, 'The Torch of Lxanvom shall burn bright again. Freedom is now ours, for that we thank you.'");
  quest::signalwith(200024,8,0);
  quest::spawn2(218068,0,0,$x,$y,$z,$h);
}

sub EVENT_SIGNAL {
  quest::depop();
}