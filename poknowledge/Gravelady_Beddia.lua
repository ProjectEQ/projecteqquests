-- items: 62839, 62840, 62841, 62842
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(e.message:findi("hail")) then
		e.self:Say("Hail seeker of knowledge. There is much to be learned here in New Tanaan of the dark gods of Norrath. I have been searching the great library for tomes pertaining to my patron Bertoxxulous. the Plague Lord and made some interesting finds. If you wish to study the tomes I have uncovered you may borrow them and they will be returned to me by the magic of New Tanaan when you are through.");
	elseif(qglobals["druid_epic"] == "2" and e.message:findi("What diseases of the skin")) then
		e.self:Say("I know much about such things, but what would you want such knowledge for? I can only surmise that your goals would not be such that I would approve of them. You would have to be willing to [" .. eq.say_link("sacrifice") .. "] something, get me something precious, in order to get any such information from me.");
	elseif(qglobals["druid_epic"] == "2" and e.message:findi("sacrifice")) then
		e.self:Say("Hmmm... since you seem to be a creature of the woods, perhaps you can get something for me that I've wanted to read for a long time. There is a story of a battle between the God of Dribbles and the Lord of Plagues. We call this battle The Corruption of Night. I don't know what you people call it, but I know you must have a text concerning it. Bring me that text and I shall give you something that you probably should not have.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (item_lib.check_turn_in(e.trade, {item1 = 62839,item2 =62840, item3 = 62841})) then --Fresh Awakenings vol. 1,2,3
		e.other:SummonItem(62842); --Healing Plants
	end
	item_lib.return_items(e.self, e.other, e.trade)
end