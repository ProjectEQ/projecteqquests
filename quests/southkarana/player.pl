#BeginFile: southkarana\player.pl
#Quest file for South Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_LOOT {
  if(($looted_id == 22892) && plugin::check_hasitem($client, 26896) && plugin::check_hasitem($client, 14344) && plugin::check_hasitem($client, 11430)) { #All 4 Paladin Heads
    $client->Message(15,"With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
  }
}
#EndFile: southkarana\player.pl