function event_say(e)
	if(e.message:findi("")) then
		e.self:Say(string.format("Greetings, %s! How lucky you are to encounter the greatness of the legendary Sir Edwin Motte, slayer of cyclopes, battler of beasts, crusher of creatures, masher of monsters, eradicator of evil and champion of the third annual dart championship of Freeport.",e.other:GetName()));
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("What is it with all this political revelry. Let's here more jests!");
	elseif(e.signal == 3) then
		e.self:Say("I say, that Sir Lucan is no man of nobility. So they say...");
	elseif(e.signal == 4) then
		e.self:Say("I say!! I have fought side by side with the great Antonius bayle. He is a man of supreme virtue.");
	elseif(e.signal == 6) then
		e.self:Say("Bloody right, you are! Those fellows can't keep down any grog.");
	end
end