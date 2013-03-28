sub EVENT_SPAWN {
	quest::settimer(2,180);	  # 3 min between shouts
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}    

sub EVENT_SAY {
	if(!quest::istaskactive(221)){
  		if ($text=~/hail/i) {
    			quest::say("Please, $name. Help me conjure Iris, my one true love, back from the dead. If only I could speak to her again, for only a brief moment. I hadn't the chance to tell her goodbye before she perished. Will you [help] me?");
  		}
  		if ($text=~/help/i) {
    			quest::say("I will forever be in your debt, $name. I will need you to gather a few things for me to make the ethereal essence needed to conjure her soul back to the living world.");
  			quest::summonitem(87307);
			quest::assigntask(221);
		}
	}
	else {
		quest::say("Please hurry! I'm counting on you!");
	}
}
  
sub EVENT_ITEM {
  	if (plugin::check_handin(\%itemcount, 87308 => 1)) { 
    		quest::emote("begins to conjure the spirit of Iris Gloomflow...");
		quest::updatetaskactivity(221,3);
		quest::summonitem(87313,20);
  	}
  plugin::return_items(\%itemcount);
}