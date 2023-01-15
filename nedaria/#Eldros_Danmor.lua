-- The Forgotten Halls

local fhalls_dz = {
  expedition = { name="The Forgotten Halls", min_players=1, max_players=6 },
  instance   = { zone="fhalls", version=0, duration=eq.seconds("2h") },
  compass    = { zone="nedaria", x=-670.09, y=1541.43, z=93.78 },
  safereturn = { zone="nedaria", x=-648, y=1559, z=96.05, h=0.0 },
  zonein     = { x=-74, y=-843, z=-11.87, h=0 }
}

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met, ".. e.other:GetName() .. ". I've recently been appointed as an ambassador of sorts to Taelosians who wish to visit our bountiful shores. It is my duty to ensure that visiting Taelosians are looked after and kept safely away from the greedy intentions of our less savory Norrathian cousins. It's not expected that many will undertake the journey, but we have had one [" .. eq.say_link("Taelosian") .. "] visit our shores recently.");
	elseif(e.message:findi("Taelosian")) then
		e.self:Say("Her name is Nideno Eliagy. She is an elder within her community, an Undari as they are known. Nideno has come to our shores in the hopes that she can teach us more about her people. She has brought with her the means to transport others to a [" .. eq.say_link("temple") .. "] deep in the mountains of Taelosia.");
	elseif(e.message:findi("temple")) then
		e.self:Say("Nideno refers to the temple simply as the Forgotten Halls. On the surface, it appears to be a place where Harindi, those Taelosian skilled in the ways of geomancy, are taught their craft. I believe the Forgotten Halls holds a much deeper meaning for the Taelosian people, though. Nideno has offered access to the Forgotten Halls to us so that we may see the beauty of an ancient Taelosian temple unscathed by the ravages of the Muramites. In the interest of security, she has asked that anyone [" .. eq.say_link("interested in visiting") .. "] the Forgotten Halls speak to me first so that I may give them my blessing.");
	elseif(e.message:findi("visiting")) then
		e.self:Say("Nideno is staying in the cave on the other side of the river. The many wooden structures near here made her nervous and she thought she would feel more at home surrounded by the earth. Go to her with my blessing and may your journey to The Forgotten Halls prove enlightening.");
		e.other:CreateExpedition(fhalls_dz)
	end
end

