local xloc = e.self:GetX();
local yloc = e.self:GetY();
local zloc = e.self:GetZ();
local heading = e.self:GetHeading();
local crystal_regen = 0;

function event_combat(e)
  if (e.joined == true) then
    eq.set_timer('Tadds', 60 * 1000);
  else 
    eq.stop_timer('Tadds');
  end
end

function event_timer(e)
  if (e.timer == 'Tadds') then
    eq.spawn2(300065,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(300062,0,0,xloc,yloc - 15,zloc,heading);
  end
end

function event_signal(e)
  if (e.signal == 80) then
    crystal_regen = crystal_regen + 1;
  end
  if (crystal_regen == 4) then
    e.self:ModifyNPCStat("hp_regen","500");
    crystal_regen = 0;
  end
end
