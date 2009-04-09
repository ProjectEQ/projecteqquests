############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Joshua
# ID: 9121
# TYPE: Warrior
# RACE: Human
# LEVEL: 5
#
# *** ITEMS GIVEN OR TAKEN ***
#
# bucket of water ID-29008
# bucket of pure water ID-29009
#
# *** QUESTS INVOLVED IN ***
#
#
#
# *** QUESTS AVAILABLE TO ***
#
#
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
 quest::say("Welcome to freeport $name.");
 }


}

sub EVENT_ITEM
{
   # bucket of water ID-29008
   if($itemcount{29008} == 1)
   {
   quest::me("Joshua dips his emaciated hand into the bucket and brings the water to his mouth. As he does, you hear a soft thump from outside and notice that through the window his sister has collapsed. A glimmer enfolds her body, and you notice the water in Joshua's hand gleam a pure, bright light for a moment. 'Thank you, sir. I hope my sister returns soon. I feel better for some reason.");

   quest::ding();
   # bucket of pure water ID-29009
   quest::summonitem("29009");
   }
}

#END of FILE Zone:freportw  ID:9121 -- Joshua