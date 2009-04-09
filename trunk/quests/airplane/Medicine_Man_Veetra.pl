sub EVENT_SAY {
     if($text=~/Hail/i){
       quest::say("Good day to you, $name. Are you a shaman of [much experience]?");
       }
     if($text=~/much experience/i){
       quest::say("Then welcome to the tests of the medicine man. I have two tomes, each tells of a shaman of great accomplishment. They are Gina MacStargan and Ooga. Simply tell me the name of the shaman you want to be tested by.");
       }
     if(($text=~/Gina MacStargan/i) && ($class eq "Shaman")){
       quest::say("I shall summon them for you");
       quest::spawn2(71087,0,0,631.9,1401.9,-766.9,129.8);
       quest::depop();
       }
     if(($text=~/Ooga/i) && ($class eq "Shaman")){
       quest::say("I shall summon them for you");
       quest::spawn2(71093,0,0,653.4,1399.0,-766.9,129.8);
       quest::depop();
       }
}
#END of FILE Zone:airplane  ID:3448 -- Medicine_Man_Veetra 



