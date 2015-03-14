sub EVENT_ITEM {
  if ($faction<=5) { # you must be indiff, or invisible
    # 29855 :  Replacement Records
    if (plugin::check_handin(\%itemcount,29855=>1)) {
      quest::summonitem(29856); # 29856  Original Records
      quest::emote("slams shut after you take the original records out.");
      # the chest spawns Guard Hargrar
      $guardhargrar = quest::spawn2(159687,0,0,$x,$y,$z,$h);
      $attack = $entity_list->GetMobID($guardhargrar);
      $gogetem = $attack->CastToNPC();
      $gogetem->AddToHateList($client, 1);
    }
    plugin::return_items(\%itemcount); # return unused items
  } else { # not at least indiff, he will say this
    quest::say("I will do nothing to aid beings like you.");
  }
}

#End of File, Zone:sseru  NPC:159420 -- A_File_Cabinet

