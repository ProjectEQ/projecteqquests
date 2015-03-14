sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 1) {
	quest::say("Ok Talor, I'm off to the keep to deposit our daily earnings. Watch the shop while I'm gone, will ya mate.");
	}
	if ($wp == 11) {
	quest::say("Hello there Faloensar, having a good day I would hope.");
	quest::signalwith(150286,1,5);
	}
	if ($wp == 12) {
	quest::say("Ah well just here to make my daily deposit then it's back to the bar for me. Had quite a brawl last night and still got some cleaning up to do. Those crazy Dwarves I tell you, get a few drinks in them and they want to take on the world or the closest Barbarian.");
	quest::signalwith(150286,2,5);
	}
	if ($wp == 13) {
	quest::say("Ill try my best! Nice doing business with you as always. Take care");
	quest::signalwith(150286,3,5);
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hey there $name. We carry many Shadowhaven exclusive brews here in our tavern. Pull up a barstool and enjoy an ale or two.");
quest::say("Due to the problems we have had lately with dishonorable visitors to the Haven we require all newcomers to see Daloran and Mistala for some simple tasks to prove that your intentions are good. I hope to see you soon."); }
}
#END of FILE Zone:shadowhaven  ID:150173 -- Verte 

