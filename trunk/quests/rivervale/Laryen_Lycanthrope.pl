sub EVENT_SPAWN {
	quest::settimer(2,180);	  # 3 min between shouts
}

sub EVENT_SAY {
$clientver = $client->GetClientVersion();
if($clientver > 2){
	if(quest::istaskactive(213)){
		if($text=~/Hail/i) {
			if(quest::istaskactivityactive(213,1)){
				quest::emote("seems disappointed at the instability of his cure, and shrugs a bit before fishing out your reward.");
				quest::summonitem(87318,5);
				$client->AddLevelBasedExp(10, 0);
				quest::setglobal("halloween_cure",1,0,"H3");
				quest::updatetaskactivity(213,1);
			}
			else {
      			quest::say("That's the spirit! Help out as many of those poor souls as you can.");
			}
      		}
	}
  	elsif(!quest::istaskactive(213)){
		if(!defined $qglobals{halloween_cure}){
  			if($text=~/hail/i) {
      				quest::say("Howdy. You venturing out into the [forest]? I have a quick favor to ask if you're heading out that way already..");
      			}
  			if($text=~/forest/i) {
      				quest::say("Well, this lycanthropy stuff is pretty serious. It would be easy for me to reconcile just wiping them out if they weren't normal folks most of the time. Just doesn't sit well with me to be out there bashing people's skulls in that can't help themselves, you know? So, I've been working on a [cure].");
      			}
 			if($text=~/cure/i) {
				quest::say("I think I have the formula nearly right. I wouldn't recommend approaching any werewolves at full strength, but I see enough injured ones here and there to make it worth my while for [testing].");
			}
  			if($text=~/testing/i) {
				quest::say("It's easy, you just hit them with the cure and back off. Keep an eye out for creepy crawlers nearby, if you get my drift. The forest is packed with them this time of year. Are you [up for it]?");
 			}
  			if($text=~/up for it/i) {
				quest::say("That's the spirit! Take these cures and help out as many of those poor souls as you can.");
                                quest::assigntask(219);
				quest::assigntask(213);
				quest::summonitem(87310);
			}
		}
		else {
			quest::emote("seems disappointed at the instability of his cure.");
		}		
	}
}
else {
	$client->Message(15,"This task does not support the Titanium client or lower. Please upgrade to SoF or newer.");
}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}     