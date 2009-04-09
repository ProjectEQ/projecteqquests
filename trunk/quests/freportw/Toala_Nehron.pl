############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Toala_Nehron
# ID: 9091
# TYPE: Guild Master Warrior
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# L.S. Pouch ID-13814
# Snapped Pole ID-13922
# Moggok's Right Eye ID-13923
# Toala's Box for heads ID-17971
# A Sealed Letter ID-26644 (Blank - Not real letter for quest)
# Box with Two Heads ID- MISSING
#
# *** QUESTS INVOLVED IN ***
#
#1 - Pouch of Lenka
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

 if($text =~ /Hail/i)
 {
	quest::say("I am Toala Nehron. You must be A another Young warrior aspiring to join the ranks of the Steel Warriors. We welcome all who should try. When you [have time] there is A friend of mine I would like you to check on.");
 }

if($text =~ /have time/i && $class == "Warrior")
 {
	quest::say("I have A friend by the name of [Lenka Stoutheart]. She reported to me that her ship was broken into and someone stold A pouch of hers. Could you go look into it for me. Just tell her Toala sent you . Oh... And pay No mind to the walking mountain by her. That will only be Bronto her navigator. Thanks friend.");
 }

 if($text =~ /Lenka Stoutheart/i && $class == "Warrior")
 {
	quest::say("Lenka Stoutheart is an old friend of mine. I trained with her in my younger days when the Steel Warriors sent me to train in the ways of the Wolves of the North, the barbarian warriors of Halas. She is now an adventurer of great sorts. She travels from continent to continent aboard the Blue Beast, her ship. The Last time I had heard from her she was docked in East Karana.");
 }

}

sub EVENT_ITEM
{
 #do all other handins first, then let it do disciplines
 # L.S. Pouch ID-13814
 if($itemcount{13814} == 1)
 {
 quest::ding();
 quest::say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk. ");

 quest::exp("200");

 # Snapped Pole ID-13922 or Moggok's Right Eye ID-13923
 quest::summonitem(quest::ChooseRandom(13922, 13923));
 quest::givecash("0","2","0","0");
 # Faction Wolves of the North ID-361
 quest::faction("361","2");
 # Faction Shamen of Justice ID-294
 quest::faction("294","2");
 # Faction Merchants of Halas ID-213
 quest::faction("213","2");
 # Faction Steel Warriors ID-311
 quest::faction("311","2");
 # Faction Rogues of the White Rose ID-275
 quest::faction("275","-2");

 
 }
 # A Sealed Letter ID-26644 (Blank - Not real letter for quest)
 elsif ($itemcount{26644} == 1)
 {
 quest::ding();
 quest::say("Why, that little trollop! What is she up to? Cain will never believe this! She must be in league with some faction of the dark elves, but why? Neither the Academy of Arcane Science nor Cain will believe this note. I will see what I can do. As for you, I command you to kill this Shintl and her dark elf courier Hollish!! Put their heads into this box and combine them. We shall cut the link. Bring me thier heads.");
 # Toala's Box for heads ID-17971
 quest::summonitem("17971");
 quest::exp("100");
 }
## # Box with Two Heads ID- MISSING
## elsif ($itemcount{MISSING} == 1)
## {
##  quest::ding();
## quest::say("'Good work!! We will soon catch Opal. I have started to formulate a plan to stop her. When I complete it, I shall notify you. Here. Take this small reward. I am sure killing Shintl was no trouble. She was just a halfling.");
## quest::exp("100");
## quest::givecash("0","10","2","0")
## # Steel Warriors Faction ID-311
## quest::faction("311","1");
## # Guards of Qeynos Faction ID-135
## quest::faction("135","1");
## # Knights of Truth Faction ID-184
## quest::faction("184","1");
##  # Corrupt Qeynos Guards Faction ID-53
## quest::faction("53","-1");
## # Freeport Militia Faction ID-105
## quest::faction("105","-1");
## }
 else
 {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:freportw  ID:9091 -- Toala_Nehron
