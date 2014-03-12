function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". This is my domain and I hope you have a peaceful stay. That is, unless the [lunatic sent you].");
	elseif(e.message:findi("lunatic sent me")) then
		e.self:Say("Oh, I see. I suppose you [want these cursed markers] that lunatic made me hold?");
	elseif(e.message:findi("cursed markers")) then
		e.self:Say("I am afraid that I can not just give them away. The lunatic had them cursed. They make me do [strange things]");
	elseif(e.message:findi("strange things")) then
		e.self:Say("Like ATTACK you!");
		eq.attack(" .. e.other:GetName() .. ");
	end
end

function event_death_complete(e)
	eq.set_global("sirran","3",3,"M20");
	eq.spawn2(71058,0,0,320,540,-54,128);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
