sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Shrine of the Diseased! You will be repaid for your service when your soul crosses the void into Bertoxxulous' waiting arms. Are you available to do His bidding?"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat  ID:45069 -- Zaen_Kalystir 
