## Frenway_Marthank.pl
##
## Quests: The Bayle List
##		   Bonethunder Staff	- Dialog is made up
## edited by mrhodes

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings. stranger. Please excuse my melancholy state.  I have had some [bad news] that has brought me great sorrow.");
	}
	
	if($text=~/bayle list/i)
	{
		quest::emote("begins to tear up as he starts to reply...");
		quest::say("My son was carrying that list when he ventured deep within the Surefall caves.  The great grizzly, Mammoth must have been threatened by his pressence and attacked him.  I'm afraid there was nothing left by the time the rangers got to him.  As a druid here in the glade I cannot seek vengence on this bear.");
		quest::emote("has an idea...");
		quest::say("Perhaps if you were to help me I may be able to prepare this list you seek.  bring me proof that you have taken care of Mammoth and anything else you may find and I will help you.");
	}
	
	if($text=~/bad news/i){
		quest::say("My youngest son was devoured by a grizzly bear while playing near the caves. It was an unfortunate accident. The great bear was just protecting its territory. Now. could you please just leave me be? <sniff>"); 
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18809 => 1) && plugin::check_handin(\%itemcount, 13912 => 1))
	{
		quest::say("Oh, this is such a relief to know that Mammoth will no longer hurt anyone. Here, please take this for your troubles. I do not need to keep this list.  Thank you $name");
		quest::summonitem(18809);			
	} else {
		quest::say("I have no use for this.");
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("You have much to learn.");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}


#END of FILE Zone:qrg  ID:1454 -- Frenway_Marthank 
