# Daksins' Vampyre Antidote
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day to you, $name. A fine day it is today in the Haven. I hear the bazaar is full of great deals today. I'd love to go and check them out for myself unfortunately I'm stuck here worrying about my friend [Daksins].");
  }
  if ($text=~/daksins/i) {
    quest::say("Well, I know that he told me he was going to the Tenebrous Mountains to try to acquire the blood of one of the cursed vampyres there. A very brave gnome he is, but also sometimes not very aware of what he is getting himself into. He told me that he needed to bring it to Zimloro so that a potion could be made to cure his sick sister. She was attacked by one of the cursed not too long ago. Perhaps you could go [lend him a hand] so that he could return sooner. His family is very worried about him.");
  }
  if ($text=~/lend him a hand/i) {
    quest::say("That is very nice of you, $name. I'm sure his family will be very grateful. He should not be there alone and we fear the worst for him. If you are to go search for him, please bring him this note from Zimloro that contains further instructions. Please seek him out and do your best to convince him to come home.");
    quest::summonitem(4764);
  }
}

# EOF zone: shadowhaven ID: 150005 NPC: Defender_Raldson

