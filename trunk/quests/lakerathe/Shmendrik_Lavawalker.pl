# EPIC CLERIC

sub EVENT_DEATH {
  # he will be killed probably by Natasha Whitewater.
  # eqcastersrealm say that the player can also kill him, not important as long as he dies
  quest::signalwith(51138,599,2000);
}


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, good $name!! Be wary near the waters of Lake Rathe! The Riptide goblin king, Lord Bergurgle, has been commanding his minions to murder and rob all who come near it! I am here seeking his death but I am afraid I am no match for all of his subjects. I shall reward you greatly for the death of Lord Bergurgle. I simply ask that you bring me his crown as proof.");
  }
}

sub EVENT_ITEM {
  # 28044 :  Lord Bergurgle's Crown
  if (plugin::check_handin(\%itemcount,28044=>1)) {
    quest::emote("shoves the crown into a scorch marked leather satchel and cackles uncontrollably as madness twists his features and flames dance in his eyes. 'You, $name, have reduced the Riptides into chaos! Without a king to keep them in control they will ravage the settlements surrounding this lake! After the slaughter I shall return and easily burn the remainder of the villages and fishing shanties to the ground! None shall escape the fires of the Tyrant!!'");
    quest::summonitem(28045); # 28045  Oil of Fennin Ro
    quest::spawn2(51138,0,0,111,3627.3,51,192.4);

    #my $entid=quest::unique_spawn(51138,0,0,111,3627.3,51,192.4); # Natasha Whitewater, spawns in the hut nearby (loc to be adjusted)
    #my $mob=$entity_list->GetMobID($entid);
    #my $mobnpc=$mob->CastToNPC();
    #$mobnpc->AddToHateList($npc,1); # she attacks Shmendrik
  }

  plugin::return_items(\%itemcount); # return unused items
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::say("I'll slay you like I slaughtered your fellow missionaries! The Triumvirate can not decide the fate of a follower of the Tyrant!!");
    quest::signalwith(51138,199,2000);
  }
  if ($signal == 299) {
    quest::signalwith(51138,399,2000);
  }
  if ($signal == 499) {
    $natasha = $entity_list->GetMobByNpcTypeID(51138);
    if ($natasha) {
      $getshmend = $natasha->CastToNPC();

      $getshmend->AddToHateList($npc, 1);
    }
  }
}

#End of File, Zone:lakerathe  NPC:51012 -- Shmendrik_Lavawalker

