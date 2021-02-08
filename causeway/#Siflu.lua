-- items: 62628
function event_spawn(e)
	eq.set_timer("depop",15*60*1000);
	eq.set_next_hp_event(15);
end

function event_hp(e)
	if (e.hp_event == 15) then
		e.self:SetSpecialAbility(19, 1);
		e.self:SetSpecialAbility(20, 1);
		e.self:SetSpecialAbility(24, 1);
		e.self:SetSpecialAbility(25, 1);
		e.self:SetSpecialAbility(35, 1);
		e.self:WipeHateList();
		e.self:Say("Well, that was interesting! I guess you've broken their power over me. I suppose I should be grateful or something. I was having fun here, killing people without having to worry that it might be wrong. So what is it that you want from me? You're not going to yell at me for beating up [" .. eq.say_link("adventurers") .. "], are you? That wasn't my fault, I was forced to do that by the muramites.");
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("adventurers") and qglobals["ranger_epic"] == "6") then
		e.self:Say("There have been plenty of those, that's for sure. If you mean recently, then, I suppose I know the group you're talking about. They were hunting us, just as I suspect you are. I was sent to kill anyone that might be on our trail. They gave me a loadstone that I could use to find them again. Here, you take it; I'm getting out of here while I still can.");		
		e.other:SummonItem(62628); --Heated Loadstone
		eq.depop();
	end
end

