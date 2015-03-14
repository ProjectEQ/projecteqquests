-- Converted to .lua by Speedz

function event_death_complete(e)
    xloc = e.self:GetX();
    yloc = e.self:GetY();
    zloc = e.self:GetZ();
    myheading = e.self:GetHeading();
    eq.spawn2(35069,15,0,xloc + 5,yloc,zloc,myheading);
    eq.spawn2(35069,15,0,xloc - 5,yloc,zloc,myheading);
    eq.spawn2(35069,15,0,xloc,yloc + 5,zloc,myheading);
    eq.spawn2(35069,15,0,xloc,yloc - 5,zloc,myheading);
end
