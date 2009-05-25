sub EVENT_SAY {
  if(plugin::check_hasitem($client, 51116)) {
 if($text=~/hail/i) {
  quest::say("Well, well. You've made good use of this in the field, I see. Are those a few notches in the belt? Luckily all this wear and tear is repairable. I can reseal the leather and reinforce it with bone for improved protection if you like. Are you interested in [reinforcing] the belt?");
  }
  }
  if ($text=~/reinforcing/i) {
    quest::say("Splendid. I will require some supplies. Return to me with the girdle, a pouch of red powder from the goblins of Solusek's Eye, a belt from the gnolls of Split Paw, and a large kobold bone.");
  }
  elsif ($text=~/hail/i) {
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
  if (plugin::check_handin(\%itemcount, 1594 =>1, 2283 =>1, 51119 =>1, 51116 =>1 )) {
    quest::say("Let's get to work. First, we'll cure the belt in a paste made from the goblin's dust. While that does its magic, I will work arced slices of the bone into your leathery girdle. Ah, there we go. Lastly we weave the cured belt in, and it is complete!");
    quest::summonitem(51117);
  }
  
  plugin::return_items(\%itemcount);
}