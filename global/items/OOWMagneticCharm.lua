function event_scale_calc(e)
	local Total		= 0;
	local Helm		= tonumber(e.owner:HasItemEquippedByID(72110));
	local Chest		= tonumber(e.owner:HasItemEquippedByID(72112));
	local Arms		= tonumber(e.owner:HasItemEquippedByID(72134));
	local Legs		= tonumber(e.owner:HasItemEquippedByID(72114));
	local Gloves	= tonumber(e.owner:HasItemEquippedByID(72104));
	local Feet		= tonumber(e.owner:HasItemEquippedByID(72106));
	local Wrist		= tonumber(e.owner:HasItemEquippedByID(72132));
	Total		= Helm + Chest + Arms + Legs + Gloves + Feet + Wrist;

	if Total < 0 then
		e.self:SetScale(0);
	elseif Total > 7 then
		e.self:SetScale(1);
	else
		e.self:SetScale(Total/7);
	end
end
