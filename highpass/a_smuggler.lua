function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		eq.move_to(336,10,45);
	end
end
