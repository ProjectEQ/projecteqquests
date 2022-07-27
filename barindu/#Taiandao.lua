-- Taiandao: Necromancer Epic 1.5 (Soulwhisper)

function event_say(e)
    local qglobals = eq.get_qglobals(e.other);
    if(e.message:findi("hail")) then
	    e.self:Say("What is it you want? I will be beaten if I am seen talking to you.");
    end
	if(qglobals["Soulwhisper"] ~= nil and qglobals["Soulwhisper"] == "2" and e.message:findi("muramite killed whiahdi")) then
        e.self:Say("Yes, I know the one who took her life. His name is Viarglug. I hate him with every fiber of my being. If you kill him, I will forever be in debt to you. He should be somewhere nearby making life miserable for a slave.");
        eq.unique_spawn(283158,0,0,-130,82,-122.5,360); --Viarglug (Passive)
	end
 end
