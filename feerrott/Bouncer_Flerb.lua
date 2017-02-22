local currclient=Client();
function event_say(e)
	if (e.other:GetRace()==42) then
		if(e.message:findi("hail")) then
			e.self:Say("A wolfy! Oh, me so excited! I never get to talk to wolfy before. Why you here? You hungry? I bet you want food, but me no have food for wolfy. What do wolfy eat? You eat meat, I bet. Not plants.' The ogre breaks into a frightful laughter. 'Sorry, but I just remember dat guy I bounce lil while ago wit da grass in his pants! Funny. Me find him coming out of da mountains so me bounce him into da river. Greenbloods eat him already, prolly, so you no get to.' More grotesque giggling from the monstrosity. 'Grass in his pants!");
			currclient=e.other;
			eq.set_timer("hail",2000);
		end
	else
		e.self:AddToHateList(e.other,1);
	end
end

function event_timer(e)
	if(e.timer=="hail") then
		eq.stop_timer("hail");
		e.self:Say("Here wolfy, try dis. It good! Flerb eat most of it before, but rest still crunchy and smelly.");
		currclient:SummonItem(62814); --Hunk of Alligator Scales
		eq.set_timer("attack",3000);
	elseif(e.timer=="attack") then
		eq.stop_timer("attack");
		currclient:Message(15,"A light slowly, very slowly, comes into the bouncers eyes. 'Wait something wrong here. You wolfy. Me like wolfy, but wolfy not talk!' The massive ogre turns red with anger. He becomes an unstoppable roil of flesh as he charges you");
		e.self:AddToHateList(currclient,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	item_lib.return_items(e.self, e.other, e.trade)
end

