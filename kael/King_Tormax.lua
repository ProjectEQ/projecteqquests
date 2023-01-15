-- items: 30501, 25858, 24984, 25857
function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then -- require kindly or better
		if(e.message:findi("hail")) then
		  e.self:Say("Greetings, " .. e.other:Race() .. ". You know who I am, but I only vaguely know of you. My purpose is simple, I will rule these lands like my father, and my grandfather before him. All tasks but two are inconsequential to me.");
		elseif(e.message:findi("task")) then
		  e.self:Say("The tasks are simple, " .. e.other:Race() .. ". I wish the death of the other 'powers' of this frozen waste land. If you are able to destroy either of my mortal foes, bring me proof of your exploits and you will be known as the hero of Kael Drakkel.");
		elseif(e.message:findi("power")) then
		  e.self:Emote("laughs deeply. 'I speak of the foolish old dragon Yelinak and that pitiful Dain Frostreaver.");
    		end
	else
		e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 3) then -- require kindly or better
		if(item_lib.check_turn_in(e.trade, {item1 = 30501})) then  -- dains head
			e.other:Ding();
			e.other:SummonItem(25858);	-- belt of dwarf slaying
			e.other:Faction(436,-250,0); 	--yelinak
			e.other:Faction(405,-250,0); 	--dain
			e.other:Faction(448,500,0);	--zek
			e.other:Faction(429,500,0); 	--tormax
			e.other:AddEXP(250000);
		elseif (item_lib.check_turn_in(e.trade, {item1 = 24984})) then -- yelinak head
			e.other:Ding();
			e.other:SummonItem(25857);	-- gauntlets of dragon slaying
			e.other:Faction(436,-250,0); 	--yelinak
			e.other:Faction(405,-250,0); 	--dain
			e.other:Faction(448,500,0);	--zek
			e.other:Faction(429,500,0); 	--tormax
			e.other:AddEXP(250000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("help", 300000);
		help_tormax(e);
	else
		eq.stop_timer("help");
	end

end

function event_timer(e)
	if(e.timer == "help") then
		e.self:Shout("King Tormax shouts 'Those who raise arms against me will suffer my wrath!'");
		help_tormax(e);
	end
end


function help_tormax(e)
	local kyenka = eq.get_entity_list():GetMobByNpcTypeID(113133);
	
	if (kyenka.valid and not kyenka:IsEngaged()) then
		kyenka:CastToNPC():SetRunning(true);
		kyenka:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local yetarr = eq.get_entity_list():GetMobByNpcTypeID(113134);
	
	if (yetarr.valid and not yetarr:IsEngaged()) then
		yetarr:CastToNPC():SetRunning(true);
		yetarr:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local vkjen = eq.get_entity_list():GetMobByNpcTypeID(113129);
	
	if (vkjen.valid and not vkjen:IsEngaged()) then
		vkjen:CastToNPC():SetRunning(true);
		vkjen:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local klraggek = eq.get_entity_list():GetMobByNpcTypeID(113383);
	
	if (klraggek.valid and not klraggek:IsEngaged()) then
		klraggek:CastToNPC():SetRunning(true);
		klraggek:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local drendar = eq.get_entity_list():GetMobByNpcTypeID(113130);
	
	if (drendar.valid and not drendar:IsEngaged()) then
		drendar:CastToNPC():SetRunning(true);
		drendar:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local irrek = eq.get_entity_list():GetMobByNpcTypeID(113302);
	
	if (irrek.valid and not irrek:IsEngaged()) then
		irrek:CastToNPC():SetRunning(true);
		irrek:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local velden = eq.get_entity_list():GetMobByNpcTypeID(113382);
	
	if (velden.valid and not velden:IsEngaged()) then
		velden:CastToNPC():SetRunning(true);
		velden:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
end
