# ancient pattern subquest -- ranger epic
#

sub EVENT_ITEM {
if ($faction < 5) { #amiable or better Keepers of the Art
  if (plugin::check_handin(\%itemcount, 20457 => 1)) {
    quest::say("Eh? What is this? A cracked earthen pot? Why in the nine hells would I need a crushed pot? Perhaps I could use it to not hold water! Why did you even bother me with this? Are you mentally deficient? Apparently. Oh, well, you're just a servant boy. Well, then, we'll make you useful, if just a little. Take this shopping list and go get my groceries. Take it to Nora in the tavern. She'll know what I need.");
    quest::summonitem(20458);
  }
  elsif (plugin::check_handin(\%itemcount, 20459 => 1)) {
    quest::say("Ah, good. Here's a few copper and a receipt for services rendered. Now be off, I'm sure citizens across the land are in dire need of broken pots at right this moment.");
    quest::summonitem(20474);
    quest::givecash(3,0,0,0);
  }
 }
  else {
    quest::emote("will not take this item.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: felwitheb ID: 62018 NPC: Farios_Elianos

