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
	else
		eq.resume_timer('depop');
		e.self:SaveGuardSpot(e.self:GetX(),e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop();
end
end
