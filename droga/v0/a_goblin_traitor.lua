-- a Goblin Traitor, somewhere in the cave, Frontier Mountains
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid

function event_say(e)
	if(e.other:GetFaction(e.self) < 3) then -- need to be warmly or better
		if(e.message:findi("hail")) then
			e.self:Say("Serve the Sarnak do ya? You the one they say they send? I don't know that I believe ya, show a token. Humm show me ya ring if ya got it.");
		elseif(e.message:findi("plan")) then
			e.self:Say("Alrighty, listen listen. Skargus used to be a low rankin' nogood. He made a fake story 'bout Gragbar who was the warlord and caused him much trouble with the chief. Gragbar was cast down, chief made Skargus the warlord now. Gragbar is very angry, would take back his position and kill Skargus if he get [evidence] of his treachery.");
		elseif(e.message:findi("evidence") and e.other:HasItem(5728)) then
			e.self:Emote("makes a terrible face, then spits on the ground before continuing. 'Gragbar are workin' with the Iksar, bleh Iksar. He sellin' goblin troops as slaves to Cabilis when he can, sayin' they died in battle at the lake. If we get evidence of that, we get Skargus and kill him. You find Sarnak here in the Frontier mountains, he knows where we get evidence from. Give him this note from me, and he help ya. Off with ya now, before I get seen with ya.'");
			e.other:QuestReward(e.self,{itemid = 6472}) -- 6472  Traitor's note
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 3) then  -- need to be warmly or better
		if(item_lib.check_turn_in(e.trade, {item1 = 5728})) then -- Di'zok Signet of Service
			e.self:Emote("looks relieved when he sees your signet of service and eyes you with a bit more respect. 'Good! They tell'd me to wait here for ya, can't say I like it but here I sits. Itbe good to be rid of Skargus though, so I be a happy one, oh yes. Want to know the [plan] then?'");
			e.other:QuestReward(e.self,{itemid = 5728}) -- 5728  Di'zok Signet of Service
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
