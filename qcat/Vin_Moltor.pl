sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Heh?? .. BURRP!.. Leave me be will ya.");
  }
  if ($text=~/paw of opolla/i) {
    quest::say("Paw ya say? Yeah.. Yeah .. I got this ratty old thing still. You want it? Its yours for a Bottle of Kalish and hm.. .. How bad you want it?  Hm..  Two..  No no..  Three Gold..  Er..  NO! Wait. Pie..  Yes! Rat Ear Pie is what I want.. Three Bottles of Kalish and a Rat Eat Pie. If you want the Paw that is my price.");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13016 =>3, 13192 =>1 )) {
    quest::say("Ah thanks, here is what I promised you.");
    quest::summonitem(17014);
  }
  if (plugin::check_handin(\%itemcount, 13016 =>3, 18103 =>1 )) {
    quest::say("Ah thanks, here is what I promised you.");
    quest::summonitem(17014);
 }
 plugin::return_items(\%itemcount);
}