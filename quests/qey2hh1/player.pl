#BeginFile: qey2hh1\player.pl
#Quest file for Adventurer's Stone
#Quest file for West Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer}))) {
    $client->Message(15, "A mysterious voice whispers to you, 'Melaara Tenwinds has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
}

sub EVENT_LOOT {
  if(($looted_id == 26896) && plugin::check_hasitem($client, 11430) && plugin::check_hasitem($client, 14344) && plugin::check_hasitem($client, 22892)) { #All 4 Paladin Heads
    $client->Message(15,"With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
  }
}
#EndFile: qey