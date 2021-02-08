#BeginFile: northkarana\player.pl
#Quest file for Luclin Spires
#Quest file for North Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_ENTERZONE {
  quest::settimer("spires",10);
  $qglobals{nexus} = undef;
  $qglobals{spire_nk} = undef;
  $qglobals{message_nk} = undef;
  if ($class eq "Bard" || $class eq "Rogue") {
    if (plugin::check_hasitem($client, 52355) && !plugin::check_hasitem($client, 52359)) { #Shakey's Dilapidated Noggin, Radiant Azure Lightstone
      quest::unique_spawn(13123, 109, 0, 0, 0, -8); #Flighty_Azure_Wisp
      $client->Message(15, "Out of the corner of your eye, you catch a glimpse of a brightly colored wisp as it darts by. It's moving at an incredible speed.");
    }
  }
}

sub EVENT_TIMER {
  if (defined $qglobals{nexus} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && plugin::check_hasitem($client, 19720)) {
    quest::selfcast(2433); #self only to avoid AE
    quest::setglobal(spire_nk,0,1,"F");
    quest::delglobal(message_nk);
    $client->NukeItem(19720); #removes stone from inventory.
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
  elsif (defined $qglobals{nexus} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && !defined $qglobals{message_nk} && !plugin::check_hasitem($client, 19720)) {
    $client->Message(15,"You don't have the correct component to travel to Luclin.");
    quest::setglobal(message_nk,1,1,"M20"); #prevent component mssage from being spammed.
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
  elsif (defined $qglobals{nexus_nk} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && defined $qglobals{message_nk} && !plugin::check_hasitem($client, 19720)) {
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
}

sub EVENT_LOOT {
  if(($looted_id == 14344) && plugin::check_hasitem($client, 26896) && plugin::check_hasitem($client, 11430) && plugin::check_hasitem($client, 22892)) { #All 4 Paladin Heads
    $client->Message(15,"With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
  }
  if ($class eq "Ranger" && $looted_id == 62604) {
    if (defined $qglobals{ranger_epic15_pre} && $qglobals{ranger_epic15_pre} ne "8") {
      return 1;
    }else{
      return 0;
    }
  }
}
#EndFile: northkarana\player.pl
