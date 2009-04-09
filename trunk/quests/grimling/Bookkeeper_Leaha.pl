sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Well met, friend.  May I be of assistance?"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6219 =>1 )) {
    quest::say("What's this? Why was Kuash unable to bring this to me himself? Oh, never mind... he's not worth the aggravation at this point. Run this report to Hollowshade and have Guard Kliknaw sign it as well. Then take it back to whomever you got it from... and tell that particular whomever to stop slacking. It's not proper for a citizen to act like that... let alone a Khala Dun.");
    quest::summonitem(6220);
    quest::emote("sighs");
    quest::faction( 348,10 );
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:grimling  ID:167129 -- Bookkeeper_Leaha 

