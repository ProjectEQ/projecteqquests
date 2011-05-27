sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name.  What brings you to the Tin Soldier?  We have the finest in previously owned weapons and armor.  Feel free to browse.");
 }
 if ($text=~/tax collection/i) {
   quest::say("Here are the taxes, $name. Boy, you call the guards and they take their time to show up but be a few days late on your taxes and they send the goons after you. Sheesh!");
   quest::faction( 217, -10);
   quest::summonitem(13171);
 }
}
#END of FILE Zone:qeynos  ID:1121 -- Mar_Sedder 

