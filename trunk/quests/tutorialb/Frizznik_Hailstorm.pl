#zone: tutorialb

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well hello there. The name's Frizznik and I'm in charge of finding food for the revolt. I've found more then enough rat meat to make steaks, so if you want to cook yourself some food, be my guest. Would you like to learn to cook [rat steaks]?");
  }
  if($text=~/rat steaks/i) {
    quest::say("It's not the greatest dish, but it'll have to do for now. Here's a nice rat sirloin for you and a jug of sauces.");
    quest::summonitem(59946); #Gloomingdeep Rat Meat
    quest::summonitem(59947); #Kobold Cooking Sauce
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}