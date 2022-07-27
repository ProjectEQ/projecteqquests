-- items: 2694
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you and what are you doing here? This place is not safe. You are to leave here immediately! You do not belong here!");
	elseif(e.message:findi("investigator") and e.message:findi("dead")) then
		e.self:Say("So he did not make it, that is a shame. I managed to defeat all of the enemies. It was difficult but they were no match for one of my skill. Did Vegalys send you?");
	elseif(e.message:findi("vegalys sent me")) then
		e.self:Say("So Vegalys sent you to check on our progress then? I don't believe you. Prove it!");
	elseif(e.message:findi("ready to complete the mission")) then
		eq.unique_spawn(45130,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Corrupt_Guard_Helminth (45130)
		eq.unique_spawn(45106,0,0,-49,410,-38,128); --a_necromancer (45106)
		eq.unique_spawn(45118,0,0,-49,330,-38,0); --a_rotting_sentry (45118)
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2694}, 0)) then
		e.self:Say("Well, well! Vegalys did send you after all. Are you [ready to complete the mission]? I am certain I know where Azibelle is hiding.");
		e.other:QuestReward(e.self,0,0,0,0,2694);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
