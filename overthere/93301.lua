function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if (qglobals["Fatestealer"] == "1" ) then
		if (e.message:findi("hail")) then
			e.self:Emote("shoots you an untrusting glare. He is wearing a pendant that resembles a sun occluded by the horizon.");
		elseif (e.message:findi("the sun is setting on the horizon")) then
			e.self:Say("Yes, of course. I have been waiting for you, " .. e.other:GetName() .. ". Seek out the legendary rogues. While some of them may welcome you with open arms, the [" .. eq.say_link("Teir`dal") .. "] will certainly be the most difficult to negotiate with. Wear your pendant so that they recognize your status. While tales of your exploits and your name are well known, they don't necessarily know what you look like. You can use that to your advantage. When you can fit it into your schedule, there is also [" .. eq.say_link("another problem") .. "] that needs to be dealt with. I hope this hasn't overwhelmed you yet. There is much to be done and little time.");
		elseif (e.message:findi("Teir`dal")) then
			e.self:Emote("winks and you see through his guise. He isn't a dark elf after all");
			e.self:Say("Yes, the Teir`dal's information might be tricky. You see. . . they hold a bit of a grudge against Stanos ever since they learned of his involvement in the Joren incident. That grudge WILL carry over to you, no matter how charming you think you might be. Use other methods to obtain the information if you cannot coerce it from them.");
		elseif (e.message:findi("another problem")) then
			e.self:Say("I hope you aren't against a little intimidation, " .. e.other:GetName() .. ".' He sighs, 'This is the problem. Our most influential contact in the Wayfarer's Brotherhood refuses to affiliate himself with us, even a little, until the bad publicity surrounding our organization lightens up a bit. Our shady background wasn't a problem in the past, but now he refuses to speak with us. We suspect he has turned over a new leaf and now that he considers himself a champion of the people, he doesn't want to tarnish this reputation. If you can convince those that have spoken out against Stanos to [" .. eq.say_link("change their tune") .. "], I think we stand a chance of garnering the favor of this contact again. This job is of utmost importance, " .. e.other:GetName() .. ", because this contact could lead us to the would-be assassin.");
		elseif (e.message:findi("change their tune")) then
			e.self:Say("Yes, exactly. Bards. The self-proclaimed heralds of Norrath. What they are is slander, personified. It seems there are several of them that have been sullying Stanos' name in both story and song. Deliver this letter to them. It's a 'request' that they speak favorably about our generous benefactor, lest some ill fate befall them. If they refuse, you know what to do. Empty threats mean nothing.");
			e.other:SummonItem(9590);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);

	if (qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 10243})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ". Galdorin had it coming, so don't feel too guilty about your part in this.");
		eq.set_global("Fatestealer_gal", "1", 5, "F");
		local qglobals = eq.get_qglobals(e.self, e.other);
		if (qglobals["Fatestealer_gal"] == "1" and qglobals["Fatestealer_mar"] == "1" and qglobals["Fatestealer_lyt"] == "1") then
			e.self:Say("That should do the trick. I think our contact will speak with you now. His name is Lirpin, and he is a paladin that works for the Wayfarer's Brotherhood. I hear he led an expedition into Kuua recently, but his current location is anyone's guess. Good Luck.");
			eq.set_global("Fatestealer_bard", "1", 5, "F");
		else
			e.other:SummonItem(9590);
		end
	elseif (qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 10239,item2 = 52416})) then
		e.self:Say("Those Marsingers won't be speaking ill about us again anytime soon.");
		eq.set_global("Fatestealer_mar", "1", 5, "F");
		local qglobals = eq.get_qglobals(e.self, e.other);
		if (qglobals["Fatestealer_gal"] == "1" and qglobals["Fatestealer_mar"] == "1" and qglobals["Fatestealer_lyt"] == "1") then
			e.self:Say("That should do the trick. I think our contact will speak with you now. His name is Lirpin, and he is a paladin that works for the Wayfarer's Brotherhood. I hear he led an expedition into Kuua recently, but his current location is anyone's guess. Good Luck.");
			eq.set_global("Fatestealer_bard", "1", 5, "F");
		else
			e.other:SummonItem(9590);
		end
	elseif (qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 10246})) then
		e.self:Say("Excellent, Lythe has been silenced.");
		eq.set_global("Fatestealer_lyt", "1", 5, "F");
		local qglobals = eq.get_qglobals(e.self, e.other);
		if (qglobals["Fatestealer_gal"] == "1" and qglobals["Fatestealer_mar"] == "1" and qglobals["Fatestealer_lyt"] == "1") then
			e.self:Say("That should do the trick. I think our contact will speak with you now. His name is Lirpin, and he is a paladin that works for the Wayfarer's Brotherhood. I hear he led an expedition into Kuua recently, but his current location is anyone's guess. Good Luck.");
			eq.set_global("Fatestealer_bard", "1", 5, "F");
		else
			e.other:SummonItem(9590);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
