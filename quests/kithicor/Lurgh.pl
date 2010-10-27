sub EVENT_SAY {
	if(quest::istaskactivityactive(215,4)){
		if($text=~/Hail/i) {
			quest::summonitem(87317,5);
			$client->AddLevelBasedExp(10, 0);
			quest::setglobal("halloween_monster_mash",1,0,"H3");
			quest::emote("is pleased with your success, and offers you these dancing skeletons as a token of his appreciation.");
			quest::updatetaskactivity(215,4);
		}
	}
	elsif(quest::istaskactive(215)){
		if($text=~/Hail/i) {
      			quest::say("Find skeleton make Lurgh laugh and Lurgh help you, too.");
      		}
      	}
	if(!quest::istaskactive(215)){
		if(!defined $qglobals{halloween_monster_mash}){
			if($text=~/Hail/i) {
   				quest::say("Lurgh miss [friend].");
      			}
      			if($text=~/Friend/i) {
      				quest::say("Lurgh had friend that battle hard. We fight lots. Skeleton friend [dance] for me, but he gone now.");
			}
			if($text=~/Dance/i) {
   				quest::say("Lurgh laugh when skeleton dance. But now sad, [skeleton] ate by bear and no more dancin' for Lurgh.");
      			}
			if($text=~/Skeleton/i) {
   				quest::say("Lurgh see lots of skeleton here. Maybe one be friend? You [help] Lurgh find friend?");
      			}
			if($text=~/Help/i) {
   				quest::say("Gud. Find skeleton make Lurgh laugh and Lurgh help you, too.");
                                quest::assigntask(219);
      				quest::assigntask(215);
      			}	
		}
		else {
			quest::say("Thank you for finding friend!");
		}		
	}	
}