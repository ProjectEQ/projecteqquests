--VZ splits from rztwl script ##Vallon_Zek_ (214129)
function event_combat(e)
if (e.joined == true) then
eq.set_timer("OOBcheck", 6 * 1000);
else
eq.stop_timer("OOBcheck");
end
end

function event_timer(e)
if(e.timer=="OOBcheck") then
	if (e.self:GetX() > 650) then
		e.self:CastSpell(2441,e.other:GetID(),0,1); -- Spell: Shadowblade
		e.self:GMMove(412,11,169,129);
		e.self:Emote("'s image fades into the shadows of Drunder.");
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end
