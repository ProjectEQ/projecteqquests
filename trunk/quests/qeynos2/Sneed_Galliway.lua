function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s. I am Sneed Galliway, merchant and citizen. I run the only general store in all of Qeynos, serving the needs of the many adventurers who call Qeynos home. If only one of them would take the time to help me with my er... [problem]...",e.other:GetName()));
	elseif(e.message:findi("problem")) then
		e.self:Say("Shhh.. Keep it down. It seems I have a little rodent problem in my store. A mangy rat keeps digging into my crates of rations. He looks as if he is diseased. If you help me by killing this pest, I will make it worth your while. Bring me his head as proof it is done.");
	elseif(e.message:findi("ronn castekin")) then
		e.self:Say("Ronn? I saw him a few days ago. He was with someone dressed in black I didn't recognize .. I think I saw them later that day, swimming in the north pond. They really should stay away from the aqueducts. They can be quite dangerous. Full of rats, ya know.");
	elseif(e.message:findi("tax collection")and tax.tax_collection ~= nil) then
		e.self:Say(string.format("Hey, %s, how the heck did Vicus convince you to do his job? He better be paying you well. Here you go.",e.other:GetName()));
		e.other:SummonItem(13172);
		e.other:Faction(217,-10,0);		
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13717})) then -- rat head
		e.self:Say("HA! Good work! I knew you were the person for the job. A regular ratslayer you are. Here is your reward as promised. be sure you keep this between us.");
		e.other:Ding();
		e.other:Faction(217,5,0);
		e.other:Faction(33,-10,0);
		e.other:Faction(9,5,0);
		e.other:Faction(47,5,0);
		e.other:Faction(135,5,0);
		e.other:AddEXP(250);
		e.other:GiveCash(4,0,0,0);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end
