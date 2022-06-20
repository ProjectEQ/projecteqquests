-- Taia_Lyfol (51095)
-- https://everquest.allakhazam.com/db/npc.html?id=20183
--
-- Mystery NPC, dialog may be incomplete.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". What brings you to the watery lands of Rathtear? Do you seek [enlightenment]?");
	elseif(e.message:findi("seek enlightenment")) then
		e.self:Emote("says in a hushed voice, almost inaudible...'I was once told that there was a noble man who held a sword of immense power. He was known all throughout Norrath as being a powerful, yet gentle man. During one of his crusades something awful [happened].'");
	elseif(e.message:findi("happened")) then
		e.self:Emote("leans forward, brushes her hand lightly against your cheek and says 'Death.'");
	end
end
