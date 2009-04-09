# Part of SK Epic 1.0

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(342);
  if ($text=~/Hail/i && $faction >= 42) {
    quest::say("Ahh, finally! He has sent you. No time to waste now, you must help me lift the curse at once!");
  }
  if ($text=~/curse/i && $faction >= 42) {
    quest::say("Can you not see my condition! I have been unjustly sentenced to an eternity in this wretched form you see before you, never to leave these walls. In exchange for the cure for this curse, I swear to show you a secret that would make you the most powerful of your kind.");
  }
  if ($text=~/cure/i && $faction >= 42) {
    quest::say("I require only four things of you, dark one, and one of them you hold now. Bring me the heart of an innocent, the head of the valiant, and the will of Innoruuk. With these, my curse shall be lifted at last and I will craft a weapon that will cast a shadow over all of Norrath.");
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(342);  
  if (($itemcount{14367} == 1) && ($itemcount{14368} == 1) && ($itemcount{14369} ==1 ) && ($itemcount{14370} == 1) && $faction >= 72) {
    quest::say("Ahh, at last I can free myself of this prison! Centuries have passed since I enjoyed the fruits of mortality.' He hurls the components above his head where they remain suspended in midair. They hover in place while he chants the words of an ancient spell. As he speaks, the items begin to rotate around his head, slowly at first, then faster as the chanting grows louder, until it spins in a blur. Soon, the room is filled with a deafening shriek that pierces you to the core.");
    quest::faction(342, 10);
    quest::summonitem(14384);
    quest::spawn2(90187, 0, 0, 85.1, 0.9, 7.8, 192);
    quest::depop();
  }
}

# Quest by mystic414

