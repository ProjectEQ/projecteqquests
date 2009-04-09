sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Brrrrrr!! Grr.. Grreetings. It is freezing out here!!");
  }
}

sub EVENT_ITEM {
  # 13241 :  Full Bottle of Elixir
  if ($itemcount{13241} == 1){
    quest::say("Mmmm.. I feel much warmer. Thank you. You should now find Bryndin McMill. He could use a swig also. I saw him hanging around two other guards.");
    quest::exp(125);
    quest::faction(213,10); # 213 : Faction Merchant's of Halas
    quest::faction(294,10); # 294 : Faction Shaman of Justice
    quest::faction(311,10); # 311 : Faction Steel Warriors
    quest::faction(361,10); # 361 : Faction Wolves of the North
    quest::summonitem(13242); # 13242 :  3/4 Full Bottle of Elixir
  }
}

#END of FILE Zone:everfrost  ID:30074, 30118, 30129 -- Talin_O`Donal

