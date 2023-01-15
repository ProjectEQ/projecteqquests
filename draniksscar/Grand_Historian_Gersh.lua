local inst_cave=1

local expeditions = {
	{
		expedition = { name="Dranik's Hollows: Watering Hole", min_players=3, max_players=6 },
		instance   = { zone="dranikhollowsa", version=0, duration=eq.seconds("6h") },
		compass    = { zone="draniksscar", x=-2045.97, y=15.84, z=214.76 },
		safereturn = { zone="draniksscar", x=-2018.75, y=6.25, z=204.625, h=0 },
		zonein     = { x=3508.0, y=1585.0, z=8.25, h=0 }
	},
	{
		expedition = { name="Dranik's Hollows: Fire Pit", min_players=3, max_players=6 },
		instance   = { zone="dranikhollowsb", version=0, duration=eq.seconds("6h") },
		compass    = { zone="draniksscar", x=-2080.3, y=393.54, z=149.22 },
		safereturn = { zone="draniksscar", x=-2057.5, y=398.75, z=146.625, h=0 },
		zonein     = { x=0, y=-447.0, z=-39.25, h=511.0 }
	},
	{
		expedition = { name="Dranik's Hollows: Murkglider Hive", min_players=3, max_players=6 },
		instance   = { zone="dranikhollowsc", version=0, duration=eq.seconds("6h") },
		compass    = { zone="draniksscar", x=-2059.05, y=574.10, z=209.51 },
		safereturn = { zone="draniksscar", x=-2038.5, y=589.25, z=201.875, h=0 },
		zonein     = { x=3944.0, y=-252.0, z=138.0, h=380.0 }
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

		e.other:CreateExpedition(expeditions[inst_cave])

		-- think it's just a random selection on live
		inst_cave=math.mod(inst_cave,3)+1;
	end
end
