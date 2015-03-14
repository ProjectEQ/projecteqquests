# Coldain Ring: Quest 4

my $flag = 0;

sub EVENT_SPAWN {
  $flag = 0;
  quest::settimer(1, 60);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");
  }
  if ($text=~/help/i && $flag == 0) {
    $flag = 1;
    quest::settimer(3, 600);
    quest::say("Thank Brell! I hear them approaching from just over that hill! Slay the leader, Ghrek, and give me his elixir.");
    my $mobid1 = quest::spawn2(116560, 0, 0, -2991, -4837, 229, 65);
    my $mobid2 = quest::spawn2(116030, 0, 0, -2991, -4815, 229, 65);
    my $mobid3 = quest::spawn2(116030, 0, 0, -2991, -4793, 229, 65);
    my $mobid4 = quest::spawn2(116030, 0, 0, -2991, -4859, 229, 65);
    my $mobid5 = quest::spawn2(116030, 0, 0, -2991, -4881, 229, 65);

    my $mob1 = $entity_list->GetMobID($mobid1);
    my $mob2 = $entity_list->GetMobID($mobid2);
    my $mob3 = $entity_list->GetMobID($mobid3);
    my $mob4 = $entity_list->GetMobID($mobid4);
    my $mob5 = $entity_list->GetMobID($mobid5);

    my $mobnpc1 = $mob1->CastToNPC();
    my $mobnpc2 = $mob2->CastToNPC();
    my $mobnpc3 = $mob3->CastToNPC();
    my $mobnpc4 = $mob4->CastToNPC();
    my $mobnpc5 = $mob5->CastToNPC();

    $mobnpc1->SaveGuardSpot(0);
    $mobnpc2->SaveGuardSpot(0);
    $mobnpc3->SaveGuardSpot(0);
    $mobnpc4->SaveGuardSpot(0);
    $mobnpc5->SaveGuardSpot(0);

    $mobnpc1->MoveTo(-2681, -4944, 150);
    $mobnpc2->MoveTo(-2703, -4920, 150);
    $mobnpc3->MoveTo(-2697, -4890, 150);
    $mobnpc4->MoveTo(-2707, -4950, 150);
    $mobnpc5->MoveTo(-2710, -4979, 150);

  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30139 => 1)) {
    $npc->SetAppearance(3);
  }

  if (plugin::check_handin(\%itemcount, 30138 => 1)) {
    quest::stoptimer(1);
    $npc->SetAppearance(0);
    quest::say("I will report your selfless actions when I return to Thurgadin. Take this for your troubles, friend. I hope you find it useful. Fare thee well.");
    quest::summonitem(30140);
    quest::settimer(2,15);

    # Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);
    quest::exp(80000);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {
    $npc->SetAppearance(3);
    quest::say("Ohhhh, someone... help, please...");
  }
  elsif ($timer == 2) {
    quest::depop_withtimer();
  }
  elsif ($timer == 3) {
    $flag = 0;
  }
}

sub EVENT_ATTACK {
  # In case he's attacked
  $npc->SetAppearance(0);
}

# Quest by mystic414

