sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Greetings, $name. Are you a [true warrior]?");
  }
  if($text=~/true warrior/i) {
    quest::say("Then you shall be tested as one. Choose. Do you wish to be tested by Falorn or Ogog?");
  }
  if(($text=~/falorn/i) && ($class eq "Warrior")) {
    quest::say("I will summon him for you then");
    quest::spawn2(71067,0,0,563.3,1392.4,-766.9,63.4);
    quest::depop_withtimer();
  }
  if(($text=~/ogog/i) && ($class eq "Warrior")){
    quest::say("I will summon him for you then");
    quest::spawn2(71064,0,0,563.3,1392.4,-766.9,63.4);
    quest::depop_withtimer();
  }
}
#END of FILE Zone:airplane  ID:5039 -- Torgon_Blademaster