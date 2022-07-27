#########################################################
# David
# Zone:  Rathe Mountains
# Quest:  Bracers of Ro
#########################################################
# items: 12311, 12301

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I, the keeper of the [Bracers of Ro], welcome you. Come and rest within our camp. You have nothing to fear while such righteous might is gathered.");
  }
  elsif ($faction > 5) {
    quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
  }
  elsif ($client->GetModCharacterFactionLevel(242) < 25) {
    quest::say("You and I are not one yet. Go to Erudin and serve the Deepwater Knights. When you can ask Lord Weligon if you are an [honored member] and he answers yes, then this is when we are one with Prexus.");
  }
  elsif ($text=~/bracers of ro/i) {
    quest::say("When you can swim the waters of Rathe and return two goblin nets from the elusive goblin net masters, then you will be rewarded the bracer mold.");
  }
}

sub EVENT_ITEM {
  if (($client->GetModCharacterFactionLevel(242) > 24) && plugin::check_handin(\%itemcount,12311 => 2)) {
    quest::say("You have done well. Take the mold for the bracer. Go forth to speak with Thomas of [Lord Searfire]. Then all components shall be known.");
    quest::summonitem(12301); # Item: Mold of Ro Bracer
    quest::faction(242, 20); # Faction: Deepwater Knights
    quest::faction(695, 3); # Faction: Clockwork Gnome (Race)
    quest::faction(265, -3); # Faction: Heretics
  }
  elsif (($client->GetModCharacterFactionLevel(242) > 24) && plugin::check_handin(\%itemcount, 12311 => 1)) {
    quest::say("Two Deepwater goblin nets are required.");
    quest::summonitem(12311); # Item: Deepwater Goblin Net
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rathemtn  ID:50108 -- David
