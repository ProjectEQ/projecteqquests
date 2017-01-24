-- #Mister_Lockout
-- Used to check instance lockouts until we have expedition system.

function event_say(e)
	local instance_requests = require("instance_requests")
	local lockout_globals = {
			{ "mirb_50_lockout", "LDoN Raid: Miragul's Menagerie: Frozen Nightmare"},
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
      { "MPG_hatred", "MPG: Trial of Hatred" },
      { "MPG_specialization", "MPG: Trial of Specialization" },
      { "MPG_endurance", "MPG: Trial of Endurance" },
      { "MPG_foresight", "MPG: Trial of Foresight" },
      { "MPG_adaptation", "MPG: Trial of Adaptation" },
      { "MPG_corruption", "MPG: Trial of Corruption" }

		}

	if(e.message:findi("hail")) then
		e.other:Message(257, "Would you like to know your [" .. eq.say_link("Lockouts",false,"Lockouts") .. "] or fix your [" ..eq.say_link('skills', false, 'skills') .. "] ?")
	elseif(e.message:findi("lockouts")) then
		instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
  elseif(e.message:findi("skills")) then

    -- See the global/global_player.lua for the reference index for these values
    local free_skills =  {0,1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,36,37,38,39,41,42,43,44,45,46,47,49,51,52,54,67,70,71,72,73,74,76};

    for k,v in ipairs(free_skills) do
      if ( e.other:MaxSkill(v) > 0 and e.other:GetRawSkill(v) < 1 and e.other:CanHaveSkill(v) ) then 
        e.other:SetSkill(v, 1);
      end
        
    end
	end
end
