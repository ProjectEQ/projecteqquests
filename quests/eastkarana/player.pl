#BeginFile: eastkarana\player.pl
#Quest file for East Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_LOOT {
  if(($looted_id == 11430) && plugin::check_hasitem($client, 26896) && plugin::check_hasitem($client, 14344) && plugin::check_hasitem($client, 22892)) { #All 4 Paladin Heads
    $client->Message(15,"With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
  }
}
#EndFile: eastkarana\player.pl