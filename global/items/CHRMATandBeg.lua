-- CHRMATandBed

function event_scale_calc(e)

	local alcohol = e.owner:GetSkill(66);
	local begging = e.owner:GetSkill(67);

	if alcohol >= 201 then
		alcohol = 200; -- Max 200 (Changes for Omens, but sticking with this for now)
	elseif alcohol <= 0 then
		alcohol = 1; -- To avoid divide by 0 (NAN)
	end

	if begging >= 201 then
		begging = 200; -- Max 200 (Changes for Omens, but sticking with this for now)
	elseif begging <= 0 then
		begging = 1; -- To avoid divide by 0 (NAN)
	end

	e.self:SetScale((alcohol + begging)/400);
end
