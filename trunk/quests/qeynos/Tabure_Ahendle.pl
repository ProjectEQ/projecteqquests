sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!  You don't look completely useless however.  You may be able to [assist] me.");
}
if($text=~/i am a member of the steel warriors/i){
quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild."); }

if ($text=~/something else/i) {
quest::say("I had an apprentice who decided to explore the islands in Erud's Crossing.  The boy was a fool, but he had a map with him that I need recovered.  Find my map and I may have something for you");#Text added by quest writer, insert correct text if known.  
}
if ($text=~/assist/i) {
quest::say("I need a rug for my home, I want this rug to be made from Kobold hides.  You can do me a favor and fetch me some hides so that I can make the rug.  4 should be sufficient.  You can find the runts around Erudin.  Do this and I may have something for you.");#text added by quest writer.
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13423 => 1)) {
    quest::say("By Strongbear you found it!  Well I guess I did promise you something.  Here you go $name.");#more invented text.
    quest::summonitem(5082);
    quest::faction( 135, 10);
    quest::faction( 184, 10);
    quest::faction( 311, 10);
    quest::faction( 53, -15);
    quest::faction( 105, -15);
    quest::exp(500);
    quest::givecash(0,0,3,2);    
  }
  
  if (plugin::check_handin(\%itemcount, 13424 => 4)) {
  quest::say("Yes these will do nicely, I was right you are not completely worthless.  Here I found some old armor you can have. I may have [something else] for you to do as well.");
    quest::faction( 135, 5);
    quest::faction( 184, 5);
    quest::faction( 311, 5);
    quest::faction( 53, -5);
    quest::faction( 105, -5);
    quest::ChooseRandom(2112, 2106, 2111, 2108, 2104);
    quest::givecash(0,4,0,0);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);

}
#END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle 
