-- items: 9590
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ", Such a beautiful day for music and tales. Don't you think?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9590})) then -- Notice to Cease and Desist
		e.self:Say("What's this? It says that you wish me to cease and desist spreading slander about the swashbuckler known as Stanos, or else . . .? You know, I am new in Freeport. Haven't been performing at this venue for long. I'm just a fledgling muse trying to make ends meet in this big city. My father told me that someday I'd have to put up my fists to protect my rights. I can see that day is today. What I have to say to you is . . . Guards, help!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);		
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		eq.set_timer('gate', 16 * 1000);
		eq.set_timer('guard', 10 * 1000);		
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
  if (e.timer == 'guard') then
	eq.spawn2(eq.ChooseRandom(382255,382256),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): a_Freeport_guard (382255), a_seasoned_Freeport_guard (382256)
		local entity_list = eq.get_entity_list();
		-- aggro guards
		local npc_list = entity_list:GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 382255 or  npc:GetNPCTypeID() == 382256)) then
				npc:AddToHateList(e.self:GetHateTop(),1);
			end
		end					
		
  elseif(e.timer == 'gate') then
  	e.self:GMMove(-873,-1025,11.3,144);
  end
end
-- END of FILE Zone:freporteast -- Lythe_Songbird
