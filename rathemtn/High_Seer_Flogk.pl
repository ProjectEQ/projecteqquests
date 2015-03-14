#Guktan Initiates Quest NPC (Initial Stage)
#
#You should have the Earring and Amulet before this NPC talks to you
#Those quests are not written yet, so this one is on hold

sub EVENT_SAY {
  quest::emote("ignores you.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}