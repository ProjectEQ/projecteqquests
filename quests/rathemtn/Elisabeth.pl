#########################################################
#  NPC:  Elisabeth
#  Zone:  Rathe Mountains
#  Quest:  Greaves of Ro
#  Author:  Unknown
#  Updated:  Andrew80k
#########################################################
sub EVENT_SAY { 
    if($text=~/Hail/i){
        quest::say("Very good to meet you. $name.  I am the keeper of the [Greaves of Ro].  Please feel free to rest and recuperate here.  We shall see that you are safe from the evils of the Rathe Mountains.");
    }
    if($text=~/greaves of ro/i){
       if ($faction <= 4) {
           quest::say("Go to the countryside of Freeport.  There, you shall seek out any nightfall giants .  They have terrorized the countryside for too long.  They have protection from common weapons.  Rely on magic.  I failed in tracking them down.  You shall succeed and when return any single head to me. you shall be awarded the mold for the greaves."); 
       } else {
           quest::say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
       }
    }
}
sub EVENT_ITEM {
   if ($faction <= 4) {
      if (plugin::check_handin(\%itemcount,12313=>1)) {
         quest::say("You have done well.  These giants shall soon be purged from the Commonlands and the inns will be filled once again.  Here is the mold for the Ro Greaves.  For the final component, go and ask Thomas of [Lord Searfire].");
         quest::summonitem(12303); #Mold of Ro Greaves
      }
   }
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50109 -- Elisabeth