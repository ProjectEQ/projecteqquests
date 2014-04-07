-- poknowledge\Tratlan_Matrick.lua NPCID 202095 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, traveler! There are many wonderful discoveries to be made and sights to be seen here in the city of New Tanaan. I myself am a tailor by trade and have seen some wonderful new tailored products during my stay here. If you are an aspiring tailor feel free to browse my wares for any purchases you may with to make.'");
		end
end