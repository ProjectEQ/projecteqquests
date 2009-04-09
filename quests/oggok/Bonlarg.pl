sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Shadowknight master me be!!  $name prove to me that $name be worthy to be one with Greenblood and me give $name black shadow tunic.  You [want black shadow tunic]?");
}
if($text=~/i want black shadow tunic/i){
quest::say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49033 -- Bonlarg 
