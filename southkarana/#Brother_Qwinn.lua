function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("In the name of the [Brotherhood of the Lost Circle], I greet you.");
	elseif(e.message:findi("brotherhood of the lost circle")) then
		e.self:Say("The [monks of the Whistling Fist] are called the Lost Circle by others. We are an ancient league of monks, long forgotten and nearly extinct. Within this realm, there are only two. [Brother Zephyl] and myself. We seek the items stolen from us. I seek the [Code of Zan Fi].");
	elseif(e.message:findi("monks of the whistling fist")) then
		e.self:Say("The monks of the Whistling fist were forged from the vision of the great master, Zan Fi. When the Combine Empire reigned supreme, a single bard grew to learn the ways of the monk. This bard was Zan Fi. The brotherhood was all but destroyed in the times that followed. Now only a few remain to carry on Zan Fi's legacy.");
	elseif(e.message:findi("code of zan fi")) then
		e.self:Say("The tome called the Code of the Whistling Fist has been stolen from me. It contains many secrets pertaining to our brotherhood. Thankfully, it is magically locked and only a Zan Fi master could unlock it. I require a monk to retrieve it. Would you be an [interested monk]?");
	elseif(e.message:findi("interested monk")) then
		e.self:Say("Then venture into the depths beyond the great Solusek Mining Company. There, living among the kobolds, will be Targin the Rock. Get the book from him, then return here and wait for my reappearance. When we meet again, you shall hand me the book and a purple headband earned from the Silent Fist clan. Do so and you shall be closer to joining the brotherhood.");
	elseif(e.message:findi("brother zephyl")) then
		e.self:Say("Brother Zephyl is searching for one who can return the [idol of Zan Fi]. I believe he is somewhere in the vicinity of the Rathe Mountains.");
	elseif(e.message:findi("idol of zan fi")) then
		e.self:Say("The idol of Zan Fi is a totem that is sacred to our brotherhood. I cannot share its secrets, but I can tell you that [Brother Zephyl] will offer to you a reward for its return..");
	elseif(e.message:findi("return the headband")) then
		e.self:Say("Then you will return that which was earned or the robe.");		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12316,item2 = 10114})) then -- Code of Zan Fi, Purple Headband
		e.self:Say("We had an agreement. The proof of a skilled monk, the purple headband, and the Code of the Whistling Fist.");
		e.self:Say("We thank you for the return of the Code of the Whistling Fist. Take this sewing needle. You shall find it useful should you aid [Brother Zephyl] in his quest. His item, the needle, a swatch of shadow silk and a scroll containing Jonathan's Whistling Warsong. Into a sewing kit they will be going. And into the brotherhood will you. I hope you do not wish me to [return the headband]..");
		e.other:SummonItem(12314); -- Needle of the Void
		e.other:Ding();
		e.other:AddEXP(2000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12314})) then -- Needle of the Void
		e.other:SummonItem(10114); -- Purple Headband
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12256})) then -- Robe of the Lost Circle
		e.other:SummonItem(10114); -- Purple Headband
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:southkarana  ID:436 -- Brother_Qwinn