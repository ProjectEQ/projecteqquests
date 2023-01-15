-- Huffin script info
-- a_cursed_conscript (224437)
-- a_cursed_magus (224441)
-- a_cursed_vicar (224440)
-- Simati_the_Cursed (224444)
-- Phizan_Crindo (224439)
-- a_fallen_knight (224438)
-- a_fallen_priest (224442)
-- a_fallen_thaumaturge (224443)
-- a_doomed_partisan (224445)
-- a_doomed_sorcerer (224446)
-- a_doomed_curate (224447)
-- Tagai_Darkheart (224448)
-- cracked finger bone (56001)
-- broken finger bone (56002)
-- pristine finger bone (56003)
-- items: 56001, 56002, 56003

local wave_counter = 0;
local event_started = 0;

function event_spawn(e)
  wave_counter = 0;
  event_started = 0;
end

function event_say(e)
	if (event_started == 0) then
		if(e.message:findi("hail")) then
		  e.self:Say("'Ahh a visitor, I see? Welcome to the Cave of the Damned. I am the keeper of these caves, and I have been charged with holding the spiritual [manifestations] at bay. Many bloody battles have been fought on the shores of Gunthak, many more battles will be fought here.'");
		elseif(e.message:findi("manifestations")) then
		  e.self:Say("'Most of the spirits that perish on the beach move on to the next world, though a few remain bound to their ships or comrades and remain on the shore.  Every once in a great while, however, a spirit breaks its bond to the beach and is drawn to this cave.  There is magic in this cave, dark magic.  The spirits that find their way here draw power from the magic in the caves.  I assure that the spirits that find their way here remain contained in the cave, along with their [treasures].'");
		elseif(e.message:findi("treasures")) then
		  e.self:Say("'Finger bones.  There is strong magic in the bones of our fingers, and I use such bones to summon the spirits, as well as keep them bound to this cave.  Bring me four identical finger bones, the better condition the bones are in, the stronger the spirits I call will be.'");
		end
	else
	  e.self:Say("'The spirits are busy. Your time will come.'");
	end
end


function event_trade(e)
	if (event_started == 0) then
		local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 56001,item2 = 56001,item3 = 56001,item4 = 56001})) then
			e.self:Say("'The spirits shall come. Ready yourselves.'");
			event_started = event_started + 1;
			eq.set_timer('lowwave1', 6 * 1000);
		elseif (item_lib.check_turn_in(e.trade, {item1 = 56002,item2 = 56002,item3 = 56002,item4 = 56002})) then
			e.self:Say("'The spirits shall come. Ready yourselves.'");
			event_started = event_started + 1;
			eq.set_timer('midwave1', 6 * 1000);
		elseif (item_lib.check_turn_in(e.trade, {item1 = 56003,item2 = 56003,item3 = 56003,item4 = 56003})) then
		  e.self:Say("'The spirits shall come. Ready yourselves.'");
			event_started = event_started + 1;
			eq.set_timer('topwave1', 6 * 1000);
		end
		item_lib.return_items(e.self, e.other, e.trade)
	else
	  e.self:Say("'The spirits are busy. Your time will come.'");
	end
end

