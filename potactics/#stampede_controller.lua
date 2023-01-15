function event_spawn(e)
eq.zone_emote(0,"You hear the pounding of hooves.");
eq.set_timer("wave1", math.random(40, 120) * 1000);
end

function event_timer(e)
if (e.timer == "wave1") then
eq.stop_timer("wave1");
eq.spawn2(214097,196,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,196,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214101,196,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #a_Stampeding_Piglet (214101)
eq.set_timer("wave2",2000);
elseif (e.timer == "wave2") then
eq.stop_timer("wave2");
eq.spawn2(214097,195,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,195,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.set_timer("wave3",2000);
elseif (e.timer == "wave3") then
eq.stop_timer("wave3");
eq.spawn2(214097,197,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.spawn2(214097,197,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_Stampeding_Boar
eq.depop_with_timer();
end
end
