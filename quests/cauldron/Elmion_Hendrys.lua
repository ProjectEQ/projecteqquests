function event_say(e)
	fac = e.other:GetFaction(e.self);

	if(fac < 7) then
		if(e.message:findi("hail")) then
			e.self:Say("How are you? Please rest. Have you [been wounded by the beasts] of this region.");
		elseif(e.message:findi("wounded by the beast")) then
			e.self:Say("Ah. Perhaps you should speak with Nyrien. Just inform him you [need to be healed].");
		elseif(e.message:findi("faldor hendrys")) then
			e.self:Say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves' guild. Good luck finding him.");
		end
	else
		e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
	end
end

function event_signal(e)
	e.self:Say("Pipe down, Ghil!! We have no quarrel with this adventurer.");
end

-- EOF Elmion Hendrys