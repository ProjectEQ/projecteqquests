sub EVENT_SAY {
    if($text=~/Hail/i){
      quest::say("Greetings, $name.  Are you ready to begin your test of faith?");
      }
    if(($text=~/test of faith/i) && ($class eq "Cleric")){
      quest::say("I have faith that you will do well. Choose Alan or Deric");
      }
    if(($text=~/Alan/i) && ($class eq "Cleric")){
      quest::say("I shall summon them for you");
      quest::spawn2(71080,0,0,660.7,1361.6,-766.9,193.2);
      quest::depop();
      }
    if(($text=~/Deric/i) && ($class eq "Cleric")){
      quest::say("I shall summon them for you");
      quest::spawn2(71083,0,0,660.7,1338.0,-766.9,193.2);
      quest::depop();
      }
}
#END of FILE Zone:airplane  ID:2851 -- Josin_Faithbringer 



