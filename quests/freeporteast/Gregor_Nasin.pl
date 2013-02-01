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
# NAME: Gregor_Nasin
# ID: 10064
# TYPE: Shopkeeper
# RACE: Freeport Guards
# LEVEL: 19
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Erud's Tonic ID-13122
# Koalindl Fish ID-13383
# Honey Jum ID-13952
# Kiola Nut ID-13340
# Barkeep Compendium ID-13379
#
# *** QUESTS INVOLVED IN ***
#
#1 - Barkeep Compendium
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Enchanter
#
# *** NPC NOTES ***
#
#
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Sit down and name your poison!  I know we are lacking in originality. but I intend to create some [exotic drinks].");
}

if($text=~/exotic drinks/i)
{
quest::say("Interested in exotic drinks. are we?  I am attempting to create some of these drinks I read about in this book I found. It was called the [Barkeep's Compendium].  I will first need to get my hands on a few [exotic ingredients].");
}

if($text=~/Barkeep's Compendium/i)
{
quest::say("I found the book amongst some garbage littering the ground in Freeport East.  It appears to have been created by an ogre named [Clurg].  I am sure he wants it returned. but I will never part with it.  That is... unless I get a few [exotic ingredients] I need to experiment with.");
}

if($text=~/exotic ingredients/i)
{
quest::say("I desire a [kiola nut]. [Erud's Tonic]. [honey jum] and a [Koalindl fish].  If I could get those. I would no longer need to hold on to the [Barkeep's Compendium].  Whoever returned the ingredients to me could have it!!");
}

if($text=~/kiola nut/i)
{
quest::say("The kiola nut usually grows only in humid territories.  I hear there are some such lands between Qeynos and Erudin.  Some also have been found on the islands of the Ocean of Tears.");
}

if($text=~/Erud's Tonic/i)
{
quest::say("Now that is an ingredient that is hard to obtain.  Found only in the city of Erudin. it is a crime for anyone to attempt to smuggle it out of the city.  If caught. a horrid death is assured. though I hear there is a frequent customer of the taverns of Qeynos who has a way to obtain the forbidden liquid.");
}

if($text=~/honey jum/i)
{
quest::say("Honey jum can be found in the halfling community of Rivervale.  I hear it is used in many of their potions.  I am sure it can be purchased somewhere in Rivervale.  If it is not on the shelf it is surely known by the shopkeeper.");
}

if($text=~/koalindl fish/i)
{
quest::say("Some rare drinks call for ground up fish. I intend to use the Koalindl fish of Qeynos.  It is said to be magical in nature.  The problem with obtaining them is that you must get them from Jahnda's Pool near the Temple of Life and I hear that the members protect these fish with great ferocity.");
}

if($text=~/Clurg/i)
{
quest::say("I do not know. Ask an ogre. Maybe they have heard of him.");
}

}

sub EVENT_ITEM
{
   # Erud's Tonic ID-13118 - Koalindl Fish ID-13383 - Honey Jum ID-13952 - Kiola Nut ID-13340
   if(plugin::check_handin(\%itemcount, 13118 => 1, 13383 => 1, 13952 => 1, 13340 => 1))
   {
   quest::say("Now I have every ingredient mentioned in the Barkeep Compendium. Here. You take it. <..click!.> Whoops!! I just closed it. It's magically sealed, I never closed it before. It's useless to you. I have no need for it any longer. Maybe you can return it to [Clurg] for some type of reward.");

   quest::ding();
   quest::exp("200");
   # Barkeep Compendium ID-13379
   quest::summonitem("13379");
   quest::givecash("0","0","0","2");

   # Coalition of Tradefolk Underground Faction
   quest::faction("48","1");
   # Coalition of Trade Folk Faction
   quest::faction("47","1");
   # Carson McCabe Faction
   quest::faction("31","1");
   # Corrupt Qeynos Guards Faction
   quest::faction("53","1");
   # Freeport Militia Faction
   quest::faction("105","1");
   }
plugin::return_items(\%itemcount);
}


#END of FILE Zone:freporte  ID:10064 -- Gregor_Nasin 


