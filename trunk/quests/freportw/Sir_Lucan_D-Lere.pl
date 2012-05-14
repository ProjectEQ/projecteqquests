############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Sir_Lucan_D`Lere
# ID: 9018
# TYPE: Warrior Quild Master
# RACE: Freeport Guards
# LEVEL: 48
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Testimony of Truth
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Paladin
#
# *** NPC NOTES ***
#
# This NPC when killed is supposed to spawn an Undead version of itself to attack the aggressor.
#
############################################


sub EVENT_SAY { 
  if($text=~/Hail/i) {
     quest::say("Hail. citizen!  I am very busy. I do not have time to speak with you.  If you have any complaints. please direct them to City Hall.  Unless. of course. you have some personal business in which I might be interested.");
  }
  if ($text=~/shrine of innoruuk/i) {
  quest::say("It is about time Pietro sent someone. You people should be lucky I allow you to conduct your business in this city. I will have you all locked up if you cannot be more prompt. Now, listen up! I want you to go out to the Commonlands. My guards have reported that a messenger from Qeynos is staying at an inn near the western edge of the Commonlands. I suspect he is carrying vital information to the Hall of Truth. I want him stopped. Bring me the message if you know what's good for you and the Dismal Rage. Now, get out of here!");
  }
}


sub EVENT_DEATH  {
	quest::spawn(9147, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ());
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18822 => 1 )) {
    quest::say("So I see you decided to bring me the message. Good. I would hate to have to hunt you down. It could have gotten really messy and I hate reading bloodstained messages. Well it seems Antonius Bayle and the Knights of Truth have begun an alliance. And it sounds as though I may have a traitor among my guards. If you wish to switch your allegiance to Freeport, then find me this traitor. Bring me his militia tunic. Try to keep the blood from staining it.");
    quest::faction(105,10);
    quest::faction(48,10);
    quest::faction(184,-20);
    quest::faction(258,-20);    
    quest::exp(5000);
}
  if (plugin::check_handin(\%itemcount, 13926 => 1 )) {
    quest::say("Thank you for your loyalty");  #need live text and reward
    quest::faction(105,20);
    quest::faction(48,20);
    quest::faction(184,-40);
    quest::faction(258,-40);    
    quest::exp(7500);
    }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere