-- player.lua codecay

function event_click_door(e)
	local qglobals = eq.get_qglobals(e.self)
	-- chair to click down to bertox event
	if (e.door:GetDoorID() == 7) then
		if(qglobals["pop_cod_preflag"] == "1" or e.self:GetGM()) then
			e.self:MovePC(200, 0, -16, -289, 128)
		else
			--made up
			e.self:Message(1, "There is still more work to be done.")
		end
	end
end

		

