-- poknowledge\Guardian_Jerbabi.lua NPCID 202027

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote(" nods deeply in formal greetings. 'The guardians of Jeral welcome you, traveler. Tread freely and without fear of judgment among us, for we embrace all as our equals. Respect our laws and we shall respect your individuality and preferences in life. Only quarrel and conflict are condemned in Jeral and thus our company is quite willing to accommodate any traveler's needs. Find our merchants, masters, and citizens if you have need of supplies or knowledge, for we are eager to make the acquaintance of all of Norrath's soldiers.");
		end
end
