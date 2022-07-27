--zone_emoter (223227)

local ThreadManager = require("thread_manager");
local emote_phase = 0;
local port_raid = false;

function event_spawn(e)
	emote_phase = 0;
	port_raid = false;
end

function event_signal(e)
	if (e.signal == 1) and (emote_phase == 0) then
		-- beginning of phase 1
		emote_phase = 1;
		eq.zone_emote(MT.LightGray,"In the distance, an hourglass appears, the grains of sand falling methodically into place. As quickly as the image was formed, it dissipates. You have one hour left.");
	else
		-- After completing a phase
		emote_phase = e.signal;
		-- half second heartbeat to resume the emote thread
		eq.set_timer("emote_hb",500);
		ThreadManager:Clear();
		ThreadManager:Create("PhaseEmotes",PhaseEmotes);
	end
end

function event_timer(e)
	ThreadManager:Resume("PhaseEmotes");
end

function PhaseEmotes()	
	eq.GM_Message(MT.Green,string.format("[Phase %i Dialogue]  Port Raid? [%s]",emote_phase,tostring(port_raid)));	--debug
	if (emote_phase == 2) then
		-- After completing Phase One:
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Solusek Ro says, 'This is absurd, why are we wasting our time and energy on this?! Direct action is needed, now! Banishing Zebuxoruk will not stop the mortals from entering our planes. Their greed for power will have them soon trampling through our realms!'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rallos Zek says, 'On this I agree! We must take action and the time is now. I will not have these mortals achieving the powers that we hold.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Fennin Ro says, 'Calm yourselves, you need to appreciate the situation that is at hand.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Xegony says, 'Please listen to reason, we are doing what we must. The mortals possess a direct tie to Zebuxoruk. If his stasis is finished their link will dwindle as well as their powers and knowledge.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rathe says, 'The knowledge that was given to them by Zebuxoruk will fade from their minds. We must do this now, for if they were able to translate the divine language all existence would unravel. The balance of power in the universe would be destroyed.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Solusek Ro says, 'This is exactly the point that I am making! So you agree we must show them now that we are the power above them, and not to be questioned!'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rallos Zek says, 'You must see what he refers to; we must turn to Norrath and show them our power. What they are trying to accomplish cannot be allowed to come to pass.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Fennin Ro says, 'My son, please understand we must stop this advancement of mortals without halting their existence. The balance of power must be maintained. Without the mortals the balance would fade.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Solusek Ro says, 'So they have made your decision for you too father. You are all wrong, this will only bring them further into our realms seeking answers! We must take action now. Have at your foolish games, I will not allow them to obtain my power.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"You look up and see a meteor burning through the sky; Solusek returning to his tower to brood over the matters at hand.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rallos lets out a sigh of frustration that vibrates the ground at your feet.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rathe says, 'Rallos still your warring heart. This is what must be done. We must place him in a stasis from which he will not be released. Come share your power. We must commence now.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Xegony says, 'Mithaniel, Karana please record what you see here. With your good nature I am sure that your records will be impartial to any side. We must record this for the ages and learn from our mistake of allowing Zebuxoruk to gain so much power that he is easily passed on to mortals.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"With a sudden jolt the wall comes into crystal clear focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"As the path before you opens up in a swirl of mystical energy, the faded image of an hourglass appears. You have one additional hour.");
		eq.stop_timer("emote_hb");
		ThreadManager:Stop();
	elseif (emote_phase == 3) then
		-- After completing Phase Two:
		eq.zone_emote(MT.LightGray,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"A bright aura streaks through the sky. The power of it sends a surge through your body that makes your hair stand on end.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"The Triumvirate of Water speaks as one voice. It says, 'Now step up to the chambers. Give a part of yourselves to the bind on Zebuxoruk. Through our power, the bonds on him will never be broken. He will be eternally placed in stasis.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Saryrn says, 'What of our weakened state. I refuse to return to my realm without the power to rule over my minions.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Terris Thule says, 'Yes, how can I spread my touch over my lands if I lack so much of myself?'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Cazic Thule says, 'Do not worry daughter, we shall stay here until we are able to recover our strength.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rallos Zek says, 'Our armies shall serve us as we regenerate our abilities. We have nothing to fear.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Bertoxxulous says, 'My soldiers of pestilence shall watch over us. Let us return to our chambers now.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Innoruuk says, 'Are you enjoying watching this Hammer of the Tribunal? I hope your petty report will show my disdain for the Tribunal having no hand in this.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"The Seventh Hammer says, 'Do not waste your energy Innoruuk. You know they are eternally preoccupied with their trials. Surely even you understand many of these trials exist because of the hate you instill into the population of Norrath.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Innoruuk says, 'Do not mock me! I shall seek you out after this is done and my power is restored. You will not be so smug after our next meeting.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"With a sudden jolt the wall comes into crystal clear focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"As the path before you opens up in a swirl of mystical energy, the faded image of an hourglass appears. You have an additional one hour and fifteen minutes.");
		if port_raid then
			raidMove(3);
		end
		eq.stop_timer("emote_hb");
		ThreadManager:Stop();
	elseif (emote_phase == 4) then
		-- After completing Phase Three:
		eq.zone_emote(MT.LightGray,"Terris Thule says, 'I am certain my warriors will have no problem holding back any intruders, but I have my doubts about the other armies.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Vallon Zek says, 'Surely you jest. Your armies are better than the regiments from our realm?'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Tallon Zek says, 'There is no question that our warriors of War and Tactics will be the backbone of the army.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Saryrn says, 'It is no matter anyways, no mortal could ever ascend to this place. These precautions are unnecessary. Bringing them here was a waste of time.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"With a sudden jolt the wall comes into crystal clear focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"As the path before you opens up in a swirl of mystical energy, the faded image of an hourglass appears. You have four additional hours.");
		if port_raid then
			raidMove(4);
		end
		eq.stop_timer("emote_hb");
		ThreadManager:Stop();
	elseif (emote_phase == 5) then
		-- After completing Phase Four:
		eq.zone_emote(MT.LightGray,"Rallos Zek says, 'Something is wrong. I feel Tallon and Vallon's spirits have weakened.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Innoruuk says, 'Don't be a fool, that is just from giving a part of themselves to the bond on Zebuxoruk.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Cazic Thule says, 'No. It is more than that, I can feel the force of Terris has been drained as well.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Bertoxxulous says, 'This is not possible, could mortals have reached us here? Call in our armies, we are too weak to fight now.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Innoruuk says, 'You are all incompetent! I knew you all could not be trusted. If we are defeated in our weakened state, I do not know if we will be able to coalesce again. I will never forgive you all for what has transpired today!'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Rallos Zek says, 'Now is not the time to bicker! We must focus our strength on these puny mortals! Minions of the army, come to our sides. Your gods beckon you, we need you now!'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"With a sudden jolt the wall comes into crystal clear focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"As the path before you opens up in a swirl of mystical energy, the faded image of an hourglass appears. You have four additional hours.");
		if port_raid then
			raidMove(5);
		end
		eq.stop_timer("emote_hb");
		ThreadManager:Stop();
	elseif (emote_phase == 6) then
		-- After completing Phase Five:
		eq.zone_emote(MT.LightGray,"Fennin Ro says, 'Impossible! How could the races of Norrath have traveled this deep into the Planes?!'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Xegony says, 'I regret that it has come to this. They leave us with little choice, however. We must fuse our powers together. Separately we are weakened, together we will halt their advances.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Triumvirate of Water says, 'Unfortunate as it may be, I agree. We must call upon the beast we swore would never be needed.'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"The Rathe says, 'Then let us begin. Let our abilities and powers meld into one. It shall be our final protector and savior. The only thing standing between us and non-existence'");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"Your head pounds from the amount of raw energy that begins to coalesce throughout the plane. Bright flashes of red, blue, green, and brown begin to come into focus on one single point. A large towering beast begins to manifest itself.");
		eq.zone_emote(MT.LightGray,"A horrible creation with all the powers from each elemental realm. Your body begins to shudder by the mere presence of this being.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"With a sudden jolt the wall comes into crystal clear focus.");
		ThreadManager:Wait(4);
		eq.zone_emote(MT.LightGray,"As the path before you opens up in a swirl of mystical energy, the faded image of an hourglass appears. You have two additional hours.");
		if port_raid then
			raidMove(6);
		end
		eq.stop_timer("emote_hb");
		ThreadManager:Stop();
	end
end

function raidMove(phase)	
	local port_locs = {[3] = {585,1110,496}, [4] = {-395,0,350}, [5] = {-410,0,5}, [6] = {330,0,5} };
	local client_list = eq.get_entity_list():GetClientList();
	for c in client_list.entries do
		if ((c.valid) and (not c:GetGM())) then
			local x = port_locs[phase][1] + math.random(-10,10);
			local y = port_locs[phase][2] + math.random(-10,10);
			local z = port_locs[phase][3];
			c:Message(MT.Yellow,"You can feel time bend around you as an unknown force advances you further into the plane!");
			c:MovePCInstance(223,instance_id,x,y,z,127);
		end
	end	
	port_raid = false;
end


