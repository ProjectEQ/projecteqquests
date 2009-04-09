sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. there. Barbarian. How goes it? Much fairer than I. I'll wager. Me troops can't hit the broad side of a mammoth with their crossbows. Oh. by the way. I'm Lieutenant Ulfur. Commander of the 23rd Coldain crossbow regiment. if ye kin call it a regiment.");
quest::say("Hail. there. %#1472. How goes it? Much fairer than I. I'll wager. Me troops can't hit the broad side of a mammoth with their crossbows. Oh. by the way. I'm Lieutenant Ulfur. Commander of the 23rd Coldain crossbow regiment. if ye kin call it a regiment.");
}
if($text=~/what regiment/i){
quest::say("Yes. we assist our troops in military endeavors. Although we're almost more harm than good. All me troops have soldier envy. they want in the middle of the rumble. face ta face with their enemies stompin them into the ground. That's all well and good but a contingent of crossbowmen can be the difference in winning or losing. Do you favor ranged weapons. $name?");
}
if($text=~/yes i favor ranged weapons/i){
quest::say("Ahh. well. maybe sometime I'll let ya try out one of our famed crossbows. Maybe even give ye one if ye prove yerself to the Coldain cause. Unfortunately. though. we can spare no crossbows now.  Perhaps in the future we will be able to."); }
}
#END of FILE Zone:thurgadina  ID:115103 -- Lieutenant_Ulfur 

