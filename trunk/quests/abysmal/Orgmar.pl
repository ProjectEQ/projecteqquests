# Orgmar's Haunt
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

	quest::say("You have got ta help me, lad! That ghost there in the corner won't [leave] me alone! Where ever I go he follows me!");
	}

if($text=~/leave/i){

	quest::say("I think I took somethin' o' his and he wants it back. Ya got ta [help] me get rid of this ghost, lad! I taint slept in over a fortnight.");
	quest::signal(279220);
	
	
	}

if($text=~/help/i){

	quest::say("I went explorin' one day in some sewers in the new land. I came across a rottin' satchel on the ground. Inside were some strange gems. I couldn't resist. I took the satchel back here to me room. A day or two later, this ghost appeared. Scared me out o' me chainmail it did. It kept moanin' about wantin' its satchel back. I didn't know what ta do so I went back to the sewers and chucked it into the water. Thought it might appease it or somethin'. That didn't work though and the darn ghost still comes back. Please find the satchel and bring it back ere. Maybe if I can give the satchel to the ghost, it will make him go away for good!"); 
	}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55621 => 1)) { # A rotting Satchel
	quest::say("Ye done a good deed this day, me friend. Not that I am scared of ghosts or anything. Take this as your reward. I found it on one of me adventures in the new land. I know it be a bit gruesome lookin', but it has some magic power. Now to see if I can get rid o' this ghost. Farewell.");
	quest::summonitem(55622); 
	quest::exp(50000);
	}
	
else {    
quest::say("I don't need this.");   
if($item1 > 0){quest::summonitem("$item1");}    
if($item2 > 0){quest::summonitem("$item2");}    
if($item3 > 0){quest::summonitem("$item3");}    
if($item4 > 0){quest::summonitem("$item4");}   
if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {quest::givecash($copper, $silver, $gold, $platinum);}   
}
}

# END of FILE Zone:abysmal  ID:279221 -- Orgmar.pl