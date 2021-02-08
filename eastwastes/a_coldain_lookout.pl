# Part of Coldain Ring 5 Quest
# items: 30136

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30136 => 1)) {
    quest::shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
    my $entid = quest::spawn2(116570, 0, 0, -642, -2591, 190, 0); # NPC: ringfivecoord
    my $mob = $entity_list->GetMobID($entid);
    my $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);

    # Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(406, 30); # Faction: Coldain
    quest::faction(405, 30); # Faction: Dain Frostreaver IV
    quest::faction(419, -30); # Faction: Kromrif
    quest::faction(448, -30); # Faction: Kromzek
  }
}

# Quest by mystic414
