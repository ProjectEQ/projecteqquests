sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Beware these woods! The sarnak claim this land as their own and wicked creatures walk beneath the burning foliage.");
  }
}

sub EVENT_ITEM {
  # 28056 :  Ornate Sea Shell
  if (plugin::check_handin(\%itemcount,28056=>1)) {
    quest::say("Praise the Triumvirate! Natasha sent you just in time! Those twisted sarnak summoners are summoning Ixiblat Fer as we speak! We must stop Ixiblat Fer while he is still weak or all of Norrath may be set aflame! Please do me one more favor, should I perish to this beast of fire. Give this note to Natasha when you next see her, and if you should perish and I survive, I will make sure the waters never forget your reflections of your deeds this day.");
    quest::summonitem(28052); # 28052  Message to Natasha
    quest::unique_spawn(87151,0,0,1500,-2000,-300); # Ixiblat Fer, kill him, loot scepter of I.F.
    $npc->Depop(1);
  }

  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:burningwood  NPC:87002 -- Naxot_Deepwater