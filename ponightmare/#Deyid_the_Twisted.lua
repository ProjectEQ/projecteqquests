function event_combat(e)
if (e.joined == true) then
eq.set_next_hp_event(90);
eq.set_timer("OOBcheck", 6 * 1000);
else
eq.stop_timer("OOBcheck");
end
end

function event_hp(e)
if(e.hp_event == 90) then
eq.spawn2(204068,0,0,1125,1162,280,344); --#a_foreboding_tree (204068)
eq.spawn2(204068,0,0,1191,1033,280,392); -- NPC: #a_corrupt_treant
eq.spawn2(204068,0,0,1071,920,280,474); -- NPC: #a_corrupt_treant
eq.spawn2(204068,0,0,901,939,280,50); -- NPC: #a_corrupt_treant
eq.spawn2(204068,0,0,843,999,283,92); -- NPC: #a_corrupt_treant
eq.spawn2(204068,0,0,786,1160,282,152); -- NPC: #a_corrupt_treant
eq.spawn2(204068,0,0,965,1256,282,262); -- NPC: #a_corrupt_treant
eq.spawn2(204085,0,0,990,908,280,512); --#a_foreboding_tree (204085) will spawn a corrupt treant
eq.spawn2(204085,0,0,808,1074,278,116); --#a_foreboding_tree (204085) will spawn a corrupt treant
eq.spawn2(204086,0,0,1171,966,280,428); --#a_foreboding_tree (204086) will spawn a blighted treant
eq.spawn2(204086,0,0,1057,1211,281,280); --#a_foreboding_tree (204086) will spawn a blighted treant
eq.get_entity_list():MessageClose(e.self, false, 300, 0, "A low groaning sound wells up out of the surrounding woods as the rustling of leaves indicate something sinister is manifesting.");
eq.set_next_hp_event(50);
elseif (e.hp_event == 50) then
e.self:Emote("waves his branches about in agitation and the surrounding trees close in.");
eq.set_next_hp_event(45);
elseif (e.hp_event == 45) then
eq.get_entity_list():MessageClose(e.self, false, 300, 0, "Several of the foreboding trees tear their roots from the ground and move in to aid Deyid.");
eq.depop_all(204085);
eq.depop_all(204086);
eq.spawn2(204087, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading()); -- a_blighted_treant (204087)
eq.spawn2(204087, 0, 0, e.self:GetX()+5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading()); -- a_blighted_treant (204087)
eq.spawn2(204069, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ(),  e.self:GetHeading()); -- a_corrupt_treant (204069)
eq.spawn2(204069, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ(),  e.self:GetHeading()); -- a_corrupt_treant (204069)
end
end

function event_death_complete(e)
eq.get_entity_list():MessageClose(e.self, false, 300, 0, "An eerie silence settles onto the forest as Deyid the Twisted slumps over, defeated.");
eq.depop_all(204068);
eq.signal(204047,1); --signal Seilaen to shout/depop
end

function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetZ() < 250) then
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end
