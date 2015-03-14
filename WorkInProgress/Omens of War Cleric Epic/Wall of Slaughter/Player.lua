

function event_enter_zone(e)
  	if(e.self:HasItem(12080)) then -- Player has Enchated Signet of Disciples on their character and Zones in.
    		e.self:Message(15, "The Signet begins to glow");
	end
end