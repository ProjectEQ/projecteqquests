sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks despondent");
    quest::say("I recently managed to escape from the city with my mother, but my sister is still stuck in there. She was too frightened to escape with us and now I fear she may be dead.");
  }
  if ($text=~/alive/i) {
    if (defined $qglobals{bic_bar} && $qglobals{bic_bar} == 5) {
    quest::emote("A look of astonishment flashes across Hamisi's face.");
    quest::say("You've seen my sister? Is she ok? Where is she? Wait, there will be time to talk later. For now, you must return to her immediately. Our mother has been worrying herself to death and has grown very sick. I fear she won't last much longer. Please, take this shawl to my sister. It's our mother's. My sister will recognize it and know what it means. May the ocean speed your journey!");
    quest::summonitem(64008);
  }
}
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}