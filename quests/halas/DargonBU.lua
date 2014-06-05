function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there, " .. e.other:GetName() .. ".  Can I interest you in any components to help you in your research?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14331})) then --Ro's Breath
		e.self:Say("So, I've been discovered! You must know Camin - he is one of the only people who could have recognized my work. I have worked very hard to mask my presence here.");
		eq.unique_spawn(29089,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	--Return Love Note handin
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14335})) then
		eq.unique_spawn(29089,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.set_global("wizepicA","1",1,"F");
		eq.depop_with_timer();
	--Return Oil Note handin
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18168})) then
		eq.unique_spawn(29089,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.set_global("wizepicB","1",1,"F");
		eq.delete_global("wizepicA");
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
