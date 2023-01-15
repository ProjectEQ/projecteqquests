--Ikkinz Group Trial #3: Tri-Fates  
function event_spawn(e)
    eq.set_timer("nuke", 5 * 1000);
    eq.set_timer("depop", 22 * 1000);
end

function event_timer(e)
    if(e.timer=="nuke") then

	local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),90000);

	--get client within 300 radius			
	    if (get_client.valid) then	
		    e.self:CastSpell(2648,get_client:GetID()); --Drain Mana (2648)
        end
    elseif(e.timer=="depop") then
        eq.depop();
    end
end

