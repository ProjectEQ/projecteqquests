sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings, $name. Are you a true warrior?");

}

if($text=~/i am a true warrior/i){

quest::say("Then you shall be tested as one.  Choose.  Do you wish to be tested by Falorn or Ogog?");

}

      if(($text=~/Falorn/i) && ($class eq "Warrior")){
        quest::say("I will summon him for you then");
        quest::spawn2(71067,0,0,563.3,1392.4,-766.9,63.4);
        quest::depop();
        }
      if(($text=~/Ogog/i) && ($class eq "Warrior")){
        quest::say("I will summon him for you then");
        quest::spawn2(71064,0,0,563.3,1392.4,-766.9,63.4);
        quest::depop();
        }

}

#END of FILE Zone:airplane  ID:5039 -- Torgon_Blademaster 



