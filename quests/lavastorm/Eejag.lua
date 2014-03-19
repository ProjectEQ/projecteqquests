function event_spawn(e)
	eq.set_proximity(e.self:GetX()-50,e.self:GetX()+50,e.self:GetY()-50,e.self:GetY()+50);
	e.self:Shout("What imbecile dares challenge a Celestial Fist?! Do you even know who you are challenging? HA! You are nothing but an insect! I will enjoy crushing you, I have not charred the flesh of an idiot in decades! If you truly wish to fight me, the battle shall be held in my own element. Come, challenger, come down to the pits of flowing fire.");
end

function event_enter(e)
	if(e.other:Class() == "Monk" and e.other:GetLevel >= 46) then
		-- Monk Epic 1.0
		eq.attack(e.other:GetName());
	end
end

-- End of File