function event_say(e)
	if eq.is_current_expansion_secrets_of_faydwer() and e.message:findi("Hail") then
		e.self:Say("Relm M`Loch says 'Greetings, traveler. Do you find the Plane of Tranquility interesting? Myself, hmm . . . I'm afraid it rather bores me. I have read these ancient tomes, watched the waves lap lazily against the shore, quietly observed the Weavereaders while they ply their trade - and it does nothing for me. My thoughts always return to the one place that has utterly captured my fascination, Innoruuk's realm: the Plane of Hatred. There are not words to describe the exhilarating emotions of rage, terror and anxiety that overwhelm me while in his domain. The only other place that has come close is the Plane of Sky. Unfortunately, my obligations require me to tarry here awhile longer, but if you would like to visit Hate or Sky I can take you there. Give me a Fuligan Soulstone for the Plane of Hate, or a Cloudy Stone of Veeshan for the Plane of Sky to focus upon and I can transport a single person.'")
	elseif e.message:findi("Hail") then
		e.self:Say("Greetings, traveler. Do you find the Plane of Tranquility interesting? Myself, hmm . . . I'm afraid it rather bores me. I have read these ancient tomes, watched the waves lap lazily against the shore, quietly observed the Weavereaders while they ply their trade - and it does nothing for me. My thoughts always return to the one place that has utterly captured my fascination, Innoruuk's realm: the Plane of Hatred. There are not words to describe the exhilarating emotions of rage, terror and anxiety that overwhelm me while in his domain.");
		e.self:Say("Unfortunately, my obligations require me to tarry here awhile longer, but if you would like to visit Hate I can take you there. Give me a Fuligan Soulstone to focus upon and I can transport a single person.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 10092}) then --Fuligan Soulstone of Innoruuk
		e.self:Say("Enjoy the exquisite anger, " .. e.other:GetName() .. ", and give my regards to Innoruuk!");
		e.other:MovePC(186, -393.0, 656.0, 3.0, 90);	-- HatePlaneB
	elseif eq.is_current_expansion_secrets_of_faydwer() and item_lib.check_turn_in(e.trade, {item1 = 10094}) then --Cloudy Stone of Veeshan; Airplane port out of era until 2008/SoF
		e.self:Say("Find the power you seek, " .. e.other:GetName() .. ".");
		e.other:MovePC(71, 539.0, 1384.0, -664.0, 90); -- AirPlane
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
