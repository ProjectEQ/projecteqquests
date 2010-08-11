sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 1) {
  quest::say("Nice work, speak to the High Priest to continue.");
  quest::setglobal("sewers",2,5,"F");
  $client->Message(4,"You receive a character flag!"); 
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 2  && $qglobals{sewers} == 2) {
  quest::say("Nice work, speak to the High Priest to continue.");
  quest::setglobal("sewers",3,5,"F");
  $client->Message(4,"You receive a character flag!"); 
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 2) {
  quest::say("Thank you for assisting in the Crematory, please visit the Plant to advance.");
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3  && $qglobals{sewers} == 3) {
  quest::say("Nice work, speak to the High Priest to continue.");
  quest::setglobal("sewers",4,5,"F");
  $client->Message(4,"You receive a character flag!"); 
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3) {
  quest::say("Thank you for assisting in the Lair, please visit the Plant to advance.");
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 3  && $qglobals{sewers} == 2) {
  quest::say("Thank you for assisting in the Lair, please visit the Crematory to advance.");
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 5) {
  quest::say("Nice work, the path to vxed is open, speak with Apprentice Udranda.");
  quest::setglobal("god_vxed_access",1,5,"F");
  $client->Message(4,"You receive a character flag!"); 
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 4) {
  quest::say("Nice work, the path to vxed is open, speak with Apprentice Udranda.");
  quest::setglobal("god_vxed_access",1,5,"F");
  $client->Message(4,"You receive a character flag!"); 
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4) {
  quest::say("Thank you for assisting in the Pool, please visit the Plant to advance.");
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 2) {
  quest::say("Thank you for assisting in the Pool, please visit the Crematory to advance.");
}
}
elsif ($text=~/hail/i) {
  if (defined $qglobals{temp_sewers} && $qglobals{temp_sewers} == 4  && $qglobals{sewers} == 3) {
  quest::say("Thank you for assisting in the Pool, please visit the Lair to advance.");
}
}
else {
  quest::say("Please speak with the High Priest if you desire to assist");
}
}