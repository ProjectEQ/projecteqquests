#zone: tutorialb
#Angelox
#rewrite by site3op

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there $name. The name's Frizznik and I'm in charge of making food for the revolt. Most of what I make starts with the basics. I don't have the time to make the basic items and the final products. Let me know if you are interested in [assisting] me with making dough.");
  }
  if($text=~/assisting/i) {
    quest::emote("eyes you up and down.");
    quest::say("Make sure you buy a mixing bowl and come see me when you are [ready].");
  }
  if($text=~/ready/i) {
    if (!defined($qglobals{frizznik})) {
      quest::say("Good enough. Now, combine these ingredients in your mixing bowl and return to me all the clumps of dough you can. If you give me four clumps of dough, I'll reward your assistance.");
      quest::summonitem(13087,20);
      quest::summonitem(13193,20);
      quest::summonitem(13088,20);
      quest::setglobal("frizznik",1,0,"D60");
    }
    else {
     quest::say("I'm sorry, but the boss has instructed me to hand out the items only once per player!");
    }
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13090 => 4) && defined($qglobals{frizznik}) && ($qglobals{frizznik} == 1)) {
    quest::say("I appreciate your assistance in getting everyone fed. Please take this as a small token of my eternal appreciation.");
    quest::summonitem(3395);
    quest::setglobal("frizznik",2,0,"D60");
  }
  else { 
      plugin::return_items(\%itemcount); 
  }
}