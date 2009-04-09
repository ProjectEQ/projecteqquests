sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. friend! I am Gallin Woodwind of the Emerald Warriors. It is my charge to send forth Fier'Dal to [hunt for meat]. Kelethin's citizens must be nourished and this requires meat. Such is the circle of life.");
}
if($text=~/i want to hunt for meat/i){
quest::say("Good!!  We have enough young warriors hunting in our woods. Your duty shall be to take this pack to the ocean and seek out sharks. Fill the bag with shark meat and combine it. I shall reward you with a fine piercing weapon."); 
quest::summonitem(17953);
  }
}

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount,  12121=> 1)) {
quest::say("Very good. This meat will supply our warriors with much strength. We have found the meat from sharks to be quite nourishing. Here, then, are your wages and your weapon. All of Kelethin appreciates your great deed.");
   quest::faction( 92, 10);
   quest::faction( 155, -10);
   quest::faction( 212, 10);
   quest::faction( 174, 10);
   quest::exp(150);
   quest::givecash(0,7,0,23);
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54102 -- Gallin_Woodwind 
