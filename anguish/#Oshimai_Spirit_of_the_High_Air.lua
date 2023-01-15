-- items: 62647, 47100, 62627
function event_spawn(e)
	e.self:Say("So you are the one that I have been sensing all this time. I had hoped that you would come to rescue me. I am Oshimai of the High Air. I owe you and your guardian spirit my thanks. I think I know how I can repay you. Give me the Heartwood Blade, the Globe of Discordant Energy and that device you used to free me.");
	eq.set_timer("depop",30*60*1000);
end

function event_timer(e)
	if e.timer=="depop" then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);			
	if(qglobals["ranger_epic"] == "8" and item_lib.check_turn_in(e.trade, {item1 = 62647,item2 = 47100,item3 = 62627})) then  
		e.self:Shout("Everyone present shall know of your deeds. Each of you take notice of this ranger that has freed me! Oshimai of the High Air thanks you, friend and those that have aided you!' Oshimai raises the blade to the level of his eyes. A cold wind stirs in the area. It gathers around him and then flows from him into the sword in his hands. When he hands the weapon back, it has an animate life in it, a power that you can see and sense. 'I have given your ally some of my strength. He, through this blade, will be better able to aid you in your work. Thank you.");
		eq.set_global("ranger_epic","9",5,"F");
		e.other:QuestReward(e.self,{itemid=62649, exp=50000});
		e.other:AddAAPoints(10);
		e.other:Message(15,'You have gained 10 ability points!');
		eq.set_timer("depop",15*1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end