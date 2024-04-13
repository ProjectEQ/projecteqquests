function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Should you wish to return from whence you came, tell me you wish to [" .. eq.say_link("go home") .. "] and I will send you.")
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
        if e.other:GetGlobal("OOW_PoD_Origin") == 55 then
            e.self:Say("Very well.  You are now to return from whence you came.")
            e.other:DelGlobal("OOW_PoD_Origin")
            e.other:MovePC(55, -153, 500, -18, 66.1)
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
