sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hi there. $name! I am Priestess Farinthorn. loyal paladin of House Fordel. It's nice to see visitors to our somewhat quiet town- all the excitement has the economy booming like never before!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadowhaven  ID:150191 -- Priestess_Farinthorn 
