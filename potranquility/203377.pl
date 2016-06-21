sub EVENT_SAY {
 if (($text=~/hail/i) && ($pop_tactics_ralloz == 1)) {
   quest::say("Ahh I see you have been quite busy! Many are speaking of the deeds of you and your compatriots. You have earned the trust of the Elders. You may now pass into the Plane of Earth.");
 }
 elsif ($text=~/hail/i) {
	 quest::say("Well met I am keeper of the Portal to the Plane of Earth.");
 }
 elsif (($text=~/elemental essences/i) && defined($qglobals{mage_epic}) && ($qglobals{mage_epic}==6)) {
   quest::say("The Essence of Earth? Indeed, I know much of it. It was captured long ago by a great geomancer. He used it to assist him in harnessing and manipulating the power of earth and stone. At last word the geomancer did something to incur the wrath of a god, and he has lost much of his power. I would find where his strength was last at its greatest, and begin my search there.");
   quest::setglobal("mage_epic_earth1", 1, 5, "F");
 }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:potranquility  ID:203 -- Sarhya the Dawnbreeze (Sarhya_the_Dawnbreeze.pl) 