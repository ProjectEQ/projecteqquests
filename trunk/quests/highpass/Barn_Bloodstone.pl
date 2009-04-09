sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You seem a little out of place here. You should go back to the nice little village you came from. This place will eat you alive. The [Golden Rooster] is no place for you.");
}
if($text=~/what Blackburrow Stout/i){
quest::say("Blackburrow Stout is the finest drink available. It is the nectar of the gods. Well.. nectar of the gnolls at least. I can't wait until they hold another drink special in the Rooster. When I hear that. I am there!");
}
if($text=~/what Golden rooster/i){
quest::say("The Golden Rooster only happens to be the finest gambling house in Highpass. It is also the only place in these parts that serves [Blackburrow Stout]."); }
}
#END of FILE Zone:highpass  ID:5021 -- Barn_Bloodstone 

