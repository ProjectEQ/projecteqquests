local inst_cave=1

local expeditions = {
	{
		info = { "Dranik's Hollows: Watering Hole", 3, 6 },
		dz = {
			"dranikhollowsa", 0, eq.seconds("6h"),
			compass = { "draniksscar", -2045.97, 15.84, 214.76 },
			safereturn = { "draniksscar", -2018.75, 6.25, 204.625, 0 },
			zonein = { 3508.0, 1585.0, 8.25, 0 }
		}
	},
	{
		info = { "Dranik's Hollows: Fire Pit", 3, 6 },
		dz = {
			"dranikhollowsb", 0, eq.seconds("6h"),
			compass = { "draniksscar", -2080.3, 393.54, 149.22 },
			safereturn = { "draniksscar", -2057.5, 398.75, 146.625, 0 },
			zonein = { 0, -447.0, -39.25, 511.0 }
		}
	},
	{
		info = { "Dranik's Hollows: Murkglider Hive", 3, 6 },
		dz = {
			"dranikhollowsc", 0, eq.seconds("6h"),
			compass = { "draniksscar", -2059.05, 574.10, 209.51 },
			safereturn = { "draniksscar", -2038.5, 589.25, 201.875, 0 },
			zonein = { 3944.0, -252.0, 138.0, 380.0 }
		}
	}
}

function event_say(e)
	if (e.message:findi("hail")) then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Grand Historian Gersh says, 'Greetings, traveler. I am Grand Historian Gersh and I can open your mind to the history of our people if you wish. I can show you the remnants of our [" .. eq.say_link("caves") .. "] where we hid from the raiding Muramite Army.'")
	elseif (e.message:findi("caves")) then
		local is_gm = (e.other:Admin() > 80 and e.other:GetGM())

		if not is_gm and e.other:GetGroupMemberCount() < 3 then
			eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Grand Historian Gersh says, 'I'm sorry but the area is too dangerous for you. I would feel better if you had more adventurers with you.'")
			return
		end

		--instance A
		if (inst_cave==1) then
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a girplan known as the Girplan Pathmaker, or a discordling known as the Discordling Hollower, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
		--instance B
		elseif (inst_cave==2) then
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a kyv known as the Kyv Bowkeeper, or an Ukun known as the Ukun Fleshrender, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
		elseif (inst_cave==3) then
		--instance C
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a murkglider known as the Inky Murkglider, or a rat known as Silentpaw, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
		end

		e.other:CreateExpedition(expeditions[inst_cave].dz, expeditions[inst_cave].info)

		-- think it's just a random selection on live
		inst_cave=math.mod(inst_cave,3)+1;
	end
end
