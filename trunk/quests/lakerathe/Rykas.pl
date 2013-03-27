#Zone: Lake Ratherear
#Short Name: lakerathe
#Zone ID: 51
#
#NPC Name: Rykas
#NPC ID: 51045
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("'Greetings, $name. I am Rykas, chronicler of knowledge. I have journeyed all throughout the lands of Norrath, and I have learned many tales of adventure from people I have encountered during my travels. I have learned of legends known and unknown to most mortals. Are you in search of knowledge?");
  }
  if ($text=~/knowledge/i) {
    quest::say("A small task is needed if you wish to learn more. Do you wish to learn the tale of Magi'kot?");
  }
  if ($text=~/Magi'kot/i) {
    quest::say("If you seek to learn the tale of Trilith Magi'kot, your journey shall begin in the Commonlands. Search for Jahsohn Aksot and give him this token. He will share some of the knowledge I have bestowed upon him, and point you further down your path to Mastery. Bring me the Words of Mastery, Power of the Elements, and the Words of Magi'kot....Then you shall learn more about the power of the orb.");
    quest::summonitem(28035);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28003 => 1, 28004 => 1, 28031 => 1)) {
    quest::say("I see that you have completed the quest I laid before you. That speaks well of your dedication, yet you do not realize your journey has just begun. Study this tome.");
    quest::summonitem(18958);
    quest::exp(2000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: lakerathe  ID:51045 -- Rykas