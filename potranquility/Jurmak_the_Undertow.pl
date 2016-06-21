sub EVENT_SAY {
 if (($text=~/hail/i) && ($pop_tactics_ralloz == 1)) {
   quest::say("The Elders say that you are now allowed to enter the Plane of Water. I shall allow you to enter, but I will not be responsible for whatever fate may befall you upon entry to this greater elemental plane.");
 }
 elsif ($text=~/hail/i) {
	 quest::say("Well met I am keeper of the Portal to the Plane of Water.");
 }
 elsif (($text=~/elemental essences/i) && defined($qglobals{mage_epic}) && ($qglobals{mage_epic}==6)) {
   quest::say("Oh? The Elemental Essence of water? That is what you mean, yes? Consider yourself fortunate, I know the location of the Essence. It has spent quite some time living as a minor god to the othmir.");
   quest::setglobal("mage_epic_water1", 1, 5, "F");
 }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:potranquility  ID:203 -- Sarhya the Dawnbreeze (Sarhya_the_Dawnbreeze.pl) 