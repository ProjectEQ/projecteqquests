# Coldain Ring: Quest 2

my $boridain = 0;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello stranger, I am Boridain, master hunter of the Coldain. Glad to meet you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30265 => 1)) {
    quest::say("Say! This looks just like the axe my uncle uses. With this I can kill the beast for sure! Now please, be very quiet, I must track my prey. I won't return to Thurgadin without the hide of the rabid tundra kodiak!");
    $mobid = quest::spawn2(116191, 0, 0, 1547, -2459, 306.5, 0);
    $mob = $entity_list->GetMobID($mobid);
    $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);
    quest::depop();
  }
  elsif (plugin::check_handin(\%itemcount, 30266 => 1) && ($boridain == 18)) {
    quest::say("Yes! I've done it! The vile beast is finally dead. I will at last be revered as the mighty hunter I am. Here is your axe back, I broke it on the killing blow. Take it as proof that you are a friend of the greatest hunter in the history of the Coldain!");
    quest::summonitem(30267);
    quest::exp(1000);
  }
}

sub EVENT_WAYPOINT {
  $npc->SaveGuardSpot(0);

  if ($boridain == 0) {
    $boridain = 1;
    quest::moveto(1760, -2468, 192);
  }

  elsif ($boridain == 1) { #loc 1760 -2468 192
    quest::say("Hmmm, fresh prints. They're HUGE! This must be it! This hunting stuff is easier than I thought.");
    $boridain = 2;
    quest::moveto(2325, -2134, 185);
  }

  elsif ($boridain == 2) {
    $boridain = 3;
    quest::moveto(2902, -1770, 148.5);
  }

  elsif ($boridain == 3) { #loc 2902 -1770 146
    quest::settimer(1,5);
  }

  elsif ($boridain == 4) {
    $boridain = 5;
    quest::moveto(973, -1131, 216);
  }

  elsif ($boridain == 5) { #loc 973 -1131 212
    quest::say("Boy, all this hunting sure does make ya hungry! Time for a snack.");
    $npc->SetAppearance(1);
    quest::settimer(1,120);
  }

  elsif ($boridain == 6) {
    $boridain = 7;
    quest::moveto(672, -579, 163);
  }

  elsif ($boridain == 7) {
    $boridain = 8;
    quest::moveto(436, -215, 90);
  }

  elsif ($boridain == 8) {
    $boridain = 9;
    quest::moveto(277, -6, -5);
  }

  elsif ($boridain == 9) { #loc 277 -6 -5
    quest::settimer(1,5);
  }

  elsif ($boridain == 10) {
    $boridain = 11;
    quest::moveto(564, -1040, 197);
  }

  elsif ($boridain == 11) {
    $boridain = 12;
    quest::moveto(1286, -1786, 175);
  }

  elsif ($boridain == 12) { #loc 1286 -1786 175
    quest::emote("yawns.");
    quest::say("All this tracking is makin me mighty sleepy. Time for a little nap. You keep a lookout.");
    $npc->SetAppearance(3);
    quest::settimer(1,120);
  }

  elsif ($boridain == 13) {
    $boridain = 14;
    quest::moveto(519, -3151, 200);
  }


  elsif ($boridain == 14) {
    $boridain = 15;
    quest::moveto(424, -3464, 145);
  }

  elsif ($boridain == 15) {  #loc 424 -3464 145
    quest::settimer(1,5);
  }

  elsif ($boridain == 16) {
    $boridain = 17;
    quest::moveto(1530, -2491, 306);
  }

  elsif ($boridain == 17) {
    $boridain = 18;
    quest::moveto(1513, -2503, 309);
  }

  elsif ($boridain == 18) {  #loc 1530 -2491 306
    quest::say("Who am I kidding, I'm no hunter. I'll never be a hunter. I may as well give up and become a miner like dad.");
    $npc->SetAppearance(1);
    $kodiak = quest::spawn2(116545, 231, 0, 1559, -2304, 313, 125.5);
    $mob = $entity_list->GetMobID($kodiak);
    $mobnpc = $mob->CastToNPC();
    $mobnpc->MoveTo(1530, -2491, 306);
    quest::settimer(2,300);
  }

}

sub EVENT_TIMER {

  if ($timer == 1) {
    quest::stoptimer(1);
  }

  if ($timer == 2) {
    quest::depop();
  }

  if ($boridain == 0) {
    quest::moveto(1601, -2440, 315);
  }

  elsif ($boridain == 3) { #loc 2902 -1770 146
    quest::say("Hmm, that wasn't him. Let's see now, if I were a rabid tundra beast where would I go? This way!");
    $boridain = 4;
    quest::moveto(1942, -1497, 211);
  }

  elsif ($boridain == 5) { #loc 973 -1131 212
    $npc->SetAppearance(0);
    quest::say("Ahh, that's better. Back to the hunt... I think I hear something over yonder. Stay low.");
    $boridain = 6;
    quest::moveto(929, -1049, 218);
  }

  elsif ($boridain == 9) { #loc 277 -6 -5
    quest::say("Where did that vile beast go now? Wait, what's that over there? Could it be? Only one way to find out!");
    $boridain = 10;
    quest::moveto(350, -264, 78);
  }

  elsif ($boridain == 12) { #loc 1286 -1786 175
    $npc->SetAppearance(0);
    quest::emote("stretches.");
    quest::say("Ahh, refreshing! Back to work... I think I smell the beast! This way.");
    $boridain = 13;
    quest::moveto(946, -2245, 205);
  }

  elsif ($boridain == 15) {  #loc 424 -3464 145
    quest::say("I just don't get it. I thought that was him for sure. I don't see any sign of him now.");
    $boridain = 16;
    quest::moveto(857, -3150, 230);
  }

}

sub EVENT_SIGNAL {
  # We just got the signal to get moving
  $boridain = 0;
  quest::settimer(1,3);
}

sub EVENT_AGGRO {
  # In case he's aggroed while sitting/sleeping
    $npc->SetAppearance(0);
}

# Quest by mystic414