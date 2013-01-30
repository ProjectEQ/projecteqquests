sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Greetings, $name. Do you believe that you are a [great Wizard]?");
  }
  if($text=~/great wizard/i) {
    quest::say("I will not take your word for it! You must prove your greatness to my apprentices. Do you wish to be tested by Neasin or by Abec?");
  }
  if(($text=~/Neasin/i) && ($class eq "Wizard")) {
    quest::say("I will summon him for you then");
    quest::spawn2(71092,0,0,585,1304.3,-766.9,0.1);
    quest::depop_withtimer();
  }
  if(($text=~/Abec/i) && ($class eq "Wizard")) {
    quest::say("I will summon him for you then");
    quest::spawn2(71079,0,0,585,1304.3,-766.9,0.1);
    quest::depop_withtimer();
  }
}
#END of FILE Zone:airplane  ID:5408 -- Wizard_Schrock