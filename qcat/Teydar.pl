# Part of SK Epic 1.0
# items: 14372, 14371, 16507, 14366

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($text=~/hail/i && $class eq "Shadowknight")  {
    quest::say("Hello $name, it's good to see another shadowknight around here. I'm Teydar. I've made it my life to fashion suitable scabbards and sheaths for our order.");
  }
  if ($text=~/decrepit sheath/i && $faction >= 28) {
    quest::say("The object you desire is very difficult to fashion. Nearly impossible, really. All I can offer to do is try. The real difficulty is the contents that give the sheath its power. They have to be of an almost equal evil. I think some kind of decrepit hide and a drake spine, along with a bar of enchanted platinum, should prove enough to make this item.");
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($faction >= 28 && plugin::check_handin(\%itemcount, 14372 => 1, 14371 => 1, 16507 => 1)) {
    quest::say("I did it! The pieces you got me were perfect! It took a huge effort on my part to craft this, of course. It saddens me that I'm unable to keep one of my best works, but a deal is a deal. There is honor among shadowknights.");
    quest::faction(404, 7); # Faction: Truespirit
    quest::summonitem(14366); # Item: Decrepit Sheath
  }
  plugin::return_items(\%itemcount);
}
# Quest by mystic414
