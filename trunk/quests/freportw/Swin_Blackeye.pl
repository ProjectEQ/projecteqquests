############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Swin_Blackeye
# ID: 9103
# TYPE: Shopkeeper
# RACE: Freeport Guards
# LEVEL: 20
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Sealed Letter ID-26644 (Blank - Not real letter for quest)
# Hog Key # 2 ID-12147
#
# *** QUESTS INVOLVED IN ***
#
#1 - Room 2 Mail
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
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
  quest::say("Greetings, friend! Welcome to the Hog Caller's Inn! Don't let the name fool you.  We are the finest establishment in Freeport. Please feel free to relax in our lounge. There is usually music to soothe your blues away.");
  }

  if($text=~/need the mail for room two/i)
  {
  quest::say("Hmmph !! If you're here to get the mail for room two you first need to show me the room key.");
  }

}

sub EVENT_ITEM
{
 # Hog Key # 2 ID-12147
 if ($itemcount{12147} == 1 )
 {
	quest::say("Here you go then.");

	quest::ding();
 	# A Sealed Letter ID-26644 (Blank - Not real letter for quest)
	quest::summonitem("26644");
	quest::exp("100");
 	# Faction Coalition of Trade Folk ID-47
	quest::faction("47","1");
	# Faction Knights of Truth ID-184
	quest::faction("184","1");
	# Faction Merchants of Qeynos ID-217
	quest::faction("217","1");
	# Faction Coalition of TradeFolk III ID-369
	quest::faction("369","1");
 }

}

#END of FILE Zone:freportw  ID:9103 -- Swin_Blackeye
