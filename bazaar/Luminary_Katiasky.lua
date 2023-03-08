-- Shaman Spell Vendor
-- ClassID 10

local MESSAGE_COLOR = 15
local CLASS_ID = 10
local SPELL_CLASS_ID = CLASS_ID - 1
local SPELLS = { 9, 12, 15, 17, 31, 32, 35, 36, 39, 40, 42, 46, 48, 49, 50, 60, 61, 62, 63, 64, 75, 79, 86, 93, 95, 96, 98, 110, 
                 111, 112, 131, 132, 133, 134, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 
                 161, 162, 163, 164, 165, 166, 167, 168, 170, 171, 172, 200, 201, 203, 205, 211, 212, 213, 220, 224, 225, 226, 227, 
                 228, 230, 238, 245, 255, 260, 261, 265, 266, 267, 269, 270, 271, 272, 274, 275, 276, 277, 278, 279, 280, 281, 282, 
                 283, 284, 308, 326, 337, 345, 349, 365, 384, 389, 424, 431, 434, 435, 436, 437, 438, 505, 506, 507, 508, 509, 510, 
                 511, 526, 527, 577, 580, 640, 649, 754, 1285, 1290, 1332, 1377, 1427, 1428, 1429, 1430, 1431, 1432, 1526, 1554, 1568, 
                 1570, 1571, 1572, 1573, 1574, 1575, 1576, 1577, 1578, 1579, 1580, 1581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 
                 1589, 1590, 1591, 1592, 1593, 1594, 1595, 1596, 1597, 1598, 1599, 1819, 1884, 1885, 1886, 1891, 1895, 2112, 2113, 
                 2435, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 2528, 2529, 2530, 2880, 2881, 2886, 2894, 2946, 3195, 3196, 3233, 
                 3235, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3392, 3393, 3394, 
                 3395, 3396, 3397, 3398, 3399, 3433, 3441, 3454, 3573, 3574, 3583, 3591, 3593, 3595, 3694, 3842, 3994, 3997, 4000, 
                 4001, 4007, 4054, 4055, 4056, 4057, 4092, 4093, 4094, 4095, 4261, 4262, 4263, 4273, 4274, 4275, 4285, 4286, 4287, 
                 4589, 4899, 4900, 4901, 4979, 5389, 5390, 5391, 5392, 5393, 5394, 5395, 5396, 5397, 5398, 5399, 5400, 5401, 5402, 
                 5403, 5404, 5405, 5406, 5408, 5409, 5410, 5411, 5412, 5414, 5415, 5416, 5417, 5418, 6142, 6667, 6735, 6827, 6874, 
                 6877, 6906, 6907, 8015, 8017, 8018, 8501, 8503, 8504, 8930, 9700, 9701, 9702, 9920, 9921, 9922, 9947, 9948, 9949, 
                 9959, 9960, 9961, 9962, 9963, 9964, 9968, 9969, 9970, 9974, 9975, 9976, 9980, 9981, 9982, 9983, 9993, 9994, 9995, 
                 9999, 10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10011, 10012, 10013, 10014, 10015, 10016, 10017, 
                 10018, 10019, 10026, 10027, 10028, 10029, 10030, 10031, 10032, 10033, 10034, 10038, 10039, 10040, 10044, 10045, 
                 10046, 10047, 10048, 10049, 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10068, 10069, 10070, 
                 11773, 11774, 11775, 11776, 11777, 11778, 11779, 11780, 11781, 11782, 11783, 11784, 21398, 21399, 21400, 24956, 
                 24957, 40971 }


