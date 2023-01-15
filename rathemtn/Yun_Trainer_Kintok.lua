-- items: 17394, 51101, 51104, 51105, 51106, 51107, 51113, 51114, 51115, 51108, 51120, 51109
function event_say(e)
	if (e.other:Class() == "Shaman" and e.other:Race() ==  "Froglok") then
		if (e.message:findi("hail")) then
			local qglobals = eq.get_qglobals(e.other);
		
			if (qglobals["guktan_shield"] == nil or qglobals["guktan_shield"] == "3") then
				e.self:Emote("leans in close to whisper something in your ear, 'Be on your guard, friend. You should be ever watchful in these swamps. Beasts lurk in the waters and behind every rotting tree stump. Perhaps you would be interested in a shield of my own creation. I'll confess it has saved my life on more than one occasion.'");
			elseif (qglobals["guktan_shield"] == "1") then
				e.self:Say("Ahh, so you have returned to me with your shield. It appears to have gotten some good use in the recent months. Before I can get to work on your shield, I need a few components. Would you mind [retrieving the components] for me?");
			elseif (qglobals["guktan_shield"] == "2") then
				e.self:Say("You sure are rough on shields, arent you?! No matter, I am sure that I can reinforce the shield enough to get you a few more years out of it, but this wont be easy. I have been expecting a shipment of supplies that have not yet arrived. The shipment left Erudin last week, but I've not received it, and I fear the worst for my assistant. If you are [up to the task], I could certainly use you to research the problem, and in exchange for your services I will upgrade your shield one final time.");
			end
		elseif (e.message:findi("shield")) then
			e.self:Say("It's quite simple and surprisingly effective. Bring me some [Stretched Kobold Leather], a [Bundle of Faydark Twigs], a [Bundle of Thicket Twigs], and some [Leathery Twine] and I'll weave you one in a frog's blink. It is the least I can do for a fellow spiritist.");
		elseif (e.message:findi("stretched kobold leather")) then
			e.self:Emote("nods knowingly, 'With a pair of kobold hides and a skinning knife, it is a relatively simple matter for one to make Stretched Kobold Leather.'");
		elseif (e.message:findi("bundle of faydark twigs")) then
			e.self:Emote("gasps, 'Oh, I almost forgot! Here you are. Collect four of the twigs and place them into this box to combine them into a full bundle.'");
			e.other:SummonItem(17394); -- Twig Binder
		elseif (e.message:findi("bundle of thicket twigs")) then
			e.self:Emote("gasps, 'Oh, I almost forgot! Here you are. Collect four of the twigs and place them into this box to combine them into a full bundle.'");
			e.other:SummonItem(17394); -- Twig Binder
		elseif (e.message:findi("leathery twine")) then
			e.self:Say("For the best twine I've found that the medium quality skin from a bear and a pair of spider silks does the trick. You will need a skinning knife, of course.");
		elseif (e.message:findi("retrieving the components")) then
			e.self:Say("A brave young initiate, indeed. This task may prove to be a bit daunting, but the items I require are quite rare, and are not available in this section of the world. Return to me with a [chunk of prismatic metal], a [chunk of refined metal], a [shield frame mold], in addition to your initiates shield, and then I will get to work rebuilding your shield for you!");
		elseif (e.message:findi("chunk of prismatic metal")) then
			e.self:Say("This particular type of metal is very difficult to come by, and has only ever been reported to me as being found in the caverns of Permafrost. Last I heard, some sort of sage or something had been hoarding it for some sort of experiment that he was working on. If you can find the sage, you'll find the metal.");
		elseif (e.message:findi("chunk of refined metal")) then
			e.self:Say("The refined material has only ever been found in the depths of Unrest Mansion. It is regretful, but I cannot recall what, or who was guarding this item, but I'm sure, if you explored the mansion thoroughly, you would find some.");
		elseif (e.message:findi("frame mold")) then
			e.self:Say("Ahh, the mold, yes. . . Unfortunately, I do not know exactly where one would obtain one of these particularly useful molds. I used to know a smith in Halas, he may have one, you might go speak with him. Tell him that I sent you.");
		elseif (e.message:findi("up to the task")) then
			e.self:Say("I thought you might be. As I said before, the shipment left out of Erudin last week sometime, and has not been seen or heard from since. As you well know, that boat could be anywhere from Erudin to Qeynos. Do what you can, and return to me when you have made some progress.");
		end
	else
		if (e.message:findi("hail")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("shield")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("stretched kobold leather")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("bundle of faydark twigs")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("bundle of thicket twigs")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("leathery twine")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("retrieving the components")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("chunk of prismatic metal")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("chunk of refined metal")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("frame mold")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		elseif (e.message:findi("up to the task")) then
			e.self:Say("It's always a pleasure to meet new faces, but if you'll excuse me I'm waiting for someone more attuned to the spirits.");
		end
	end
end


function event_trade(e)
	local item_lib = require("items");
	
	-- Stretched Kobold Leather, Bundle of Thicket Twigs, Bundle of Faydark Twigs, Leathery Twine
	if (item_lib.check_turn_in(e.trade, {item1 = 51101, item2 = 51104, item3 = 51105, item4 = 51106})) then
		e.self:Emote("begins working furiously with the items you acquired, weaving the twine between the various twigs faster than your eyes can track, 'This is an old family tradition, you know. My parents showed me this skill many years ago. Ah, there we are. One final tie and it is finished. A fine shield, if I may say so. This should keep you protected for years to come. If you ever find that it is not serving up to your standards, see me again, and I shall see what I can do to improve it for you.'");
		e.other:AddEXP(500);
		e.other:SummonItem(51107); -- Guktan Initiate's Shield
		e.other:SetGlobal("guktan_shield", "1", 0, "F");
	-- Guktan Initiate's Shield, Chunk of Prismatic Metal, Shield Frame Mold, Chunk of Refined Metal
	elseif (item_lib.check_turn_in(e.trade, {item1 = 51107, item2 = 51113, item3 = 51114, item4 = 51115})) then
		e.self:Say("You have proven to be quite a resourceful young initiate! I had not expected to see you again for quite some time. This was definitely not an easy task to complete, by any means' he says, as he begins working on the shield. A few hammer swings, and a jug of water later, he holds the new shield up for inspection.' Here you are, you've earned it! I replaced the old wooden shield frame with a metal one, it should increase the durability of the shield ten fold. May it serve you well!");
		e.other:AddEXP(500);
		e.other:SummonItem(51108); -- Guktan Apprentice's Shield
		e.other:SetGlobal("guktan_shield", "2", 0, "F");
	-- Guktan Apprentice's Shield, Note to Kintok
	elseif (item_lib.check_turn_in(e.trade, {item1 = 51108, item2 = 51120})) then
		e.other:SummonItem(51109); -- Guktan Assistant's Shield
		e.other:SetGlobal("guktan_shield", "3", 0, "F");
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
