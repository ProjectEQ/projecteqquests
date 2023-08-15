--Thin Out the Murkgliders 

function event_say(e)
	--if (e.other:GetFaction(e.self) <= 2) then -- might be faction req? above KOS. need to test
if(e.message:findi("hail")) then
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 75,"The dragorn bows as you approach. 'Greetings. I know not of your heritage or family, but I beseech you none-the-less. My farms are being overrun by roving murkgliders. Too many dragorn warriors have been slain or conscripted by the Muramites and now there's no one left to defend us forgotten serfs. I beg of you, spare my life and slay as many murkgliders as you can. Bring me their blood for its scent will ward off the rest of the hive. Please help. The Muramites have forgotten us.");
		
    end
  --end
end

function event_trade(e)
  --any faction check on turn in?
local item_lib = require("items");
    if(item_lib.check_turn_in(e.trade, {item1 = 55835})) then
      eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 75,"The dragorn takes the blood from you. 'Thank you, ".. e.other:GetCleanName() ..". This should keep the murkgliders at bay for a while. Let me know if you recover any more.");
      -- any exp?
		e.other:Faction(410,1) --Dranik Loyalists +5
		e.other:Faction(432,-1) -- Overlord Mata Muram -1
    end
    item_lib.return_items(e.self, e.other, e.trade)
  end
