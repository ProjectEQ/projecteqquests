sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings. $name.  Have you come here to test your dark powers of skill and spell casting?");

}

if($text=~/dark powers of skill/i){

quest::say("You will be tested by either Gragrot or Tynicon.  Choose one!");

}

      if(($text=~/Gragrot/i) && ($class eq "Shadowknight")){
        quest::say("I will summon him for you then");
        quest::spawn2(71063,0,0,563.3,1351.9,-766.9,63.4);
        quest::depop();
        }
      if(($text=~/Tynicon/i) && ($class eq "Shadowknight")){
        quest::say("I will summon him for you then");
        quest::spawn2(71098,0,0,563.3,1351.9,-766.9,63.4);
        quest::depop();
        }

}

#END of FILE Zone:airplane  ID:4268 -- Sarkis_Ebonblade 



