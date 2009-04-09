sub EVENT_SAY {
if($text=~/hail/i) {
  quest::say("Who.. who are you? You.. You must help me! ");
}
if($text=~/I will help you/i) {
  quest::say("The forest, it.. I can feel it looking at me.. following me! Oh, I just want to leave and go!");
  quest::say("I don't know what it could be, I was just walking home and.. and.. this doesn't look like the forest near my home at all! Oh, and I am wearing my mother's Locket of Escape.. but it won't work for me!");
}
if($text=~/What locket of escape/i) {
  quest::say("My mother always carried this with her. I have no idea why I suddenly have it. Perhaps I can make it work for you, if you want me to?");
}
if($text=~/I want you to/i) {
  quest::say("Hmm.. It doesn't seem to want to work. Do you see Deyid?'");
}
if($text=~/I see Deyid/i) {
  quest::say("Ohh, that must be what is causing all this trouble! You all seem so brave. Maybe if you chop down Deyid the Twisted I will be able to go home? Will you please? If you have gathered together and are prepared, have your leaders step forward and tell me their readiness. Mother's Locket doesn't seem as bright as it was before. I fear I can only use it but a couple more times.");
}
if($text=~/We are ready/i) {
  quest::movegrp(204,1194,1121,280); 
 }
}

sub EVENT_SIGNAL {
  quest::shout("Oh thank you! Thank you! I don't feel the trees watching me anymore! And.. Let me try Mother's Locket again, I think it might work..");
quest::depop();
}
