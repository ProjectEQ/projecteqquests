-- #Mister_Lockout
-- Used to check instance lockouts until we have expedition system.

function event_say(e)
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
      { "MPG_subvion", "MPG: The Mastery of Subversion"},
      { "MPG_efficiency", "MPG: The Mastery of Efficiency"},
      { "MPG_ingenuity", "MPG: The Mastery of Ingenuity"},
      { "MPG_destruction", "MPG: The Mastery of Destruction"}

		}

	if(e.message:findi("hail")) then
		e.other:Message(257, "Would you like to know your [" .. eq.say_link("Lockouts",false,"Lockouts") .. "]?")
	elseif(e.message:findi("lockouts")) then
		instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
	end
end
