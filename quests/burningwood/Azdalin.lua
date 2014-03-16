function event_combat(e)
	local random_result = math.random(60);
	
	if(e.joined) then
		e.self:Say("Foolish adventurer!!  You shall die.  You are nothing to Azdalin. ");
		if(random_result <=20) then
			e.self:Say("" .. e.other:Class() .. " like you always bring out the worst in me!");
		elseif(random_result <=40) then
			e.self:Say("I really hate " .. e.other:Class() .. " like you!");
		else
			e.self:Say("" .. e.other:Class() .. " like you are an affront to my senses!");
		end
	end
end

--by: Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
