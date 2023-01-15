# items: 13319, 13318, 16482, 12187
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings!  Please look through my fine wares.  I have spent my whole life practicing my skills in tailoring.  I do my best to compete with the other local merchants. but I have yet to make a profit.  I pray to Tunare that my [banded orc vests] will finally bring me a few extra coins.");
}
if($text=~/What are banded orc vests/i){
quest::say("Glad you are interested!  I can create a leather vest I call a banded orc vest.  It will aid you in repelling any disease and offers quite a bit of protection in battle.  I will need some materials. For a Deathfist banded orc vest. I require two legionnaire pads worn by the Clan Deathfist. one Deathfist slashed belt. and ten gold coins. For a Crushbone banded orc vest. I require two legionnaire pads worn by the Clan Crushbone. one Crushbone belt. and ten gold coins.");
 }
}

sub EVENT_ITEM { 
   if(plugin::check_handin(\%itemcount,13319 => 2,13318 => 1,16482 => 1)){ 
   quest::say("Grand doing business with you. Hold your nose. I can never get rid of the orc stench of the vests. That is why the other merchants do not pay me much for them."); 
  quest::summonitem(12187); # Item: Banded Orc Vest
  quest::exp(100); 
  quest::faction(5001,10); # Faction: Anti-mage
  quest::faction(276,10); # Faction: Kelethin Merchants
  quest::faction(246,10); # Faction: Faydarks Champions
  quest::faction(326,10); # Faction: Emerald Warriors
  } 
} 

#END of FILE Zone:gfaydark  ID:9006 -- Linadian 

