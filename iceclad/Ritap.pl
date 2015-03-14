sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Avast you! Ya best be shoving off if ye knows whats good for you. We be pirate raiders and ya best not be messing with the likes of us!");
    quest::settimer("ritap1", 2);
  }
  if ($text=~/tinkered rope/i) {
    quest::say("Batten down yer yapper! Ahl be doin the talking here. We be needin the rope to tie ye down fer ransom. Now fetch me the beard of a frost giant scout so's I can make some more rope to tie ye up with.");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::settimer("ritap2", 2)
  }
    # shawl signal
  elsif($signal == 101) {
    quest::say("Arrrrrrrrrrr!");
  } 
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30048 => 1)) {
    quest::say("Arg! By blubberbeards nostril! Ye'v done it!'");
    quest::emote("He braids the beard together into a sturdy rope.");
    quest::say("Now take this here rope and tie yerself up! Come lets go tell the cap'n we've captured us some prisoners!");
    quest::summonitem(30049);
    quest::faction(251, 30);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if ($timer eq "ritap1") {
    quest::stoptimer("ritap1");

    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();

    my $mobid = $entity_list->GetMobByNpcTypeID(110052);
    if ($mobid) {
      my $mobnpc = $mobid->CastToNPC();
      $mobnpc->SignalNPC(1);
    }
    else {
      my $ent = quest::spawn2(110052, 0, 0, $x-9, $y-1, $z, $h);
      my $mob = $entity_list->GetMobID($ent);
      my $mobnpc = $mob->CastToNPC();
      $mobnpc->SignalNPC(1);
    }
  }
  if ($timer eq "ritap2") {
    quest::stoptimer("ritap2");
    quest::say("The cap'n said PIRATES! Not parrots, ye knucklehead!");
    quest::emote("whacks the other raider upside the head.");
    quest::say("Now whar's the tinkered rope!?");
    quest::settimer("ritap3", 2);
  }
  if ($timer eq "ritap3") {
    quest::stoptimer("ritap3");
    my $mobid = $entity_list->GetMobByNpcTypeID(110052);
    if ($mobid) {
      my $mobnpc = $mobid->CastToNPC();
      $mobnpc->SignalNPC(2);
    }
    else {
      my $ent = quest::spawn2(110052, 0, 0, $x-9, $y-1, $z, $h);
      my $mob = $entity_list->GetMobID($mobid);
      my $mobnpc = $mob->CastToNPC();
      $mobnpc->SignalNPC(2);
    }
  }
}

# Quest by mystic414