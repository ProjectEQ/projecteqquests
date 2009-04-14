sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks up at you and blinks,");
    quest::say("Oh hello, initiate. This is by no means aimed as an insult, but you look as if you could use a new waistguard. Perhaps I could interest you in a [leathery girdle] of my own design?");
  }
  if ($text=~/leathery girdle/i) {
    quest::say("It is quite trivial to craft this girdle, for someone of my experience, however, I will require that you gather some components for me before I can craft it. The items that I require are the raw materials that I will need to craft the belt, the first of which would be a pair of High Quality Gnoll Furs, which can only be found in the depths of Blackburrow. The second item would be the scale of a Mermaid, which would be found in the Ocean of Tears, though I highly doubt it will come easily. The third, and final item, admittedly, is not a component for the belt, but rather a task of a more [personal nature]. This item would be a Minotaur's Battle Axe, which can be found in several areas of Norrath, including the Gorge of the great King Xorbb. Return to me with these, and I shall craft
for you a belt of fine quality.");
  }
  if ($text=~/personal nature/i) {
    quest::say("While it is common knowledge that the Kor refrain from the use of sharp edged implements of war, I do appreciate fine craftsmanship and so do my friends in the guard. It is to be a gift.");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 27427 =>1, 16542 =>1, 5017 =>1  )) {
    quest::say("Here you go $name!");
    quest::summonitem(51116);
    quest::ding();
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}