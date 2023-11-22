function event_say(e)
	e.self:SetTarget(e.other);
	e.self:SetAppearance(0); -- Stand
	local plevel = e.other:GetLevel();
	eq.set_timer("Sit", 30 * 1000);

	if e.other:GetFaction(e.self) >= 7 then -- Dubious or higher (lower number is higher faction)
		e.self:Say("You had best be on your way before you end up as a feast for the worms!");
	elseif e.message:findi("hail") then
		e.self:Say("Make it a habit of walking into peoples rooms now do ya? Well seeing as I'm here on business I may have a [proposition] for you.");
	else
		if plevel <= 19 then
			e.self:Say("You are far too inexperienced to assist me in my endeavors.");
		else
			if e.message:findi("proposition") then
				e.self:Say("I'm in the employment of an alchemist that desires some rare venom from this region of Norrath. I will reward you with a special weapon treatment if you can return to me with a venomous spikefish poison sac, an ancient poison sac, an ancient snake fang, and the blood of a necromancer.");
			elseif e.message:findi("special weapon treatment") then
				e.self:Say("My employer has uncovered the secrets of the Bloodclaw and can reproduce the weapon treatment used in the forging of the legendary Stiletto of the Bloodclaw.");
			end
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.trade, {item1 = 31828,item2 = 22570, item3 = 6949,item4 = 6950}) then
		e.self:Say("There is the weapon treatment I promised you. Use it in a forge with either a Long Sword or a Scimitar. Choose which weapon you prefer carefully as there is only enough of the substance for a single treatment.");
		e.other:QuestReward(e.self,{itemid = 22571, exp = 500}); -- Item: Thick Caustic Liquid
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:IsClient() then
		e.self:SetTarget(e.other);
		e.self:SetAppearance(0); -- Stand
	end
end

function event_exit(e)
	if e.other:IsClient() then
		e.self:SetAppearance(1); -- Sit
	end
end

function event_timer(e)
  if e.self:IsEngaged() then
    e.self:SetAppearance(0); -- Stand
  else
    e.self:SetAppearance(1); -- Sit
  end
end