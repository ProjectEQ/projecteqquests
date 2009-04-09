sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Have you noticed the vicious Saurek [Shredders] out in the thicket? I wouldn't want to hunt one of those nasty things.");
}
if($text=~/what shredders?/i){
quest::say("The shredder has been known tear young hunters apart in mere seconds. I would stay far away from those things if I were you. Tarief has offered a reward for any that bring him four of their scales, but I just don't think it would be worth facing such a beast in battle. The meat from the smaller ones are just as good to eat if you want my opinion."); }
}
#END of FILE Zone:shadeweaver  ID:165150 -- Trainee_Naria 

