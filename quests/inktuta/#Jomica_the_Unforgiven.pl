sub EVENT_SPAWN {
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
     }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("inktutalockout", 1, "H108", 295065, $charid, 295);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It's so ironic. My furthest distant memory is a dream of finding this ancient sentinel and now that I've found it, there is no point. The only thing worse than realizing that I've been living in an illusion, unaware that we died long ago, is . . . The knowledge that we will slip back into the endless routine again. I can feel my lucidity slipping away even now. It's only a matter of time before . . . we haunt this place as if you had never arrived. Before I lose myself again, allow me to offer you something that may help . . .");
    quest::say("I notice that you are not afraid to face the consequences of your actions, but you will also pursue the non-violent solution if such a thing is possible. This ancient cloak should suit you well. Tell me if you wish to [receive the reward] for your actions. I only have one to offer, so select the recipient wisely.");
  }
  if ($text=~/receive the reward/i) {
    $check_named = $entity_list->GetMobByNpcTypeID(296067);
    $check_named = $entity_list->GetMobByNpcTypeID(296072);
      if($check_named == 0) {
         quest::say("I'm afraid I have nothing else to offer. See to the sentinel if you have not already.");
         quest::spawn2(296067,0,0,-63,-600,-127,128);  #an ancient sentinel
         quest::spawn2(296072,0,0,5,-654,-127,175);  #pile of bones
      }
   }
}