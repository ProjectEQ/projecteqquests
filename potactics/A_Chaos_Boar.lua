-- A_Chaos_Boar (214136) part of rztwl script

function event_spawn(e)
local rallos = eq.get_entity_list():GetMobByNpcTypeID(214113);	--#Rallos_Zek_the_Warlord (214113)
eq.move_to(rallos:GetX(),rallos:GetY(),rallos:GetZ(),rallos:GetHeading(),true);
e.self:SetRunning(true);
eq.set_timer('depop', 900 * 1000);
end



function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer("OOBcheck", 6 * 1000);
	else
		eq.resume_timer('depop');
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if (e.timer == 'depop') then
		eq.depop();
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
		if (e.self:GetX() > 950) then
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	end
end
