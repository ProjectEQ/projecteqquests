function event_scale_calc(e)
	IS_IN_GROUP			= e.owner:IsGrouped();
	IS_IN_RAID_GROUP	= e.owner:IsRaidGrouped();

	if IS_IN_GROUP or IS_IN_RAID_GROUP then
		local group				= e.owner:GetGroup();
		local owner_hp			= e.owner:GetMaxHP();
		local lowest_group_hp	= 9999999;
		local hp_diff			= 0;

		if group.valid then
			for i = 1,6,1 do
				member = group:GetMember(i);
				if member then
					local member_hp = member:GetMaxHP();

					if member_hp < lowest_group_hp then
						lowest_group_hp = member_hp;
					end
				end
			end
		end

		hp_diff = owner_hp - lowest_group_hp;

		if hp_diff < 1000 then
			e.self:SetScale(0.75);
		elseif hp_diff >= 1000 and hp_diff < 2000 then
			e.self:SetScale(1);
		elseif hp_diff >= 2000 and hp_diff < 4000 then
			e.self:SetScale(1.25);
		elseif hp_diff >= 4000 then
			e.self:SetScale(1.5);
		end
	else
		e.self:SetScale(0.75);
	end
end
