--eastwastes/#Larnik_Trigger.lua NPCID 
--Warrior Epic 2.0
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25);
end

function event_enter(e)
	if(e.other:HasItem(60324)) then --Fazzle's Map of East Wastes
		--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Larnik_the_Recluse
		eq.depop();
	end
end