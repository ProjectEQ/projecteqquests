-- Primal Door

local question			=	0;	-- Current question number
local expected_door		=	0;	-- Expected Next Door Number
local door_order_number	=	0;	-- Which of the 10 random orders used
local fail_clicks		=	0;	-- Live seemed to take at least 3 failed clicks (No notice that you are clicking wrong)
local ready_to_click	=	false;	-- Door is ready to click (every 30s)
local event_started		=	false;	-- Event is running
local event_completed	=	false;

local question_dialog	=	{
	[33]	=	{"Beginning new, the months refreshed, they youngest of us, I am but a babe.","As far as needle is concerned. I am indeed in the right, and only just.","With the sun at its highest, everyone takes refuge. I am the first to come out after the time of rest."},
	[34]	=	{"I am second of us, but not the least, it is time that tells all, i hear it next.","The lodestone seeks me not, but always drifts near, as near as the sunrise.","Of thrushar I am the loved the most. To find me, you must understand the element and know the signs."},
	[31]	=	{"I am 6 under noon.","Read your lodestone and you will find that I am sinister of the sunrise, but only just.","Trushor's servant of tail and fin, I am their sign. Seek me within."},
	[32]	=	{"If time flies, add are to thee then move on to me.","Where your magnet points I will not be found. Seek me just beyond the sunrise.","Peril I am not, Remove the second in me and give me the first in aid, and with but little confusion I can be found"},
	[29]	=	{"If my clock had your digits, I would be this.","I can bear a load of any stone, but have only one eye to see. Remove one of the majority of this eye from what you see.","As each month passes, so I may"},
	[30]	=	{"You may find yourself in a pinch, should you fail to sea my sign.","You lay arrow straight, your face to face, find me at your right foot.","Seeking news of me, up and down. Tradition has me down, but the rising sun uplifts my spirits ever so slightly."},
	[27]	=	{"Half past six, there are no tricks","Spin your compass as you will, I shall be the rear still.","I am the month of a pair and hand."},
	[28]	=	{"My time is at the end of light and the edge of night","Be certain of your heading and make for the place twixt the sunset and the tail of the lodestone.","If our schedules match, you shall find me in the most dignified company."},
	[26]	=	{"The river flows to be cradled in the sea. Time flows, but is lost. when is it devoured.","Face the setting sun and you will feel the heat of my presence. You grow colder as you follow guidance of the lodestone.","Creatures of Trushar are often protected by those that are my symbol."},
	[25]	=	{"I am the hour that exists betwixt twice two primes.","My aged father is the sun, my least cousin the lodestone.","I am eight in name, but not in sequence"},
	[23]	=	{"It is your style and your gnomon that will help you find me. I am the hour of the sum of the constituents of relative term of terms.","When the needle is lessened by a triple net of degrees you shall find me.","I am the month that brings most of somthing new and a large portion of reminiscences."},
	[24]	=	{"I come last and in number am the greatest, yet when I have passed and all of my kind haven ended, I return in part in the number that follows me.","If you are disarmed, watch your blade fall. Where it leads will answer all.","When brightest day and darkest night are indistinguishable."}
};

	-- Door Map ID = Door Entity ID
	-- 1 = 33
	-- 2 = 34
	-- 3 = 31
	-- 4 = 32
	-- 5 = 29
	-- 6 = 30
	-- 7 = 27
	-- 8 = 28
	-- 9 = 26
	-- 10 = 25
	-- 11 = 23
	-- 12 = 24
	--

local door_order	=	{
	[1]		=	{26,30,25,23,34,28,31,24,33,27,29,32},
	[2]		=	{28,23,32,34,29,25,33,27,26,30,24,31},
	[3]		=	{25,31,24,33,27,30,29,34,23,26,28,32},
	[4]		=	{34,25,23,32,29,31,27,26,33,30,24,28},
	[5]		=	{33,24,27,30,32,23,26,31,28,34,25,29},
	[6]		=	{30,23,34,26,32,31,29,28,27,24,25,33},
	[7]		=	{23,31,28,26,30,24,25,27,29,33,32,34},
	[8]		=	{30,23,27,31,29,25,26,32,34,24,33,28},
	[9]		=	{27,25,31,34,23,30,32,26,29,24,33,28},
	[10]	=	{29,26,31,27,25,24,30,28,23,32,33,34}
}

function enterzone(e)
	local primal_door_status = tonumber(eq.get_data("primal_door_status")) or 0

	if not primal_door_status then	-- Lock the Primal Doors if no global/expired
		eq.get_entity_list():FindDoor(16):SetLockPick(-1);
		event_completed = false;
	else							-- Unlock the Primal Doors if the global is defined.
		eq.get_entity_list():FindDoor(16):SetLockPick(0);
		event_completed = true;
	end
