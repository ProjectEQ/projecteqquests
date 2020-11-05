function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Thank you for stopping by. Had you heard I was looking for any and all information regarding the Tesch Val incursion? Perhaps you have come to help me gather knowledge? I seek the [Tesch Val scrolls]!",e.other:GetName()));
		e.self:DoAnim(70); -- bowing		
	elseif(e.message:findi("scrolls")) then
		e.self:Say("Oh good! I can add them to my collection. We are preparing to make books you know. Bring me any of the scrolls you find in the old Splitpaw lair, and I would be happy to reward you handsomely.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	-- Verified Live faction and experience.  questsay and item reward seems to be random with each item turn in.
	local scroll = 0;
	local Volone = item_lib.count_handed_item(e.self,e.trade, {18504});
	local Voltwo = item_lib.count_handed_item(e.self,e.trade, {18505});
	local Volthree = item_lib.count_handed_item(e.self,e.trade, {18506});
	local Volfour = item_lib.count_handed_item(e.self,e.trade, {18507});
	
	if(Volone == 1) then
		scroll = scroll + 1;
		Volone = 0;
	end
	if(Voltwo == 1) then
		scroll = scroll + 1;
		Voltwo = 0;
	end
	if(Volthree == 1) then
		scroll = scroll + 1;
		Volthree = 0;
	end
	if(Volfour == 1) then
		scroll = scroll + 1;
		Volfour = 0;
	end
	
	if(scroll > 0) then
		repeat
			if(math.random(100) < 50) then
				e.self:Say("Why thank you, " .. e.other:GetCleanName() .. ". If you do happen to come across any more of these, please bring them to me.");
			end
			if(math.random(100) < 50 and not e.other:HasItem(12076)) then
				e.other:QuestReward(e.self,{itemid = 12076});
			end
			e.other:Faction(e.self,121,2,0); -- Faction: Qeynos Citizens
			e.other:QuestReward(e.self,math.random(0,15),math.random(0,8),math.random(0,8),math.random(0,2),0,5000);
			scroll = scroll - 1;
		until scroll == 0;
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
