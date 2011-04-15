sub EVENT_SPAWN {
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,205,-508,-27,253);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,203,-479,-27,126);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,220,-493,-27,195);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,147,-517,-27,38);
  quest::spawn2(quest::ChooseRandom(296031,296032,296034),0,0,153,-466,-27,81);
  quest::shout("What?! How in the name of Trushar did you get to this cursed place? From the smug look on your face I can only imagine you think you can destroy us . . . We are already doomed, knaves!");
}
sub EVENT_DEATH {
  quest::spawn2(296030,0,0,-274,-531,-52,125);
  quest::spawn2(296033,0,0,-557,-237,-2,63);
  quest::spawn2(296035,0,0,-406,-552,-77,62);
  quest::spawn2(296036,0,0,-355,-554,-77,190);
}