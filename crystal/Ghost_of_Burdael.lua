function event_spawn(e)
	eq.set_timer("depop",600000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("says, in an unknown tongue, 'Hgidf! Hsdh je shafoin jsjsi!... Frundlpap gnut hfna iiongio... Woha?! Yiond?'");
	elseif(e.message:findi("Yiond") or e.message:findi("gurintop")) then
		e.self:Emote("says, in an unknown tongue, 'Yiond?!?!? Yohodfnon jf awhicin fhnn fhgou vu ganferdefli sahbfnfn. Yexsf asfsdfupoi xubeni gindas hguj quetsrrop. Pliuhghtn gurintop noe?'");
	end
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)
	eq.depop();
end
