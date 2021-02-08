-- items: 15791, 16148
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and qglobals["mage_epic_fire1"] == "1") then	
		e.self:Say("Ugh. It's dreadfully hot in here. It's been extra hot since Tagrin [" .. eq.say_link("upgraded") .. "] his forge.");
	elseif(e.message:findi("upgraded") and  qglobals["mage_epic_fire1"] == "1") then	
		e.self:Say("Oh! Curious are you? Well I'm not going to tell you unless you get me out of here! And don't think you can just break my chains with some heavy weapons or some fancy hocus-pocus! It's going to take more than that to [" .. eq.say_link("break Tagrin's steel") .. "].");	
	elseif(e.message:findi("break Tagrin's steel") and  qglobals["mage_epic_fire1"] == "1") then	
		e.self:Say("If I knew that do you think I'd be here still? I thought you'd at least be half as smart as you look! Well, I have a friend that may be able to help us. Have you ever met Bor Wharhammer? Well if you have, good, go to him. If you haven't, find him. Bring him a hammer made by Tagrin so he can see what he's working with. He's really good at breaking stuff. Bring him this note as well, so he knows I sent you.");
		e.other:SummonItem(15791); -- Item: Note from Gnapp
	end
end


function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);	
	if(qglobals["mage_epic_fire1"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 16148})) then
		e.self:AssignWaypoints(191);
		e.self:ResumeWandering();		
	end
	item_lib.return_items(e.self, e.other, e.trade)	
end

function event_waypoint_arrive(e)
	if(e.wp >= 4) then 
		eq.spawn2(214127,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());--Elemental Essence of Fire (214127)
	end
end