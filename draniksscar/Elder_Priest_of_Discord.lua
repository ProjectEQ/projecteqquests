-- items: 77767, 77768, 77654, 77655, 77656, 77657, 77658

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Should you wish to return from whence you came, tell me you wish to [" ..
        eq.say_link("go home") ..
        "] and I will send you.  I am also able to aid wizards and druids with the ability to [find their way] further into Discord.")
        return
    end

    if e.message:findi("find") then
        e.self:Say(
        "If you bring me the right materials -- three samples of pure discordant blood from a dark creature and a rare enchanted scroll, I can help to create teleportation spells.")
        return
    end

    if e.message:findi("home") then
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.poknowledge then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.poknowledge, 582, 49, 4, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.grobb then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.grobb, 2, 13, 4, 180)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.erudnext then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.erudnext, 30, -130, 40, 180)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.neriakb then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.neriakb, -564, -43, -37, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.freporte then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            if eq.is_prophecy_of_ro_enabled() then
                e.other:MovePC(Zone.freeporteast, -682, 146, -51, 192)
                return
            end
            e.other:MovePC(Zone.freporte, -682, 146, -51, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.felwithea then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.felwithea, -289, 10, 4, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.gfaydark then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.gfaydark, 215, 232, 2, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.halas then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.halas, 47, 123, 4, 10)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.oggok then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.oggok, 500, 220, 60, 10)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.qeynos2 then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.qeynos2, 227, 22, 3, 10)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.rivervale then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.rivervale, -110, -16, 4, 192)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.akanon then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.akanon, -153, 500, -18, 66.1)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.kaladima then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.kaladima, 26, 38, 4, 65)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.sharvahl then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.sharvahl, 89, -849, -189, 180)
            return
        end
        if e.other:GetGlobal("OOW_PoD_Origin") == Zone.rathemtn then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(Zone.rathemtn, 653, -2217, 2, 100)
            return
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    if (item_lib.check_turn_in(e.trade, { item1 = 77767, item2 = 77767, item3 = 77767, item4 = 77768 })) then
        e.self:Emote(
        "takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.")
        e.self:Say("You may now travel further into Discord, true power awaits!")
        if (e.other:GetClass() == Class.WIZARD) then
            e.other:SummonItem(77654) -- Item: Spell: Slaughter Gate
            e.other:SummonItem(77655) -- Item: Spell: Translocate: Slaughter
            e.other:SummonItem(77656) -- Item: Spell: Slaughter Portal
        elseif (e.other:GetClass() == Class.DRUID) then
            e.other:SummonItem(77657) -- Item: Spell: Circle of Slaughter
            e.other:SummonItem(77658) -- Item: Spell: Ring of Slaughter
        end
        e.other:Ding()
    end
end
