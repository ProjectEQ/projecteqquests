sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings, $name.  Do you believe you are a great rogue?");

}

if($text=~/great rogue/i){

quest::say("I will not take your word for it!  You must prove your greatness to one of my apprentices.  Do you wish to be tested by Rayne or by Kendrick?");

}

      if(($text=~/Rayne/i) && ($class eq "Rogue")){
        quest::say("I will summon him for you then");
        quest::spawn2(71061,0,0,563.3,1372.6,-766.9,63.4);
        quest::depop();
        }
      if(($text=~/Kendrick/i) && ($class eq "Rogue")){
        quest::say("I will summon him for you then");
        quest::spawn2(71068,0,0,563.3,1372.6,-766.9,63.4);
        quest::depop();
        }

}

#END of FILE Zone:airplane  ID:4949 -- Thalik_Silenthand 



