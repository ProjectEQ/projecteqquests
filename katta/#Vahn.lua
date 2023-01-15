function event_spawn(e)
	eq.set_timer("emote",1000);
end

function event_timer(e)
	if(e.timer == "emote") then
			e.self:Emote("steps out of the shadows as though appearing out of thin air.")
			eq.stop_timer("emote");
	end
end
