-- player.lua in Tacvi

-- opening a door, in white. "As the massive door gives way, you are overwhelmed by the smell of decaying flesh."
-- opening a door, in white. "Behind the stone door lies another hallway.  This one is also filled with rubble created by the actions of the Legion of Mata Muram."
--locked door, in red. "A barrier of energy seals the door before you"


function event_click_door(e)
	-- populate the current entity list whenever someone clicks.
	local entity_list = eq.get_entity_list()
	local npc_list = entity_list:GetNPCList()
	local door_id = e.door:GetDoorID()

	--PRT
	if (e.door:GetDoorID() == 23 and e.door:GetLockPick() == -1) then
		e.self:Message(4, "Pixtt Riel Tavas says 'You dare enter my chambers and then try to leave? Your punishment will be quite severe.'")
	end
end
