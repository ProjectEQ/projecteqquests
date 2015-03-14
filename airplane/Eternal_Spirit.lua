-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd and Sorvani
---------------------------------------------------------------------------------------
-- on death of Eternal Spirit, two a soul harvester spawn
--

function event_death_complete(e)
	eq.spawn2(71110,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	eq.spawn2(71110,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 57081})) then
		e.self:Emote("beams and looks at you with pride, 'Greetings, " .. e.other:Class() .. ". I am both glad to see you and somewhat sad. I know you are here to retrieve my talisman -- which is the reason for my weeping heart. I do understand the importance of taking it for the Ruchu. My heart does warm, though, at the sight of a class in pursuit of great things. I am envious. Here, take the talisman and protect it with your life. I should like to see it again after all has been set right.'");
		e.other:SummonItem(57083);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
