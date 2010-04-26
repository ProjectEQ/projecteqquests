## player.pl
##
## Created by mrhodes for use in tasks/perl questing


#Task 182 - Ways of Nature - Initiate Dakkan in Crescent Reach
#Task 183 - Snake Sacs - Initiate Dakkan in Crescent Reach
sub EVENT_TASK_STAGE_COMPLETE {
	if($task_id eq "182" && $activity_id eq "1")		##  Is tasked completed
	{
		quest::summonitem(53481, 5);
		quest::signalwith(394147 , 1);
		quest::me("Dakkan is one step further in his quest to learn about nature and could use your help.");
		quest::exp(500);
		quest::ding();		
	}
	if($task_id eq "183" && $activity_id eq "1")		##  Is tasked completed
	{
		quest::summonitem(53482, 5);
		quest::signalwith(394147 , 1);
		quest::me("Dakkan is getting closer to learning all he needs to about poison, but he still has more to learn.");
		quest::exp(500);
		quest::ding();		
	}
}