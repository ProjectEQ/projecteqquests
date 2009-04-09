sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met $name. Pay close attention to Captain Tarief's words of advice. It takes a skillful hunter to kill a Saurek [Darkclaw]. His advice could mean the difference between life and death.");
}
if($text=~/what darkclaw?/i){
quest::say("The darkclaws are nasty beasts. Their claws are much thicker than the smaller saureks. Tarief has offered a reward to any that return with four of their scales to him. Don't get any ideas now. That reward is mine. I assure you."); }
}
#END of FILE Zone:shadeweaver  ID:165151 -- Trainee_Jonkar 

