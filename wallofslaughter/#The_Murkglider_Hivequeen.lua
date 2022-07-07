function event_combat(e)
if(e.joined) then
eq.set_timer("adds", 40 * 1000);
else
eq.stop_timer("adds");
end
end

function event_timer(e)
if (e.timer == "adds") then
e.self:Emote("spews several slimy eggs unto the ground.  They begin to quiver almost immediately.");
eq.spawn2(300083, 0, 0, e.self:GetX(),e.self:GetY()-5,e.self:GetZ()+5,0);
eq.spawn2(300083, 0, 0, e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ()+5,0);
eq.spawn2(300083, 0, 0, e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()+5,0);
end
end
