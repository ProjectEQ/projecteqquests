############################################
# ZONE: West Freeport (freportw)
# LAST EDIT DATE: November 18,2011
# DEVELOPER: MWMDRAGON
# REVISED BY: robregen
############################################


sub EVENT_SAY{
	if($text =~ /Hail/i) {
		quest::say("I am Toala Nehron. You must be another young warrior aspiring to join the ranks of the Steel Warriors. We welcome all who would try. When you [have time] there is a friend of mine I would like you to check on.");
	}
	if($text =~ /opal/i) {
		quest::say("Opal Darkbriar is a little plague rat.  She has used her knowledge of arcane arts to charm [Cain Darkmoore].  I know that is what happened.  Why else would he be in love with her?  He is a mighty warrior and she is nothing more than a sickly little librarian for the Academy of Arcane Science.  He must truly yearn for a bold hearted female warrior such as myself.  Not that I care, of course.");
	}
	if($text =~ /cain darkmoore/i) {
		quest::say("Cain Darkmoore is only the most handsome of warriors!  He is also the strongest and most bold.  He has slain the mightiest of fiends.  He is truly the manliest man around.  It is no wonder he is the guildmaster of the Steel Warriors.");
	}
	if(($text =~ /have time/i) && ($faction < 5)) {
		quest::say("I have A friend by the name of [Lenka Stoutheart]. She reported to me that her ship was broken into and someone stole a pouch of hers. Could you go look into it for me? Just tell her Toala sent you. Oh, and pay no mind to the walking mountain by her. That will only be Bronto, her navigator. Thanks friend.");
	}
	if(($text =~ /lenka stoutheart/i) && ($faction < 5)) {
		quest::say("Lenka Stoutheart is an old friend of mine. I met her in my younger days when the Steel Warriors sent me to train in the ways of the Wolves of the North, the barbarian warriors of Halas. She is now an adventurer of great renown. She travels from continent to continent aboard her ship,the Blue Beast, her ship.");
	}
	if((($text =~ /have time/i) || ($text =~ /lenka stoutheart/i)) && ($faction == 5)) {
		quest::say("The Steel Warriors have no cause to dislike you, but you have yet to prove your worth to this guild.");
	}
	if((($text =~ /have time/i) || ($text =~ /lenka stoutheart/i)) && ($faction > 5)) {
		quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
	}
}

sub EVENT_ITEM {
	if ($faction < 5) {
		if(plugin::check_handin(\%itemcount, 18814 => 1)) {# A Sealed Letter ID-18814 filename "NERtoShintl"
			quest::ding();
			quest::say("Why, that little trollop! What is she up to? Cain will never believe this! She must be in league with some faction of the dark elves, but why? Neither the Academy of Arcane Science nor Cain will believe this note. I will see what I can do. As for you, I command you to kill this Shintl and her dark elf courier Hollish!! Put their heads into this box and combine them. We shall cut the link. Bring me thier heads.");
			quest::summonitem(17971);# Toala's Box for heads ID-17971
			quest::exp(100);
		}
		if(plugin::check_handin(\%itemcount, 12246 => 1)) {## # Box with Two Heads ID- 12246
			quest::ding();
			quest::say("Good work!! We will soon catch Opal. I have started to formulate a plan to stop her. When I complete it, I shall notify you. Here. Take this small reward. I am sure killing Shintl was no trouble. She was just a halfling.");
			quest::exp(100);
			quest::givecash(0,10,2,0);
			quest::faction(311,1);## # Steel Warriors Faction ID-311
			quest::faction(135,1);## # Guards of Qeynos Faction ID-135
			quest::faction(184,1);## # Knights of Truth Faction ID-184
			quest::faction(53,-1);##  # Corrupt Qeynos Guards Faction ID-53
			quest::faction(105,-1);## # Freeport Militia Faction ID-105
		}
		if(plugin::check_handin(\%itemcount, 13814 => 1)) {# L.S. Pouch ID-13814
			quest::ding();
			quest::say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk. ");
			quest::exp(200);
			quest::summonitem(quest::ChooseRandom(13922, 13923)); # Snapped Pole ID-13922 or Moggok's Right Eye ID-13923
			quest::givecash(0,2,0,0);
			quest::faction(361,2);# Faction Wolves of the North ID-361
			quest::faction(294,2); # Faction Shamen of Justice ID-294
			quest::faction(213,2);# Faction Merchants of Halas ID-213
			quest::faction(311,2);# Faction Steel Warriors ID-311
			quest::faction(275,-2);# Faction Rogues of the White Rose ID-275
		}
	}
	if ($faction == 5) {
		if(plugin::check_handin(\%itemcount, 18814 => 1)) {# A Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		}
	}
	if ($faction > 5) {
		if(plugin::check_handin(\%itemcount, 18814 => 1)) {# A Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			quest::say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		}
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9091 -- Toala_Nehron
