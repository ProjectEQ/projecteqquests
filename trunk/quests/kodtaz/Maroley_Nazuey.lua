-- Gives Ikkinz Group 2 Expedition
-- Maroley_Nazuey NPCID: 293116
function event_say(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.other);
	-- GM Bypass variable. it is set to true if the player has status > 80 and has #gm on
	local gm_bypass = false;
	if (e.other:Admin() > 80 and e.other:GetGM()) then
		gm_bypass = true;
	end
	if(e.message:findi("hail")) then
		-- check for lockout qglobal.
		if (qglobals.ikkyredo ~= nil) then
			e.self:Say("Feel free to venture in this trial again");
		elseif (gm_bypass or (qglobals.ikky ~= nil and tonumber(qglobals.ikky) == 2)) then
			e.self:Say("At last you have arrived. I have heard that you passed the trial at the Temple of Singular Might without any problems and I congratulate you on your achievement. Do not believe for a moment that you are done! Your next trial will be more difficult that the last. Are you ready to hear [" .. eq.say_link("what's in store") .. "] for you beyond the temple exterior?");
		elseif (qglobals.ikky ~= nil and tonumber(qglobals.ikky) >= 3) then
			e.self:Say("You have finished this trial, speak with Kevren and proceed to the next one.");
		else
			e.self:Say("Gah, what do you think you're doing causing all that ruckus? I'm trying to keep a low profile so no wandering Muramites come to investigate noise. I may be the liaison for this temple, but that doesn't mean you can blow my cover! In any case, you still need to find Gazak and attempt the first trial before you can go any farther! Now make haste!");
		end
	else
		-- check if the player is on the right step to request this event
		if (gm_bypass or qglobals.ikkyredo ~= nil or (qglobals.ikky ~= nil and tonumber(qglobals.ikky) == 2)) then
			if (e.message:findi("in store")) then
				e.self:Emote("glaces toward the temple. 'The Muramites have sent priests to this temple. These priests are not ordinary, in fact they are terrible, horrific beings sent to collect artifacts for a singular purpose. What this purpose is we are not clear on, but we believe it has something to do with a summoning of some sort. If you're willing to [" .. eq.say_link("test my mettle",false,"test your mettle") .. "] in this trial, now is the time for action.");
			elseif (e.message:findi("test my mettle")) then
				e.self:Say("The rumor we have been investigating suggests that the summoning will be a beast of war that is far more destructive than anything we may have seen so far. The Muramite [" .. eq.say_link("priests") .. "] working inside this temple are gathering artifacts of corporeal power that will grant the beast an unusual physical strength when it is conjured. We must make sure that they do not finish this summoning.");
			elseif (e.message:findi("priest")) then
				e.self:Say("I nearly forgot. You must venture inside to an entrance to the inner chambers of the Temple of Twin Struggles and enter there. Once inside you must find the Malevolent Priests. We have begun referring to them thusty because of their torturous looks and ways. They are very unpleasant and work cooperatively. You must get to them and [" .. eq.say_link("recover the artifacts") .. "] they have been gathering before they are allowed to move them to another temple nearby.");
			elseif (e.message:findi("recover the artifacts")) then
				e.self:Say("This is your moment, $name. Now is the time to prove your worth to the brotherhood. I bid you good luck and hope that the strength you showed in the first trial will aid you again in your second one. When you are [" .. eq.say_link("ready to enter the temple") .. "] and have a group with you, return to me and I shall set you on your way.");
			elseif (e.message:findi("ready")) then
				-- determine if the player is in an instance already
				if (eq.get_instance_id("ikkinz",1) > 0) then
					e.other:Message(13, "You are already in an instance!");
				-- check for the lockout global
				elseif (qglobals["lockout_ikky_g2"]  ~= nil and not gm_bypass) then
					e.other:Message(13, "You have recently completed this trial, please come back at a later point");
				else
					--	create the instance (6 hours for ikkinz group trials)
					local instance_id = eq.create_instance("ikkinz",1,10800);
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
				end
			end
		else
			e.self:Say("You need to speak with Kevren!");
		end
	end
end

function event_trade(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 60153})) then
		if (qglobals.ikky ~= nil and tonumber(qglobals.ikky) == 2) then
			e.self:Say("You've done well, " .. e.other:GetName() .. ". I believed this temple was more than you could handle despite your success with the first temple. You faced two enemies at once and came back  in one piece. You only have one more trial left to complete before you can proceed onto more difficult tasks. Please return to Kevren for information on the final trial. Good luck!");
			eq.set_global("ikky","3",5,"F");
			e.self:Message(4,"Finished!- You have completed the trial at the Temple of Singular Might!");
		else
			e.self:Say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
			e.other:SummonItem(60153);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
