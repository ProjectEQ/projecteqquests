# on death this npc spawns Bristlebane the King of Thieves in the throne room
#

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(126373,0,0,-127,938,186.125,264); # NPC: Bristlebane_the_King_of_Thieves
  quest::me("Merry laughter echoes throughout the castle and a cheerful voice is heard saying, 'Come on then if you seek the King of Thieves you must choose wisely! Hurry up lads and lasses!");
}

# EOF zone: mischiefplane ID: 126012 NPC: the_Mischievous_Jester

