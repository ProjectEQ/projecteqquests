function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self)
		if qglobals["pre_pal"] == "2" then
			 e.self:Message(15,"Your sword piece reverberates with a low hum. An attraction is felt within it. To the south you are pointed, towards the direction of that attraction.");
		end
end

function event_loot(e)
    -- bard 1.5 Metala chest
    if e.self:GetClass() == 8 and e.item:GetID() == 77630 then
        local qglobals = eq.get_qglobals(e.self)
        if e.self:HasItem(77629) and qglobals["bard15_metalachest"] == nil then
            eq.spawn2(283157, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
            eq.set_global("bard15_metalachest", "1", 5, "F")
        end
    end
end

