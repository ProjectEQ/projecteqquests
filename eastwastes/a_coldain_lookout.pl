# Part of Coldain Ring 5 Quest

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30136 => 1)) {
    quest::shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
    my $entid = quest::spawn2(116570, 0, 0, -642, -2591, 190, 0);
    my $mob = $entity_list->GetMobID($entid);
    my $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);

    # Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49, 30);
    quest::faction(67, 30);
    quest::faction(188, -30);
    quest::faction(189, -30);
  }
}

# Quest by mystic414