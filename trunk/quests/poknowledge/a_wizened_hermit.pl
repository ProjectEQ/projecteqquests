sub EVENT_SAY {
	if(quest::istaskactive(217)){
		if($text=~/Hail/i) {
			if(quest::istaskactivityactive(217,1)){
				quest::emote("hermit pulls out a strange earring as she tucks the toadstools into a fold of her robe.");
				quest::summonitem(53513);
				quest::summonitem(85062);
				$client->AddLevelBasedExp(10, 0);
				quest::setglobal("halloween_mushroom",1,0,"D30");
				quest::updatetaskactivity(217,1);
                                $client->NukeItem(54725);
			}
      			else {
      				quest::say("Bring me back some toadstools from Toxxulia, if you dare!");
      			}
      		}
      	}
	elsif(!quest::istaskactive(217)){
		if(!defined $qglobals{halloween_mushroom}){
			if($text=~/Hail/i) {
   				quest::say("I don't understand what all the fuss is about. This should be a day of [fear], not celebration!");
      			}
      			if($text=~/Fear/i) {
      				quest::say("Yes! All should be afraid! Er, well I can't think of anything in particular they should be scared of come to think of it. I just know that when the [masses] are fearful they stay home, and out of my hair!");
      			}	
			if($text=~/Masses/i) {
      				quest::say("Far too many people out and about today if you ask me. I have half a mind to turn them all into [toadstools].");
			}
			if($text=~/Toadstools/i) {
      				quest::say("It's a neat trick actually. Since it seems there won't be any peace for me today regardless, I suppose I could show it to you. Bring me back some toadstools from Toxxulia, if you dare!");
                                quest::assigntask(219);
				quest::assigntask(217);
			}
		}
		else {
			quest::say("Thank you for finding them!");
		}		
	}	
}