-- Txevu Flagging

function event_say(e)
	local has_all_keys = (e.other:HasItem(60176) and e.other:HasItem(60252) and e.other:HasItem(60253));
	local has_some_keys = (e.other:HasItem(60176) or e.other:HasItem(60252));

	if e.message:findi("Hail") then
		if has_all_keys then
			e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'I've been expecting you. You have all three pieces to complete the mystery of Txevu. Give them to me and I will use what geomantic knowledge I have to form them into a totem of stone that will carry the trusik essence.'");
		elseif has_some_keys then
			e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Hello. I see you've been busy. I've heard of your exploits from the scouts in the mountains and it seems you're close to uncovering the mystery of Txevu. Return to me when you have more information.'");
		else
			e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Greetings. I'd love to chat but I must get back to my studies. I've been learning as much as I can about geomancy and its uses. Good day.'");
		end
	elseif e.message:findi("need this back") then
		local data_bucket = e.other:GetBucket("txevu_items");
		if data_bucket ~= "" then -- Has Started
			local s = eq.split(data_bucket, ',');

			local sliver	= tonumber(s[1]); -- Item: Sliver of the High Temple (60176)
			local fragment	= tonumber(s[2]); -- Item: Fragment of the High Temple (60252)
			local splinter	= tonumber(s[3]); -- Item: Splinter of the High Temple (60253)

			local has_all_keys = (sliver == 1 and fragment == 1 and splinter == 1);

			if has_all_keys then
				-- do nothing
			elseif splinter == 1 then
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Here is your splinter from the high temple.'");
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Please keep it safe until you can recover whatever else goes along with it.'");
				update_databucket(e,sliver,fragment,0);
				e.other:SummonItem(60253); -- Item: Splinter of the High Temple
			elseif fragment == 1 then
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Here is your fragment from the high temple.'");
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Please keep it safe until you can recover whatever else goes along with it.'");
				update_databucket(e,sliver,0,splinter);
				e.other:SummonItem(60252); -- Item: Fragment of the High Temple
			elseif sliver == 1 then
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Here is your sliver from the high temple.'");
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Please keep it safe until you can recover whatever else goes along with it.'");
				update_databucket(e,0,fragment,splinter);
				e.other:SummonItem(60176); -- Item: Sliver of the High Temple
			else
				e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Please keep it safe until you can recover whatever else goes along with it.'"); -- Yes he says this even if you do not have any items.
			end
		else
			e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'Please keep it safe until you can recover whatever else goes along with it.'"); -- Yes he says this even if you do not have any items.
		end
	end
end

function update_databucket(e,sliver_turnin, fragment_turnin, splinter_turnin)
	e.other:SetBucket("txevu_items", sliver_turnin..","..fragment_turnin..","..splinter_turnin);
end

function event_trade(e)
	local item_lib = require("items");
	local data_bucket = e.other:GetBucket("txevu_items");
	local sliver	= 0; -- Item: Sliver of the High Temple (60176)
	local fragment	= 0; -- Item: Fragment of the High Temple (60252)
	local splinter	= 0; -- Item: Splinter of the High Temple (60253)

	if data_bucket ~= "" then -- Has Started
		local s = eq.split(data_bucket, ',');

		sliver		= tonumber(s[1]); -- Item: Sliver of the High Temple (60176)
		fragment	= tonumber(s[2]); -- Item: Fragment of the High Temple (60252)
		splinter	= tonumber(s[3]); -- Item: Splinter of the High Temple (60253)
	end

	if item_lib.check_turn_in(e.trade, {item1 = 60176, item2 = 60252, item3 = 60253}) then -- Item: Sliver of the High Temple, Fragment of the High Temple, Splinter of the High Temple
		update_databucket(e,1,1,1);
	elseif item_lib.check_turn_in(e.trade, {item1 = 60176}) then -- Item: Sliver of the High Temple
		e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'You've found a sliver from the high temple deep within the mountains! I'm impressed. Do you have anything else or do you [need this back]?'");
		update_databucket(e,1,fragment,splinter);
	elseif item_lib.check_turn_in(e.trade, {item1 = 60252}) then -- Item: Fragment of the High Temple
		e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'You've found a fragment from the high temple deep within the chantry! I'm impressed. Do you have anything else or do you [need this back]?'");
		update_databucket(e,sliver,1,splinter);
	elseif item_lib.check_turn_in(e.trade, {item1 = 60253}) then -- Item: Splinter of the High Temple
		e.other:Message(MT.NPCQuestSay, "Brevik Kalaner says, 'You've found a splinter from the high temple deep within the mountains! I'm impressed. Do you have anything else or do you [need this back]?'");
		update_databucket(e,sliver,fragment,1);
	end

	progress_check(e);

	item_lib.return_items(e.self, e.other, e.trade)
end

function progress_check(e)
	local data_bucket = e.other:GetBucket("txevu_items");
	if data_bucket ~= "" then -- Has Started
		local s = eq.split(data_bucket, ',');

		local sliver	= tonumber(s[1]); -- Item: Sliver of the High Temple (60176)
		local fragment	= tonumber(s[2]); -- Item: Fragment of the High Temple (60252)
		local splinter	= tonumber(s[3]); -- Item: Splinter of the High Temple (60253)

		local has_all_keys = (sliver == 1 and fragment == 1 and splinter == 1);

		if has_all_keys then
			e.other:Message(MT.NPCQuestSay, "Brevik Kalaner takes the three stone pieces from you and wraps them in a soft hide covered with glyphs. He mutters some strange words and the stones begin to glow and undulate beneath the hide. You see a wind of souls swirl around you and become absorbed in the stone. 'The essence of the trusik has been imbued into this stone. With one touch of this totem, the guardian of Txevu will recognize the spirit of its masters and let you pass.'");
			e.other:SummonItem(60254); -- Item: Cipher of Txevu
			eq.set_global("god_txevu_access","1",5,"F");
		end
	end
end
