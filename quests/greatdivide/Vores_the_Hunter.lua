function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("squints and looks in your direction. 'Who is that? I can't see ya but yer not Coldain and yer voice is too whiny for a giant. We ain't bashin' each other's brains in yet so ya can't be all that bad. Come have a seat by me fire. But quiet yerself down already. The wurms may not be the best at sniffin out people but best not to test em'.");
	elseif(e.message:findi("wurm")) then
		e.self:Say("Ye must be kidding me, outlander. Sure'n ya got eyes. The shardwurms. If ye can't see em then ya best not be tryin' ta put on yer pants for fear of stabbin' yerself with a sword.");
	elseif(e.message:findi("control")) then
		e.self:Say("Control. Aye. Break em like dogs or such. Domesticate em. I ain't ever found a way, all I got is me theories.");
	elseif(e.message:findi("theories")) then
		e.self:Say("It ain't so complex like a caster's diagrams 'n such. I just be thinkin' mebbe ya need a somethin' like a leash and then maybe some magical gem o' control. Uh, maybe. Ain't much for years o' work, eh? Unfortunately, I tried a hundread of other things already. Them wurms chafe at any attempt at control.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 30270,item2 = 30249})) then -- Gem of Persuasion and Blood Wolf Harness
		e.self:Say("Hey! What ya got there? Well now, ain't that pretty! Ya know, this just might do it. You done what I never was able. I gotta give ya that much. I ain't much o' one for travelin' any more. My legs be old and my bones are weak. You take this harness and find a good big mother of a wurm ta test it on. Just focus in yer mind what yer wantin the wurm ta do. Heh, maybe have it clear out some pests, eh?");
		e.other:SummonItem(30272); -- Harness of Control
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
