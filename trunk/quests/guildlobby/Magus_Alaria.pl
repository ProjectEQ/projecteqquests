sub EVENT_SAY {
    if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) { #Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("Greetings, $name. As you may have guessed I have been sent here by the Wayfarers Brotherhood to assist those that dare subject themselves to our magic. I promise you I have trained long and hard to be up to the task.  I only rarely make the type of mistakes you may have heard about regarding these spells of travel. Come, let me know where you would like to go and I'll send you on your way.  I can send you to any of the Wayfarer camps in [Butcherblock], [Commonlands], [Everfrost], [North Ro], [South Ro], or [Nedaria's Landing].");
		}
		elsif($text=~/commonlands/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(22,-105,-1640,5,0); #East Commonlands
		}
		elsif($text=~/butcherblock/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(68,-2500,-1105,1,0); #Butcherblock Mountains
		}
		elsif($text=~/everfrost/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4180); #Teleport Everfrost
		}
		elsif($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		}
		elsif($text=~/north ro/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(34,900,2650,-24,0); #Northern Desert of Ro
		}
		elsif($text=~/south ro/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(35,1030,-1440,-23,0); #Southern Desert of Ro
		}
    }
    else { #PC does not have Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it.  Perhaps you should talk to those at the Wayfarer camps to see if they have any use for you.  I have enough time to send you to [Nedaria's Landing], if you'd like.");
		} elsif($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		}		
    }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}