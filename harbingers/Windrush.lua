function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] >= "7" and e.message:findi("hail")) then
		e.other:Message(6,"As you look at Windrush's face you can feel that you share a common bond with it. You can hear a faint voice in your mind that says, 'Speak the words of the Master. [" .. eq.say_link("I am of the body") .. "].");
		e.self:Say("Leave before I send you to your god.");
	elseif(qglobals["monk_epic"] >= "7" and e.message:findi("body")) then
		e.other:Message(6,"As you speak you can see that you have stirred something from within this creature");	
		e.self:Say("I will teach you to disturb what you cannot change!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
	end		
end

function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("depop", 1800 * 1000);
	eq.set_next_hp_event(70);
  end
end

function event_hp(e)
	if(e.hp_event == 70) then
		e.self:Say("I know what you seek but I now hold all the power that is Kaiaren's mind!");
		eq.set_next_hp_event(40);
		eq.set_timer("stun", 1 * 1000);
	elseif(e.hp_event == 40) then
		e.self:Say("Fools! You cannot fathom the power an enlightened mind has.");
		eq.set_timer("spectrum", 1 * 1000);
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop_with_timer();
	elseif(e.timer=="spectrum") then
		eq.stop_timer("spectrum");
		e.self:CastSpell(3908, e.self:GetTarget():GetID());	
		eq.set_timer("spectrum", 15 * 1000);
	elseif(e.timer=="stun") then
		eq.stop_timer("stun");
		e.self:CastSpell(1968, e.self:GetTarget():GetID());	
		eq.set_timer("stun", 20 * 1000);
	end
end