-- Kanthurn (51096)
-- Paladin 1.0 Epic Quest npc giving hints
-- https://everquest.allakhazam.com/db/npc.html?id=24011
--
-- related to PAL 1.0. Verified on live the text is availabe for all classes.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". Have you heard of [Rineval] Talyas?");
	elseif(e.message:findi("rineval")) then
		e.self:Say("Rineval is a strange, but special young lady.  I've been told that she can read and write in ways that only a few in Norrath can. She usually does not speak of this, however I am a dear friend of hers. Say that you are in need of a scribe. If she asks you who told you this mention my name.");
	end
end