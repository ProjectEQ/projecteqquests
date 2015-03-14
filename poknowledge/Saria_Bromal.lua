-- poknowledge\Saria_Bromal.lua NPCID 202150 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Why, hello there, "..e.other:GetName().."! I'm Saria Bromal, and it is a pleasure to make your acquaintance. That grouchy lump of minotaur refuse is my husband. Unfortunately, if you have come to us in search of tinkering needs, you may need to speak with him if what you are looking for is not in my particular stock. Don't let him fool you -- he's a harmless nit-wit who would willingly give his spirit to The Tribunal if it guaranteed him a small, quiet, dark place to work the rest of his immortal days.");
		end
end