############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 2,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Linadian
# ID: 9011
# TYPE: Shopkeeper
# RACE: Wood Elf
# LEVEL: 40
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Crushbone Shoulderpads ID-13319
# Crushbone Belt ID-13318
# Deathfist Shoulderpads ID-13917
# Deathfist Slashed Belt ID-13916
# Banded Orc Vest ID-12187
#
# *** QUESTS INVOLVED IN ***
#
#1 - Banded Orc Vest
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
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
 quest::say("Greetings. Please look through my fine wares. I have spent my whole life practicing my skills in tailoring. I do my best to compete with the other local merchants, but I have yet to make A profit. I pray to Tunare that my [ Banded Orc Vests ] will finally bring me A few extra coins. ");
 }

 if($text=~/Banded Orc Vests/i)
 {
 quest::say("Glad you are interested! I can create A leather vest I call A Banded Orc Vest. It will aid you in repelling any disease and offers quite A bit of protection in battle. I will need some materials. For A Deathfist Banded Orc Vest, I require two Deathfist Shoulderpads worn by the Clan Deathfist, one Deathfist Slashed Belt, and ten gold coins. For A Crushbone Banded Orc Vest, I require two Crushbone Shoulderpads worn by the Clan Crushbone, one Crushbone Belt, and ten gold coins.");
 }

}

sub EVENT_ITEM
{
   # Deathfist Shoulderpads ID-13917 - Deathfist Slashed Belt ID-13916 - 10 Gold Coins
   if($itemcount{13917} == 2 && $itemcount{13916} == 2 && $gold == 10)
   {
   quest::say("Grand doing business with you. Hold your nose. I can never get rid of the Orc stench of the vests. That is why the other merchants do not pay me much for them.");

   quest::ding();
   # Banded Orc Vest ID-12187
   quest::summonitem("12187");
   quest::exp(75);

   # Kelethin Merchants Faction
   quest::faction("174","1");
   # Faydark's Champions Faction
   quest::faction("99","1");
   # Emerald Warriors Faction
   quest::faction("92","1");
   # Anti-mage Faction
   quest::faction("8","1");
   }

   # Crushbone Shoulderpads ID-13319 - Crushbone Belt ID-13318 - 10 Gold Coins
  elsif($itemcount{13319} == 2 && $itemcount{13318} == 2 && $gold == 10)
   {
   quest::say("Grand doing business with you. Hold your nose. I can never get rid of the Orc stench of the vests. That is why the other merchants do not pay me much for them.");

   quest::ding();
   # Banded Orc Vest ID-12187
   quest::summonitem("12187");
   quest::exp(75);

   # Kelethin Merchants Faction
   quest::faction("174","1");
   # Faydark's Champions Faction
   quest::faction("99","1");
   # Emerald Warriors Faction
   quest::faction("92","1");
   # Anti-mage Faction
   quest::faction("8","1");
   }
}

#END of FILE Zone:freportw  ID:9011 -- Linadian