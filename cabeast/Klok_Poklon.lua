function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, thirsty traveler. Pull up a stool and lay yer copper down. Its time to drink and be merry. Just don't get too merry or I will have to call the troopers.");
	elseif(e.message:findi("talon southpaw")) then
		e.self:Emote("feints with two quick left hooks!! 'Talon Southpaw. He had the fastest hands in the empire. I remember he once beat another lizard in an arm wrestling match. The amazing thing was, while he was gripping the croaks left hand, he left hooked him without losing his hold!! Thats quick!! I hear one of his treasured hands is in the possession of a monk called Master Rinmark.'");
	elseif(e.message:findi("Sisters of Scale") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Hmm, yes, the Babble around here is that one of the Kloks in the Lake Garrison has one of the Sisters of Scale Skull up for Auction. The Temple will bury him when they hear of it!");
	elseif(e.message:findi("What memory of Sebilis?")) then
		e.self:Emote("takes a sip of Legion Lager. 'Puhh...lease!! That's the little trophy the War Baron brought back from Sebilis. He got it stolen from him by some thieves!! I say it was the [Steelhead gang]. They were waltzing in and out of Cabilis like it was a blasted public vomitorium!!'");
	elseif(e.message:findi("What steelhead gang?")) then
		e.self:Emote("picks some flesh from between his teeth. 'The Steelhead gang were a band of Forsaken thieves. No one knew this!! They used to walk around here like they were rebirthed!! They used to frequent my place and get involved in head butt contests. Whew!! I tell ya, the only way to crack their skulls is with a forging hammer!! Heheh!!'");
	end
end
