local inst_cata=1
local inst_sewer=1

local catacombs = {
	{
		dz = { "dranikcatacombsa", 0, eq.seconds("6h"), zonein = { 0, 0, -8.5, 0 } }
	},
	{
		dz = { "dranikcatacombsb", 0, eq.seconds("6h"), zonein = { 222.125, 665.875, -14.75, 286.0 } }
	},
	{
		dz = { "dranikcatacombsc", 0, eq.seconds("6h"), zonein = { -20, -218, -1.25, 112 } }
	}
}

for i=1,#catacombs do
	catacombs[i].info = { "Catacombs of Dranik", 3, 6 }
	catacombs[i].dz.compass = { "dranik", -292.35, 1049.05, -82.54 }
	catacombs[i].dz.safereturn = { "dranik", -291.375, 1027.125, -76.25, 0.0 }
end

local sewers = {
	{
		dz = { "draniksewersa", 0, eq.seconds("6h"), zonein = { 0, 0, -3.5, 0 } }
	},
	{
		dz = { "draniksewersb", 0, eq.seconds("6h"), zonein = { 0, 0, -7.5, 0 } }
	},
	{
		dz = { "draniksewersc", 0, eq.seconds("6h"), zonein = { 0, 0, -6.875, 0 } }
	}
}

for i=1,#sewers do
	sewers[i].info = { "Sewers of Dranik", 3, 6 }
	sewers[i].dz.compass = { "dranik", -153.43, -1254.68, -243.39 }
	sewers[i].dz.safereturn = { "dranik", -133.375, -1239.125, -237.875, 0 }
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

		e.other:CreateExpedition(catacombs[inst_cata].dz, catacombs[inst_cata].info)

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

		e.other:CreateExpedition(sewers[inst_sewer].dz, sewers[inst_sewer].info)

		inst_sewer=math.mod(inst_sewer,3)+1;
	end
end
