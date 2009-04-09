############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lorme_Tredore
# ID: 9078
# TYPE: Guild Master Magician
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Tattered Note ID-18740
# Used Violet Robe ID-13559
# Fleshy Orb ID-13951
# Fine Steel Scimitar ID-5353
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note Magician
#2 - Fleshy Orb
#
# *** QUEST AVAILABLE TO ***
#
#1 - Magician
#2 - All
#
############################################

sub EVENT_SAY
{
  if ($text=~/Hail/i)
    {
    quest::say("Hello $name. If you are new here you might have a note for me.");
    quest::emote(" mumbles under his breath - Now where did I lose that Fleshy Orb.");
    }
  else
    {
    quest::say("Hello $name. Welcome to the Academy.");
    }
}

sub EVENT_ITEM
{ 
     # Fleshy Orb ID-13951
	   if ($itemcount == "13951")
	      {
        quest::say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
        # Fine Steel Scimitar ID-5353
	      quest::ding();
	      quest::summonitem("5353");
	      quest::exp(100);
	      }
	   else
  	     {
	        # A Tattered Note ID-18740
	       if ($itemcount == "18740" && $class == 'Magician')
    	       {
	            quest::say("Thanks. Please take this robe to help you on your journeys.");
              # Used Violet Robe ID-13559
	            quest::ding();
	            quest::summonitem("13559");
	            quest::exp(100);
	           }
          else
  	         {
  	          quest::say("Only Casters may earn the rewards of the Academy!");
  	          quest::summonitem($item1) if($item1);
  	          quest::summonitem($item2) if($item2);
  	          quest::summonitem($item3) if($item3);
  	          quest::summonitem($item4) if($item4);
             }
          }
}

# END of FILE Zone:freportw  ID:9078 -- Lorme_Tredore

