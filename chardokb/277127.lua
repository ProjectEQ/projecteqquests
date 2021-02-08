function event_combat(e)
	if (e.joined == true) then
            eq.spawn2(eq.ChooseRandom(277008,277032),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_revived_sarnak (277008) an_iksar_skeleton (277032)
            eq.depop_with_timer();
        end
end
