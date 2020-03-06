function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you would like to adjust the offensive difficulty level of this npc, let me know if you would like a [low], [medium], or [hard] difficulty. Perhaps you would like to [add flurry], [remove flurry], [add rampage], [remove rampage], [add ae rampage], [remove ae rampage], [hit slower], [hit faster], [mitigate more slow], or [mitigate less slow]. You may also [repop] me to reset my settings.");
	elseif(e.message:findi("low")) then
    e.self:ModifyNPCStat("accuracy", "100");
    e.self:ModifyNPCStat("atk", "200");
	elseif(e.message:findi("medium")) then
    e.self:ModifyNPCStat("accuracy", "500");
    e.self:ModifyNPCStat("atk", "300");
	elseif(e.message:findi("hard")) then
    e.self:ModifyNPCStat("accuracy", "900");
    e.self:ModifyNPCStat("atk", "400");
	elseif(e.message:findi("add flurry")) then
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
	elseif(e.message:findi("remove flurry")) then
    e.self:SetSpecialAbility(SpecialAbility.flurry, 0)
	elseif(e.message:findi("add rampage")) then
    e.self:SetSpecialAbility(SpecialAbility.rampage, 1)
	elseif(e.message:findi("remove rampage")) then
    e.self:SetSpecialAbility(SpecialAbility.rampage, 0)
	elseif(e.message:findi("add ae rampage")) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1)
	elseif(e.message:findi("remove ae rampage")) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0)
	elseif(e.message:findi("hit slower")) then
    e.self:ModifyNPCStat("attack_delay","20");
	elseif(e.message:findi("hit faster")) then
    e.self:ModifyNPCStat("attack_delay","10");
	elseif(e.message:findi("mitigate more slow")) then
    e.self:ModifyNPCStat("slow_mitigation","85");
	elseif(e.message:findi("mitigate less slow")) then
    e.self:ModifyNPCStat("slow_mitigation","15");
	elseif(e.message:findi("repop")) then
    eq.depop_with_timer();
	end
end
