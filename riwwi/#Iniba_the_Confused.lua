-- zam comment needs confirmation: "You need Begging 151 and WARMLY faction with Yunjo Resistance to get key."

function event_say(e)
    if(e.message:findi("please")) then
        if (e.other:GetFaction(e.self) <= 3) then
            if (e.other:GetSkill(67) > 150) then --Begging skill
                e.other:SummonItem(52156); -- Item: Scored Silvery Key
            end
        end
    end
end
