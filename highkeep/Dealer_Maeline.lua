--Huffdaddy script parsed from live
local prize_money = 0;
local urn = 0;
local busy = 0;

function event_spawn(e)
prize_money = 0;
busy = 0;
urn = 0;
end

function event_trade(e)
local item_lib = require("items")
local qglobals = eq.get_qglobals(e.other)

  if(e.other:Class() == "Rogue") and qglobals["roguepre"] == nil and item_lib.check_turn_in(e.trade, {item1 = 9446}) then -- Gold-Leafed Urn

    e.self:Emote("passes the urn to Guard Kovan for safekeeping.  She slides her left hand down her right sleeve and vice versa. 'Welcome to the High Keep Casino, Lepois.  The urn you brought is worth 1500 credits.  Let me know at any time if you want me to [deal you a hand], or if you'd rather [cash out].");
    e.other:AddEXP(10000); --made up live value
    prize_money = 1500;
    urn = 1;
  elseif (e.other:Class() ~= "Rogue") and item_lib.check_turn_in(e.trade, {item1 = 9446}) then -- Gold-Leafed Urn
    e.self:Emote("refuses to accept the urn. 'This is obviously stolen. Why don't you leave the thieving up to the rogues, since you're not very good at it, and get out of here before you land in real trouble?");
  elseif(e.other:Class() == "Rogue") and qglobals["roguepre"] ~= nil and item_lib.check_turn_in(e.trade, {item1 = 9446}) then -- Gold-Leafed Urn
    e.self:Say("Oh, it's you. I'm not falling for that again.");
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other)
  if(e.other:Class() == "Rogue" or e.other:GetGM()) then

    if(e.message:findi("hail")) then
		  e.self:Say("Greetings, " .. e.other:GetName() .. ".");
		elseif(e.message:findi("deal") and urn == 1 and busy == 0) then
		  prize_money = prize_money + 100;
		  e.self:Emote("sweeps the cards from the table. 'Great!  You won several hands that round!");
		  e.other:Message(15, "You now have "..prize_money.." chips to gamble with.  Let me know at any time if you want me to [deal you a hand], or if you'd rather [cash out].")
		  busy = 1;
			-- is there a cap on prize money?
			if prize_money == 1600 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan glares at you with distrust.");
			elseif prize_money == 1700 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan gives you a stern look of disapproval.");
			elseif prize_money == 1800 then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan gives you a stern look of disapproval.");
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"A noble says, 'Yes, but some of your other patrons have a most unsettling look about them.  It's as if you would let in any old thing off the street!");
			elseif prize_money == 1900 then
				local rand = math.random(1,100);
          				if (rand >= 50) then
						e.self:Emote("sweeps the cards from the table. 'Great!  You ...");
						eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan brandishes his blade, 'Not so fast. There's something strange about... I knew it - this artifact was stolen! You're one of those smugglers aren't you? Think about your crimes while you rot in a cell, two-bit thief. Your days of pilfering and plundering are over.");
						e.self:CastSpell(6095, e.other:GetID()); --incapacitating darkness
                		
						prize_money = 0;
						urn = 0;
				
						e.other:MovePC(6, -541.99, -38.02, -10.30, 388.2);
					end
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan turns his attention to the nobles, 'Glad you folks could make it tonight.  I trust you were treated well at dinner?");
			elseif prize_money == 2000 then
				local rand = math.random(1,100);
          				if (rand >= 50) then
						e.self:Emote("sweeps the cards from the table. 'Great!  You ...");
						eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan brandishes his blade, 'Not so fast. There's something strange about... I knew it - this artifact was stolen! You're one of those smugglers aren't you? Think about your crimes while you rot in a cell, two-bit thief. Your days of pilfering and plundering are over.");
						e.self:CastSpell(6095, e.other:GetID()); --incapacitating darkness
                		
						prize_money = 0;
						urn = 0;
				
						e.other:MovePC(6, -541.99, -38.02, -10.30, 388.2);
					end
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan appears restless.  He taps his feet and glances around the casino.");
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"A noble says, 'Yes, but some of your other patrons have a most unsettling look about them.  It's as if you would let in any old thing off the street!");
			elseif prize_money >= 2100 then
				local rand = math.random(1,100);
          				if (rand >= 50) then
						e.self:Emote("sweeps the cards from the table. 'Great!  You ...");
						eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan brandishes his blade, 'Not so fast. There's something strange about... I knew it - this artifact was stolen! You're one of those smugglers aren't you? Think about your crimes while you rot in a cell, two-bit thief. Your days of pilfering and plundering are over.");
						e.self:CastSpell(6095, e.other:GetID()); --incapacitating darkness
                		
						prize_money = 0;
						urn = 0;
				
						e.other:MovePC(6, -541.99, -38.02, -10.30, 388.2);
					end
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan turns to the nobles, 'Is there anything we can fetch for you?");
			end
		eq.set_timer("busy", 10 * 1000); --10 sec cd on dealing hands
		elseif(e.message:findi("deal") and urn == 1 and busy == 1) then
		  e.self:Emote("deftly shuffles the cards together. 'Just a moment, hon, I'm still shuffling.");
		elseif(e.message:findi("cash out") and urn == 1 and qglobals["roguepre"] == nil) then
			if prize_money >= 1800 then --win at 1800 or above
		  		e.other:Message(15, "You have unloaded the stolen urn, completing the first task for the Smuggler's Camp.")
		  		eq.set_global("roguepre", "1", 5 , "F")
				urn = 0;
		  		e.self:Say("Thanks for playing, " .. e.other:GetName() .. ". Here are your winnings. Come back to our establishment again anytime.");
      				e.other:GiveCash(prize_money,0,0,0);
				
				prize_money = 0;
				
			elseif prize_money < 1800 then
				--banish
				e.self:Say(" Thanks for playing, " .. e.other:GetName() .. ". Here are your ...");
				eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Guard Kovan brandishes his blade, 'Not so fast. There's something strange about... I knew it - this artifact was stolen! You're one of those smugglers aren't you? Think about your crimes while you rot in a cell, two-bit thief. Your days of pilfering and plundering are over.");
				e.self:CastSpell(6095, e.other:GetID()); --incapacitating darkness
                		
				prize_money = 0;
				urn = 0;
				
				e.other:MovePC(6, -541.99, -38.02, -10.30, 388.2);
			end
		  
			
			
		  
		elseif(e.message:findi("cash out") and urn == 0) then
		  e.self:Say("You have no winnings to cash in.");
    end
  end
end

function event_timer(e)
  if (e.timer == "busy") then
    eq.stop_timer("busy");
    busy = 0;
  end
end
