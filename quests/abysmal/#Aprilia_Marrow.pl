# The Fourteen Great Adventures
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

	quest::emote("focuses her attention on $name.") ;      
	quest::say("groans softly as she turns to face you. 'Please leave me be. My darling Prathun has yet to return to me and each day weakens my resolve. I know in my heart he is out there somewhere, but with no word since the day he left, I fear that my heart may be wrong. If only I had something that would let me know what has happened to him.") ;      
	}
}


sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 67617 => 1)) { # Prathun's Writings

	quest::emote("takes the dusty tome from $name's hands.") ;  
	quest::say("I thought I would never have to face this reality, but here it is -- the proof I asked for. While these pages detail the adventures of my love, it is you who are the great one. While I shall forever be pained by this, I am in your debt for helping me. Please leave me now and find those others who suffer the continued disappearance of their loved ones. If you have already helped everyone, please tell De'van that your task is complete and he will reward you.") ;      
quest::setglobal("writingsf", 1, 5, "F"); 
} 

else {    
	quest::say("I don't need this.");   
	if($item1 > 0){quest::summonitem("$item1");}    
	if($item2 > 0){quest::summonitem("$item2");}    
	if($item3 > 0){quest::summonitem("$item3");}    
	if($item4 > 0){quest::summonitem("$item4");}   
	if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) 
		{quest::givecash($copper, $silver, $gold, $platinum);}   }}



# END of FILE Zone:abysmal  ID:279034 -- #Aprilia_Marrow.pl

