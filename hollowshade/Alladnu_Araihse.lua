-- items: 52911, 57053
local finished_event=0;
local started_event=0;

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["beast_epic"] == "21" and started_event==0) then
		e.self:Say("Ah, I can sense that you have truly walked the path of a commander of the wild spirits. You have your Savage Lord's Totem imbued with your spirit, do you not? Well, we will now put it to good use. You must give it to me as well as proof that Muada has sent you so we can proceed with final steps of your journey.");
	elseif(e.message:findi("hail") and qglobals["beast_epic"] == "22" and started_event==0) then
		e.self:Say("Follow me, "..e.other:GetName()..". We will embark upon the final steps of your journey.");
		e.self:MoveTo(1809,-1050,-108,90,true);
		eq.set_timer("startevent",75*1000);
		finished_event=0;
		started_event=1;
	elseif(e.message:findi("ready") and qglobals["beast_epic"] == "22" and finished_event==1) then
		e.self:Say("Then you have finished your journey. Here ends my service and those of the spirits. You are one with the spirits now. Travel your life's journey with pride.");
		e.other:QuestReward(e.self,{itemid=57054, exp=50000});
		e.other:AddAAPoints(10);
		e.other:Message(MT.Yellow,'You have gained 10 ability points!');
		eq.set_global("beast_epic","23",5,"F");
		eq.set_timer("depop",15*1000);
	end
end	

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 52911,item2 = 57053})) then
		eq.set_global("beast_epic","22",5,"F");
		e.self:Say("Follow me, "..e.other:GetName()..". We will embark upon the final steps of your journey.");
		e.self:MoveTo(1809,-1050,-108,90,true);
		eq.set_timer("startevent",60*1000);
		finished_event=0;
	end
	item_lib.return_items(e.self, e.other, e.trade);
end


function event_timer(e)
	if e.timer=="startevent" then
		eq.stop_timer("startevent");
		e.self:Say("Wait here for a moment.");
		eq.set_timer("event1",15*100);
	elseif e.timer=="event1" then
		eq.stop_timer("event1");
		e.self:Emote("begins to growl and ascend into the realm of the wild spirits as she closes her eyes");
		eq.set_timer("ukki",15*1000);
		eq.set_timer("nyrash",45*1000);
		eq.set_timer("nudulk",75*1000);
		eq.set_timer("mikkily",105*1000);
		eq.set_timer("wiqak",135*1000);
		eq.set_timer("zemote",185*1000);
		eq.set_timer("endevent",200*1000);
	elseif e.timer=="ukki" then
		eq.stop_timer("ukki");
		eq.spawn2(166297,0,0,1785,-1058,-110.3,96); -- NPC: Eternal_Animist_Ukki
		eq.signal(166297, 1, 15); -- NPC: Eternal_Animist_Ukki
	elseif e.timer=="nyrash" then
		eq.stop_timer("nyrash");
		eq.spawn2(166296,0,0,1814,-1016,-102,262); -- NPC: Eternal_Animist_Nyrash
		eq.signal(166296, 1, 15); -- NPC: Eternal_Animist_Nyrash
	elseif e.timer=="nudulk" then
		eq.stop_timer("nudulk");
		eq.spawn2(166299,0,0,1817,-1078.5,-109,484); -- NPC: Eternal_Animist_Nudulk
		eq.signal(166299, 1, 15); -- NPC: Eternal_Animist_Nudulk
	elseif e.timer=="mikkily" then
		eq.stop_timer("mikkily");
		eq.spawn2(166295,0,0,1836,-1047,-107.5,374); -- NPC: Eternal_Animist_Mikkily
		eq.signal(166295, 1, 15); -- NPC: Eternal_Animist_Mikkily
	elseif e.timer=="wiqak" then
		eq.stop_timer("wiqak");
		eq.spawn2(166298,0,0,1791,-1027,-104.6,196); -- NPC: Eternal_Animist_Wikaq
		eq.signal(166298, 1, 15); -- NPC: Eternal_Animist_Wikaq
	elseif e.timer=="zemote" then
		eq.stop_timer("zemote");
		eq.zone_emote(MT.Yellow,"The air begins to rumble with a harmony of deep growls and all savage creatures grow restless with the passing breath and approval of the great animal spirit, Sahteb Mahlni");
	elseif e.timer=="endevent" then
		eq.stop_timer("endevent");
		e.self:Say("It is done. I do hope you fully understand the gift that is about to be bestowed upon you. With each breath the eternal spirits of the wild spoke, your Savage Lord's Totem was imbued with their blessing. This totem has now come to represent all of the beasts most close to a savage lord. The swirling essence within it will allow you to tap into the spirits of your elders -- your origin -- with a focused mind. Are you truly [" .. eq.say_link("ready") .. "] to take your place among the respected elders of the beastlords of Norrath?");
		finished_event=1;
		eq.set_timer("depop",300*1000);
	else
		eq.depop_all(166295);
		eq.depop_all(166296);
		eq.depop_all(166297);
		eq.depop_all(166298);
		eq.depop_all(166299);
		eq.depop_with_timer();	
		eq.depop();
	end
end

