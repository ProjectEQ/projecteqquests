function event_enter_zone(e)
	e.self:ClearCompassMark();
	eq.delete_global("hpb_zone_emote");
	local qglobals = eq.get_qglobals(e.self);
	if ( qglobals["hpb_zone_emote"] == nil) then
		eq.set_timer("s1",5000);
		eq.set_timer("s2",10000);
		eq.set_timer("s3",15000);
		eq.set_global("hpb_zone_emote","1",3,"1H");
	end  
end


function event_loot(e)
	if(e.self:Class() == "Rogue") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["Fatestealer"] == "1"  and qglobals["rogue_hate_chest"] == nil and e.item:GetID() == 52337 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("rogue_hate_chest","1",5,"F");
		end
	end
end

function event_timer(e)
	if(e.timer=="s1") then
		eq.zone_emote(13, "Innoruuk shouts, What? Once again I have been called away to the mortal realm!");
		eq.stop_timer("s1");
	elseif (e.timer=="s2") then
		eq.zone_emote(13, "Innoruuk shouts, No. It is . . . someone else.");
		eq.stop_timer("s2");
	elseif (e.timer=="s3") then
		eq.zone_emote(13, "Innoruuk shouts, Stay out of sight, and ignore any mortal fools that deign to trespass here. Remember, they are beneath us and not worthy of our attention.");
		eq.stop_timer("s3");
	end
end