local say_ready = 1;

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	e.self:Emote("stammers, his eyes darting about nervously.");
	e.self:Say("Thousands! Why the chamber is literally alive with them. A multitude of skittering insects swarming about on the tiles above.");
end

function event_say(e)
	if say_ready == 1 then
		if e.message:findi("hail") then
			e.self:Emote("exhibits signs of a complete madman. 'This is like a horrible dream. Isolated, trapped, no way out! You, keep back. Stay away from me! Please, someone [awaken me from this nightmare]. AAAAUUUGGH!'");
		elseif e.message:findi("awaken me from this nightmare") then
			e.self:Emote("blinks and a spark of sanity returns. 'Ah, wha... what? How strange. I can see clearly now.'");
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 70, "You feel as if you have made the correct move. However, the exile is already beginning to slip back into insanity. Somehow you must awaken them all, simultaneously.");
			say_ready = 0;
			eq.set_timer("set_ready", 30 * 1000); -- Timer
			eq.signal(296070,296035); -- signal zone_status
		else
			say_ready = 0;
			eq.set_timer("set_ready", 30 * 1000); -- Timer
			exile_fail(e);
		end
	end
end

function event_timer(e)
	if e.timer == "set_ready" then
		eq.stop_timer("set_ready");
		say_ready = 1;
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Say("Thank you for restoring our clarity. Something in this cursed place had stolen away my sanity, and I will not allow it to happen again. Death would be preferable to that endless madness. Be warned, the gateway to the lower reaches of this temple will be unsealed soon. Leave this place before you become mad yourselves!");
	elseif e.signal == 2 then
		exile_fail(e);
	end
end

function exile_fail(e)
	local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),3136);
	--get client within 56 radius
	if get_client.valid then
		e.self:CastSpell(2151,get_client:GetID()); --Contagious Insanity
	end
end
