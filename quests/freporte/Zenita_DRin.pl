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
# NAME: Zenita_DRin
# ID: 10113
# TYPE: Rogue
# RACE: Dark Elf
# LEVEL: 10
#
# *** ITEMS GIVEN OR TAKEN ***
#
# King Card ID-22298
# Joker Card ID-22295
# Knight Card ID-22299
# Innoruuk's Kiss of Death ID-13121
# A Telescope Lens ID-13279
#
# *** QUESTS INVOLVED IN ***
#
#1 - Telescope Lenses
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Wizard
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
quest::say("Greetings! I would love to chat with you. but I just remembered something.. I do not waste time with whelps.");
}

if($text=~/lens/i)
{
quest::say("If you want the lens then either you will have to [fight] or play a [card game] of chance.");
}

if($text=~/card game/i)
{
quest::say("You bring me a bottle of Innoruuk's Kiss of Death and you can draw a random card from my deck. If you get a King, you can have the lens.");
}

if($text=~/fight/i)
{
quest::say("This should be a joke! But... DIE!!!");
quest::attack($name);
}

}

sub EVENT_ITEM
{

   # Innoruuk's Kiss of Death ID-13121
   if($itemcount{13121} == 1)
   {
   quest::say("Let see what card you pulled.");
   # King Card ID-22298 - Joker Card ID-22295 - Knight Card ID-22299
   $random=int(rand 22298+22295+22299);
   # King Card ID-22298 - Joker Card ID-22295 - Knight Card ID-22299
   quest::summonitem($random);
   }
   
   # King Card ID-22298
   if($itemcount{22298} == 1)
   {
   quest::say("As much as I hate to admit it, you won! Take this and be gone before take it back the easy way!");
   quest::ding();
   quest::exp(100);
   # A Telescope Lens ID-13279
   quest::summonitem("13279");
   }
   
   # Joker Card ID-22295
   if($itemcount{22295} == 1)
   {
   quest::say("I see you have drawn the card that best represnts a $race such as yourself. You lose!");
   }
   
   # Knight Card ID-22299
   if($itemcount{22299} == 1)
   {
   quest::say("Bad luck must be one of your strong suits. You should have been a begger because you sure aren't a very good $class. You lose!");
   }
   
}

#END of FILE Zone:freporte  ID:10113 -- Zenita_DRin


