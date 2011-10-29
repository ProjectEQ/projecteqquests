sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("The Rainkeeper shall guide me to victory.");
	}
}

sub EVENT_DEATH {
	quest::say("Karana shall guide the Knights of Thunder to avenge the death of one of his flock.");
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello. Nice to make your acquaintance. Be careful in the plains. There are many creatures. Just stay close to the guard towers.");
  }
  if ($text=~/follower of Karana/i) {
    quest::say("Yes. I am a follower of Karana, the Rainkeeper. It is He who keeps the plains fertile.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12105 =>1 )) {
    quest::say("May the Rainkeeper keep you safe. I thank you. Here is the empty chalice. By the way, inform your superior that the operations of the [Karana bandits] are getting closer to Qeynos.");
    quest::exp(500);
    quest::faction( 167,1 );
    quest::faction( 183,1 );
    quest::faction( 135,1 );
    quest::faction( 257,1 );
    quest::summonitem(12104);
  }
  plugin::return_items(\%itemcount);
}