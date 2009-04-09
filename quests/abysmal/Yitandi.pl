# Orgmar's Haunt
# Created by Gonner



sub EVENT_SAY {
if($text=~/hail/i){
	quest::emote("moans in a sad, wispy voice, Death. coming for all."); 
	}
}

sub EVENT_SIGNAL {
        quest::say("moans pitifully, Satchel. Sewers."); 
}

sub EVENT_ITEM {
quest::say("I don't need this.");   
if($item1 > 0){
quest::summonitem("$item1");
}    
if($item2 > 0){
quest::summonitem("$item2");
}    
if($item3 > 0){
quest::summonitem("$item3");
}    
if($item4 > 0){
quest::summonitem("$item4");
}   
if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0){
quest::givecash($copper, $silver, $gold, $platinum);
}   
 }

# END of FILE Zone:abysmal  ID:279220 -- Yitandi.pl