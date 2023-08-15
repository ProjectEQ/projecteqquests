-- #Vrex_Stonemaster_Lorasa (297088)

local myx
local myy
local myz
local myh

function event_spawn(e)
	myx = e.self:GetX()
	myy = e.self:GetY()
	myz = e.self:GetZ()
	myh = e.self:GetHeading()
	e.self:SetOOCRegen(0);
end


function event_signal(e)
	if (e.signal == 1) then
		--Active and able to kill, but won't fight back
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
	elseif (e.signal == 2) then
		e.self:SetSpecialAbility(25, 1);
		e.self:SetSpecialAbility(35, 1);
	end
end

function event_death_complete(e)
	eq.get_entity_list():MessageClose(e.self,false,120,MT.White,"The dying cries of the Vrex cause the final Stonemaster to falter for a moment, but continuing the chanting with renewed vigor.")
end
