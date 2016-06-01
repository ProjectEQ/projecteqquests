function command_lockouts(e)
	local instance_requests = require("instance_requests")
	local lockout_globals = {
			--LDoN raid needs to be set in lua
			--{ "mirb_50_lockout", "LDoN Raid: Miragul's Menagerie: Frozen Nightmare"},
			{ "potimeb_lockout", "Plane of Time"},
			{ "lockout_ikky_g1", "Ikkinz Group Trial #1: Singular Might"},
			{ "lockout_ikky_g2", "Ikkinz Group Trial #2: Twin Struggles"},
			{ "lockout_ikky_g3", "Ikkinz Group Trial #3: Tri-Fates"},
			{ "ikkylockout3", "Ikkinz Raid #1: Chambers of Righteousness"},
			{ "ikkylockout4", "Ikkinz Raid #2: Chambers of Glorification"},
			{ "ikkylockout5", "Ikkinz Raid #3: Chambers of Transcendence"},
			{ "ikkylockout6", "Ikkinz Raid #4: Chambers of Destruction"},
			{ "uqualockout", "Uqua, the Ocean God Chantry"},
			{ "Ink_Kelekdrix", "Kelekdrix, Herald of Trushar" },
			{ "Ink_Mites", "Stonemite Event" },
			{ "Ink_Golems", "Inktu`Ta Golems" },
			{ "Ink_Callers", "Cursecaller Event" },
			{ "Ink_Noqufiel", "Noqufiel Event" },
      { "Tacvi_PXK", "Tacvi: Pixtt Xxeric Kex" },
      { "Tacvi_PKK", "Tacvi: Pixtt Kretv Krakxt" },
      { "Tacvi_PRT", "Tacvi: Pixtt Riel Tavas" },
      { "Tacvi_ZMKP", "Tacvi: Zun`Muram Kvxe Pirik" },
      { "Tacvi_ZMSB", "Tacvi: Zun`Muram Shaldn Boc" },
      { "Tacvi_ZMMD", "Tacvi: Zun`Muram Mordl Delt" },
      { "Tacvi_ZMYV", "Tacvi: Zun`Muram Yihst Vor" },   
      { "Tacvi_TMCV", "Tacvi: Tunat`Muram Cuu Vauax" },
      { "LDON_rujg", "LDoN Raid: Rujarkian Hills: Hidden Vale of Deceit"},
      { "LDON_mmcc", "LDoN Raid: Mistmoore Catacombs: Struggles within the Progeny"},
      { "LDON_takc", "LDoN Raid: Takish-Hiz: Within the Compact" },
      { "LDON_gukg", "LDoN Raid: Deepest Guk: Ritualist of Hate"},
      { "MPG_fear", "MPG: The Mastery of Fear"},
      { "MPG_weaponry", "MPG: The Mastery of Weaponry"},
      { "MPG_subversion", "MPG: The Mastery of Subversion"},
      { "MPG_efficiency", "MPG: The Mastery of Efficiency"},
      { "MPG_ingenuity", "MPG: The Mastery of Ingenuity"},
      { "MPG_destruction", "MPG: The Mastery of Destruction"},
      { "MPG_hatred", "MPG: Trial of Hatred" } 


		}
  instance_requests.DisplayLockouts(e.self, e.self, lockout_globals)
end

function command_endurance(e)
	local tar = e.self:GetTarget();
	if(tar.null) then
		tar = e.self;
	end
	
	tar:SetEndurance(tar:GetMaxEndurance());
end

local commands = { };
commands["endurance"] = { 50, command_endurance };
commands["lockouts"] = { 0, command_lockouts };

function eq.DispatchCommands(e)
	local command = commands[e.command];
	if(command) then
		local access = command[1];
		if(access > e.self:Admin()) then
			e.self:Message(13, "Access level not high enough.");
			return 1;
		end
		
		local func = command[2];
		func(e);
		return 1;
	end	
	return 0;
end
