##Brewworks familiar from Station Store. Converts water flasks to ale.##
# items: 13006, 13039

sub EVENT_SPAWN{
   quest::say("Brewworks Unit ready to convert Water Flasks to Ale, Master.");
}

sub EVENT_ITEM{
   if(plugin::check_handin(\%itemcount, 13006 => 1)){
      quest::say("Ale brewed, Master.");
      quest::summonitem(13039); # Item: Ale
   }
    plugin::return_items(\%itemcount);
}