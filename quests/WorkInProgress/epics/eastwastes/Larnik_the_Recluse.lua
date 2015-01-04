--eastwastes/Larnik_the_Recluse.lua NPCID 
--Warrior Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["warrior_epic"] == "18") then
		e.self:Say("Ahh! I've been found out! Who are you and where did you come from? How did you find me? It was that bothersome Fazzle, wasn't it? I knew he couldn't be trusted with the map! I knew it! Leave me alone, I don't want to be bothered! Away, away!");
	elseif(e.message:findi("korbuk sent me") and qglobals["warrior_epic"] == "18") then
		e.self:Say("What? What did you say? Who sent you? Korbuk sent you? That's impossible. I told him to be gone long ago. I told him never to speak of me or send anyone my way ever again! That fool! Why would he send you here?");
		--should stop running here
	elseif(e.message:findi("the great purification") and qglobals["warrior_epic"] == "18") then
		e.self:Say("Raaaa! I'm out of that business! I'll never help him or anyone else purify another thing so long as I live! Get away from me!");
		e.self:Say("I'll not be hunted any more! Begone with you!");
		--he attacks here
	end	
end