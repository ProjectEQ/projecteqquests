function event_enter(e)
	
end


function event_exit(e)

end

function event_spawn(e)
	e.self:CastSpell(8469,0);
	e.self:CastSpell(8469,e.self:GetID());
	e.self:Say("self: " .. e.self:GetID() .. " : " .. e.self:GetName());
	e.self:Say("self: " .. e.self:GetID() .. " : " .. e.self:GetOwner():GetName());
end

function event_timer(e)
end