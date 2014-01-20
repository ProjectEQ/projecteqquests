-- Gives Ikkinz Group 1 Expedition
-- Gazak_Klelkek NPCID: 293117
function event_say(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		-- check for lockout qglobal.
		if (qglobals.ikkyredo ~= nil) then
			e.self:Say("Feel free to venture in this trial again");
		elseif (qglobals.ikky ~= nil and tonumber(qglobals.ikky) >= 2) then
			e.self:Say("You have finished this trial, speak with Kevren and proceed to the next one.");
		else
			e.self:Say("Keep your voice down! We must not attract any [" .. eq.say_link("undo attention") .. "] to ourselves here. I may be the liaison for the Temple of Singular Might, but that doesn't make me any less of a target. I have kept watch of this temple since we began collecting information on the trusik and the Legion of Mata Muram. You should ask Kevren for more information on them if you haven't already.");
		end
	elseif (e.message:findi("undo attention")) then
		e.self:Say("Certainly you do not believe that we are alone here, do you? The Muramites have assigned one of their magic users to gather spiritual artifacts from this area and use their power to gain strength. This creature, which we have dubbed the [" .. eq.say_link("Diabolic Destroyer") .. "], controls the temple and its inner abominations.");
	elseif (e.message:findi("Diabolic Destroyer")) then
		e.self:Say("It is one of a fearsome collective that commands minions to do its bidding. The beast's minions recover the artifacts from within the temple. The master then extracts the energy from the artifact to become more powerful. You and your party must venture inside the temple and [" .. eq.say_link("eradicate the beast") .. "] before it can recover any more artifacts. The Muramites will reinforce their position shortly after it has been defeated, but we cannot allow any single creature of this sort to become too powerful.");
	elseif (e.message:findi("eradicate the beast")) then
		e.self:Say("Your task is to battle through the temple and enter an entrance to the inner chambers of the Temple of Singular Might. Once inside you must find the Diabolic Destroyer and kill it before it becomes more powerful. You must recover an artifact from the beast and return it to me. Once you have done this, you will be allowed to move onto the next trial. When you are [" ..  eq.say_link("ready to proceed") .. "] and have a group with you, return to me and I shall set you on your way.");
	elseif (e.message:findi("ready to proceed")) then
		-- determine if the player is in an instance already
		if (eq.get_instance_id("ikkinz",0) > 0) then
			e.other:Message(13, "You are already in an instance!");
		-- check for the lockout global
		elseif (qglobals["lockout_ikky_g1"] ~= nil and (e.other:Admin() > 80 and not e.other:GetGM())) then
			e.other:Message(13, "You are not ready yet to start a new instance");
		else
			-- check if the player is on the right step to request this event
			if ((e.other:Admin() > 80 and e.other:GetGM()) or (qglobals.ikkyredo ~= nil or tonumber(qglobals.ikky) == 1)) then
				--	create the instance (6 hours for ikkinz group trials)
				local instance_id = eq.create_instance("ikkinz",0,10800);
				-- check if in a group
				local group = e.other:GetGroup();
				if (group.valid) then
					eq.assign_group_to_instance(instance_id);
				-- remove this else if ikkinz requires group
				else
					-- not in a group, just assign to the player
					eq.assign_to_instance(instance_id);
				end
				e.self:Say("Instance added.");
			else
				e.self:Say("You need to speak with Kevren!");
			end
		end
	end
end

function event_trade(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 60152})) then
		if (qglobals.ikky == "1") then
			e.self:Say("Though you were pitted against a most heinous aggressor, you have proven that you are a capable adventurer thus far. Nicely done, " .. e.other:GetName() .. ". I urge you to continue honing your skills. Now that you are ready to move onto the next trial, you should return to Kevren for more information. Good luck!");
			eq.set_global("ikky","2",5,"F");
			e.self:Message(4,"Finished!- You have completed the trial at the Temple of Singular Might!");
		else
			e.self:Say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
			e.other:SummonItem(60152);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end
