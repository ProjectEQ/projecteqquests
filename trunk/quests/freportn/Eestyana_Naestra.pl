sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18822 =>1 )) {
    quest::say("Thanks for your hard work.");
    quest::givecash(7,0,1,0);
    quest::summonitem(14003);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8045 -- Eestyana_Naestra 

