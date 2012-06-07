sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 5) {
    quest::say("I would like an Erudian tart, please.");
    quest::signal(1110,1)
  }
  if($wp == 8) {
    quest::say("Time in the pub shall keep them from advancing to the next level of the mind. When will they learn?");
  }
  if($wp == 26) {
    quest::say("A magnificent piece of workmanship! The clock, too.");
  }
}

sub EVENT_SIGNAL {
  quest::say("Just get me the tart and put your eyes back in your sockets or I'll pry them out for good!");
}



sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings! Nice to meet someone with manners. I do not see how you people stand to live in this madhouse of ruffians. I would have left weeks ago if I were not waiting for a delivery. Oh, well. Nice to have met you.");
  }
  if ($text=~/delivery/i) {
    quest::say("I am in Qeynos to meet up with a fellow Erudite coming from Freeport. He is two weeks late and I fear the worst. I shall need to hire some lackey to go to Freeport to find him.");
  }
  if ($text=~/i will find him/i) {
    quest::say("Yes, that might work. Please go to Freeport and find him. His name is Palatos Kynarn. Tell him that Danaria has sent you for the painting. And be quick about it! Thank you.");
  }
}
  
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);  
}