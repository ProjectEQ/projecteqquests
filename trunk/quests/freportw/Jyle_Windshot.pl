############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 6,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Jyle_Windshot
# ID: 9008
# TYPE: Ranger
# RACE: Human
# LEVEL: 30
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Small Lantern ID-13003
# Wooden Shards ID-13824
# A Wooden Heart ID-12334
#
# *** QUESTS INVOLVED IN ***
#
#1 - Trueshot Longbow
#2 - Rain Caller
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Ranger
#2 - Ranger
#
############################################

sub EVENT_SAY
{ 
 if($text=~/Hail/i)
 {
 quest::say('Greeting friend!! Nice to meet you. I see you enjoy barging into other peoples rooms. No problem. I enjoy the company. What are you looking for?');
 }

 if($text =~ /treant wood/i && $class == 'Ranger')
 {
 quest::say("You are a new courier from the Faydarks. I am sorry I did not stay closer to the docks. I hear that part of Freeport is dangerous and is filled with many rogues. I shall require a new Small Lantern in trade for the Treant Wood.");
 }
}

sub EVENT_ITEM
{
 # Small Lantern ID-13003
 if($itemcount{13003} >= 1)
        {
	quest::say("Thanks, friend. I have run a long way to get here in time. Mostly at night. I lost my lantern in a card game in Highkeep.");
	quest::ding();
	# 1/10 chance of wooden heart
	# Wooden Shards ID-13824 , A Wooden Heart ID-12334
	quest::summonitem(quest::ChooseRandom(13824, 13824, 13824, 13824, 13824, 13824, 13824, 13824, 12334));
	# Faydark's Champions Faction
	quest::faction("99","1");
        # King Tearis Thex Faction
	quest::faction("178","1");
	# Clerics of Tunare Faction
	quest::faction("43","1");
	# Soldiers of Tunare Faction
	quest::faction("304","1");
	# Crushbone Orcs Faction
	quest::faction("63","-1");
	}
	else
        {
		quest::say("You have no business giving me this junk.");
		quest::summonitem($item1) if($item1);
		quest::summonitem($item2) if($item2);
		quest::summonitem($item3) if($item3);
		quest::summonitem($item4) if($item4);
		return;
	   }
}

#END of FILE Zone:freportw  ID:9008 -- Jyle_Windshot

