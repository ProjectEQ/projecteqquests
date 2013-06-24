##Brewworks familiar from Station Store. Converts water flasks to ale.##

sub EVENT_SPAWN{
   quest::say("Brewworks Unit ready to convert Water Flasks to Ale, Master.");
}

sub EVENT_ITEM{
   if(plugin::check_handin(\%itemcount, 13006 => 1)){
      quest::say("Ale brewed, Master.");
      quest::summonitem(13039);
   }
    plugin::return_items(\%itemcount);
}