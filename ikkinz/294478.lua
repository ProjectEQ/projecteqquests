--Ikkinz Raid #2: Chambers of Glorification
--Glorified_Bolsterer (294478)
--(house left)
function event_signal(e)
if (e.signal == 1) then
e.self:SetSpecialAbility(35, 0); -- turn off immunity
end
end

function event_death_complete(e)
eq.signal(294582,2); -- NPC: #Guardian_of_Glorification (294582) signal to reduce max hp
eq.signal(294583,2); -- ##Guardian_of_Glorification (294583) signal to reduce max hp
eq.signal(294584,2); -- #Guardian_of_Glorification_ (294584) signal to reduce max hp
end
