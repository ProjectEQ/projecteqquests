sub EVENT_SIGNAL {
	quest::say("Aye sir.");
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What's that in your pockets there. $name? You wouldn't be carrying any unauthorized goods. would ya? Let me have a look in your coin purse to make sure it's all legal tender! Ah. ok. looks good to me."); }
}
#END of FILE Zone:shadowhaven  ID:150040 -- Lookout_Reloen 

