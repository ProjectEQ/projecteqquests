local hp = true;
local hptwo = true;
local blind_timer=40;
local blind_cast=52;
local Rikkukin_hp=65;
local Rikkukin_hptwo=30;

local box = require("aa_box")

local Rikk = box();
Rikk:add(1554.17, 6653.29);
Rikk:add(1115.40, 6631.73);
Rikk:add(1107.08, 6266.73);
Rikk:add(1486.47, 6230.15);

local index = 0;
local rikkukin_emote = {
	{
		"Rikkukin pulls his right arm back, preparing to cut a swathe through his opponents with his razor sharp claws.",
		"Rikkukin claws at those on his right flank.",
		6554
	},
	{
		"Rikkukin pulls his left arm back, preparing to cut a swathe through his opponents with his razor sharp claws.",
		"Rikkukin claws at those on his left flank.",
		6555
	},
	{
		"Rikkukin twirls his tail, preparing to sweat away those foolish enough to take up position behind him.",
		"Rikkukin swats at those behind him with his tail.",
		6553
	},
	{
		"Rikkukin rears backs and fills his lungs, preparing to exhale a cone of ice.",
		"Rikkukin exhales a cone of deadly ice.",
		6552
	}
};

function event_timer(e)
	if not Rikk:contains(e.self:GetX(), e.self:GetY()) then -- If I am not inside this box - respawn me back at spawn point.
		e.self:GotoBind();
		e.self:WipeHateList();
	end

	if e.timer == "Emote" then
		index = math.random(1, #rikkukin_emote);
		eq.get_entity_list():MessageClose(e.self, false, 500, MT.SayEcho, "Meanwhile, his attentions are focused on ".. e.self:GetHateTop():GetCleanName());
		eq.zone_emote(MT.Yellow, rikkukin_emote[index][1]);	-- Warn the players whats about to happen.
		eq.set_timer("Emote", 30 * 1000);					-- After emote goes off, set timer to every 30 seconds.
	elseif e.timer == "Casting" then
		eq.zone_emote(MT.Yellow, rikkukin_emote[index][2]);
		e.self:CastSpell(rikkukin_emote[index][3], e.self:GetTarget():GetID());	-- Cast this spell.
		eq.set_timer("Casting", 30 * 1000);										-- After cast goes off, re-adjust timer to every 30 seconds which should line up every 12 behind "Emote"
	elseif e.timer == "Locked_HP" then
		eq.stop_timer('Locked_HP');
		eq.set_timer("Blind", blind_timer * 1000);		-- If my HP is locked -- Start my blind timer.
		eq.set_timer("Blind_Cast", blind_cast * 1000);	-- Start my cast timer on blind
		e.self:TempName("Rikkukin the Defender");		-- Reset my name to Rikkukin the Defender
		hp = false;										-- Set HP lock to false to prevent loop.
		eq.set_next_hp_event(30);						-- Set this to happen again @ 30%
	elseif e.timer == "Wipe" then -- If wipe condition is met, stop all timers, wipe my hate list. Get my max HP, set my locked statuses back to true.
		eq.stop_all_timers();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
		hp		= true;
		hptwo	= true;
	elseif e.timer == "Locked_HPtwo" then
		eq.stop_timer('Locked_HPtwo');
		e.self:TempName("Rikkukin the Defender");	-- If my  HP is unlocked reset my name back.
		hptwo = false;								-- Set HP lock to false to prevent loop.
	elseif e.timer == "Blind" then
		eq.zone_emote(MT.Yellow, "Rikkukin twists his body so that the ambient light starts to reflect from his slivery scales."); -- Emote I will blind soon.
	elseif e.timer == "Blind_Cast" then
		local cl = eq.get_entity_list():GetClientList();
		for client in cl.entries do
			if client.valid and not e.self:BehindMob(client, e.self:GetX(), e.self:GetY()) then -- If you are facing towards me. Blind your client.
				e.self:CastedSpellFinished(6556, client);
			end
		end
		eq.set_timer("Blind_Cast", 40000); -- Readjust Blind cast to sync up with Blind Emote.
	end
end

function event_combat(e)
	if e.joined then
		eq.set_timer("Emote", 1000);		-- Start First Emote
		eq.set_timer("Casting", 11 * 1000);	-- Start First Cast.
		eq.set_timer("Rikk", 3 * 1000);
		eq.set_next_hp_event(65);
		eq.zone_emote(MT.SayEcho, "Rikkukin the Defender says 'Is there one among you with a guilty burden to bear? I sense the culprit, the slayer of my mate. You will all perish for this misdeed!'");
	elseif not e.joined then -- If raid wipes, set my fail condition in 30 seconds.
		eq.set_timer("Wipe", 30 * 1000);
	end
end

function event_hp(e)
	if e.hp_event == 65 and hp then
		e.self:TempName("Rikkukin (Frozen Aura)");	-- Rename myself.
		eq.zone_emote(MT.Yellow, "Rikkukin's skin seal over with a caustic sheet of malleable ice. The Protection will soon make him impervious to melee and magical attacks."); -- Warn the players I'll absorb damage soon.
		eq.set_timer("Locked_HP", 30 * 1000);		-- Start a 30 second countdown of my locked state.
		eq.set_next_hp_event(60);					-- Do something at 60%
	elseif e.hp_event == 60 and hp then
		e.self:SetHP(e.self:GetMaxHP() * (Rikkukin_hp / 100.0));							-- If I reach 60% HP reset my HP to (Rikkukin_hp /100) 65%
		e.self:Emote("focuses inwardly and heals his wounds through sheer force of will.");	-- Warn the players I'm healing.
		eq.set_next_hp_event(60);															-- Rinse repeat until my locked state is up.
	elseif e.hp_event == 30 and hptwo then
		eq.zone_emote(MT.Yellow,"Rikkukin's skin seal over with a caustic sheet of malleable ice. The Protection will soon make him impervious to melee and magical attacks."); -- Warn the players I'll absorb damage soon.
		e.self:TempName("Rikkukin (Frozen Aura)");	-- Rename myself.
		eq.set_timer("Locked_HPtwo", 30 * 1000);	-- Start a 30 second countdown of my locked state.
		eq.set_next_hp_event(25);
	elseif e.hp_event == 25 and hptwo then
		e.self:SetHP(e.self:GetMaxHP() * (Rikkukin_hptwo / 100.0));							-- If I reach 25% H P reset my HP to (Rikkukin_hptwo / 100) 25%
		e.self:Emote("focuses inwardly and heals his wounds through sheer force of will.");	-- Warn the players I'm healing.
		eq.set_next_hp_event(25);															-- Rinse repeat until my locked state is up.
	end
end

function event_death_complete(e)
	eq.spawn2(339112,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Spawn a chest with loot at my location upon death.
end
