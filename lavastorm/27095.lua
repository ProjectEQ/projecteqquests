--Officer_Vacax_Rol`Tas
function event_say(e)
	--if you have prereqs
	if(e.message:findi("hail")) then
		e.self:Say("These are indeed good days for the will of hate and fear. We will overcome the races of light and prevail. Pledge allegiance to Lanys T`Vyl!");
		e.other:AssignTask(273,e.self:GetID());
	end
end