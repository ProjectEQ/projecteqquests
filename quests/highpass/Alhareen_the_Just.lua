function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail and well met. %s. I am Alhareen the Just. herald and servant of The Tribunal. Judge and adjudicator of mortal deeds. Sent down from the Realm of Heroes. I have been given the duty of bestowing honor and due recognition on those whose deeds have been found worthy in the eyes of the gods for divine honor and reward.",e.other:GetName()));
	end
end
