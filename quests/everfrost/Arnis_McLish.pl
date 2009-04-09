sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("My word!! I cannot believe how cold it is out here. I must keep running around just to keep warm.");
  }
  if($text=~/where is megan/i){
quest::say("I heard she got lost on the plains. You should go ask her dog, Snowflake, where she is. I hear she is somewhere around the pass to Halas.");
  }
}

sub EVENT_ITEM {
  # 13243 :  One Half Bottle of Elixir
  if ($itemcount{13243} == 1){
    quest::say("Mmmm.. Thank you stranger. I feel a lot warmer now. You should now go and find [Megan] O'Reilly.");
    quest::exp(125);
    quest::faction(213,1); # 213 : Faction Merchant's of Halas
    quest::faction(294,1); # 294 : Faction Shaman of Justice
    quest::faction(311,1); # 311 : Faction Steel Warriors
    quest::faction(361,1); # 361 : Faction Wolves of the North
    quest::summonitem(13244); # 13244 :  One Quarter of Elixir
  }
}

#END of FILE Zone:everfrost  ID:30049 -- Arnis_McLish

