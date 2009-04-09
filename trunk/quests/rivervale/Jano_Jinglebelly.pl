sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("A pleasure to make your acquaintance $name . I am Kaya Cloudfoot. first Paladin of the Storm Reapers. I traveled long ago when I was just a wee sprout to the city of Qeynos far to the west. It was there I grew under the tutelage of the Knights of Thunder. a noble order of paladins loyal to Karana. the Storm Lord. I have returned now to Rivervale to teach interested young halflings the ways of a Knight of the Storm Reapers so that we may defend Karana's people and lands from the [evil forces] that would see it destroyed."); }
}
sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18431 => 1)){
quest::say("Thanks.");
quest::summonitem("13541");
quest::exp("100"); 
 }
plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19079 -- Jano_Jinglebelly 

