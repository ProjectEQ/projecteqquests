local ThreadManager = require("thread_manager");
local trumpy = nil;

-- First conversation with Sunsa the waitress
function SunsaConversation()
	trumpy:Say("Time to drain the [dragon].. if ya know what I mean.. Bwah ha ha ha.");
	ThreadManager:Wait(0.65);

	local sunsa = eq.get_entity_list():GetMobByNpcTypeID(1074);
	if(sunsa.valid) then
		sunsa:Say("Trumpy, you are one sick little man!");
	end
end

-- Second conversation with Bruno the bouncer
function BrunoConversation()
	local bruno = eq.get_entity_list():GetMobByNpcTypeID(1075);
	if(bruno.null) then
		return;
	end
	
	trumpy:Say("Outta my way, ya big lummox!");
	ThreadManager:Wait(0.65);
	
	bruno = eq.get_entity_list():GetMobByNpcTypeID(1075);
	if(bruno.null) then
		return;
	end
	
	bruno:Say("Yeah, Yeah. I hope you fall in, you little creep.");
end

-- Third conversation with Guard Beren and Corshin
function GuardBerenConversationOne()
	local beren = eq.get_entity_list():GetMobByNpcTypeID(1090);
	if(beren.valid and beren:GetX() == -145 and beren:GetY() == -247) then
		trumpy:Say("<BURP!> Heh heh.. Enjoy that one, boys!");
		ThreadManager:Wait(0.65);
	
		beren = eq.get_entity_list():GetMobByNpcTypeID(1090);
		beren:Say("Curse you, [Trumpy]!!!");
		ThreadManager:Wait(0.65);
		
		local corshin = eq.get_entity_list():GetMobByNpcTypeID(1091);
		if(corshin.valid) then
			corshin:Say("Shhhhh. What are you, crazy?! I saw Kane talking to him yesterday. I sure don't want to find you washed up under the docks because of that little gnoll dropping.");
		end		
	end
end

-- Fourth conversation with Faren on the docks
function FarenConversation()
	--Every ThreadManager:Wait is a chance for Faren to disappear.
	--As uncommon as that might be in reality we will check for him every step of the way.
	local faren = eq.get_entity_list():GetMobByNpcTypeID(1159);
	if(faren.null) then
		return;
	end
	
	trumpy:Say("Hey, Fishboy! You dropped something! Bwah ha ha ha!");
	ThreadManager:Wait(0.65);
	
	faren = eq.get_entity_list():GetMobByNpcTypeID(1159);
	if(faren.null) then
		return;
	end

	faren:Say("Huh? What? My [tacklebox]? You know I can't swim, you rotten [dwarf]!");
	ThreadManager:Wait(0.65);
	
	faren = eq.get_entity_list():GetMobByNpcTypeID(1159);
	if(faren.null) then
		return;
	end
	
	trumpy:Say("Better start learning, [Skippy].");
	ThreadManager:Wait(10.0);
	
	faren = eq.get_entity_list():GetMobByNpcTypeID(1159);
	if(faren.null) then
		return;
	end
	
	faren:Say("My name is not Skippy.");
end

-- Final return conversation with Guard Beren
function GuardBerenConversationTwo()
	trumpy:Say("Heh. What a loser!");
	ThreadManager:Wait(0.65);
	local beren = eq.get_entity_list():GetMobByNpcTypeID(1090);
	if(beren.valid and beren:GetX() == -145 and beren:GetY() == -247) then
		beren:Say("If you ever talk that way about my [brother] again, I will throw your butt into the dungeon. I don't care who you know!");
		ThreadManager:Wait(0.65);
		
		trumpy:Say("Peh! What have you been eating? Your brother's bait? You are lucky I don't have time to give you the beating you so richly deserve.");
	end
end

function TrumpyWaypoint(e)
	trumpy = e.self;
	if(e.wp == 2) then
		ThreadManager:Create("SunsaConversation", SunsaConversation);
	elseif(e.wp == 4) then
		ThreadManager:Create("BrunoConversation", BrunoConversation);
	elseif(e.wp == 7) then
		ThreadManager:Create("GuardBerenConversationOne", GuardBerenConversationOne);
	elseif(e.wp == 11) then
		e.self:DoAnim(1);
	elseif(e.wp == 12) then
		ThreadManager:Create("FarenConversation", FarenConversation);
	elseif(e.wp == 17) then
		ThreadManager:Create("GuardBerenConversationTwo", GuardBerenConversationTwo);
	end
end

function TrumpyHeartbeat(e)
	--trumpy isn't guaranteed to still "be there" every time heartbeat happens, so we reacquire each heartbeat
	trumpy = e.self;
	ThreadManager:GarbageCollect();
	ThreadManager:Resume("SunsaConversation");
	ThreadManager:Resume("BrunoConversation");
	ThreadManager:Resume("GuardBerenConversationOne");
	ThreadManager:Resume("FarenConversation");
	ThreadManager:Resume("GuardBerenConversationTwo");
end

function TrumpySpawn(e)
	eq.set_timer("trumpy_hb", 100);
end

function event_encounter_load(e)
	eq.register_npc_event("trumpy", Event.waypoint_arrive, 1042, TrumpyWaypoint);
	eq.register_npc_event("trumpy", Event.timer, 1042, TrumpyHeartbeat);
	eq.register_npc_event("trumpy", Event.spawn, 1042, TrumpySpawn);
end
