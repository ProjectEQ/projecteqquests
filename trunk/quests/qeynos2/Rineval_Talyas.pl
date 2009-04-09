sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name."); 
 }
}
sub EVENT_ITEM {#no handin text available
  if ((plugin::check_handin(\%itemcount, 19071 =>1, 19070 => 1 )) && ($platinum >=1000)) {
    quest::summonitem(18302);
  
 }
}
#END of FILE Zone:qeynos2  ID:2086 -- Rineval_Talyas 

