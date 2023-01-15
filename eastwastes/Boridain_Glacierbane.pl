# Coldain Ring: Quest 2
# items: 30265, 30266, 30267

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello stranger, I am Boridain, master hunter of the Coldain. Glad to meet you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30265 => 1)) {
    quest::say("Say! This looks just like the axe my uncle uses. With this I can kill the beast for sure! Now please, be very quiet, I must track my prey. I won't return to Thurgadin without the hide of the rabid tundra kodiak!");
    $mobid = quest::spawn2(116191, 0, 0, 1547, -2459, 306.5, 0); # NPC: Boridain_Glacierbane
    $mob = $entity_list->GetMobID($mobid);
    $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);
    quest::depop_withtimer();
  }
  elsif (plugin::check_handin(\%itemcount, 30266 => 1)) {
    quest::say("Yes! I've done it! The vile beast is finally dead. I will at last be revered as the mighty hunter I am. Here is your axe back, I broke it on the killing blow. Take it as proof that you are a friend of the greatest hunter in the history of the Coldain!");
    quest::summonitem(30267); # Item: Broken Axe
    quest::exp(5000);
  }
}

my $nap = 0;
my $ks = 0;

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 5) {
    quest::say("Boy, all this hunting sure does make ya hungry! Time for a snack.");
    $npc->SetAppearance(1);
  }
  elsif ($wp == 12) { #loc 1286 -1786 175
    if ($nap == 0) {
      quest::emote("yawns.");
      quest::say("All this tracking is makin me mighty sleepy. Time for a little nap. You keep a lookout.");
      $npc->SetAppearance(3);
      $nap = 1;
    } else {
      quest::say("Back to that nap.  You keep a lookout.");
      $npc->SetAppearance(3);
    }
  }
  elsif ($wp == 17 && $ks == 0) {  #loc 1530 -2491 306
    $ks = 1;
    quest::say("Who am I kidding, I'm no hunter. I'll never be a hunter. I may as well give up and become a miner like dad.");
    $npc->SetAppearance(1);
    $kodiak = quest::spawn2(116545, 231, 0, 1559, -2304, 313, 251); # NPC: Rabid_Tundra_Kodiak
    $mob = $entity_list->GetMobID($kodiak);
    $mobnpc = $mob->CastToNPC();
    $mobnpc->MoveTo(1530, -2491, 306);
    quest::settimer(2,300);
  }
}

sub EVENT_WAYPOINT_DEPART {
  if ($wp == 0) { #loc 1760 -2468 192
    quest::say("Hmmm, fresh prints. They're HUGE! This must be it! This hunting stuff is easier than I thought.");
  }
  elsif ($wp == 3) { #loc 2902 -1770 146
    quest::pause(5);
    quest::say("Hmm, that wasn't him. Let's see now, if I were a rabid tundra beast where would I go? This way!");
  }
  elsif ($wp == 6) { #loc 973 -1131 212
    $npc->SetAppearance(0);
    quest::say("Ahh, that's better. Back to the hunt... I think I hear something over yonder. Stay low.");
  }
  elsif ($wp == 9) { #loc 277 -6 -5
    quest::say("Where did that vile beast go now? Wait, what's that over there? Could it be? Only one way to find out!");
  }
  elsif ($wp == 12) { #loc 1286 -1786 175
    $npc->SetAppearance(0);
    $npc->SetHP($npc->GetMaxHP());
    quest::emote("stretches.");
    quest::say("Ahh, refreshing! Back to work... I think I smell the beast! This way.");
  }
  elsif ($wp == 15) {  #loc 424 -3464 145
    quest::say("I just don't get it. I thought that was him for sure. I don't see any sign of him now.");
  }
  elsif ($wp == 17) {  #loc 1530 -2491 306
    $npc->SetAppearance(0);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::stoptimer(1);
    quest::start(271);
  }

  if ($timer == 2) {
    quest::depop_withtimer();
  }
}

sub EVENT_SIGNAL {
  # We just got the signal to get moving
  quest::settimer(1,3);
}

sub EVENT_AGGRO {
  # In case he's aggroed while sitting/sleeping
  $npc->SetAppearance(0);
}

# Quest by mystic414
