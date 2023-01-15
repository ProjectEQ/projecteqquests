-- items: 51120
rescue = 0;
x_dest = 785;
y_dest = -1775;

function event_say(e)
	if (e.message:findi("hail")) then
		if (rescue == 0) then
			e.self:Emote("whispers something almost inaudible to " .. e.other:GetName() .. ".");
			e.self:Emote("whispers, 'Oh thank heavens! Did Kintok send you?! I thought he might. I had gone to get some supplies for him, but our ship got attacked, and I was taken prisoner by these zombie guards here. I've been here for more days than I can count. Would you [help me escape]?");
		elseif (rescue == 1) then
			e.self:Say("I must return to the docks, I am afraid that they may still be after us, at least if we are near the docks, the Kerran will help us out.");
		elseif (rescue == 2) then
			e.self:Emote("appears to be thanking " .. e.other:GetName() .. " heartily for his assistance, and for the rescue.");
			e.self:Say("Oh, thank you very much, I thought I would never get away from those cretins! It seems I've been there for ages. Now, what to do about these supplies. . .' he says as he checks his pockets. 'They've taken everything from me, fortunately I didn't carry the money on me, so they didn't get much. Once I finally make it to Erudin, I should be able to make a withdrawal, and purchase the supplies, and return to Kintok with them. I realize that I am indebted to you already, but could I possibly ask for one last favor? Please return to Kintok with this note from me. It should explain everything, and you will be my proof. Let him know that I shouldn't be more than a day behind you, with the supplies.");
			e.other:SummonItem(51120); -- Note to Kintok
			e.self:Depop();
		end
	elseif (e.message:findi("help me escape")) then
		if (rescue == 0) then
			e.self:Emote("whispers something almost inaudible to " .. e.other:GetName() .. ".");
			e.self:Emote("whispers, 'You are a true hero. I fear that if we try and escape, these zombies may attack us, and perhaps even kill us . . I sure hope you are [prepared for an attack]. If we make it out of here alive, return me to the docks, so that I may be able to gather my thoughts, and composure. I believe I will need to return to Erudin and replace the supplies I lost, but lets not think of that now, lets get out of here first! If we make it to the docks, speak with me again, and I will figure out what it is that I must do.'");
		elseif (rescue == 1) then
			e.self:Say("I must return to the docks, I am afraid that they may still be after us, at least if we are near the docks, the Kerran will help us out.");
		end
	elseif (e.message:findi("prepared for an attack")) then
		if (rescue == 0) then
			e.self:Emote("whispers something almost inaudible to " .. e.other:GetName() .. ".");
			e.self:Emote("whispers, 'I applaud your effort, you truly are a servant of Marr, may he bless you.'");
			
			rescue = 1;
			
			eq.signal(98043, e.other:GetID()); -- NPC: a_zombie_guardian
			eq.follow(e.other:GetID());
			eq.set_timer("docks", 2000)
			
		elseif (rescue == 1) then
			e.self:Say("I must return to the docks, I am afraid that they may still be after us, at least if we are near the docks, the Kerran will help us out.");
		end
	end
end

function event_timer(e)
	x_npc = e.self:GetX();
	y_npc = e.self:GetY();
	if (x_npc >= (x_dest - 100) and x_npc <= (x_dest + 100) and y_npc >= (y_dest - 100) and y_npc <= (y_dest + 100)) then
		rescue = 2;
		eq.stop_timer("docks");
	end
end





