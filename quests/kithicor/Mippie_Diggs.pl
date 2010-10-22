sub EVENT_SPAWN {
	quest::settimer(2,180);	  # 3 min between shouts
}
sub EVENT_SAY {
	if(quest::istaskactive(19)){
		if(quest::istaskactivityactive(19,4)){
			quest::summonitem(65096);
			quest::summonitem(85062);
			$client->AddLevelBasedExp(10, 0);
			quest::setglobal("halloween_hungry",1,0,"D30");
                        quest::updatetaskactivity(19,4);
		}
		else {
		quest::say("The Hungry Halfling is already in progress.");
		}
      	}
       	elsif(!quest::istaskactive(19)){
       		if(!defined $qglobals{halloween_hungry}){
  			if($text=~/hail/i) {
      				quest::say("Hail to you too. You wouldn't happen to have any of those wondrous [pumpkiny foods] on you would you? I'm not really feel my best and nothing perks you up better than a nice bit of tasty pumpkin.");
      			}
  			if($text=~/Pumpkiny foods/i) {
      				quest::say("The best of the best pumpkiny foods can be found in my personal book of home remedies. They may be a bit complicated to make, but you've never had anything tastier. I'd be happy to give you a copy of my book if you'd be [willing] to bring me the first couple of snacks you make.");
      			}
  			if($text=~/willing/i) {
        			quest::say("Thank you so much. Here is the book, now see what sort of things you can come up with.");
        			quest::summonitem(84097);
        			quest::taskselector(19); #Task: The Hungry Halfling
      			}
    		}
  	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::stoptimer(2);
		quest::settimer(2,180);
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}    