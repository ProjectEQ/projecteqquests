sub EVENT_SPAWN {
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,205,-508,-27,253);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,203,-479,-27,126);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,220,-493,-27,195);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,147,-517,-27,38);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,153,-466,-27,81);
}

sub EVENT_AGGRO {
  quest::shout("What?! How in the name of Trushar did you get to this cursed place? From the smug look on your face I can only imagine you think you can destroy us . . . We are already doomed, knaves!");
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(296030,0,0,-274,-531,-52,125); #Stonemite event Exiles
  quest::spawn2(296033,0,0,-557,-237,-2,63);
  quest::spawn2(296035,0,0,-385,-562,-76,270);
  quest::spawn2(296036,0,0,-305,-310,-51,270);
  my $instid = quest::GetInstanceID("inktuta",0);
  quest::setglobal($instid.'_inktuta_status',3,3,"H6");
}