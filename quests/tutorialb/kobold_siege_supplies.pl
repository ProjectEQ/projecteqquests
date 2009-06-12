#zone: tutorialb
#npc: kobold siege supplies
#
#Quest turn in for 'Sabotage' - taskid:31
#- makeshift lantern bomb (id:86011)
#

sub EVENT_ITEM {
   if (quest::istaskactivityactive(31,0) && plugin::check_handin(\%itemcount, 86011 => 1)) {
      quest::updatetaskactivity(31,0);
      quest::exp(200);
      quest::ding();
      # missing explosion emotes:
      # The fuse has been set.  -----------x
      # The fuse burns shorter.  ------x
      # The fuse burns shorter.  --x
      # A deafening blast rips throughout the cavern as the kobold supplies explode into a ball of fire.
      #
      # There should be a zone wide shaking, to go with the deafening blast emote.
   }
   else
   {
      plugin::return_items(\%itemcount);
   }
} 