sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hey there stranger, pleased to meet you. I'm Ruru, I do the cooking around here. I'm the best cook around these parts. So, if you get hungry, you'd best be making sure you're coming to see me.");
    quest::signalwith(114467,3,1); #Grudash the Baker
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Hah! Whatever Grudash. You know that my Roasted Walrus in Plum Sauce is better. You just don't want to admit it.");
    quest::signalwith(114467,1,1); #Grudash the Baker
  }
  if($signal == 2) {
    quest::say("Just you wait, just you wait! One of these days Grudash, you'll see.");
    quest::signalwith(114467,2,1); #Grudash the Baker
  }
  if($signal == 3) {
    quest::say("Bah!");
  }
  if($signal == 4) {
    quest::emote("grumbles, 'Bah, this still doesn't settle anything Grudash. This stranger obviously has no taste for fine cuisine.'");
  }
  if($signal == 5) {
    quest::emote("laughs, 'Don't get me started. You know that my cuisine Is prefered over yours two to one.'");
  }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Ruru_the_Cook