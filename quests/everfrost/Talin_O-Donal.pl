sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13241 => 1)) { #Full Bottle of Elixir
    quest::say("Mmmm.. I feel much warmer. Thank you. You should now find Bryndin McMill. He could use a swig also. I saw him hanging around two other guards.");
    quest::ding();
    quest::exp(125);
    quest::faction(213,10); #Merchant's of Halas
    quest::faction(294,10); #Shaman of Justice
    quest::faction(311,10); #Steel Warriors
    quest::faction(361,10); #Wolves of the North
    quest::summonitem(13242); #3/4 Full Bottle of Elixir
  }
  else {
    quest::say("No thanks.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:everfrost  ID:30072 -- Talin_O`Donal