sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("$name, it is good that you have come to me. The kobolds have entered this cavern. Our numbers are too few to hold them off for long. But some slaves have offered to join our cause - for a price. They will act as mercenaries for us! To protect this cavern, hire one of them and kill a kobold infiltrator.");
    quest::taskselector(15035); #Task: Mercenaries for Hire
    quest::popup("Introduction to Mercenaries", "<br>Elegist is a <c \"#CCFF99\">mercenary liaison</c>. Mercenary liaisons are located in many starting cities, as well as the Plane of Knowledge. These liaisons allow you to hire mercenaries.<br><br><c \"#CCFF99\">Mercenaries</c> are NPCs that will fight alongside you. There are four different types of mercenaries: <c \"#CCFF99\">tank</c>, <c \"#CCFF99\">healer</c>, <c \"#CCFF99\">damage caster</c>, and <c \"#CCFF99\">melee damage</c>.<br><br><c \"#CCFF99\">Tanks</c> hold your enemy's attention and focus its attacks on themselves.<c \"#CCFF99\"> Healers</c> cast healing spells on you and your group. <c \"#CCFF99\">Damage casters</c> attack your enemies with magic. <c \"#CCFF99\">Melee damage</c> mercenaries confront your enemies with physical attacks and poison.<br><br><c \"#00F0F0\">Right click</c> on Elegist to see which mercenaries he has for hire.<br><br><c \"#F07F00\">Click 'OK' to find out what type of mercenary you should hire.</c>", 28);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}