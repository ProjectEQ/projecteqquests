sub EVENT_SAY { 
 if ($text=~/Hail/i){
	quest::say("Bring to me that which was taken.")
 }
}

sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount,18069=> 1, 18068=> 1)){
quest::emote("fades out of existence. The air smells of death. Something has appeared in your hand.");
        quest::depop();
	quest::summonitem(12889);
 }
plugin::return_items(\%itemcount); # return unused items
quest::say("All must be returned!");
}