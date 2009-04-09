sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What!!? You [Craknek] or you [pest]?");
}
if($text=~/i am craknek/i){
quest::say("Good. Me not bash you.  You help Horgus and Crakneks.  Go smash lizards.  Bring four tails.  Greenbloods think they get all lizard tails.  We take first.  Taste good.  You bring four tails.  Me give you tings.  Me gives armur.  Now go!!");
}
if($text=~/i am pest/i){
quest::say("Bah!! You go join Greenbloods. You weak."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49042 -- Horgus 
