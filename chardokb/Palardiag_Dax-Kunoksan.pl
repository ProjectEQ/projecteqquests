#Palardiag_Dax-Kunoksan.pl
#Forge Shai`Din Ceremonial Blade
# items: 61182, 61181, 61183, 61184, 61194, 61196, 61193, 61195

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("What business could you possibly have with me mortal? Speak quickly before I have your tongue ripped out. I have a very important ceremony to prepare for.");
	}
	
	if ($text=~/ceremony/i) {
		quest::say("The time for the tainting of the blade draws near. All new initiates of the Shai`din must take place in this. If you do not [pledge allegiance to Shai`din] then I would suggest leaving now while you still have your head.");
	}
	
	if ($text=~/pledge allegiance/i) {
		quest::say("You support our cause and rituals do you $name? I cannot say I am not surprised, I do not usually come across a mortal with the same intentions as yourself. As a matter of fact this is the first time. Regardless, I think that you wish to assist us and I am willing to give you a chance. Do you [agree to collect the necessary items] to forge your own Shai`din ceremonial blade?");
	}
	
	if ($text=~/agree to collect the necessary items/i) {
		quest::say("Very well $name, go out and seek out the four pieces of the Shai`Din blade amongst these halls. I am sure you will know what they are once you have come across them.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 61182 => 1, 61181 => 1, 61183 => 1, 61184 => 1)) {#Shai`Din Longsword Left Hilt , Shai`Din Longsword Right Hilt , Dulled Shai`Din Longsword Blade, Runed Shai`Din Blade Edge
		quest::say("All existing councilmen must be the third generation in their bloodline to be eligible for entrance into the di`zok hierarchy. Seek out the blood of these eight councilmen to complete your task. when you have obtained a blood sample of all eight combine them in the alchemy sack that I have provided you with to creat the tanning agent needed for your ceremonial blade. Return the tanning agent to me along with your blade and I shall judge you at that time.");
		quest::summonitem(61194);#Shai`Din Ceremonial Blade 
		quest::summonitem(61196);#Shai`Din Medicine Bag

	}
	
	if(plugin::check_handin(\%itemcount, 61193 => 1)) {#Blood of the Royals 
		quest::say("I do not believe your service to my clan $name, please take this as a token of my appreciation. You have done well.");
		quest::summonitem(61195);#Flowing Cloak of the Shai`Din 
	}
   
  plugin::return_items(\%itemcount);
}#END of FILE Zone:chardokb ID:277081 --Palardiag_Dax-Kunoksan.pl
