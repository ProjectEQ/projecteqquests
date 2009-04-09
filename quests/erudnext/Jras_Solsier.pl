sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Temple of Divine Light.  We are the Peacekeepers. followers of Quellious.  If you are a paladin of this temple. you can assist us by showing a desire to [protect the peace].");
}
if($text=~/i desire to protect the peace/i){
quest::say("It was a fine decision.  We are in need of your services.  It seems there is a disturbance in Toxxulia Forest.  There are poachers from other nations who have sought to cause turbulence among the creatures there.  Will you help us [catch the poachers] or are you skeptical about this mission?");
}
if($text=~/i will help you to catch the poachers/i){
quest::say("The infidels are in Toxxulia Forest.  They have begun hunting the kobolds.  We have no love of the kobolds. but cannot allow the lands of Odus to be overrun by outsiders.  The ways of tranquility are balanced with harmony.  We will not allow chaos to take hold of our land.  Go and find these poachers.  Bring me their heads!!"); }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13825 => 1)) {
  quest::say("You have served us well. The harmony of the forest shall be preserved. I have word that theses infidels were all working for one man. Find me evidence pertaining to this man. Surely one of these poachers has something which could aid in finding this man. We must stop him to stop the poachers. Go in peace.");
  quest::summonitem(10004);
  quest::faction( 247, 20);
  quest::faction( 145, 20);
  quest::faction( 143, -20);
}
if (plugin::check_handin(\%itemcount, 13913 => 1)) {
  quest::say("You found the man?  That is excellent work, young Paladin, here take this for your trouble and we thank you once again.");
  quest::summonitem(15011);
  quest::faction( 247, 20);
  quest::faction( 145, 20);
  quest::faction( 143, -20);
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnext  ID:98041 -- Jras_Solsier 
