--Smith_Rondo (284097) killable version

function event_spawn(e)
	e.self:Emote("stands and shakes off the effects of the spell that knocked him unconscious. Seeing Vtiink's corpse he smiles and begins to reach into his pocket when suddenly his face becomes filled with anger letting out a maniacal laugh. 'You have destroyed him, my master Vtiink he who helped show me the way of the Mata Muram, the true joy of pain. Now I shall share that gift with you prepare to suffer the wrath of Smith Rondo.");
	eq.set_timer("depop", 3600 * 1000); --unconfirmed
	eq.set_next_hp_event(65);
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(284084,0,0,1447,-586,106,0); -- NPC: #Smith`s_Spectral_Memory
end

function event_hp(e)
	if(e.hp_event == 65) then
		e.self:SendIllusionPacket({race=392,gender=2,texture=0,helmtexture=0});
	end
end

function event_combat(e)
	if (e.joined == false) then
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end
