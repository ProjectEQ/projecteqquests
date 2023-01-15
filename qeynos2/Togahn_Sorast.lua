-- items: 10112, 13165, 13166, 13167, 10113, 13168, 13169, 3000, 10114
function event_waypoint_arrive(e)
	if(e.wp == 16) then
		eq.set_anim(2087,1);
	end
end

function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings.. I am Second Master Togahn Sorast. I am here to teach the ways of our guild. For our more advanced members, I will give out [headbands] as a reward for their contribution to the clan.");
	elseif(e.message:findi("headbands")) then
		e.self:Say("The Silent Fist Clan gives out colored Headbands for various deeds completed by our students. Phin gives out the White, Yellow, and Orange Headbands.. and I give out the [Red, Purple, and Blue Headbands].");
	elseif(e.message:findi("Lu'Sun")) then
		e.self:Say("Ahhh, Lu'Sun is a master of many skills. He has traveled all of Norrath, studying various techniques and disciplines. Now, he runs this small guild and passes on his knowledge to those willing to devote their lives to our cause.");
	-- Requires Kindly Faction for Headband Quests
	elseif(fac <= 3) then
		if(e.message:findi("red headband")) then
			e.self:Say("Ah, you think you are skilled enough to earn the red headband of the Silent Fist Clan, " .. e.other:GetName() .. "? Hmmm.. Well, if you can help us find [Brother Dareb], you would certainly deserve the honor of wearing the red headband.");
		elseif(e.message:findi("brother dareb")) then
			e.self:Say("Yes, brother Dareb was last heard from over two weeks ago. He was out in the Plains of South Karana, and then just disappeared. We fear that those vile gnolls fleeing Splitpaw may have captured him or worse. We sent brother Shen to go search the Karanas and look for Dareb over three days ago, but haven't heard from him, either. I fear the worst for both of them, especially if the [Splitpaws] are involved. Please, " .. e.other:GetName() .. ", find and return our lost brothers to us. If they are not alive, bring back their remains so we may give them a proper burial.. and, if it is that evil [Ghanex Drah]'s doing, bring me his head as well, for the honor of the clan. You do this for us, " .. e.other:GetName() .. ", and turn in your orange headband, and I will reward you with the red headband of the Silent Fist. Good luck.");
		elseif(e.message:findi("splitpaws")) then
			e.self:Say("The Splitpaws were a large clan of gnolls that lived in a burrow out in South Karana, They have recently been ousted from their home by a new clan of gnolls that are very powerful. We try to stay away from them if we can, for we do not know much about this new breed. The Splitpaws are on the move and now is the only time to strike. If we wait too long, there will be no way to find our brother. Go now my friend, we haven't much time.");
		elseif(e.message:findi("Ghanex Drah")) then
			e.self:Say("Ghanex Drah is ruler of the now fleeing gnolls of Splitpaw. I've heard rumors that he has been dabbling in the dark art of necromancy. Ghanex is looking for more test subjects, no doubt to rebuild his stronghold. The good people of Antonica must put an end to his evil reign soon, or I fear he could grow much more powerful.");
		elseif(e.message:findi("purple headband")) then
			e.self:Say("Ah, you think you are now skilled enough to deserve the purple headband of the Silent Fist Clan? Very well, " .. e.other:GetName() .. ", I have a task for you that will prove whether or not you are worthy of this honor. I have heard recent rumors of ancient evils surfacing once again throughout Antonica. These evil groups have discovered some items that are giving them mystical and dangerous powers. These items must be destroyed, or else the evils of Norrath may gain control of the world's future. Bring me these [evil items], and turn in your red headband, and you will have proven yourself a mighty spirit and dedicated member of the Silent Fist.");
		elseif(e.message:findi("evil items")) then
			e.self:Say("These evil creations have been found all over Antonica, and no one knows, or at least no one admits to knowing, where exactly they were found, but we do know that they are currently in the wrong hands and must be destroyed. Please, " .. e.other:GetName() .. ", seek out the [Skull of Jhen'Tra], the [Dagger of Marnek], and the [Coronet of Buried Blood], and bring them to me.");
		elseif(e.message:findi("Skull of Jhen'Tra")) then
			e.self:Say("I don't know much about the Skull of Jhen'Tra. I've heard that it has resurfaced in the gnoll burial grounds of Lake Rathetear. Apparently, this skull is helping to give these gnolls the power to raise an undead army of their fallen ancestors. This evil must be stopped before their army becomes too powerful.");
		elseif(e.message:findi("Dagger of Marnek")) then
			e.self:Say("The Dagger of Marnek is a diabolical weapon created by the ancient necromancer Marnek Jaull. Marnek was the leader of a small cult of necromancers who worshipped Solusek Ro. Marnek used this dagger in his ceremonial sacrifices to the Burning Prince, to increase his own power and show his loyalty to his god. His cult grew stronger and word of the evil acts spread all over Antonica. Legend has it that a group of paladins from Erudin, followers of Prexus, spent over 10 years searching out Marnek and his followers, and finally destroyed them. Though Marnek's evil reign was put to an end, many of his books and items are still being uncovered to this day. The Dagger of Marnek is now being used by the evil inhabitants who control the depths of Befallen. Bring this dagger to me, so that we may dispose of it and banish its evil powers forever.");
		elseif(e.message:findi("Coronet of Buried Blood")) then
			e.self:Say("The Coronet of Buried Blood is an ancient headdress which is said to have belonged to the High Priest of the Plexant Temple. The Plexant were known to be devout followers of Innoruuk and the coronet is supposed to have been blessed by the Prince of Hate himself. Apparently, the coronet is now in the hands of a clan of goblins that dwell in the caverns of Permafrost.");
		elseif(e.message:findi("blue headband")) then
			e.self:Say("Sorry, we are currently out of blue headbands. Please check back later.");
		elseif(e.message:findi("black headband")) then
			e.self:Say("The black headband is one of the highest honors of our guild.. [Lu'Sun] only gives those out for great acts of heroism and devotion to the clan.");
		end
	else
		e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	-- Orange Headband, Head of Ghanex Drah, Dareb's Skull, Head of Shen
	if(item_lib.check_turn_in(e.trade, {item1 = 10112, item2 =13165, item3 = 13166, item4 = 13167})) then
		e.self:Say("We are deeply honored to have such great warrior as part of our Clan. With a proper burial, Shen and Dareb's souls will finally be at peace, and with the death of that vile Ghanex, the plains will be much safer for travelers. It is a great honor to present you, " .. e.other:GetName() .. ", with the red headband of the Silent Fist Clan.");
		e.other:SummonItem(10113); -- Item: Red Headband
		e.other:Ding();
		e.other:Faction(309,75,0); -- Silent Fist Clan
		e.other:Faction(262,11,0); -- Guards of Qeynos
		e.other:Faction(361,5,0); -- Ashen Order
		e.other:AddEXP(500);
	-- Red Headband, Skull of Jhen`Tra, Dagger of Marnek, Zaharn's Coronet
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10113, item2 =13168, item3 = 13169, item4 = 3000})) then
		e.self:Say("In honor of your recent acts of courage and dedication, I reward you, " .. e.other:GetName() .. ", with the purple headband of the Silent Fist Clan.");
		e.other:SummonItem(10114); -- Purple Headband
		e.other:Ding();
		e.other:Faction(309,100,0); -- Silent Fist Clan
		e.other:Faction(262,15,0); -- Guards of Qeynos
		e.other:Faction(361,5,0); -- Ashen Order
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2087 -- Togahn_Sorast
