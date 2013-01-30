###############################
#Zone: The Warrens
#Short Name: warrens
#Zone ID: 101
#
#NPC Name: a captured erudite
#NPC ID: 101064
#Quest Status: completed
#Modified by: Realityincarnate
###############################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("bats her eye lashes seductively.");
    quest::say("I would be immensely pleased if someone would free me from these shackles.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6923 => 1)) {
    quest::say("I thank you for freeing me from my dog faced captors.");
    quest::exp(300);
    quest::depop_withtimer();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}