--Ikkinz Raid #4: Chambers of Destruction 
function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.set_timer("fling",  math.random(5,20) * 1000);
		eq.set_timer("throw",  math.random(5,20) * 1000);
		eq.set_timer("bury",   math.random(5,20) * 1000);
		
	else
		eq.stop_timer("OOBcheck");
		eq.stop_timer("fling");
		eq.stop_timer("bury");
		eq.stop_timer("throw");
	end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
		if (e.self:GetX() < -35 or e.self:GetX() > 120 or e.self:GetY() > -100 or e.self:GetY() < -310) then --($x > 120 || $x < 35 || $y > -100 || $y < -310) {
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
	else
		eq.set_timer("OOBcheck", 3 * 1000);
		end
	elseif(e.timer=="fling") then
		eq.stop_timer("fling");
		e.self:CastedSpellFinished(2167, e.self);-- Spell: Fling
		eq.set_timer("fling", 45 * 1000);
	elseif(e.timer=="bury") then
		eq.stop_timer("bury");
		e.self:Emote("buries its opponent in a fit of stone fury!");
		e.self:Emote("focuses its attention on someone new!");
		e.self:CastedSpellFinished(5001, e.self:GetHateTop()); -- Spell: Bury
		eq.set_timer("bury", 30 * 1000);
	elseif(e.timer=="throw") then
		eq.stop_timer("throw");
		e.self:Emote("throws an enemy away violently!");
		e.self:CastedSpellFinished(4185, e.self:GetHateRandom()); --throw
		eq.set_timer("throw", 40 * 1000);
	end
end

function event_death_complete(e)
	eq.signal(294614, 1); -- NPC: #Trigger_Ikkinz_4
	eq.zone_emote(0,"Alter Warden's corpse crumbles to pieces almost instantly.  Whatever is the driving force behind this creature must be siphoning the energy back into itself.");
end
