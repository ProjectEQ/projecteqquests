sub EVENT_SPAWN {
quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}
sub EVENT_ENTER {
  quest::emote("grapples with an imaginary opponent. He seems quite convinced that another humanoid is struggling against him.");
  quest::say("Raargh! This worship room is mine, ask Kelekdrix. You'll not take it!.");
}
sub EVENT_SAY {
  if ($text=~/awaken me from this nightmare/i) {
  quest::setglobal("exile_ir",1,1,"M2");
  quest::settimer(1,3);
  }
}
sub EVENT_TIMER {
  quest::stoptimer();
  if (($qglobals{exile_ir} == 1) && ($qglobals{exile_co} == 1) && ($qglobals{exile_ra} == 1) && ($qglobals{exile_in} == 1)) {  
    quest::emote("blinks and a spark of sanity returns.");
    quest::say("Ah, wha . . . what? How strange. I can see clearly now.");
    quest::say("Thank you for restoring our clarity. Something in this cursed place had stolen away my sanity, and I will not allow it to happen again. Death would be preferable to that endless madness. Be warned, the gateway to the lower reaches of this temple will be unsealed soon. Leave this place before you become mad yourselves!");
    }
}
