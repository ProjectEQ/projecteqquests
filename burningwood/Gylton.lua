function event_combat(e)
	if e.joined then
		e.self:Say("You will perish!!  You are weak and should have kept to your own realm!!");
		e.self:Say(eq.ChooseRandom(e.other:GetClassName() .. " like you always bring out the worst in me!", "I really hate " .. e.other:GetClassName() .. " like you!", e.other:GetClassName() .. " like you are an affront to my senses!"));
	end
end

function event_death_complete(e)
	e.self:Emote(" slams to the ground with a loud THUD!!  The ground around you still trembles.  'Now.. I shall never slay my blasphemous.. brother..  Xyl..'");
end