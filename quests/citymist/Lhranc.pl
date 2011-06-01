# Part of SK Epic 1.0

sub EVENT_SAY {
  if ($faction >=42) { #True Spirit
    if ($text=~/hail/i) {
      quest::say("Ahh, finally! He has sent you. No time to waste now, you must help me lift the curse at once!");
    }
    if ($text=~/curse/i) {
      quest::say("Can you not see my condition! I have been unjustly sentenced to an eternity in this wretched form you see before you, never to leave these walls. In exchange for the cure for this curse, I swear to show you a secret that would make you the most powerful of your kind.");
    }
    if ($text=~/cure/i) {
      quest::say("I require only four things of you, dark one, and one of them you hold now. Bring me the heart of an innocent, the head of the valiant, and the will of Innoruuk. With these, my curse shall be lifted at last and I will craft a weapon that will cast a shadow over all of Norrath.");
    }
  }
  else {
    quest::emote("seems to ignore you."); #Emote made up
  }
}

sub EVENT_ITEM {
  if ($faction >= 72) { #True Spirit
    if (plugin::check_handin(\%itemcount, 14367 => 1, 14368 => 1, 14369 => 1, 14370 => 1)) { #Corrupted Ghoulbane, Heart of the Innocent, Head of the Valiant, Will of Innoruuk
      quest::say("Ahh, at last I can free myself of this prison! Centuries have passed since I enjoyed the fruits of mortality.' He hurls the components above his head where they remain suspended in midair. They hover in place while he chants the words of an ancient spell. As he speaks, the items begin to rotate around his head, slowly at first, then faster as the chanting grows louder, until it spins in a blur. Soon, the room is filled with a deafening shriek that pierces you to the core.");
      quest::faction(342, 10); #True Spirit
      quest::summonitem(14384); #Lhranc's Token
      quest::spawn2(90187, 0, 0, 85.1, 0.9, 7.8, 192); ##Lhranc
      quest::depop();
    }
    else {
      quest::say("This is not what I seek."); #Text made up
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::emote("seems to ignore you."); #Emote made up
    plugin::return_items(\%itemcount);
  }
}

# Quest by mystic414