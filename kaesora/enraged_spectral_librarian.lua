-- spawn 3 A Freed Soul on death
-- enchanter epic - Test of Charm

function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_death_complete(e)
	free_spawn = math.random(2,6)
	if(free_spawn < 3) then
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	elseif(free_spawn == 3) then
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	elseif(free_spawn == 4) then
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	elseif(free_spawn == 5) then
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	elseif(free_spawn > 5) then
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	end
end

function event_combat(e)
	if(e.joined) then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop",300000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
