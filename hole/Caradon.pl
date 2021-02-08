# Part of SK Epic 1.0
# items: 14373

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($faction >= 44) {
    if ($text=~/Hail/i) {
      quest::say("Please help me get out of here! My companion, Kyrenna, and I are trapped in this hellish place!");
    }
    if ($text=~/Who is Kyrenna/i) {
      quest::say("I was with Kyrenna when she attempted to revive the corpse of Glohnor the Valiant. Like fools, we rushed into a trap. Now we sit here and await our deaths.");
    }
    if ($text=~/Where is Kyrenna/i) {
      quest::say("She is close by. For a price, I shall tell you. Bring me the key to my freedom and I will betray her, who sentenced me to this fate.");
    }
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($faction >= 44 && plugin::check_handin(\%itemcount, 14373 => 1)) {
    quest::say("Kyrenna! We are free!");
    quest::spawn2(39155, 0, 0, -195.8, 426.6, -213.9, 230); # NPC: Kyrenna
    quest::faction(404, 7); # Faction: Truespirit
    quest::attack($name);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414

