function event_spawn(e)
	eq.set_timer("animation", 1000);
end

function event_timer(e)
  eq.stop_timer("animation");
  e.self:SetAppearance(1); -- sitting
end
