###############################
#Zone: The Warrens
#Short Name: warrens
#Zone ID: 101
#
#NPC Name: an erudite prisoner
#NPC ID: 101068
#Quest Status: completed
#Modified by: Realityincarnate
###############################

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("angrily rattles his shackles.");
    quest::say("Damned Kobolds!! Some day I will return and these filthy warrens will be littered with their dog faced corpses! You wouldn't happen to have a key for these shackles would you?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6923 => 1)) {
    quest::say("I say we round up the Furballs AND the Dog Faces and let them kill each other off! Then we can easily finish off the survivors!");
    quest::exp(300);
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: warrens ID:101068 -- an_erudite_prisoner