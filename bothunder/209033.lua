--agnarr script A_storm_portal

function event_signal(e)
if (e.signal==1) then
eq.spawn2(eq.ChooseRandom(209107,209124,209125,209126), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
e.self:Emote("glows with power as several large silhouettes begin to take shape inside.");
eq.set_timer('agnarradds', 1 * 1000);
end
end

function event_timer(e)
if(e.timer == 'agnarradds') then
eq.signal(209026,1);
eq.stop_timer('agnarradds');
end
end
