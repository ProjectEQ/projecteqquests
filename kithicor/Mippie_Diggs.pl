# items: 65096, 85062, 84097
sub EVENT_SPAWN {
	quest::settimer(2,600);
}
sub EVENT_SAY {
	if(quest::istaskactive(8013)){
		if(quest::istaskactivityactive(8013,4)){
			quest::summonitem(65096); # Item: 5 Dose Essence of Halfling
			quest::summonitem(85062); # Item: Bristlebane's Ticket of Admission
			$client->AddLevelBasedExp(10, 0);
			quest::setglobal("halloween_hungry",1,0,"D30");
                        quest::updatetaskactivity(8013,4);
		}
		else {
		quest::say("The Hungry Halfling is already in progress.");
		}
      	}
       	elsif(!quest::istaskactive(8013)){
       		if(!defined $qglobals{halloween_hungry}){
  			if($text=~/hail/i) {
      				quest::say("Hail to you too. You wouldn't happen to have any of those wondrous [pumpkiny foods] on you would you? I'm not really feel my best and nothing perks you up better than a nice bit of tasty pumpkin.");
      			}
  			if($text=~/Pumpkiny foods/i) {
      				quest::say("The best of the best pumpkiny foods can be found in my personal book of home remedies. They may be a bit complicated to make, but you've never had anything tastier. I'd be happy to give you a copy of my book if you'd be [willing] to bring me the first couple of snacks you make.");
      			}
  			if($text=~/willing/i) {
        			quest::say("Thank you so much. Here is the book, now see what sort of things you can come up with.");
        			quest::summonitem(84097); # Item: Mippie's Home Remedies
        			quest::assigntask(500219);
      			        quest::assigntask(8013); #Task: The Hungry Halfling
      			}
    		}
  	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::stoptimer(2);
		quest::settimer(2,600);
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}    
