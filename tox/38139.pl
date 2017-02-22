#abandoned heretic pet

my $jobresponse;
my $numresponse;
my $askresponse;
my $beenonjob;
my $skelent;
my $skelnpc;
my $leftskelealive;
my $eventstart;

sub EVENT_SAY {
 if ($class eq "Druid") {
  if ($text=~/I am on the job/i && $askresponse==1 && $beenonjob) {
	if ($client->GetItemIDAt(13) == 62829) {
		quest::say("Well I'll be, a druid that wants to be a miner! Alright then, you keep at it. Don't break a nail or strain your delicate sensibilities!");
		$jobresponse=1;
	}
  }
 }
}

sub EVENT_ITEM { 
     if (plugin::check_handin(\%itemcount, 13894 => 1)){
          quest::say("Good work, you should be running this operation instead of that Talrigar fellow. Have a small reward. A little bit of the gems I found while tunneling through this rock.");
          quest::summonitem(quest::ChooseRandom(10015,10016,10017,10018)); 
      }
  plugin::return_items(\%itemcount);
}
	 
sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 6) {
		quest::say("Speed up the digging my pets!!");
		if ($eventstart==0) {
			$skelent = $entity_list->GetMobByNpcTypeID(38016);
			$skelnpc = $skelent->CastToNPC();
			$skelnpc->SignalNPC(9);				
		}
		else {
			quest::say("Who on Bertoxxulous' blistered backside are you? Where did those fools go off to?");
			quest::settimer(1,5);
			$jobresponse=0;
			$askresponse=1;
		}
	}
}

sub EVENT_TIMER {  
  if ($timer == 1) {
	quest::stoptimer(1);
	$askresponse=0;
	if ($jobresponse==1) {
	  $numresponse=$numresponse+1;
	  $jobresponse=0;
	}
	else {
	  $numresponse=0;	  
	}
	#quest::say("nresponse $numresponse");
	if ($numresponse >=3) {
		$start = $entity_list->GetMobByNpcTypeID(38016);
		$moving = $start->CastToNPC();
		$moving->SignalNPC(1);	
		$eventstart=0;
	}
  }
  elsif ($timer == 2) {
	$eventstart=0;
  }
  elsif ($timer == "wallecho") {
	$beenonjob=0;
  }  
}
sub EVENT_SIGNAL {
#signal from #wall_echo
  if ($signal == 1) {
  	$beenonjob=1;
	#quest::say("someone has been on the job $beenonjob");
	quest::settimer("wallecho",5);
  }
  elsif($signal == 5){
	$jobresponse=0;
	$beenonjob=0;
	$numresponse=0;
	$askresponse=0;
	$leftskelealive=0;
	$skelent=0;
	$skelnpc=0;	
	$eventstart=1;
	quest::settimer(2,600);
  }
}