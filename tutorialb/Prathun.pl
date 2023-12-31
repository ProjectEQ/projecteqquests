#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There are many members of the revolt that can aid you as you combat the kobolds.  A new soldier like you won't last long without friends!");
    quest::popup("Grouping", "<br>Prathun recommends forming groups with other adventurers to improve your mutual chances of survival.  This is the best advice you will ever receive in all of your EverQuest adventures! <br><br><c \"#F0F000\">Forming Groups:</c><br>To invite another player to join your group, target them and then click 'Invite' in the <c \"#00A000\">Group Window</c>.  If another player invites you to group, the invite button will change to read 'Follow' which will cause you to join the group when pressed.<br><br><c \"#F07F00\">Click 'OK' when you are ready to continue.</c>", 21);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::say("Good luck out there, friend.  I'm sure you'll do fine!");
}