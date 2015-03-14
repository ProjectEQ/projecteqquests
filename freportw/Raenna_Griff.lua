function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail %s. If it is refuge you seek from the evil that is corrupting this city then I suggest you flee to Qeynos or take up arms along side the Sentries of Passion and the Knights of Truth. You must have faith that the Marr twins will not let this city fall to the hate of the Dismal Rage.",e.other:GetName()));
	end
end

-- END of FILE Zone:freportw -- Raenna_Griff