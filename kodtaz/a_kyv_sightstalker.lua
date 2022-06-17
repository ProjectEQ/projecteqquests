function event_spawn(e)
    eq.set_next_hp_event(45)
e.self:ModSkillDmgTaken(7, -25); -- archery
end

function event_hp(e)
    if (e.hp_event == 45) then
        eq.set_timer("casting", 20 * 1000) -- chance to fire every 20 sec
        eq.set_next_inc_hp_event(45)
    elseif (e.inc_hp_event == 45) then
        eq.stop_timer("casting")
        eq.set_next_hp_event(45)
    end
end

function event_timer(e)
    if (e.timer == "casting") then
        local roll = math.random(100)
        if (roll >= 50) then
        e.self:Emote("releases a volley of arrows.");
        hate_list = e.self:CountHateList();
	if (hate_list ~= nil and tonumber(hate_list) == 1) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 2) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 3) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 4) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 5) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	elseif (hate_list ~= nil and tonumber(hate_list) == 6) then
		e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
                e.self:CastedSpellFinished(eq.ChooseRandom(4850, 4849, 4851), e.self:GetHateRandom())
	end
        
        eq.set_timer("casting", 20  * 1000)
        end
    end
end
