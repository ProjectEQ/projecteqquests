sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hey..  What's up? My name's Knargon Lanenda. I just came over here from [Freeport] a couple of months ago. I used to run a big business importing goods from [Faydwer]. If you've been to [Freeport]. I'm sure you've heard of me.");
}
if($text=~/freeport/i){
quest::say("It's a long way from here. . .which is a good thing for me.");
}
if($text=~/faydwer/i){
quest::say("It's a long way from here. . .which is a good thing for me."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2063 -- Knargon_Lanenda 
