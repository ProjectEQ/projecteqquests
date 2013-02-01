############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Xelha_Nevagon
# ID: 10093
# TYPE: Necromancer Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Xelha's Spiderling Silk
# Xelha's Fire Beetle Eye
# Xelha's Bone Chips
# Xelha's Cyclops Eye

sub EVENT_SAY {

if($text=~/Hail/i) {

	quest::say("A new recruit to our cause.  Just what I have been waiting for!  How would you like to serve the great Xelha Nevagon?  I need an apprentice necromancer to [assist the great Xelha].");

}

if($text=~/assist the great xelha/i) {

	quest::say("Fantastic.  Stick with me and you shall ascend in our ranks quickly.  I am in need of some components for new spells.  Will you collect them for me?  I shall need four each of the following - fire beetle eyes. bone chips and spiderling silk.  Fetch these items for me at once. Well..? Did not you hear the great Xelha? Begone!");

	}

}

sub EVENT_ITEM {

   if($itemcount{13099} == 4){ # Spiderling Silk

   quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");

	quest::ding();
	quest::exp("60");
	quest::givecash("0","4","0","0");
	quest::summonitem(12247); # Xelha's Sparkler
	quest::faction("86","1"); # Dismal Rage
	quest::faction("235","1"); # Opal Dark Briar
	quest::faction("184","-1"); # Knights of Truth

	}
   
   if($itemcount{13927} == 1) { # Cyclops Eye

   quest::say("A cyclops eye!! You are stronger than I believed. You will rise in the ranks of the Dismal Rage quickly with acts such as this!! I am most appreciative! Here, take this. It was lying around my shelves, just gettingg all dusty. I hope you can use it. And watch yourself in your journeys, the aura of your faith in Innoruuk surrounds you like a shroud. Our enemies will surely see you for what you are.");

	quest::ding();
	quest::exp("1000");
   	quest::summonitem(15331); # Spell: Reclaim Energy
	quest::faction("86","1"); # Dismal Rage
	quest::faction("235","1"); # Opal Dark Briar
	quest::faction("184","-1"); # Knights of Truth

	}


   if($itemcount{10307} == 4) { # Fire Beetle Eye

	quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");

	quest::ding();
	quest::exp("40");
	quest::summonitem(15338); # Spell: Cavorting Bones
	quest::givecash("8","1","0","0");
	quest::faction("86","1"); # Dismal Rage
	quest::faction("235","1"); # Opal Dark Briar
	quest::faction("184","-1"); # Knights of Truth

	}

   if($itemcount{13073} == 4) { # Bone Chips

   quest::say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");

	quest::ding();
	quest::exp("25");
	quest::givecash("4","0","0","0");
	quest::faction("86","1"); # Dismal Rage
	quest::faction("235","1"); # Opal Dark Briar
	quest::faction("184","-1"); # Knights of Truth

   }



}


#END of FILE Zone:freporte  ID:10093 -- Xelha_Nevagon.pl


