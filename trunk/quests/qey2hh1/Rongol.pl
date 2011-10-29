sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("Karana, protect me in battle!!");
	}
}

sub EVENT_DEATH {
	quest::say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Great!! I have fifty acres to seed and now I have visitors stopping by to waste my time!!");
  }
  if ($text=~/follower of Karana/i) {
    quest::say("Yes. I am a follower of Karana, the Rainkeeper. It is He who keeps the plains fertile.");
  }
  if ($text=~/blanket/i) {
    quest::say("With the frequent rains, I find my only need is a blanket to keep me warm during the long cold nights. Thank Karana the temple has begun to send young $class to deliver extra blankets.");
  }
  if ($text=~/karana bandits/i) {
    quest::say("The Karana bandits are rogues who operate in the plains. I have heard there are bounties for the bandits. Within the Temple of Thunder in Qeynos, Cleric Gehna offers one for bandit spectacles and Paladin Chesgard offers one for bandit sashes.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12102 =>1 )) {
    quest::say("Thank you, protector of Karana. This will be handy when the cold rushes into the valley. Allow me to offer you some provisions for your journey. And, might I add, the [Karana bandits] have begun to operate much closer to Qeynos.");
    quest::exp(500);
    quest::faction( 167,1 );
    quest::faction( 135,1 );
    quest::faction( 257,1 );
    quest::faction( 183,1 );
    quest::givecash(12,0,0,0);    
  }
  plugin::return_items(\%itemcount);
}