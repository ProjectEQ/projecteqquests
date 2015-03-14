sub EVENT_SAY {
  if ($text=~/hobby/i) {
    quest::say("I used to collect rare coins and gems. I came to Firiona Vie to do just that, but I never have the time to [collect rare coins] when I am always here working.");
  }
  if ($text=~/collect rare coins/i) {
    quest::say("If you want to help, you can begin by replacing my prized Star of Odus which was taken from my vault when I stepped out to dine. Do so, and I may trust you to collect coins. I will also reward you with an item a composer left here.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84120 -- Wellford_Fargin