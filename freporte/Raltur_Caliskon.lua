function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the rage of Innoruuk flow through your veins. Welcome " .. e.other:GetName() .. ". Soon the Dismal Rage shall run rampant in the streets of Freeport. Our numbers grow. Like you, so many feel the rage within. It is now time to [ serve Innoruuk ].");
	elseif(e.message:findi("serve innoruuk")) then
		e.self:Say("Wise choice. We of the Dismal Rage have learned of the value of incompetence. As the Teir'Dal use the ogres and the trolls so to shall the Dismal Rage have A pawn in this game. Ours is the Freeport Militia. They trust us. How unfortunate for them. I want you to go speak with Sir Lucan D'lere, the so called ruler of this city and leader of this mob of ruffians called the Freeport Militia. Tell him you are [ from the Shrine of Innoruuk ]. Do as he asks. Little favors lead to large debts. And if you should find something of importance, bring it to me not that inept warrior.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18822})) then
		e.self:Say("So the great Antonius Bayle wishes to ally himself with the mighty Knights of Truth. How pathetic. It would appear that the alliance has spawned infiltrators of sorts. Of course, we of the Dismal Rage are already aware of this, but I am sure Sir Lucan D'Lere knows nothing as usual. I have a [mission] for any evil shadowknight of Innoruuk.");
		e.other:Ding();
		e.other:Faction(235,1,0);
		e.other:Faction(86,1,0);
		e.other:Faction(184,-3,0);
		e.other:AddEXP(5000);
		e.other:GiveCash(0,2,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10100 -- Raltur_Caliskon