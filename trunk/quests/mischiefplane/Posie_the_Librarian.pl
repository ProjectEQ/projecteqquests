#Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Posie the Librarian
#NPC ID: 126215

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("SSH! do not disturb the library! It's $race like you who have ruined your own books, you won't ruin mine!");
}
 }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9510 => 1)) {
    quest::summonitem(17325);
    quest::say("Ahh, you brought your card. Let's see here. $name is it? Here's the only book we have stocked at the moment. It's missing the chapter on wealth but there's an excellent story about melting your clothing in a pot on page 11. It's a one of a kind story written completely in invisible ink. Enjoy!");
  }
  plugin::return_items(\%itemcount);
}