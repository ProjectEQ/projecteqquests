--shadeweaver/#Wunshi_Kashra.lua NPCID 165296
--Shaman Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Ah, another courageous alchemist after my own heart. I've been so worried and consumed by aiding the spirits that I'd forgotten how much time I'd spent here. Anyway, no matter. If you give me 1000 platinum pieces, I will give you the medicine bag you will need to work the potion for the spirit. I hate to ask for money, but this bag has cost me four times that to make. It's a long process that requires the magic of some very rare and expensive materials. We are dealing with wisps of consciousness, after all.");
	elseif(e.message:findi("hail") and qglobals["shaman_epic"] == "3") then
		e.self:Say("I am glad to see you do all you can to aid the spirits. Their grasp on existence grows weaker every day and it breaks my heart. With you, though, we may stand a chance. Now, it is up to you to find two dark creatures that carry some treasures that we need and they will not be willing to part with them. First you must find a [gruesome being] whose goal is to steal spirits to make it stronger. It wears a ring that it obtained from an evil enchanter who used it to charm the very spirits of its prey. The [second beast] is just as foul.");
	elseif(e.message:findi("gruesome being") and qglobals["shaman_epic"] == "3") then
		e.self:Say("This creature is found far across the seas and exists between life and death. It is quite frightful to behold amongst its followers. Good luck to you, my friend. Return the ring to me and I will guide you further.");
	elseif(e.message:findi("second beast") and qglobals["shaman_epic"] == "3") then
		e.self:Say("The second creature is a strange and powerful beast that seeks to increase the number of its followers by overcoming them with intimidation. I am embarrassed to say that he had [stolen] a special gift from me -- a gift given to me by the elder spirits when I had proven my dedication and worth.");
	elseif(e.message:findi("stolen") and qglobals["shaman_epic"] == "3") then
		e.self:Say("The vermin that stole it now abuses it to gain control over spirits it wants to command. It is a peculiar beast that lives way up in the heavens on the moon. It is not often seen, so your timing must be right. Return its amulet to me when you obtain it. We will all be better off without this creature lurking about.");
		eq.set_global("shaman_epic_nadox","1",5,"F");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {platinum = 1000})) then
		e.self:Say("When you have all the pieces you need, you must find the great shaman who seeks greater knowledge of the spirit world. You will need his guidance with this task.");
		e.other:SummonItem(57704); --Thatched Medicine Bag
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57087, item2 = 57085}) and qglobals["shaman_epic"] == "3") then --hand in Ring of the Undead Spiritcharmer (drops from Spiritseeker Nadox in Crypt of Nadox) and Amulet of the Spiritist (drops from Netherbian Swarmfiend in Umbral Plains)
		e.self:Say("Marvelous! You have come a long way, " .. e.other:GetName() .. " . I didn't have many doubts, but to see you return with this very rare and precious item is a joy. Now that we have this, we are yet another step closer to performing the Ruchu. I will keep this and deliver it. Thank you and stay strong, heyokah.");
		e.self:Say("I'll be! You have successfully put an end to that fiend. This amulet will be used by the spirits during Ruchu. Now this amulet which I had used so many times in the past will help the one who wears it during the ritual to bind itself to the consciousness of the spirits so that they can be called. Stay focused shaman.");
		eq.delete_global("shaman_epic_nadox");
		eq.set_global("shaman_epic","4",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
