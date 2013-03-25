# Test of Illusion - enchanter epic - Snow Blossoms
# 

sub EVENT_SAY {
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10629 => 1)) {
    quest::say("Brokk sorry, me no smush Bozlum's perty garden on purpose. Me felt bad and me too shy to go tell Boz Brokk sorry. Umm....go give her these perty flowers. Dem smell good and maybe make Bozlum feel better.");
    quest::summonitem(10630);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: oggok ID: 49061 NPC: Brokk_Boxtripper

