function event_spawn(e)
	eq.set_timer("cough",350000);
end

function event_timer(e)
	if(e.timer == "cough") then
		e.self:Emote("coughs and wheezes.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s.  My name is Vicus Nonad. <cough>  I am the official tax collector for the fine city of Qeynos. <cough>  I serve the will of Antonius Bayle, our glorious leader.  <cough>  <cough>  Please excuse my [cough].  <cough>",e.other:GetName()));
	elseif(e.message:findi("cough")) then
		e.self:Say("Oh, <cough> I am sorry, but it seems I have fallen a bit ill.  I was caught out in the rain the other day and my chills have gotten the best of me. <cough>  If only someone would [help] me with today's [collections]..  <cough>");
	elseif(e.message:findi("help")) then
		e.self:Say("Oh thank <cough> you so <cough> <cough> much <cough>..  Here is the official collection box.  Please collect from each merchant on the <cough> [list].  Then bring me back the combined total of all your collections.");
		e.other:SummonItem(17012);
		eq.set_global("tax_collection","0",5,"F");
	elseif(e.message:findi("list")) then
		e.self:Say("Oh.  <cough>  I am sorry..  I forgot to give it to you.  Here you go.  Be sure to give that back when your job is finished.  <cough>");
		e.other:SummonItem(18009);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13181,item2 = 18009})) then
		e.self:Say("<cough> Great! Thank you so much. Here is a small gratuity for a job well done. Thank you again. <cough> Antonius Bayle and the People of Qeynos appreciate all yo have done.");
		eq.delete_global("tax_collection");
		e.other:Ding();
		e.other:Faction(9,10,0);
		e.other:Faction(135,10,0);
		e.other:Faction(273,-15,0);
		e.other:Faction(164,-15,0);
		e.other:Faction(217,10,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,1,2,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13181})) then
		e.self:Say("Very good <cough> work. But I need both the full tax collection box and the list of debtors. You did get the [list] from me before you left, right? <cough>");
		e.other:SummonItem(13181);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18009})) then
		e.self:Say("Very good <cough> work. But I need both the full tax collection box and the list of debtors. You did get the [list] from me before you left, right? <cough>");
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end