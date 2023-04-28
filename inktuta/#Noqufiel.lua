local entered = 0;

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 10, xloc + 10, yloc - 10, yloc + 10);
end

function event_enter(e)
	if not entered then
		e.self:Say("Ah, you made it, "..e.other:GetName()..". I am most impressed.");
		entered = 1;
	end
end

-- There is a delay to most of his dialog.. for dramatics maybe however, only adding it to the final trigger functions to prevent spamming.
function event_say(e)
	local inktuta_noq_bonus_flag = tonumber(eq.get_data("inktuta_noq_bonus_flag-"..eq.get_zone_instance_id())) or 0
	local inktuta_bonus_loot = tonumber(eq.get_data("inktuta_bonus_loot-"..eq.get_zone_instance_id())) or 0
	
	if e.message:findi("hail") then
		e.self:Emote("raises a hand to indicate silence. 'Shhh. Do not speak. I already know why you have come, and rest assured, the sentinel you seek is nearby.'");
		e.self:Say("The only thing standing in your way is me, humble Noqufiel.' He bows deeply, scraping the floor, then continues. 'But I would like to know one thing. My question is this: do you [plan to kill me], or were you interested in garnering my assistance while [keeping me alive]? Or do you [truly understand]...? Which is it, exactly?'");
		elseif e.message:findi("truly understand") then
		e.self:Say("Well done! You continue to impress me, Hugh. My companions are impressed as well. You see, I'm not the only vengeful spirit trapped in this decrepit temple. Have a look around.");
		e.self:Say("You stand among the deceased. Does this suprirse you? All of us - Kelekdrix, myself, the other trusik are dead. We have been dead for years. When it became apparent that we were doomed, in an act of purest mercy I slew my brother and sisters - every last one, before passing away of starvation myself. Many of my companions still walk these halls, unaware of their fate or unwilling to accept what occurred. Others were driven mad by the idea of it. These pitiful souls did not understand the strength that could be harnessed by embracing undeath.");
		if inktuta_noq_bonus_flag == 0 then
			local bonus_loot_value = tostring(inktuta_bonus_loot + 64);
			eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
			eq.set_data("inktuta_noq_bonus_flag-"..eq.get_zone_instance_id(), "1",tostring(eq.seconds("6h")));
		end
		eq.signal(296052,1,5 * 1000);
	elseif e.message:findi("keeping me alive") then
		e.self:Emote("smirks. 'That's terribly kind of you, "..e.other:GetName()..". Were I still alive, such a benevolent gesture would bring a warm tear to my eye, but as you will soon realize, that is no longer the case.'")
		if inktuta_noq_bonus_flag == 0 then
			local bonus_loot_value = tostring(inktuta_bonus_loot + 32);
			eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
			eq.set_data("inktuta_noq_bonus_flag-"..eq.get_zone_instance_id(), "1",tostring(eq.seconds("6h")));
		end
		eq.signal(296052,1,5 * 1000);
	elseif e.message:findi("we plan to kill you") then
		e.self:Say("You stand among the deceased. Does this surprise you? All of us - Kelekdrix, myself, the other trusik are dead. We have been dead for years. When it became apparent that we were doomed, in an act of purest mercy I slew my brother and sisters - every last one, before passing away of starvation myself. Many of my companions still walk these halls, unaware of their fate or unwilling to accept what occurred. Others were driven mad by the idea of it. These pitiful souls did not understand the strength that could be harnessed by embracing undeath.");
		if inktuta_noq_bonus_flag == 0 then
			local bonus_loot_value = tostring(inktuta_bonus_loot + 16);
			eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
			eq.set_data("inktuta_noq_bonus_flag-"..eq.get_zone_instance_id(), "1",tostring(eq.seconds("6h")));
		end
		eq.signal(296052,1,5 * 1000);
	end
end

function event_signal(e)
	local x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();

	e.self:Emote("clenches his fist, 'And the curse you've no doubt heard about. Do you yet understand?'");
	e.self:Say("I am the curse.");
	e.self:Emote("steps through the flames and vanishes.");
	eq.spawn2(296053,0,0,-2,-961,-127,498);		-- NPC: #Cursecaller_Fhqwhgads
	eq.spawn2(296054,0,0,-7,-852,-127,254);		-- NPC: #Cursecaller_Kiamquz
	eq.spawn2(296055,0,0,-209,-970,-127,0);		-- NPC: #Cursecaller_Qibaiz
	eq.spawn2(296056,0,0,-146,-994,-127,2);		-- NPC: #Cursecaller_Requarak
	eq.spawn2(296057,0,0,-145,-828,-127,248);	-- NPC: #Cursecaller_Towzaqu
	eq.spawn2(296058,0,0,-218,-853,-127,258);	-- NPC: #Cursecaller_Xavonique
	eq.spawn2(296017,0,0,x,y,z,h);				-- NPC: #curse_trigger
	eq.depop();
end
