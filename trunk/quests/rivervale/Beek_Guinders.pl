#############
#Quest Name:Cleric Supplies
#Author:Shaznito
#NPCs Involved:Beek Guinders
#Items Involved:Berries, Black Wolf Skin, Ruined Wolf Pelt
#################


sub EVENT_SAY { 
	if($text=~/hail/i) {
quest::emote("waves enthusiastically and says, Hay, ho, there, young $race!  I'd love to yak it up with you but I'm a bit busy at the moment, trying to find some [help].");
}
        if($text=~/help/i) {
quest::say("Well, we're experimenting with some tanning methods but we're running low on supplies. We need to find someone to go out and [gather some things]. Seems no one wants to do an honest day's work any more. I'd do it myself but, errrr, my, uhhh, foot hair has been hurting lately... yes, that's it.");
}
	if($text=~/gather some things/i){
quest::say("Ahhh, excellent! Okay, first, we'll need a couple of wolf pelts. They don't have to be perfect, completely ruined would work just fine, hehe. I'll also need a black wolf skin and a handful of berries. The berries you should be able to find out in the Thicket. I hear they grow in a small canyon near the lone tower. Hurry, hurry!");
 }
}

sub EVENT_ITEM {
        if (plugin::check_handin(\%itemcount, 18731 => 1)) {
quest::say("Aye. Welcome. my fur-footed friend. My name is Beek Guinders. and I am guild master here at the Chapel of Mischief. Here is our guild tunic. Wear it with pride, as it will set you apart from the crowd.");
quest::summonitem(13538);
quest::exp(100);
}
	elsif (plugin::check_handin(\%itemcount, 13045 => 1, 13782 => 2, 13758 => 1)) {
quest::say("Hey, great! You found the materials! We'll get to work right away. If you find any more, please come by again. Here's a little something for your troubles, friend.");
		quest::summonitem(quest::ChooseRandom(15014,15201,15207,15208,16303));
		quest::faction(259,10);
		quest::faction(208,10);
		quest::faction(133,10);
		quest::exp(50);
		quest::givecash(23,13,0,0);
	} else {
quest::say("Whoooops! I'll need the two ruined wolf pelts along with the berries and black wolf skin before I can reward you, $name. Don't dawdle.");
		plugin::return_items(\%itemcount);
                plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
 }
}

#END of FILE Zone:rivervale  ID:19111 -- Beek_Guinders
