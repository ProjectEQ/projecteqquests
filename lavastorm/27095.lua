-- Officer_Vacax_Rol`Tas (27095)
-- Dark Reign Missions

--[[
Have Note Will Travel	>= indifferent	Group
Drake Eggs	>= amiable	Group
The Gilded Scroll	>= amiable	Group
Rival Party	>= warmly	Group
]]

function event_say(e)
	--if you have prereqs
	if(e.message:findi("hail")) then
		e.self:Say("These are indeed good days for the will of hate and fear. We will overcome the races of light and prevail. Pledge allegiance to Lanys T`Vyl!");
		e.other:AssignTask(273,e.self:GetID());
	end
end