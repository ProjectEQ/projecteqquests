sub EVENT_SAY {
 if ($text=~/Hail/i){
   quest::say("Well met. I am keeper of the Portal to the [Plane of Air].");
 }
 if ($text=~/plane of air/i && ($pop_tactics_ralloz == 1)) {
   quest::say("Xegony has created four avatars, each one embodies a different aspect of her power, and each of these avatars was created with a portion of her very essence. The story goes, the one who possesses each of these essences may create a key to break Xegony's ward and enter into her inner sanctum. I don't know the truth behind this, as I have neither the power, nor the desire to challenge the Avatars myself. I have fashioned this, which I believe will form the four essences into a key.");
        quest::summonitem(17888);
 }
 elsif ($text=~/plane of air/i) {
   quest::say("The Elemental Planes are not for idle exploration. Return to me when you have a reason to enter and I will consider opening the portal for you.")
 }
 plugin::return_items(\%itemcount); # return unused items
}

#END of FILE Zone:potranquility  ID:203 -- Sarhya the Dawnbreeze (Sarhya_the_Dawnbreeze.pl) 