local inst_cata=1
local inst_sewer=1

local catacombs = {
	{
		instance = { zone="dranikcatacombsa", version=0, duration=eq.seconds("6h") },
		zonein = { x=0, y=0, z=-8.5, h=0 }
	},
	{
		instance = { zone="dranikcatacombsb", version=0, duration=eq.seconds("6h") },
		zonein = { x=222.125, y=665.875, z=-14.75, h=286.0 }
	},
	{
		instance = { zone="dranikcatacombsc", version=0, duration=eq.seconds("6h") },
		zonein = { x=-20, y=-218, z=-1.25, h=112 }
	}
}

for i=1,#catacombs do
	catacombs[i].expedition = { name="Catacombs of Dranik", min_players=3, max_players=6 }
	catacombs[i].compass    = { zone="dranik", x=-292.35, y=1049.05, z=-82.54 }
	catacombs[i].safereturn = { zone="dranik", x=-291.375, y=1027.125, z=-76.25, h=0.0 }
end

local sewers = {
	{
		instance = { zone="draniksewersa", version=0, duration=eq.seconds("6h") },
		zonein = { x=0, y=0, z=-3.5, h=0 }
	},
	{
		instance = { zone="draniksewersb", version=0, duration=eq.seconds("6h") },
		zonein = { x=0, y=0, z=-7.5, h=0 }
	},
	{
		instance = { zone="draniksewersc", version=0, duration=eq.seconds("6h") },
		zonein = { x=0, y=0, z=-6.875, h=0 }
	},
}

for i=1,#sewers do
	sewers[i].expedition = { name="Sewers of Dranik", min_players=3, max_players=6 }
	sewers[i].compass    = { zone="dranik", x=-153.43, y=-1254.68, z=-243.39 }
	sewers[i].safereturn = { zone="dranik", x=-133.375, y=-1239.125, z=-237.875, h=0.0 }
end

function event_say(e)
	local is_gm = (e.other:Admin() > 80 and e.other:GetGM())

	if (e.message:findi("hail")) then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Grand Historian Rygua says, 'Greetings, traveler. I am Grand Historian Rygua and I can open your mind to the history of our people if you wish. I can show you the [" .. eq.say_link("catacombs") .. "] or the [" .. eq.say_link("sewers") .. "].'")
	elseif (e.message:findi("catacombs")) then
		if not is_gm and e.other:GetGroupMemberCount() < 3 then
			eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Grand Historian Rygua says, 'I'm sorry but the area is too dangerous for you. I would feel better if you had more adventurers with you.'")
			return
		end

		--instance A
		if (inst_cata==1) then
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a dragorn known as Dragorn Marshal Greshka, or an ikaav enchantress known as High Enchantress Zy'chia, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
		--instance B
		elseif (inst_cata==2) then
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as Elite Overlord Vijaz, or an ikaav wizard known as High Sorceress Vi'Tara, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
		elseif (inst_cata==3) then
		--instance C
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as the Master of the Watch, or an ikaav mage named, Elite Pixxt K’illiga, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
		end

		e.other:CreateExpedition(catacombs[inst_cata])

		inst_cata=math.mod(inst_cata,3)+1;

	elseif (e.message:findi("sewers")) then
		if not is_gm and e.other:GetGroupMemberCount() < 3 then
			eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Grand Historian Rygua says, 'I'm sorry but the area is too dangerous for you. I would feel better if you had more adventurers with you.'")
			return
		end

		--instance A
		if (inst_sewer==1) then
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across discordling named Craftsman Ferinio, or a golem known as Stonefoot. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
		--instance B
		elseif (inst_sewer==2) then
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across an ikaav mage named Silania Janaid, or a bat known as the Nightfang Glider. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
		elseif (inst_sewer==3) then
		--instance C
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across a dragorn known as the Dragorn Foreman, or an ukun known as the Ukun Sentinel. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
		end

		e.other:CreateExpedition(sewers[inst_sewer])

		inst_sewer=math.mod(inst_sewer,3)+1;
	end
end
