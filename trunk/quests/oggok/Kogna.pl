sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You be tinking you be [real tuff Craknek]?");
}
if($text=~/i am a real tuff craknek/i){
quest::say("Me not tinking so. but maybe me wrongs.. no.. me neber wrongs.  You no tuff. only liddle Craknek is you.  You tink you be tuff Craknek. you bringed me four lizard meats.  Me like lizard meats.  You no tuff.  You bringed me lizard meats.  I make you tuffer Craknek.  Me bestest Craknek."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49041 -- Kogna 
