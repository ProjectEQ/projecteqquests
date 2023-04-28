-- #Jerimo_Jiao (291113)

local uqua = "Uqua, the Ocean God Chantry"
local uqua_raid = {
	expedition = { name="Uqua, the Ocean God Chantry", min_players=18, max_players=54 },
	instance   = { zone="uqua", version=0, duration=eq.seconds("6h") },
	compass    = { zone="yxtta", x=1575.46, y=1745.46, z=-397.62 },
	safereturn = { zone="yxtta", x=1232.68, y=-783.72, z=-428.72, h=128 },
	zonein     = { x=-17, y=-7, z=-24, h=0 }
}

function event_say(e)
	local is_gm = (e.other:Admin() > 80 and e.other:GetGM())

	if(e.message:findi("hail")) then
		e.other:Message(MT.NPCQuestSay, "Jerimo Jiao says, 'Beware traveler for behind me lies the way to an ancient temple long since forgotten about. It is within this temple that the trusik have begun a ritual similar to the one that brought the menacing beings known as Muramites. While it may appear to be nothing what you see behind me is a complex illusion placed here by those inside to trick travelers like you. But after losing my life and that of the one I loved to the invading army I am bound here to help those who wish to stop the trusik from damning us again. If you are truly a brave adventurer then just tell me you are [ready] and I will tell you how to get through the facade behind me.'");
	elseif(e.message:findi("ready")) then
		if not is_gm and e.other:GetRaidMemberCountInZone() < 18 then
			e.other:Message(MT.NPCQuestSay, "Jerimo Jiao says, 'I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least eighteen friends to join you on this perilous journey.")
		elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(uqua, "Replay Timer", 54) then
			e.other:Message(MT.NPCQuestSay, "Jerimo Jiao says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
		else
			e.other:Message(MT.NPCQuestSay, "Jerimo Jiao says, 'Place your hands on one of the altars behind me and the way will be revealed. Be wary for you are about to encounter some of the most vicious trusik known. If for any reason you wish to return, place your hands on the golem within the temple.'");
			local dz = e.other:CreateExpedition(uqua_raid)
		end
	end
end