function event_timer(e)
	if (e.timer == 'topwave1' and wave_counter < 7) then
		eq.spawn2(224438, 0, 0, 1107, -2526, -42, 355); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 1076, -2470, -44, 297); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 1004, -2458, -40, 237); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 963, -2526, -42, 161); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 941, -2582, -47, 104); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 959, -2640, -44, 55); -- NPC: a_fallen_knight
		eq.spawn2(224442, 0, 0, 1034, -2640, -44, 508); -- NPC: a_fallen_priest
		eq.spawn2(224443, 0, 0, 1112, -2599, -45, 427); -- NPC: a_fallen_thaumaturge
		eq.set_timer('topwave1', 600 * 1000);
		wave_counter = wave_counter + 1;
	elseif (e.timer == 'topwave1' and wave_counter == 7) then
		eq.spawn2(224438, 0, 0, 1107, -2526, -42, 355); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 1076, -2470, -44, 297); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 1004, -2458, -40, 237); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 963, -2526, -42, 161); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 941, -2582, -47, 104); -- NPC: a_fallen_knight
		eq.spawn2(224438, 0, 0, 959, -2640, -44, 55); -- NPC: a_fallen_knight
		eq.spawn2(224442, 0, 0, 1034, -2640, -44, 508); -- NPC: a_fallen_priest
		eq.spawn2(224443, 0, 0, 1112, -2599, -45, 427); -- NPC: a_fallen_thaumaturge
		eq.spawn2(224439, 0, 0, 1116, -2545, -43, 384); -- NPC: Phizan_Crindo
		eq.stop_timer('topwave1');
		e.self:Say("'You seem to have this situation under control. I will depart now. Best of luck.'");
		eq.depop_with_timer();
	elseif (e.timer == 'midwave1' and wave_counter < 4) then
		eq.spawn2(224445, 0, 0, 1107, -2526, -42, 355); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 1004, -2458, -40, 237); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 963, -2526, -42, 161); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 959, -2640, -44, 55); -- NPC: a_doomed_partisan
		eq.spawn2(224446, 0, 0, 1034, -2640, -44, 508); -- NPC: a_doomed_sorcerer
		eq.spawn2(224447, 0, 0, 1112, -2599, -45, 427); -- NPC: a_doomed_curate
		eq.set_timer('midwave1', 420 * 1000);
		wave_counter = wave_counter + 1;
	elseif (e.timer == 'midwave1' and wave_counter == 4) then
		eq.spawn2(224445, 0, 0, 1107, -2526, -42, 355); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 1004, -2458, -40, 237); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 963, -2526, -42, 161); -- NPC: a_doomed_partisan
		eq.spawn2(224445, 0, 0, 959, -2640, -44, 55); -- NPC: a_doomed_partisan
		eq.spawn2(224446, 0, 0, 1034, -2640, -44, 508); -- NPC: a_doomed_sorcerer
		eq.spawn2(224447, 0, 0, 1112, -2599, -45, 427); -- NPC: a_doomed_curate
		eq.spawn2(224448, 0, 0, 1116, -2545, -43, 384); -- NPC: Tagai_Darkheart
		eq.stop_timer('midwave1');
		e.self:Say("'You seem to have this situation under control. I will depart now. Best of luck.'");
		eq.depop_with_timer();
	elseif (e.timer == 'lowwave1' and wave_counter < 4) then
		eq.spawn2(224437, 0, 0, 1107, -2526, -42, 355); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 1004, -2458, -40, 237); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 963, -2526, -42, 161); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 959, -2640, -44, 55); -- NPC: a_cursed_conscript
		eq.spawn2(224440, 0, 0, 1034, -2640, -44, 508); -- NPC: a_cursed_vicar
		eq.spawn2(224441, 0, 0, 1112, -2599, -45, 427); -- NPC: a_cursed_magus
		eq.set_timer('lowwave1', 360 * 1000);
		wave_counter = wave_counter + 1;
	elseif (e.timer == 'lowwave1' and wave_counter == 4) then
		eq.spawn2(224437, 0, 0, 1107, -2526, -42, 355); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 1004, -2458, -40, 237); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 963, -2526, -42, 161); -- NPC: a_cursed_conscript
		eq.spawn2(224437, 0, 0, 959, -2640, -44, 55); -- NPC: a_cursed_conscript
		eq.spawn2(224440, 0, 0, 1034, -2640, -44, 508); -- NPC: a_cursed_vicar
		eq.spawn2(224441, 0, 0, 1112, -2599, -45, 427); -- NPC: a_cursed_magus
		eq.spawn2(224444, 0, 0, 1116, -2545, -43, 384); -- NPC: Simati_the_Cursed
		eq.stop_timer('lowwave1');
		e.self:Say("'You seem to have this situation under control. I will depart now. Best of luck.'");
		eq.depop_with_timer();
	end
end
