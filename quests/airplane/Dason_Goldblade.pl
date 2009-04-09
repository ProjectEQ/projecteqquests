sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings, $name.  Are you pure of heart and soul?");
 }
if($text=~/Heart and Soul/i) {
  quest::say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
  }
      if($text=~/Gregori/i){
        quest::say("I will summon him for you then");
        quest::spawn2(71089,0,0,563,1331.1,-766.9,63.4);
        quest::depop();
        }
      if($text=~/Dirkog/i){
        quest::say("I will summon him for you then");
        quest::spawn2(71077,0,0,563,1331.1,-766.9,63.4);
        quest::depop();
        }

}

#END of FILE Zone:airplane  ID:853 -- Dason_Goldblade 



