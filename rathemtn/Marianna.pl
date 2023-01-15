#########################################################
# Marianna
# Zone:  Rathe Mountains
# Quest: Vambraces of Ro
#########################################################
# items: 12310, 12300

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Rodcet Nife welcomes you into our noble camp. I am the keeper of the [Vambraces of Ro].");
  }
  elsif ($faction > 5) {
    quest::say("Foolish person!! The word is out amongst the followers of the Prime Healer not to trust you.");
  }
  elsif ($client->GetModCharacterFactionLevel(341) < 25) {
    quest::say("In the name of Rodcet Nife, I must ask you to venture to Qeynos and find the Temple of Life. There you shall serve until High Priestess Jhanda responds when you ask her, am [I an honored member]?");
  }
  elsif ($text=~/vambraces of ro/i) {
    quest::say("The mold will be offered to you when you have performed a task for the Temple of Life. The oceans near our home are host to a plague.. the plague sharks!! They have been infected with a deadly malady which has been turning up in the Qeynos Hills. Kill the sharks and bring me two of their rotten shark portions as proof.");
  }
}

sub EVENT_ITEM {
  if (($client->GetModCharacterFactionLevel(341) > 24) && plugin::check_handin(\%itemcount, 12310 => 2)) {
    quest::say("You now own a mold for the Vambracers of Ro. Go and ask Thomas of [Lord Searfire] for the final component.");
    quest::summonitem(12300); # Item: Mold of Ro Vambrace
    quest::faction(341, 20); # Priests of Life
    quest::faction(280, 6); # Knights of Thunder
    quest::faction(262, 10); # Guards of Qeynos
    quest::faction(221, -5); # Bloodsabers
    quest::faction(219, 3); # Antonius Bayle
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50114 -- Marianna
