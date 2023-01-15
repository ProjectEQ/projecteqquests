-- items: 8919, 8951, 8955
function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(fac < 3) then
		if(e.message:findi("tale")) then
			e.self:Say("Nyrein Shadowstorm spent much of her life defending the Jaggedpine from within its confines. However, duty would sometimes deem that she trek beyond the forests to assure its protection. In the peak years of her life, she spent much time wandering the whole of Norrath in pursuit of one villain that had betrayed the entire order. We are not certain why or how this one, who at one time was Nyrein's most trusted of companions and second to only her within the order, fell to the temptations and corruption of The Faceless -- but we do know that Nyrein defeated him on the battlefield. He fled to the Plane of Fear and with him went the very essence of the Tempest Guard that remains caged within his corrupted, violent spirit. Find the Tempest Reaver and retrieve the Essence of the Tempest Guard, which you must then seal within the Hollowed Tempest Stone to create the Tempest's Guard Stone. Once you have this sacred stone, return it to Lady Deira.");
		end
	end
end

function event_trade(e)
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 8919, item2 = 8951})) then
    e.self:Say("Aaaah, yet another warrior brave enough to face their own faults and honorable enough to strive for a proof of their worth and devotion to The Rainkeeper. Your kind is too few and far too rare, but do not think that your trials are at their end. I have forged the necessary Hollowed Tempest Stone -- yes, young warrior, I am indeed one well versed in the ways of the Tempest Guard for at one time I myself held such a rank in a time before the closing of the Jaggedpine. Aaaah, but enough reminiscing for one day -- your trial is the matter at hand. Within the Hollowed Tempest Stone you must combine the Essence of the Tempest Guard, which you will find only through great peril. The Tempest Reaver, who resides in the realm of Cazic-Thule himself, holds the essence. The [tale] regarding its presence there is indeed one to be heard if you wish to fully understand your task.");
	e.other:SendSound();
	e.other:SummonItem(8955); -- Item: Hollowed Tempest Stone
    e.other:Faction(280,10,0); -- Faction: Knights of Thunder
    e.other:Faction(221,-10,0); -- Faction: Bloodsabers
    e.other:Faction(341,7,0); -- Faction: Priests of Life
    e.other:Faction(262,7,0); -- Faction: Guards of Qeynos
    e.other:AddEXP(1000);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
