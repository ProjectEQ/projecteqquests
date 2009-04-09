#Zone: The Warrens
#Short Name: warrens
#Zone ID: 101
#
#NPC Name: a captured erudite
#NPC ID: 101064
#Quest Status: completed
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("bats her eye lashes seductively.");
    quest::say("I would be immensely pleased if someone would free me from these shackles.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6923 == 1)) {
    quest::say("I thank you for freeing me from my dog face captors.");
    quest::depop();
    quest::exp(300);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: warrens ID:101064 -- a_captured_erudite

