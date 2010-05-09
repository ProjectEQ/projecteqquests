sub EVENT_SAY {
	if (plugin::check_hasitem($client, 29165)){
		if ($text=~/Hail/i) {
			quest::emote("fidgets about with excitement, 'So here you are, this is quite impressive. I cannot wait to see the results of this impressive machine! I have coordinated with the clockworks here that have not gone mad. We have set the machine to tear a point of time open that should be equal to that based on the cipher and history that we have [researched].'");
		}
		if ($text=~/researched/i) {
			quest::say("Based on the findings from the information that you brought back to me I have determined the exact time to open. I believe the machine will work. Please step up and activate the machine! Once you have formed a bond with the Plane of Time you will be able to access the Plane again through the Plane of Tranquility. They have built a portal there, but no one was able to become attuned to that plane, until you that is. Good luck!");
			quest::setglobal("pop_time_maelin",1,5,"F");
		}
	}
}