sub EVENT_SAY {
   if($client->GetSkill(67) >= 151) {
     if ($text=~/please/i) {
       quest::summonitem(52156); # Item: Scored Silvery Key
     }
}
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}