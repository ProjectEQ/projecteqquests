# Part of the Ghoulbane quest

sub EVENT_SAY {
  if($text=~/Hail/i)
  {
    quest::say("Hello $name, I see that you've spoken to Llara. She too came to me looking for Amstaf. Though she wasn't able to find her friend, she was able to recover his [sword]");
  }
  if($text=~/sword/i) {
    quest::say("I've heard stories about a holy sword. There are many rumored to be hidden all throughout the world, yet only a few have actually been found. Amstaf had one of these swords. It is known for its ability to dismiss the undead. Perhaps by having this sword it'll bring you closer to finding your friend. Gather a ghoul's heart, Amstaf's Scroll, the Blade of Nobility, and a noblemans hilt and place them in this [bag].");
  }
  if($text=~/bag/i) {
    quest::say("Take this bag and gather the items I've mentioned. I've been told that the Ghoul's Heart can be found in the estate of the undead, while the scroll can be found in the Keep not far from the Karanas. One of the others are rumored to be found near the dwarven city among the goblins. While the last should be found in the caverns of Najena.");
    quest::summonitem(64020);
  }
}

sub EVENT_ITEM {
  if($itemcount{2417} == 1) {
    quest::say("I see that you've spoken to Llara. She too came to me looking for Amstaf. Though she wasn't able to find her friend, she was able to recover his [sword].");
  }
}

# Quest edited by mystic414
# Quest edited by Sesmar