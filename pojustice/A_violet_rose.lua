function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("lies in the middle of the floor. It seems to call to you in a faint whisper. As you get closer, it suddenly explodes in a cloud of thick black smoke.");
    eq.spawn2(201412, 0, 0, e.self:GetX()-10, e.self:GetY()-10,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: Wraith_of_Domagr
    eq.spawn2(201412, 0, 0, e.self:GetX()-5, e.self:GetY()-10,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: Wraith_of_Domagr
    eq.spawn2(201412, 0, 0, e.self:GetX()+10, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: Wraith_of_Domagr
    eq.spawn2(201412, 0, 0, e.self:GetX()+7, e.self:GetY()+7,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: Wraith_of_Domagr
    eq.depop_with_timer();
  end
end
