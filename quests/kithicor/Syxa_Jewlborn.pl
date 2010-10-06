sub EVENT_SAY {
	if(quest::istaskactive(211)){
		if($text=~/Hail/i) {
			if(quest::istaskactivityactive(211,1)){
				quest::say("Oh you found her! How can I ever repay you.");
				quest::summonitem(87311,5);
				quest::exp(1000);
				quest::setglobal("halloween_black_cat",1,0,"H3");
			}
      			else {
      				quest::say("Did you find Muffin? I don't see her anywhere. Please return her to me safely!");
      			}
      		}
      	}
	if(!quest::istaskactive(211)){
		if(!defined $qglobals{halloween_black_cat}){
			if($text=~/Hail/i) {
   				quest::say("Please help me find my missing cat, she has gone astray and I can't seem to find her anywhere. Her name is Muffin. Will you [help] me? Oh please!");
      			}
      			if($text=~/help/i) {
      				quest::say("Please bring her back safely!");
      				quest::assigntask(211);
      			}	
		}
		else {
			quest::say("Thank you for finding her!");
		}		
	}	
}