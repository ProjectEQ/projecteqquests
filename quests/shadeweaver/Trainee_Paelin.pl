sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is an honor to meet a fellow hunter. I am training to learn how to hunt down the [saurek] that roam the thicket. It is our duty as taruun to provide food for our kin. I plan on claiming captain Tarief's [reward].");
}
if($text=~/what saurek?/i){
quest::say("The Saurek hoppers are far more aggressive than the needle clawed hoppers. We must hunt them down and kill them lest they attack our families and traders that wander through these thickets. They have many uses to us as well. Their meat gives us food to eat, and their hides make strong protective armor.");
}
if($text=~/what reward?/i){
quest::say("Captain Tarief has offered to reward those that slay four of the saurek hoppers. You must return four of their scales to him as proof of your deeds to claim the reward. I hope to bring honor to my family by returning home with such a trophy."); }
}
#END of FILE Zone:shadeweaver  ID:165152 -- Trainee_Paelin 

