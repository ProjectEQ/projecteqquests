############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 2,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Taxonomist_Darwin_Grisk
# ID: 9055
# TYPE: Magician
# RACE: Froglok
# LEVEL: 65
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Warded Satchel ID-17590
#
# *** QUESTS INVOLVED IN ***
#
#1 - Luggald Rumors
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
 quest::say("Have you come to [help]? If not, be gone! I will not have my time wasted.");
 }

 if($text=~/Help/i)
 {
 quest::say("Recently rumors have surfaced that a new race, the Luggalds, walks the land. I suspect that some evil force is involved in their appearance. Are you [willing] to risk unknown dangers to help me find out?");
 }

 if($text=~/willing/i)
 {
 quest::say("Good. I have not been able to confirm the existence of these beings. I will need definite proof if the rest of the members of the Academy are to believe me. Take this Warded Satchel and retrieve three examples of Luggald Flesh.");
 # Warded Satchel ID-17590
 quest::summonitem("17590");
 }
if ($text=~/aid/i) {
  quest::say("Travel to the Crypt of Nadox and slay as many of the Luggalds there as you can. This will slow their plans, but to truly damage their efforts I will need more information. Bring me three more samples of their fecund flesh so that I can compare them with the other examples. Combine them in this Warded Chest.");
  quest::summonitem(17591);   #Warded Chest
}

if (($text=~/hail/i ) && ($grisk == 1)) {   
  quest::say("Thank the gods, you have returned safely! We had heard tell of your battle. Did you by chance find anything of informational value?");
  $globals{grisk} = undef;
   quest::delglobal("grisk");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63009 =>1 )) {
    quest::say("Very good. This will no doubt convince the others. However, we don't have time to wait for their consensus. Deep in the uncovered Crypt of Nadox the Luggalds seem to be at work. This can mean nothing good for the mortal world. You must provide further [aid].");
  }
  
  if (plugin::check_handin(\%itemcount, 63010 =>1 )) {
    quest::say("Alas, it all becomes clear! The Luggalds seek to spread their vile race. I had received word of a dark elf performing arcane rites on the shores of Toxxulia Forest. Now I know she must be attempting to summon other Luggalds. She is expecting an agent of the enemy. Talk with her. Then deal with her and any evil she creates.");
  }
 
  if (plugin::check_handin(\%itemcount, 63015 =>1 )){
	if (($class eq "bard") || ($class eq "beastlord") || ($class eq "paladin") || ($class eq "ranger") || ($class eq "rogue") || ($class eq "shadowknight") || ($class eq "warrior")){
    		quest::say("Well done. I can only imagine the evil you averted. Here. Take this a token of my personal thanks. May we all continue to benefit from your valor."); 
    		quest::summonitem(63050);
		quest::exp(5000);
    }
	else{
		quest::say("Well done. I can only imagine the evil you averted. Here. Take this a token of my personal thanks. May we all continue to benefit from your valor."); 
    		quest::summonitem(63051);
		quest::exp(5000);
	}
  plugin::return_items(\%itemcount);
}
}
#END of FILE Zone:freportw  ID:9055 -- Taxonomist_Darwin_Grisk