sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, friend. My name is Joffrey. I'm trying to learn to play the [flute].  I'm also working on a new song I learned while I was visiting [Kelethin].");
}
if($text=~/what kelethin/i){
quest::say("I just got back from a trip to Faydwer. I was over there studying the lore of Tunare, in the beautiful elven city of Kelethin. I highly recommend visiting there as soon as you get a chance."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1131 -- Joffrey_Clay 
