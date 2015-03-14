#!/usr/bin/perl

# START of FILE Zone:kithicor  ID:20095 -- Gandari

sub EVENT_SAY { 
    if($text=~/hail/i) {
		quest::say("Most call me Gandari the Terse.  You here for [ivy armor]?");
    } 
	if($text=~/ivy armor/i) {
		quest::say("I reward brave rangers with ivy etched armor - [Helm]s. [Tunic]s. [Sleeves] and [Bracers]. [Interested]?");
    } 
	if($text=~/bracers/i) {
		quest::say("I do not haggle, I do not bargain. The Bottom of the Rune of Ivy from the plains of Everfrost, a Watery Ring from the Cauldron of Tears and a Fire Emerald to warm my heart. Bring these to me and you shall earn your reward.");
    } 
	if($text=~/helm/i) {
		quest::say("I do not haggle, I do not bargain. The Top of the Rune of Ivy from the Castle Mistmoore, a Cyclops Charm from Tarskuk and a Sapphire of Sky Blue. Bring these to me and you shall earn your reward.");
    } 
	if($text=~/sleeve/i) {
		quest::say("I do not haggle, I do not bargain. A Heart of Fire from the Caverns of Solusek, the Left side of the Rune of Ivy from the Griffon Grimfeather and two Star Rubies of sparkling hue. Bring these to me and you shall earn your reward.");
    } 
	if($text=~/tunic/i) {
		quest::say("I do not haggle, I do not bargain. The Skull of Meldrath, the Right side of the Rune of Ivy from the Thistle Brownie and two Rubies of Fiery Red. Bring these to me and you shall earn your reward.");
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 10569 => 1, 10546 => 1, 10033 => 1)) { # bracers
		quest::summonitem("3189");
		quest::ding();
		quest::say("Well done. May Karana bless your soul.");
		quest::faction(182,+30); # kithicor residence
		quest::faction(265,+30); # protectors of the pine
		quest::faction(159,+30); # jaggedpine treefolk
		quest::faction(347,-60); # unkempt druids
		quest::exp(10000);		
    } 
	if(plugin::check_handin(\%itemcount, 10566 => 1, 10570 => 1, 10034 => 1)) { # helm
		quest::summonitem("3181");
		quest::ding();
		quest::say("Well done. May Karana bless your soul.");
		quest::faction(182,+30); # kithicor residence
		quest::faction(265,+30); # protectors of the pine
		quest::faction(159,+30); # jaggedpine treefolk
		quest::faction(347,-60); # unkempt druids
		quest::exp(10000);
    } 
	if(plugin::check_handin(\%itemcount, 10548 => 1, 10568 => 1, 10032 => 2)) { # sleeves
		quest::summonitem("3188");
		quest::ding();
		quest::say("Well done. May Karana bless your soul.");
		quest::faction(182,+30); # kithicor residence
		quest::faction(265,+30); # protectors of the pine
		quest::faction(159,+30); # jaggedpine treefolk
		quest::faction(347,-60); # unkempt druids
		quest::exp(10000);		
    }
	if(plugin::check_handin(\%itemcount, 10571 => 1, 10567 => 1, 10035 => 2)) { # tunic
		quest::summonitem("3184");
		quest::ding();
		quest::say("Well done. May Karana bless your soul.");
		quest::faction(182,+30); # kithicor residence
		quest::faction(265,+30); # protectors of the pine
		quest::faction(159,+30); # jaggedpine treefolk
		quest::faction(347,-60); # unkempt druids
		quest::exp(10000);
    } 
	plugin::return_items(\%itemcount);
}

# END of FILE Zone:kithicor  ID:20095 -- Gandari

