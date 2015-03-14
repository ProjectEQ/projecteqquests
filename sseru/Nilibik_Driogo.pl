# Bronus' Amulet
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, you look like a battleworn traveller. Have you heard of the place where [grieg] resides?");
  }
  if ($text=~/grieg/i) {
    quest::say("Aye, Grieg Veneficus. We do not know much about this madman, only where his [stronghold] is. One of my friends from the Eye was sent there to investigate it, but he has not returned. It has been quite some time and I am very worried about him.");
  }
  if ($text=~/stronghold/i) {
    quest::say("Grieg's End is what it has become to be known as. Some reports have come back that this place is cursed with foul visages. Any entering will surely loose their minds. I.. I would go but you see I am desperately busy here in the city doing..uh..many important things! You look like you could help, will you [travel] to Grieg's End and look for my friend?");
  }
  if ($text=~/travel/i) {
    quest::say("Good, I am glad you would prove yourself useful to Seru. Look for Bronus, you should beware if he has lost his sanity for he is almost as powerful as myself.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6515 => 1)) {
    quest::emote("speaks a small incantation as he pulls a branch from a nearby tree and ties it around the amulet 'I shall mourn him dearly, he was a good friend. This was the amulet that I had given him before he left to explore Grieg's End. I want you to have this for helping to find his lost soul. Go in peace my friend.");
    quest::summonitem(6516);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: sseru ID: 159414 NPC: Nilibik_Driogo

