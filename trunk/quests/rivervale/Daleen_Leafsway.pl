sub EVENT_SPAWN {
  quest::settimer("blurt",600);
}
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name!  Welcome to Tagglefoot's Farm.  We grow nothing but the finest vegetables in our field.  We even manage to harvest the mystical jumjum stalk in our fields.  Karana has blessed us indeed."); 
}
if(($faction == 1) && $text=~/starving/i){
quest::say("Deputy Eigon! I forgot! I was supposed to bring him some turnips to eat while he is on patrol! Oh... He asked so nicely, too. I feel bad that I forgot. If only someone would take these [turnips] to the Deputy..");
}
if(($faction == 1) && $text=~/turnips/i){
quest::say("Oh, thank you so much! You can keep any payment he gives you. Be sure to tell him I'm sorry.");
quest::summonitem(16165);
}
  }
sub EVENT_TIMER {
 if ($timer eq "blurt") {
  quest::say("Oh Dear.. I can't believe I forgot.. He must be [starving]!");
 }
}
#END of FILE Zone:rivervale  ID:19082 -- Daleen_Leafsway 

