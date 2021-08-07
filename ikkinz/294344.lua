--spawn group 98734-98741 crumbling monument adds

function event_signal(e)
if (e.signal == 1) then
 if(e.self:GetSp2() == 98734) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 2) then
 if(e.self:GetSp2() == 98735) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 3) then
 if(e.self:GetSp2() == 98736) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 4) then
 if(e.self:GetSp2() == 98737) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 5) then
 if(e.self:GetSp2() == 98738) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 6) then
 if(e.self:GetSp2() == 98739) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 7) then
 if(e.self:GetSp2() == 98740) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
elseif (e.signal == 8) then
 if(e.self:GetSp2() == 98741) then
        e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn turn off immunity
	eq.set_timer("deactivate", 15 * 1000);
 end
end
end

function event_timer(e)
        eq.stop_timer("deactivate");
        e.self:SetSpecialAbility(24, 1); --turn on immunity
        e.self:SetSpecialAbility(35, 1); --turn turn on immunity
	e.self:WipeHateList();
end
