-- #Vrex_Stonemaster_Hateq (297089)

local myx
local myy
local myz
local myh

function event_spawn(e)
	myx = e.self:GetX()
	myy = e.self:GetY()
	myz = e.self:GetZ()
	myh = e.self:GetHeading()
end


function event_signal(e)
	if (e.signal == 1) then
		--Active and able to kill, but won't fight back
		e.self:ModifyNPCStat("special_attacks","12,13,14,15,16,17,24")
		e.self:SetDisableMelee(true)
	end
end

function event_death_complete(e)
	eq.get_entity_list():MessageClose(e.self,false,120,0,"As the last breath leaves the dying Vrex, the other two Stonemasters raise their voices in an attempt to cover the part of their fallen comrade.")
end