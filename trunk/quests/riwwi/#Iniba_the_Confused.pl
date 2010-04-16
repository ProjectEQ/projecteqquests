sub EVENT_SAY {
   if($client->GetSkill(67) >= 152) {
     if ($text=~/please/i) {
       quest::summonitem(52156);
     }
}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}