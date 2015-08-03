--[[ The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
  Books
  Items will set a qglobal using lua bit in the same order listed here
  +---------------------+-------+
  | Name                | id    |
  +---------------------+-------+
  | Zajeer's Writings   | 67607 | = 1
  | Valtron's Writings  | 67608 | = 2
  | Frizznik's Writings | 67609 | = 4
  | Wijdan's Writings   | 67610 | = 8
  | Rytan's Writings    | 67611 | = 16
  | Vahlara's Writings  | 67612 | = 32
  | Kaikachi's Writings | 67613 | = 64
  | Xenaida's Writings  | 67614 | = 128
  | Lyndro's Writings   | 67615 | = 256
  | Silius' Writings    | 67616 | = 512
  | Prathun's Writings  | 67617 | = 1024
  | Rashere's Writings  | 67618 | = 2048
  | Maddoc's Writings   | 67619 | = 4096
  | Absor's Writings    | 67620 | = 8192
  +---------------------+-------+
--]]

function event_say(e)
    local greatadventures = 0
    if (e.other:GetGlobal("greatadventures") ~= "Undefined") then
        greatadventures = tonumber(e.other:GetGlobal("greatadventures"))
    end
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (e.message:findi("hail")) then
        if (greatadventures > 0) then
            e.self:Say("There is nothing more I can tell you. If you accomplish what I ask, then I will reward you. Until then, there is nothing left to say.")
        else
            e.self:Emote(" focuses his attention on " .. e.other:GetName())
            e.self:Say("Well, hello there. Have you come to listen to my tale of sorrow? Please say [" .. eq.say_link("yes") .. "].")
        end
    elseif (e.message:findi("yes")) then
        e.self:Say("Find a place to sit, for what I am about to tell you is a tale of fourteen great adventurers who met the full force of the Muramites head on... [" .. eq.say_link("continue") .. "].")
        e.other:SetGlobal("greatadventures", "1", 5, "H36")
    elseif (greatadventures > 0 and e.message:find("continue")) then
        if (greatadventures == 1) then
            e.self:Say("When the brotherhood first arrived here, we sent out scouts to gather information about the area. Those scouts were some of our best and they were executing their task flawlessly until one day the information stopped. All of the brotherhood began to worry. We sent a young scout named Falcin to investigate.  Soon after his departure, he returned in bad condition. Falcin died shortly afterward, but not before he detailed the gruesome practices of the Muramite army. This upset many, including a group of fourteen legendary adventurers who had arrived shortly after we hit land... [" .. eq.say_link("continue") .. "].")
            e.other:SetGlobal("greatadventures", "2", 5, "H36")
        elseif (greatadventures == 2) then
            e.self:Say("Feeling that things were getting out of hand, these fourteen came to me and asked that I help them by telling them everything we had found out about the continent thus far. Seeing the light of determination in their eyes, I decided to reveal confidential information to them. I figured they would just leave things to us once they knew how serious the situation was, but knowledge of how dire things could become just fueled the spirit of honor within all of them. I told them that it would be brought under control by the brotherhood, but they refused to listen. They decided that the only solution was to destroy the leader of this invading force... [" .. eq.say_link("continue") .. "].")
            e.other:SetGlobal("greatadventures", "3", 5, "H36")
        elseif (greatadventures == 3) then
            e.self:Say("That morning, those of them who chose to save us said goodbye to their friends and family, and the rest -- all good friends of mine -- asked me to honor them.  They wanted me to say that I believed they would accomplish what it was they set out to do. I told them I would have a mug of ale waiting for all of them upon their triumphant return, but while I said this aloud, deep inside I knew that this would not turn out well... [" .. eq.say_link("continue") .. "].")
            e.other:SetGlobal("greatadventures", "4", 5, "H36")
        elseif (greatadventures == 4) then
            e.self:Say("The next morning I gathered all of them together and cast a spell on their leader that would allow me to communicate with him through his mind and see what he saw. So, off they went, leaving behind six of our residents -- Sophia, Verna, Irena, Jenna, Gizzmu, and Aprilia -- to wait for their return. Days passed and nights of unrest became worse and worse as visions of their battles popped into my mind. I saw them fighting through Qinimi and stalking through the sewers. I witnessed their arrival in Yxtta where they begin to have problems making it through. I saw one of them almost fall before the rest rushed to his aid and saved him. Even through all of this, they never once considered turning back... [" .. eq.say_link("continue") .. "].")
            e.other:SetGlobal("greatadventures", "5", 5, "H36")
        elseif (greatadventures == 5) then
            e.self:Say("A short time went by and my mind was oddly silent. I spent those moments trying to comfort the others as they began to ask me questions. Fearing I would reveal my worry, I reassured them that everything was fine and that our heroes would return shortly.  There was more silence and my hopes began to wane. Then, I had another vision. They were still alive and were fighting in an area with a huge crater at its center. This, I surmised, was where some kind of explosion occurred that had caused all of the destruction I'd seen. Our friends fought on through this until they finally went as far as they could go... [" .. eq.say_link("continue") .. "].")
            e.other:SetGlobal("greatadventures", "6", 5, "H36")
        elseif (greatadventures >=  6) then
            e.self:Say("They had finally made it to the entrance of Tacvi, the broken temple of the enslaved trusik. It was inside this temple that the trusik worshiped a false god named Trushar. It was here that the army's leader could be found, this ominous being we knew only as the Zun'Muram. It was here that I would receive my last vision and the link to my friends would disappear. The last thing I saw was all of them bruised and beaten, yet still determined to stop this threat to Norrath. Before entering the lair of the fearsome beast, they all embraced each other. That is where the visions stopped and the [" .. eq.say_link("mystery") .. "] began.")
            e.other:SetGlobal("greatadventures", "7", 5, "H36")
        end
    elseif (e.message:findi("mystery")) then
        if (greatadventures == 7) then
            e.self:Say("Well, you see. this happened some time ago and as each day passes, me and the others sink deeper into depression. With our hope quickly dying, all we can do now is pray for some sort of closure. While I do not want to fully admit it, I believe our heroes all met their demise and now I just want them to be honored in death. I have taken enough of your time and I appreciate that you listened to me. Telling the story helps me feel better, but now I must go back to wondering what has happened [" .. eq.say_link("unless") .. "]...")
        end
    elseif (e.message:findi("unless")) then
        if (greatadventures == 7) then
            e.other:Message(12, "De`van Szostek says 'You seem quite interested in what I have said here and while I could be wrong, when I look at you I see a glimpse of the same honor-filled spirit I saw in them. I know it may be too much to ask, but we have all been suffering for a long time and... well, if you ever find yourself inside Tacvi, and you come across the remains of an adventurer, bring back what you find. For me, I would like to have the writings of Xenaida, Wijdan, Rytan, Kaikachi, Vahlara, Frizznik, Zajeer, and Valtron. As for the rest of them, I would ask that you return their memories to the six they left here on the boat. While this task is not an easy one, I shall handsomely reward anyone who returns all of these things to the proper people.'")
        end
    elseif (e.message:findi("task is complete")) then
        if (turnins == 16383) then -- completed!
            e.self:Say("I thank you, " .. e.other:GetName() .. ", and as I promised, here is a reward for your efforts. Guard this with your life, for while it may not seem like much, I believe its potential will increase when we discover more about these beings and the realm they came from.")
            e.other:SummonItem(67606) -- Tome of New Beginnings
        else
            e.self:Say("I am sorry. You still have more to collect before I can reward you.")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67607})) then -- Zajeer's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 1)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67608})) then -- Valtron's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 2)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67609})) then -- Frizznik's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 4)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67610})) then -- Wijdan's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 8)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67611})) then -- Rytan's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 16)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67612})) then -- Vahlara's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 32)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67613})) then -- Kaikachi's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 64)), 5, "F")
    elseif (item_lib.check_turn_in(e.trade, {item1 = 67614})) then -- Xenaida's Writings
        e.self:Say("This tome will serve as a remnant of a great warrior who died protecting our realm from the menace of the Muramites. I thank you, " .. e.other:GetName() ..", and ask that you bring more if you find them.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 128)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
