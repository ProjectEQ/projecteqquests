sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 5) {
	quest::say("Hey there Ronlotar! Mighty fine selection of footwear ya got here. How goes the business?");
	quest::signalwith(150269,1,5);
	}
	if ($wp == 6) {
	quest::say("Ah of course I can see what ya mean, well im sure it will get better keep up the good work! I have been saving up some money im hoping to pick up a new pair of boots soon, keep me in mind for a discount!");
	quest::signalwith(150269,2,5);
	}
	if ($wp == 10) {
	quest::say("Afternoon Lookout Gereol, everything is going good on this post as far as I can see.");
	quest::signal(150049,5);
	}
	if ($wp == 17) {
	quest::say("Fall in Lookout! Whats that yer squintin at son, I can see ya strainin to see what lies right in front of you. Is this true?");
	quest::signal(150036, 5);
	}
	if ($wp == 18) {
	quest::say("All right then Lookout, wipe that blank look of yer face and back to your watch.");
	}
	if ($wp == 22) {
	quest::say("Afternoon Lookouts. I hope everything is in order here and the two of you arent yelpin at each other like usual. Here in the Short and Stout quarter we need to be focused on our task as Lookouts and not spendin time gripin at each other!");
	quest::signal(150034,5);
	quest::signal(150040,5);
	}
	if ($wp == 31) {
	quest::say("Hail Lookouts! Great job youre both doing here, nobody else id rather have at the front line then my two finest Uhingil and Yereil. You both make me proud and make my mob a whole lot easier, Keep it up!");
	quest::signal(150021,5);
	quest::signal(150043,5);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Oi there $name! Not causing any trouble are ya? Well that's good to hear. Allow me to introduce myself. I am Head Guardsman Dalinastalarix the VI . I take pride in my position and care for my guardsmen the best I can. Well enough out me. enjoy your stay will ya? Perhaps we will share an ale or two over stories of battle."); }
}
#END of FILE Zone:shadowhaven  ID:150013 -- General_Dalinastalarix 

