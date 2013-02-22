sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Bless you. my friend!  We always welcome new converts into our Hall of Truth.  The righteous army of the twin deities must assemble.  The battle draws near.  The blessings of the Truthbringer are passed to all who are [devoted to truth].");
}
if($text=~/i am devoted to truth/i){
quest::say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer. but there is more work to do.");
 }

if ($faction <= 3) {
if ($text=~/i am devoted to truth/i) {
  quest::say("We have a great need to remove a few evil guards from the city.  Please bring me a token of your accomplishments.");
}
}
if ($faction <= 3) {
if ($text=~/true organizer/i) {
   quest::say("So you are ready to go after the person who makes our life hard.  Captain Hazran needs to be eliminated, bring me his head as proof of the deed.");
}
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13921 =>1 )) {
    quest::say("You have done well, it is time now to destroy the [true organizer].");
    quest::exp(5000);
    quest::faction( 184,3 );
    quest::faction( 258,3 );
    quest::faction( 48,-10 );
    quest::faction( 105,-10 );
  }
  if (plugin::check_handin(\%itemcount, 12142 =>1 )) {
    quest::say("Wonderful work!  You have done well and have made the city safer.");
    quest::exp(5000);
    quest::faction( 184,3 );
    quest::faction( 258,3 );
    quest::faction( 48,-10 );
    quest::faction( 105,-10 );
    quest::ChooseRandom(15560,15230,15219,15229,15222,15012);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8044 -- Jemoz_Lerkarson 

