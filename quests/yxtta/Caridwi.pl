## NPC not in DB when created
# Cragbeast Queen: Visage of the Brute
# created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Greetings $race, it is not often that someone visits me here. In fact, I can't remember the last time I saw another person. Ever since that day in the Coliseum my life has been so strange. Time has all but lost its meaning, and I see the most unusual things. Have you come to hear my [story], or would you like me to explain what the world looks like [through my eyes]?"); 
}

if($text=~/through your eyes/i){

quest::say("It is difficult to describe. Things that used to be clear to me are now non-distinct, and . . . I see visions . . . that are inexplicably real but defy all common logic. For instance, I see you carry a trophy from an epic battle; a misshapen lump of flesh that you aquired from a tremendous foe. You do not understand. Please allow me to borrow it for a moment so I can show you."); 
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 52113 => 1)) { # Misshapen Cragbeast Flesh
quest::emote("Caridwi places her hand over your eyes and forces you to examine the Cragbeast Queen's Flesh through her transparent fingers. The skin takes the shape of a hideous mask.");
quest::say("Do you see now, $name? Do you understand?"); 
quest::summonitem(52120); # Visage of the Brute
}

else{
     quest::say("I have no use for this.");    
	 plugin::return_items(\%itemcount);
	 }

}
}
#END of FILE zone:Yxtta ID: -- Caridwi.pl

