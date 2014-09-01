-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Salutations. " .. e.other:GetName() .. "! I am here as a favor to my brother. High Priest Perrir. We seek loyal followers of Innoruuk to earn their place among the hierarchy of the Spires. Are you [" .. eq.say_link("devoted to Innoruuk",false,"devoted to Innoruuk") .. "]?");
	elseif(e.message:findi("devoted to innoruuk")) then
		e.self:Say("My brother requests your presence in Neriak at the Spires of Innoruuk. Take this note with you. " .. e.other:GetName() .. ". It will inform Perrir of who sent you.");
		e.other:SummonItem(18756); -- Tattered Note
	end
end
