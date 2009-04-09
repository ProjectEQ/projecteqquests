sub EVENT_SAY {
  if($text=~/hail/i){
    quest::me("Captain Rottgrime has numerous cracks and holes in his skull from many battles.");
    quest::say("Attention marine!! You will go into battle and fear nothing. You shall prevail and then you shall be sent back into battle. We [shall not allow those sarnak to overtake the Danak Shipyards]. Is that clear marine?!!");
  }
  elsif($text=~/shall not allow those sarnak to overtake the danak shipyards/i){
    quest::say("Stand up straight!! That is correct marine!! You shall not allow the sarnak to overtake the shipyards!! Head out to the frontlines marine. Kill the berzerkers and return their war braids to me. For every four, you shall earn your wages. Now get to the front marine!! Move it!! Move it!!");
  }
}

sub EVENT_ITEM {
 #Handin: 4x a Sarnak War Braid (12982)
  if(plugin::check_handin(\%itemcount, 12982 => 4)){
    quest::say("Great job marine!! Word of your heroics shall be passed on to the Admiral. If you don't have a shield then take one, if you do then get back to the frontlines. There is no time for R n R!! Move it marine!! Or you'll be pushing Danak till the cockatrice crow!!");
    quest::summonitem(12981); #Guard of the Marines
    quest::faction(353,10); # +Venril Sathir
    quest::exp(10);
    quest::givecash(0,0,1,0);
  }
  plugin::return_items(\%itemcount);
}


#Quest: Protect the Shipyard (Submitted By: Senzo)

