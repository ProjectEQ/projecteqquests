############################################
# ZONE: West Freeport (freportw)
# DATABASE: Luclin
# LAST EDIT DATE: 09-17-06
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lady_Shae
# ID: 9058
# TYPE: Warrior
# RACE: High Elf
# LEVEL: 12
#
# *** ITEMS GIVEN OR TAKEN ***
#
# White Wine ID-13031
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hog Caller Inn Mail
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
# *** NPC NOTES ***
#
############################################
############################################
# ZONE: West Freeport (freportw)
# DATABASE: Luclin
# LAST EDIT DATE: 09-17-06
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lady_Shae
# ID: 9058
# TYPE: Warrior
# RACE: High Elf
# LEVEL: 12
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Red Wine ID-13030
# White Wine ID-13031
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hog Caller Inn Mail
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
# *** NPC NOTES ***
#
############################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hello. It is always good to meet someone new. I am Lady Shae of the House of Dumas. And what [house] are you from?");
  }
  if($text=~/no house/i) {
    quest::say("Good. I care not to hang around any snobs this evening. Would you be so kind as to buy me some wine?");
  }
  if($text=~/steel warriors sent me/i) {
    quest::say("Thank you for checking into this matter. I told the Militia, but they just ignored me. It appears the darkelves keep coming in leaving mail for [Shintl] Lowbrew. Before I tell you more could you please buy me A white wine please.");
  }
  if($text=~/shintl/i) {
    quest::say("Dyllin was the name of A Qeynos guard who was sent to pick up the list I was holding for dear sweet Antonius. He left just yesterday. If you wish to meet up with him, I heard him say he was going to stop at Highpass Hold.");
  }
  if($text=~/house of pancakes/i) {
    quest::say("I can tell. You look like you ATE a house of pancakes.");
  }
  if($text=~/house of style/i) {
    quest::say("I would of never guessed by the way you look.");
  }
  if($text=~/dyllin/i) {
    quest::say("Dyllin was the name of a Qeynos guard who was sent to pick up the list I was holding for dear, sweet Antonius. He left just yesterday. If you wish to meet up with him, I heard him say he was going to stop at Highpass Hold.");
  }
}

sub EVENT_ITEM { 
  my $wine = 0;

  if (plugin::check_handin(\%itemcount,13031=>4)) { #White Wine
    $wine=4;
  }
  elsif (plugin::check_handin(\%itemcount,13031=>3)) {
    $wine=3;
  }
  elsif (plugin::check_handin(\%itemcount,13031=>2)) {
    $wine=2;
  }
  elsif (plugin::check_handin(\%itemcount,13031=>1)) {
    $wine=1;
  }
  elsif (plugin::check_handin(\%itemcount,13030=>4)) {
    quest::say("Oh my.. You are so kind. I can not tell you the last time I had so much fine wine. Well, there was the time Antonius Bayle told me he no longer had the time for a committed relationship. Mister big ruler of the world. Make it to the top and find someone younger. I know his plan. I hate him. I will never trust another human again. After all that, he goes and asks me to hold on to this list for him. Well I am glad it was taken from me by that [Dyllin]. Antonius Bayle has no ties to me any more!! Good riddance! Oooooh! I love him.");
    quest::ding();
    #quest::faction(99,2);  #Faydark's Champions
    #quest::faction(178,2); #King Tearis Thex
    #quest::faction(34,2);  #Clerics of Tunare
    #quest::faction(304,2); #Soldiers of Tunare
    #quest::faction(63,-4); #Crushbone Orcs 
    quest::faction(100,2);  #Felguard - Only NPC in the game with it.
    quest::exp(2500);
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
  if ($wine >= 1) {
    for ($i=0; $i<$wine; $i++) {
      quest::say("Thank you. Pandos has been telling me to try white wine forever. I mostly only drink red wine. Pardon me for getting off track. Anyway, it is a good thing you showed up. The lady in room 2 has been receiving mail from a Dark Elf. You [need the mail for room two]. The Innkeeper usually holds it for the guests.");
      quest::ding();
      #quest::faction(99,2);  #Faydark's Champions
      #quest::faction(178,2); #King Tearis Thex
      #quest::faction(34,2);  #Clerics of Tunare
      #quest::faction(304,2); #Soldiers of Tunare
      #quest::faction(63,-4); #Crushbone Orcs
      quest::faction(100,2); #Felguard - Only NPC in the game with it.
      quest::exp(1000);
    }
    $wine = 0;
  }
}
#END of FILE Zone:freportw  ID:9058 -- Lady_Shae.pl