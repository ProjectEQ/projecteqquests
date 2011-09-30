sub EVENT_SPAWN {
	quest::settimer(1,60);
}

sub EVENT_TIMER {
		if ($timer == 1){
		my $random = int(rand(2));	
		if($random == 0){
			quest::say("Keep running! I'll get him."); 
			}
		if($random == 1){
			quest::say("Hey down there... Behind you!");
			}
	}
}


sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hail friend! Are you just out killing time or are you looking to earn a [wage]?");
  }
  if($text=~/wage/i){
    quest::say("Hmmm... I see. Well friend, there is plenty for you to do here. There are all sorts of pests in the hollow that lies below the city. It would be nice if we could get rid of all of them. Perhaps then we could concentrate on real soldiering. With that in mind, we are always looking for another brave young citizen to go down there and kill some of the vermin. Tell Khala Dun Bokh that you are being [assigned] to help. He will tell you what to do.");
  }
}
