-- 201460 spirit of suffocation
-- 201447 spirit of suffocation
function event_death_complete(e)
	-- On death; send a signal to the controler with
	-- my ID.
	eq.signal( 201448, e.self:GetNPCTypeID() );
end

