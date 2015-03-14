-- poknowledge\Sherin_Matrick.lua NPCID 202144 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("'Why, hello there, and good day to you indeed. If you are a tailor and are searching for supplies, then you may find what I have to sell of value, my friend. Please feel free to search my inventory if you wish and purchase whatever you might require that I currently have in stock.'");
		end
end

