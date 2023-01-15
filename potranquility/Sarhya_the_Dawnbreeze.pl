# items: 17888
sub EVENT_SAY {
 if (($text=~/hail/i) && ($pop_tactics_ralloz == 1)) {
   quest::say("It appears that you are ready to travel into the Elemental Planes. Beware many of the gods there have set up wards to protect them against assaults. Most I cannot speak about; however I do have information on the Circle of Protection that guards Xegony, in her [" . quest::saylink("Plane of Air") . "].");
 }
 elsif ($text=~/hail/i) {
	 quest::say("Well met I am keeper of the Portal to the [" . quest::saylink("Plane of Air") . "].");
 }
 if ($text=~/plane of air/i && ($pop_tactics_ralloz == 1)) {
   quest::say("Xegony has created four avatars, each one embodies a different aspect of her power, and each of these avatars was created with a portion of her very essence. The story goes, the one who possesses each of these essences may create a key to break Xegony's ward and enter into her inner sanctum. I don't know the truth behind this, as I have neither the power, nor the desire to challenge the Avatars myself. I have fashioned this, which I believe will form the four essences into a key.");
        quest::summonitem(17888); # Item: Pouch of Swirling Winds
 }
 elsif ($text=~/plane of air/i) {
   quest::say("The Elemental Planes are not for idle exploration. Return to me when you have a reason to enter and I will consider opening the portal for you.");
 }
 elsif (($text=~/elemental essences/i) && defined($qglobals{mage_epic}) && ($qglobals{mage_epic}==6)) {
   quest::say("You seek the elemental essences? It has been a very long time since I've heard them spoke of. I am afraid I cannot be of much help, except to tell you it often enjoys to whistle through valleys and canyons. I fear it may not even reside in this realm any longer.");
   quest::setglobal("mage_epic_air1", 1, 5, "F");
 }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:potranquility  ID:203 -- Sarhya the Dawnbreeze (Sarhya_the_Dawnbreeze.pl) 