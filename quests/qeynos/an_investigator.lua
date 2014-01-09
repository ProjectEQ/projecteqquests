function event_say(e)
	local qglobals = eq.get_qglobals(e.self);

	if(e.message:findi("hail")) then
		e.self:Emote("raises one eyebrow and looks at you with suspicion before returning his watchful eye to the many people going about their business in the city.");
	elseif(e.message:findi("first suspect") and qglobals.invest_badge == "first_suspect") then
		e.self:Say("The first suspect was last seen near the shop called Fireprides.");
	elseif(e.message:findi("follow me")) then
		e.self:Say("Right, let's get going.");
		eq.follow(e.other:GetID());
	elseif(e.message:findi("confession")) then
		e.self:Say("Here you are.");
		e.other:SummonItem(2344);
	elseif(e.message:findi("summon a guard") and e.other:HasItem(2394) == true) then
		e.self:Say("Guards!  Take this man away.");
		eq.unique_spawn(1314,66,0,-413,50,-24,0);
	elseif(e.message:findi("summon a guard") and e.other:HasItem(2369) == true) then
		e.self:Say("Guards!  Take this man away.");
		eq.unique_spawn(1182,64,0,-246,145,3,0);
	elseif(e.message:findi("summon a guard") and (e.other:HasItem(2369) == false or e.other:HasItem(2394) == false)) then
		e.self:Say("Let us interrogate the suspects before summoning any guards.");
	elseif(e.message:findi("second suspect") and qglobals.invest_badge == "second_suspect") then
		e.self:Say("The second suspect was sighted below the Grounds of Fate.");
	elseif(e.message:findi("third suspect") and qglobals.invest_badge == "third_suspect") then
		e.self:Say("The last suspect has been known to hang around that low life known as Raz the Rat.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18289})) then
		e.self:Say("Very well, let's get to work. I assume you have read the briefing and committed it to memory. This is how you will be tested. I shall play the part of student and you shall play the master who directs me. I promise I won't make it easy on you either, we want only the best. We'll see how you do and then I'll decide if you are worthy to wear the badge or not.");
		eq.follow(e.other:GetID());
		eq.set_timer("depop",1800000);
		eq.unique_spawn(1183,0,0,-324,200,6,120);
		eq.set_global("invest_badge","first_suspect",3,"F");
	elseif(item_lib.check_turn_in(e.trade,{item1 = 2369,item2 = 2394,item3 = 2279})) then
		eq.stop_follow();
		e.self:Say("You have done our city a great service and helped to bring several criminals to justice this day! Wear this Investigator's Badge with pride! Speak again with Vegalys Keldrane, he may have information about [advancing further] in rank.");
		e.other:SendSound();
		e.other:SummonItem(2386);
		e.other:Faction(135,10,0);
		e.other:Faction(9,10,0);
		e.other:Faction(273,-10,0);
		e.other:Faction(164,-10,0);
		e.other:Faction(217,10,0);
		e.other:AddEXP(2000);
		eq.delete_global("invest_badge");
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_timer(e)
	if(e.timer == "depop") then
		e.self:Say("Our time has run out. You have failed.");
		eq.depop_with_timer();
		eq.delete_global("invest_badge");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("We have several witnesses that have signed affidavits swearing to the fact that they had witnessed you raising an undead servant in the hills outside the city several nights past. Do you deny this?");
		eq.signal(1201,1,5000);
	elseif(e.signal == 2) then
		e.self:Say("I find that difficult to believe. We have further statements that say you were seen drawing the life force from a rat before this undead servant of yours tore it apart. The evidence against you is irrefutable. I suggest you cooperate now. It will be better for you in the long run.");
		eq.signal(1201,2,5000);
	elseif(e.signal == 3) then
		e.self:Say("We are deadly serious, sir. We know who you are and where your allegiances lie. We are also aware that you are simply a misguided pawn in this terrible plot. I suggest you take advantage of this offer, sign the confession document and allow yourself to be taken into custody. The court may not be so lenient should it come to a trial.");
		eq.signal(1201,3,5000);
	end
end

function event_death_complete(e)
	eq.delete_global("invest_badge");
end