function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Go away! I have no time for you!");
	elseif(e.message:findi("What are you searching for")) then
		-- should check faction here...
		e.self:Say("Ah! A smart one, I see! If you really wish to know about such a thing, you will have to help me finance my studies. The knowledge I have acquired and researched did not come cheaply.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(item_lib.check_turn_in(e.trade, {item1 = 18088})) then
		e.self:Say("So you have met Solomen, eh? He is a man with a wealth of knowledge. It is good to hear he is well.");
		e.other:Ding();
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14330}) and qglobals["wizepic"] == "1") then
		e.self:Say("So you have met Solomen, eh? He is a man with a wealth of knowledge. It is good to hear he is well.");
		e.other:SummonItem(14331);
		e.other:Faction(342,30,0); -- Truespirit
		e.other:Ding();
		e.other:AddEXP(10000);
		eq.delete_global("wizepic");
	elseif(item_lib.check_turn_in(e.trade, {platinum = 1000})) then
		e.self:Say("Good, good, you show a willingness to learn of this with your offer. What I can tell you is that Solusek Ro had four followers who had shown exceptional aptitude in the arts of wizardry. Solusek Ro himself tutored them. He considered them to be like his own children. I know of one who still exists. He goes by the name of Arantir Karondor. He used to specialize in the storing of magic into physical objects. Arantir has been hiding for many, many years and will most assuredly be going by another name, so keep your eyes open. Anyway, be off, I need to continue my research. Return to me if you ever find Arantir Karondor.");
		e.other:Ding();
		e.other:AddEXP(500);
		eq.set_global("wizepic","1",0,"D30");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
