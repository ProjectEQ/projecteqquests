-- items: 62846, 62857, 62885, 62875
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(e.message:findi("hail")) then
		e.self:Say("Hi. It's a wonderful view. I'm not sure that it makes up for what we've [" .. eq.say_link("done") .. "] to get here, though.");
	elseif(qglobals["druid_epic"] == "5" and e.message:findi("stabilizer")) then
		e.self:Say("A stabilizer? Well, there are several in nature. What do you need it for?");
	elseif(qglobals["druid_epic"] == "5" and e.message:findi("I need to purify a Mind Crystal")) then
		e.self:Say("Really? I have been consulted about the Mind Crystal, but I have not had the chance to see it yet. Please, let me see this crystal.");		
	end
end


function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other)
	if(item_lib.check_turn_in(e.trade, {item1 = 62846})) then --Mind Crystal
		e.self:Say("This is a very interesting item. I sense that it was not grown naturally. For all of its other flaws, that might be the most severe. Hmmm... let me think about this a moment. There are certain kinds of moss that I think might work well for you, probably some of the heartier mosses that are found in the wooded areas of Kunark. I don't know who you are working with and I probably don't want to know. But if they created this crystal it is not a druid. I suspect that the directions you have been given will indeed work to remove the nasty taint that it carries. I think, however, that you will need something more than just moss. You'll need some way to allow the crystal to grow into the natural form that it wants to take. This can probably be done after you purify it. Please, come back to me when you have done so and let me examine the crystal again. Maybe I can help.");
		eq.set_global("druid_epic","6",5,"F");
		e.other:SummonItem(62846); --Mind Crystal
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62857})) then --Cleansed Mind Crystal
		e.self:Say("I knew that coming here would show me a way to aid nature! This is a lovely crystal, but it is still marred at the core where it was forced to grow unnaturally. If you can find a way to . . . I don't know . . . replant it so that it can regrow, this would be the most precious crystal I've ever seen. You will need to find a fertilizer that will be potent enough to restart the growth process. There is no soil that I know of that could do it. You'll need to get the best soil you can find and supplement it with something very fertile. You'll probably also need a special pot to put it in, though I don't know what that would be made of. It too would have to be very potent to focus the energy of the crystal and allow it to regrow.");
		eq.set_global("druid_epic","7",5,"F");
		e.other:SummonItem(62857); --Cleansed Mind Crystal
	elseif(qglobals["druid_epic"] == "12" and item_lib.check_turn_in(e.trade, {item1 = 62885})) then --Synched Leather Bag
		e.self:Say("Well, this shouldn't be too hard. These pieces want to be rejoined. I suppose all you really need is a good source of reliable cold to help the pieces mend together and a cool place to put them while that happens. Once you have the pieces together you'll need a source constant heat to revive the spirit. The frozen spirit and the heat will need a warm place to sit for a while. You could probably use one good insulated container for both tasks. Here, let me show you what I mean.' Silanda sketches a drawing on a pieces of rough parchment and hands it to you. 'You'll want to have that made out of the clay the Taelosians used to make their stone workers. There is one problem, though. I can sense that all of the energy has been drained from the spirit that resides here. You will need to restore that energy once you have made the shards whole. It seems likely that the energy should be restored while the spirit is being revived.");
		e.other:SummonItem(62885); --Synched Leather Bag
		e.other:SummonItem(62875); --Insulated Container Sketch		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end