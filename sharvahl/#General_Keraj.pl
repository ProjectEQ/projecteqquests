sub EVENT_SPAWN {
	quest::settimer(1,210);
	quest::settimer(2,220);
	quest::settimer(3,230);
	quest::settimer(4,400);
	quest::settimer(5,410);
	quest::settimer(6,420);
	quest::settimer(7,430);
	quest::settimer(8,440);
	quest::settimer(9,450);
	quest::settimer(10,700);
	quest::settimer(11,705);
}

sub EVENT_TIMER {
	if($timer==1) {
	quest::say("Nay friend, we appear to be making decent progress. The grimling numbers are increasing, but so are ours. Many of the newcomers are working with us in the moor and forests. The influx of adventurers has provided us with some amazing new leaders. They are so full of energy and fearless ambition");
	quest::stoptimer(1);
	}
	if($timer==2) {
	quest::say("Aye friend, I guess that you are right. I am just ready to head back into the forest. I want to take those mines back before this season ends. We built this city from the acrylia in those mines and now look at us. We have to resort to using any scrap of acrylia that we can find.");
	quest::stoptimer(2);
	}
	if($timer==3) {
	quest::say("Aye mate, a few games would be a fine sight. Well, let me get back in there. I'm sure that'll want to keep talking. Bah...");
	quest::stoptimer(3)
	}
	if($timer==4) {
	quest::signalwith(155161,1,5); # NPC: High_Spiritist_Jimuul
	quest::stoptimer(4);
	}
	if($timer==5) {
	quest::say("Tell him what you have told him every season prior to this... We are keeping them from over running the city, the moor is clear with the exception of a few camps, and the forest outpost still stands. What more is there to report?");
	quest::stoptimer(5);
	}
	if($timer==6) {
	quest::signalwith(155161,2,5); # NPC: High_Spiritist_Jimuul
	quest::stoptimer(6);
	}
	if($timer==7) {
	quest::signal(155160,5); # NPC: Pathmaster_Kharin
	quest::stoptimer(7);
	}
	if($timer==8) {
	quest::signalwith(155161,3,5); # NPC: High_Spiritist_Jimuul
	quest::stoptimer(8);
	}
	if($timer==9) {
	quest::say("Then make no demands of my soldiers beyond what they are already doing. It will serve no one to have our resources depleted before you can even produce the question I am supposed to answer. If you need more headway in the area of the mines, then tell the king that we need new incentives to compel the outsiders to aid us in that area. We cannot take that area with my men alone and I am not sending soldiers in to die without a known goal!");
	quest::stoptimer(9);
	}
	if($timer==10) {
	quest::say("Bah, I do not know why I let these meetings bother me. They have little relevance to our current battle. The mines have been lost to those creatures and their ranks seem to swell to greater numbers with each day that passes.");
	quest::stoptimer(10);
	}
	if($timer==11) {
	quest::settimer(1,210);
	quest::settimer(2,220);
	quest::settimer(3,230);
	quest::settimer(4,400);
	quest::settimer(5,410);
	quest::settimer(6,420);
	quest::settimer(7,430);
	quest::settimer(8,440);
	quest::settimer(9,450);
	quest::settimer(10,700);
	}
}
