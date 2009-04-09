#Zone:hollowshade  ID:166011 -- Kerr_Tiparr

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Welcome to our humble outpost. traveller. Let me know if you see anything you need. I
 consider it an honor to sell here. for doing so enables Vah Shir in training to stay in the field.");
}

}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,5566=>1)){
   quest::say("Thanks $name!  That was delicious.  Here is the empty bowl.");
   quest::summonitem(5567);
}
plugin::return_items(\%itemcount);
}


#END of FILE Zone:hollowshade  ID:166011 -- Kerr_Tiparr
