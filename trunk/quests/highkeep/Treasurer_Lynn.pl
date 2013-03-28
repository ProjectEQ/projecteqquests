sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Greetings!!  Welcome to Highkeep. home of the greatest casino in all of Norrath.  Please visit our fine casino on the second floor."); 
	}
	if($text=~/highpass lottery/i){
		quest::say("Interested in the Highkeep lotter, are we?  I am afraid it as been put on hold.  We found last season's winner to be holding a counterfeit ticket.  We now await [last season's winner] to step foward with the winning ticket - ticket number 16568.  His prize is the key to the royal suite."); 
	}
	if($text=~/last season/i){
		quest::say("Last season's winner is not known.  I have heard from my sources that he was some sort of merchant of used goods."); 
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12261 => 1)){
		quest::say("You have the runner up ticket from last season!! Here is your reward. Remember, a copper gambled is a plat earned!!");
		quest::ding();
		quest::exp(500);
		quest::givecash(16,11,10,0);
	}
	elsif(plugin::check_handin(\%itemcount, 12266 => 1)){
		quest::say("Congratulations!! You are the winner of last season's Highkeep lottery. Here is the key to the royal suite. You should find this room on the third floor.");
		quest::ding();
		quest::exp(500);
		quest::summonitem(12267);
	}
  plugin::return_items(\%itemcount);
}


#END of FILE Zone:highkeep  ID:6077 -- Treasurer_Lynn 

