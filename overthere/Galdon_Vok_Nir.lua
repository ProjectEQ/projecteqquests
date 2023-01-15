-- items: 12743, 12744, 12742
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Please do not harm me.  I am not the one who brought the outsiders to our land.  I am innocent and deserve to return to my people.");
	elseif(e.message:findi("What will you trade for the skull of Di Nozok?")) then
		e.self:Say("Ah, doing the bidding of the council are you?  I will only give up the skull for the 2 Ton Warrior Totems held by the goblins of nurga and frogloks of the swamp of no sarrow, the Canopie of Di Nozok held by the goblin Overseer Dlubish, and 400 gold pieces.");
	elseif(e.message:findi("sealed canopic")) then
		e.self:Say("I have heard of such things.  You must have stumbled upon an ancient jar devised by one of my long-dead ancestors.  They were fine craftsmen.  I do not share their gift, but I do know the secret of the locks.  If you have one of the ancient Vok Nir canopics, allow me to open it for you.");
	elseif(e.message:findi("dai keys")) then
		e.self:Say("There are two keys of Dai.  They were made of ceramic and were also crafted to look like warrior totems. I once broke one as a child and my grandfather got very angry.  He lashed me good!  I do not know what the big fuss was about; he easily put them back together using some sort of clay.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the 2 totems and the canopie of Di Nozok and 400 gold pieces
	if(item_lib.check_turn_in(e.trade, {item1 = 12743, item2 = 12744, item3 = 12742, gold = 400})) then
		e.self:Say("A deal is a deal I suppose, many have attempt to do what I have asked, but fallen to the Overseer.");
		e.other:QuestReward(e.self,0,0,0,0,12740); -- Give the player the Iksar Skull
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end