end

function event_reset(e)
	question			=	0;
	expected_door		=	0;
	ready_to_click		=	false;
	door_order_number	=	0;
	fail_clicks			=	0;
	event_started		=	false;
end

function event_click_door(e)
	local door = e.door:GetDoorID();
	local primal_door_status = tonumber(eq.get_data("primal_door_status")) or 0
	
	-- Zkr Epic 1.5 Ferns
	if door == 37 or door == 39 or door == 41 then
		local qglobals = eq.get_qglobals(e.self);
		if e.self:GetClass() == Class.BERSERKER and qglobals["kt_" .. door .. "fern"] == nil then
			e.self:SummonItem(16949); --Taelosian Fern Sample 
			eq.set_global("yx_" .. door .. "fern","1",3,"H1")
		end
	end

	-- Uqua Doors
	if door >=35 and door <=36 then -- Uqua Doors
		local dz = e.self:GetExpedition()
		if dz.valid then
			e.self:MovePCDynamicZone("uqua") 
		else
			e.self:Message(MT.Red,"The gateway to the chantry is sealed off to you. Perhaps you would be able to enter if you needed to adventure there.");
		end
	end

	-- Primal Door Logic
	if door >= 23 and door <= 34 and ready_to_click then
		if expected_door == door then				-- Success
			ask_question(e);
		else										-- Failure
			eq.set_timer("click_timer", 30 * 1000); -- 30s (Live is 60s and its painful)
			fail_clicks = fail_clicks + 1;			-- Increment Failure
			if fail_clicks == 3 then				-- Fail Click 3x = Bad Guys Attack
				stone_attack(e);
			end
		end
	end

	-- Init Primal Event
	if not event_started and door >= 23 and door <= 34 and not event_completed then
		event_started		= true;
		question 			= 1;
		door_order_number	= math.random(1,10); 	-- Choose Random Order
		ready_to_click		= true;
		expected_door		= door_order[door_order_number][question];
		eq.set_timer("click_timer", 30 * 1000); 	-- 30s (Live is 60s and its painful)
		e.self:Message(MT.Yellow, question_dialog[expected_door][math.random(1,3)]);
		question			= question + 1;
	end
end

function event_timer(e)
	if e.timer == "click_timer" then
		ready_to_click = true;
		eq.set_timer("reset_event", 2 * 60 * 1000); -- 2 Minute Reset
		eq.stop_timer("click_timer");
	elseif e.timer == "reset_event" then
		event_reset(e);
		eq.stop_timer("reset_event");
	end
end

function stone_attack(e)
	eq.spawn2(291138,0,0,-1118,816,-426,256):AddToHateList(e.self,500);		-- NPC: an unbound guardian
	eq.spawn2(291133,0,0,-1125,451,-426,0):AddToHateList(e.self,500);		-- NPC: a liberated stoneworker
	eq.spawn2(291131,0,0,-1190,532,-426,0):AddToHateList(e.self,500);		-- NPC: a freed rockbearer
	eq.spawn2(291131,0,0,-1203,685,-426,256):AddToHateList(e.self,500);		-- NPC: a freed rockbearer
	eq.spawn2(291131,0,0,-1150,793,-426,256):AddToHateList(e.self,500);		-- NPC: a freed rockbearer
	eq.spawn2(291131,0,0,-984,740,-426,256):AddToHateList(e.self,500);		-- NPC: a freed rockbearer
	eq.spawn2(291131,0,0,-964,564,-426,0):AddToHateList(e.self,500);		-- NPC: a freed rockbearer
	event_reset(e);
end

function ask_question(e)
	local primal_door_status = tonumber(eq.get_data("primal_door_status")) or 0

	if question == 12 then -- Event Win
		eq.set_data("primal_door_status","1",tostring(eq.seconds("210M"))); -- 3.5 Hours
		eq.get_entity_list():FindDoor(16):SetLockPick(0);
		eq.zone_emote(MT.Red, "The pathway is now clear, but your time is limited.");
		eq.stop_timer("click_timer");
		eq.stop_timer("reset_event");
	else
		question = question + 1;														-- Increment Question Number
		expected_door		= door_order[door_order_number][question];					-- Get Next "Random" door
		ready_to_click		= false;													-- Door is no longer ready to click pending below timer
		eq.set_timer("click_timer", 30 * 1000); 										-- 30s (Live is 60s and its painful)
		e.self:Message(MT.Yellow, question_dialog[expected_door][math.random(1,3)]);	-- Provide text for next door
	end
end
