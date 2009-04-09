sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name.  Care to help the city?  Bring me four rat whiskers and I'll reward you with some spare coin.");  #adlib text
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13071 =>4 )) {
  quest::exp(25);
  quest::faction( 48,10 );
  quest::faction( 105,10 );
  quest::faction( 184,-10 );
  quest::faction( 258,-10 );
  quest::givecash(5,2,1,0);
    
  }
}