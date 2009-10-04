sub EVENT_SPAWN {
  quest::settimer("depop", 1800); #Depop in 30 minutes
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I do not desire any company other than my bodyguards. Be off!!");
  }
}

sub EVENT_ITEM {
  quest::say("I do not want that.");
  plugin::return_items(\%itemcount);
}

sub EVENT_ATTACK {
  quest::say("You have made a big mistake choosing to battle a high member of the Circle of Unseen Hands. Now you shall pay!!");
}

sub EVENT_DEATH {
  quest::say("Big mistake, my friend!! The Circle of Unseen Hands shall surely find and cut you down for the death of the nephew of Renux Herkanon. My bodyguards will be waiting for you!!");
  quest::signal(6186,0);
  quest::signal(6187,0);
  quest::stoptimer("depop");
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::signal(6186,0);
  quest::signal(6187,0);
  quest::depop();
}