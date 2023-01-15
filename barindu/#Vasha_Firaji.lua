--  Help Vasha
function event_trade(e)
	local item_lib = require("items");
   if (e.other:GetFaction(e.self) <= 2) then
		if (item_lib.check_turn_in(e.trade, {item1 = 64011})) then --head of the aneuk overseer
      eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The look on Vasha Firaji's face softens and a tear rolls down her cheek. 'Thank you friend. With the beast where he belongs, I can finally begin to mourn. Please take this bracelet as a token of my thanks. It was my husband's. Proteri Amari tells me there is some magic locked away inside it.");
			e.other:QuestReward(e.self,0,0,0,0,64012,10000); --Item: Engraved Stone Bracelet
      e.other:Faction(1761, 10); -- Faction: Nihil
		end
  end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then
		if(e.message:findi("hail")) then
		  e.self:Emote("stares at you intently as though judging you on the spot. Making up her mind, she leans in close and says, I need your [help]");
		elseif(e.message:findi("help")) then
		  e.self:Say("Shortly after the Muramites came and enslaved us, my family was picked as a target and slaughtered. The elders tell me to mourn and let it go but I cannot while my soul sears with hatred. I want [revenge]!");
		elseif(e.message:findi("revenge")) then
		  e.self:Say("I wish death for every last one of these creatures, but I realize that simply isn't possible. The Aneuk Overseer is the one who ordered the deaths. Bring me his head so my heart can start to mend.");
	  end
  else
    e.self:Emote("pointedly ignores you and continues what she was doing.");
  end
end