function event_say(e)
    adapt_points = tonumber(e.other:GetBucket("SpellPoints-" .. CLASS_ID))
    if (adapt_points == nil) then
        adapt_points = 0
    end

    -- Sort spells array by level
    table.sort(SPELLS, function(a, b) return compareSpells(a, b) end)

    if e.other:GetClass() == CLASS_ID then
        if e.message:findi("Hail") then
            e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am " .. e.self:GetCleanName() .. ". You look like a " .. e.other:GetClassName() .. " to me, am I [" .. eq.say_link("class_resp_1", true, "right") .. "] about that?")
        elseif e.message:findi("class_resp_1") then
            e.self:Say("I knew it. I have all of the spells you could need on your adventures. I can also help you adapt your abilities to be useful while you are focusing another aspect in your soul, just talk to me when you are ready to [" .. eq.say_link("unlock", true) .. "] those adaptations.")
        elseif e.message:findi("unlock") then
            if adapt_points ~= nil and adapt_points > 0 then
                e.self:Say("Which spell were you interested in unlocking?")
                eq.message(MESSAGE_COLOR, "You have " .. e.other:GetBucket("SpellPoints-" .. CLASS_ID) .. " adaptation points available. [" .. eq.say_link("convert", true, "Convert 5 AA") .. "]") 
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_1", true, "1-10") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_2", true, "11-20") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_3", true, "21-30") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_4", true, "31-40") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_5", true, "41-50") .. "]")
                eq.message(MESSAGE_COLOR, "Level [" .. eq.say_link("level_range_6", true, "51-60") .. "]")
            else
                e.self:Say("In order to adapt your " .. e.other:GetClassName() .. " spells to be used by other classes, I'll need you to expend some of your alternate experience points. I can [" .. eq.say_link("convert", true) .. "] them for you, five at a time, as long as you have a surplus. This will earn you one hundred adaptation points for this class, which you can then spend on unlocking individual spells. I'll provide those spell formula to you for free whenever you have a different class equipped and are sufficiently skilled in that class.")
            end
        elseif e.message:findi("convert") then
            if e.other:GetAAPoints() >= 5 then
                e.other:SetAAPoints(e.other:GetAAPoints() - 5)
                e.other:SetBucket("SpellPoints-" .. CLASS_ID, tostring(adapt_points + 100))
                eq.message(MESSAGE_COLOR, "You have converted five AA to 100 adaptation points. Total: " .. e.other:GetBucket   ("SpellPoints-" .. CLASS_ID))
                eq.message(MESSAGE_COLOR, "You have " ..  e.other:GetAAPoints() .. " alternate advancement points remaining.")
            else
                e.self:Say("I'm sorry " .. e.other:GetCleanName() .. ", you don't have enough unspent AA points to convert.")
            end        
        elseif e.message:findi("level_range_1") then
            printSpellList(1,10,e)        
        elseif e.message:findi("level_range_2") then
            printSpellList(11,20,e)            
        elseif e.message:findi("level_range_3") then
            printSpellList(21,30,e)            
        elseif e.message:findi("level_range_4") then
            printSpellList(31,40,e)            
        elseif e.message:findi("level_range_5") then
            printSpellList(41,50,e)            
        elseif e.message:findi("level_range_6") then
            printSpellList(51,60,e)
        else
            local check_id = tonumber(e.message)
            local unlocked = e.other:GetBucket("Spell-" .. check_id .. "-unlocked")
            if unlocked == '' then
                if e.other:HasSpellScribed(check_id) then
                    e.other:SetBucket("Spell-" .. check_id .. "-unlocked", tostring(eq.get_spell(check_id):Classes(SPELL_CLASS_ID)))
                    e.other:SetBucket("SpellPoints-" .. CLASS_ID, tostring(adapt_points - getSpellCost(check_id)))

                    e.self:Say("You've unlocked access to the spell '" .. eq.get_spell(check_id):Name() .. ". Come talk to me while you have another class equipped to have it added to your spellbook.")
                    eq.message(MESSAGE_COLOR, "You have spent " .. getSpellCost(check_id) .. " adaptation points unlocking a spell. You have " .. e.other:GetBucket("SpellPoints-" .. CLASS_ID) .. " adaptation points available.")
                else
                    e.self:Say("You don't know that spell at all. Ask me again once you've learned it.")
                end
            else
                e.self:Say("How droll.")
            end
        end
    else
        if e.message:findi("Hail") then
            if e.other:GetBucket("class-" .. CLASS_ID .. "-unlocked") then
                e.self:Say("Hail, " .. e.other:GetCleanName() .. ". You look like you have quite a bit of experience as a " .. eq.get_class_name(CLASS_ID) .. ", am I [" .. eq.say_link("offclass_resp_1", true, "right") .. "] about that?") 
            end           
        elseif e.message:findi("offclass_resp_1") then
                e.self:Say("I knew it. I have all of the spells you could need on your adventures. If you have opened up your " .. eq.get_class_name(CLASS_ID) .. " spells with me in the past, I can [" .. eq.say_link("scribe", true) .. "] them in your spellbook.")            
        elseif e.message:findi("scribe") then            
            local count = 0
            for i = 1, #SPELLS do
                local spell_info = eq.get_spell(SPELLS[i])
                local unlocked = 0
                
                if e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked") ~= '' then
                    unlocked = tonumber(e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked"))
                end

                if unlocked <= e.other:GetLevel() and unlocked > 0 and e.other:HasSpellScribed(SPELLS[i]) ~= true then
                    count = count + 1
                    if (count == 1) then
                        e.self:Say("Which spell would you like for me to copy into your spellbook?")
                    end
                    eq.message(MESSAGE_COLOR, "-[" .. eq.say_link(tostring(spell_info:ID()),true,spell_info:Name()) .. "]-")
                end
            end
            if count == 0 then
                e.self:Say("I don't think that you've adapted any " .. eq.get_class_name(CLASS_ID) .. " spells that you don't already know. Visit me in your guise as a "  .. eq.get_class_name(CLASS_ID) .. ", and I can unlock more of them for you.")
            end 
        else 
            local spell_id = tonumber(e.message)
            if e.other:GetBucket("Spell-" .. spell_id .. "-unlocked") and e.other:HasSpellScribed(spell_id) ~= true then
                e.other:ScribeSpell(spell_id, e.other:GetNextAvailableSpellBookSlot())
            end
        end
    end
end

function printSpellList(low, high, e)
    local count = 0

    -- Fail Early
    if (e.other:GetLevel() < low) then
        eq.message(MESSAGE_COLOR, "You must gain more experience before attempting to adapt those spells.")    
    else 
        for i = 1, #SPELLS do
            local spell_info = eq.get_spell(SPELLS[i])
            if spell_info:Classes(SPELL_CLASS_ID) >= low and spell_info:Classes(SPELL_CLASS_ID) <= high then            
                local unlocked = e.other:GetBucket("Spell-" .. SPELLS[i] .. "-unlocked")
                -- This doesn't fucking work for whitespace wtf?
                if (unlocked == '' and (e.other:HasSpellScribed(SPELLS[i]) or e.other:GetGM())) then
                    eq.message(MESSAGE_COLOR, string.format("Cost: %d - Spell:[", getSpellCost(SPELLS[i])) .. eq.say_link(tostring(spell_info:ID()),true,spell_info:Name()) .. "]")
                    count = count + 1
                end
            end
        end
        if count == 0 then
            eq.message(MESSAGE_COLOR, "You have unlocked all spells that you currently know in this level range.")
        end
    end
end

function getSpellCost(spellID)

    local spell_info = eq.get_spell(spellID)
    local spell_level = spell_info:Classes(SPELL_CLASS_ID)

    if (spell_level <= 50) then
        return math.floor(spell_level)
    elseif (spell_level <= 60) then
        return math.floor(spell_level * 2)
    elseif (spell_level <= 65) then
        return math.floor(spell_level * 4)
    elseif (spell_level <= 70) then
        return math.floor(spell_level * 8)
    elseif (spell_level <= 75) then
        return math.floor(spell_level * 16)
    end
end

-- Define the function that will be used to compare two spells
function compareSpells(spellId1, spellId2, spellClassId)
    local spell1 = eq.get_spell(spellId1)
    local spell2 = eq.get_spell(spellId2)
  
    -- Get the class value for each spell
    local classValue1 = spell1:Classes(SPELL_CLASS_ID) or 0
    local classValue2 = spell2:Classes(SPELL_CLASS_ID) or 0
  
    -- Compare the class values
    if classValue1 == classValue2 then
      -- If the class values are the same, use the spell IDs to break ties
      return spell1:Name() < spell2:Name()
    else
      -- Sort spells with higher class values first
      return classValue1 < classValue2
    end
  end