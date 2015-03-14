function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Emote("stops and flashes brightly for a moment. It seems to be regarding you with interest.");
		eq.pause(30);
	elseif(fac<=3) then
		if(e.message:findi("shield of falsehood")) then
			e.self:Say(string.format("Yes, I have taken Marr's Promise along with Woe and Envy and fashioned them together to create the Shield of Falsehood. Wield this in defense of possession and the weakness that comes with hoarding treasure instead of using it to accomplish your goals. May it serve you well, %s.",e.other:Race()));
			e.other:SummonItem(1679);
		elseif(e.message:findi("last path")) then
			e.self:Say("You have trusted us along the paths we have set before you. You have been known to be patient and await the right moment. And now, you have learned the wisdom to act in our best interest. However, one last path awaits, to determine if you have the ability to act out what must be done.");
			e.self:Say("There are many troubles about the world we try to rub out but none is more serious than the curse on what the wasichu call the Emerald Jungle. Go there and find one of our spirits. Show them the gem you have been given and follow the path they set you on.");
			e.other:SummonItem(1668);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1667})) then -- Part of Shaman Epic 1.0
		e.self:Say("Oh, it is you, shaman! Good! You must hurry before it's too late. Go now to the Mountains they call Rathe and find them! They need your help quickly! They will know you when they see you and instruct you on how you can help, but you must hurry!");
		e.other:Ding();
		e.other:Faction(342,250,0);
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1675,item2 = 1676,item3 = 1677})) then -- Part of Shaman Epic 1.0
		e.self:Emote("nods somberly and takes the items. After a moment, he says, 'It is unfortunate that it came to this, but nothing else was to be done. Both paragons had lost sight of their virtures to protect the items given to them. The mere protection of these material belongings was not as important to Mithaniel Marr or Bertoxulous as it was that they act with righteousness in their minds and purpose in their hearts.");
		e.self:Say("You saw this and acted accordingly. For that, we will reward you with the three treasures made into one to ward off the falsehood of possession, the [Shield of Falsehood]. You have walked the path and now, as your final test, we must set you along one [last path].");
		e.other:Ding();
		e.other:Faction(342,200,0);
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1669,item2 = 1670})) then -- Part of Shaman Epic 1.0
		e.self:Say("This is a sad day. You have failed and strayed from the path set before you. Please try to live as close to the spirits as you are able, though this is the closest you will ever get.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1669})) then -- Part of Shaman Epic 1.0
		e.self:Say("This is a sad day. You have failed and strayed from the path set before you. Please try to live as close to the spirits as you are able, though this is the closest you will ever get.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1670})) then -- Part of Shaman Epic 1.0
		e.self:Say("This is a sad day. You have failed and strayed from the path set before you. Please try to live as close to the spirits as you are able, though this is the closest you will ever get.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
-- converted to lua by: robregen