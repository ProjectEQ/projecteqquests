sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings, young one. Are you a [child of the trees]?");

}

if($text=~/what child of the trees/i){

quest::say("Then you are welcome in my presence. I shall call forth some loyal children if you but speak the name. Will or Fenalla will serve you well.");
 }
      if(($text=~/Will/i) && ($class eq "Druid")) { 
        quest::say("I will summon him for you then");
        quest::spawn2(71099,0,0,563,1311.4,-766.9,65.4);
        quest::depop();
        }
      if(($text=~/Fenalla/i) && ($class eq "Druid")){
        quest::say("I will summon him for you then");
        quest::spawn2(71086,0,0,562.5,1329.3,-766.9,65.4);
        quest::depop();
        }

}

#END of FILE Zone:airplane  ID:4825 -- Strandar_Pinemist 



