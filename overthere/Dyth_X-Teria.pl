#Dyth_X-Teria.pl
#Brain Bite (The Overthere)
# items: 10027, 10028, 10021, 12962, 12963, 12964, 12965, 12966, 12967, 12968

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("appears to be the local master of wizardry. His garb clearly comes from the dark city of Neriak as it bears a black sun emblem.");
		quest::say("Speak!! I am dispatched from Neriak to this land by order of the king. I shall research [new spells] and aid the adventuring wizards. My knowledge of wizardry is offered to all in hopes of gaining information about Kunark.");
	}
	
	if ($text=~/new spells/i) {
		quest::say("Within this lost land could lie the knowledge of extinct civilizations. I am ordered to seek out this knowledge for the empire of Neriak. So far, all I have discovered is a way to create a spell of my own design. I call it [Brain Bite].");
	}
	
	if ($text=~/brain bite/i) {
		quest::say("If you wish to own a copy of MY spell, Brain Bite, I would be glad to give you one. All I ask is that you [gather a few souls] for me.");
	}
	
	if ($text=~/gather a few souls/i) {
		quest::emote("reveals three ornate bottles.");
		quest::say("While I finished my research on Brain Bite, I encountered three [interlopers] who wished to steal my spell. I had the dragoon garrison track them down and dispatch them. Unfortunately, I forgot to instruct them to trap their souls with these bottles. Do you want to [take the bottles] and finish the job?");
	}
	
	if ($text=~/interlopers/i) {
		quest::say("The garrison report was sloppy, to say the least. They informed me that Hampton was slain near some ruins within a jungle infested by raptors. Mardon was slain in an ancient city found deep in a jungle. Ryla was killed in a hidden fortress guarded by fierce armored wolves who walked on their hind legs.");
	}
	
	if ($text=~/take the bottles/i) {
		quest::say("The bottles also require a gem. You will fetch me the three gems and I will prepare the bottles and give them to you to finish the job. I need an onyx, a peridot and a star rose quartz.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 10027 => 1, 10028 => 1, 10021 => 1)){#Onyx, Peridot, Star Rose Quartz
		quest::say("This bottle is for the one called Hampton. If you look well, you can see his name.");
		quest::say("This bottle is for Mardon. You may be able to identify his name upon it.");
		quest::say("Identify this when the time comes. It is Ryla's prison.");
		quest::summonitem(12962);# Ornate Bottle, Hampton
		quest::summonitem(12963);# Ornate Bottle, Mardon
		quest::summonitem(12964);# Ornate Bottle, Ryla
	}
	
	elsif(plugin::check_handin(\%itemcount, 12965 => 1, 12966 => 1, 12967 => 1)) {# Bottle of Swirling Smoke (Hampton), Bottle of Swirling Smoke (Mardon), Bottle of Swirling Smoke (Ryla)
		quest::emote("empties the bottle's smoke into a very large glass urn filled with similar swirling smoke. You think you hear the cries of a thousand tortured souls. He then closes the urn and hands you a scroll.");
		quest::say("Here is your reward. It will blast a foe's brain and hopefully, they may forget their hatred.");
		quest::summonitem(12968);#Scroll of Brain Bite
		quest::faction(318, 30);#Add some Venril Sathir faction
		quest::giveexp(3322176);#3% level 45 xp,
	}
  	plugin::return_items(\%itemcount);
}#END of FILE Zone:overthere  ID:93116--Dyth_X-Teria.pl
