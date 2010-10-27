sub EVENT_SAY {
	if(quest::istaskactive(212)){
		if($text=~/Hail/i) {
      			quest::say("Good on ya! Get on out there then and kill some zombies! Bring me some hearts while you're at it. I want to have a look at what's going on in there.");
      		}
      	}
	if(!quest::istaskactive(212)){
		if(!defined $qglobals{halloween_zombie}){
			if($text=~/Hail/i) {
   				quest::say("Dagnabbit! Don't creep up on folks like that, especially around here! What are ya trying to do, give somebody a heart attack! Noise attracts [their] attention, don't ya know.");
      			}
      			if($text=~/their/i) {
      				quest::say("Who? Look around! The zombies, of course! They aren't too bright, but seem attracted to noises. I just know the [epidemic] is going to spread.");
      			}	
      			if($text=~/epidemic/i) {
			   	quest::say("What epidemic? Are you mad? Where do you think all these zombies came from? Luclin? Someone has to be getting sick and turned or there wouldn't be any zombies! Of course there's an epidemic. I fear mass [carnage] is the only way to go.");
      			}
      			if($text=~/carnage/i) {
				quest::say("Aye. If we kill them all, then there are none left to infect us. See? Yup. Mass carnage it is. Are you going to [fight] or just ignore the problem?");
      			}
      			if($text=~/fight/i) {
				quest::say("Good on ya! Get on out there then and kill some zombies! Bring me some hearts while you're at it. I want to have a look at what's going on in there.");
                                quest::assigntask(219);
				quest::assigntask(212);
				quest::summonitem(87309);
      			}
		}
		else {
			quest::say("Thank you for the mass carnage!");
		}		
	}	
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 97289 => 4)){ 
        	quest::summonitem(85062);
    	}
    	else { 
         	plugin::return_items(\%itemcount);
         	quest::say("I have no need for this item.");
    	}
}

