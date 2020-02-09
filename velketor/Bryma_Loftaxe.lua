function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("whispers, 'Speak softly outlander or you may end up like Frekka and some of the others.'");
	elseif(e.message:findi("frekka")) then
		e.self:Emote("whispers, 'He... experimented on her because she spoke so loudly in the cell. I fear I will be next. You should leave this place at once and never return...' ");
	elseif(e.message:findi("experimented")) then
		e.self:Emote("whispers, 'He placed some tiny beast into Frekka's head.  I cannot bear to think of the pain she must be in.'");
		eq.signal(112037,1); -- NPC: Frekka_Alebringer
	elseif(e.message:findi("leave")) then
		e.self:Emote("whispers, 'It is impossible for me to leave here. Velketor has placed an enchantment upon all of us so we cannot leave. My poor husband Glrarm...' Bryma begins to cry softly to herself.");
		eq.signal(112034,1); -- NPC: Brumen_Firehammer
	elseif(e.message:findi("glrarm")) then
		e.self:Emote("wipes a tear from her face. 'He tried to leave... Velketor even left the doors of our cells open. As soon as Glrarm set foot outside the citadel his body pulsed with a sickly green light and he fell dead... Velketors voice... the cruel laughter...' Bryma quietly sobs again. If Velketor were dead, we might be able to escape this horrible place.");
	elseif(e.message:findi("velketor")) then
		e.self:Emote("whispers, 'He is a twisted storm giant sorcerer who spoke out against Rallos Zek and was cast out of Kael Drakkel, or so the rumor is. He is not far from here, you should go now, while you still can.'");
	end
end
