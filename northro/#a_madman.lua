-- items: 62836
local eventcomplete=0;
function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(qglobals["druid_epic"] == "3" and e.message:findi("Geadin")) then
		e.self:Emote("looks down and his features crinkle in concentration.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("soul binding")) then
		e.other:Message(1,"Again Geadin looks down and his features crinkle in concentration. 'I once knew something about that, I think. Something about. . .' He loses control of his features and for a moment all sense of personality leaves his face. He regains control after a moment and continues. 'I can tell that you are not one of them, so what do you want? I can no longer be of use to anyone with all the noise in my mind. I can rarely remember who I am, curse them.' Again he breaks out in insane laughter. '[" .. eq.say_link("Curse") .. "] me is more like it!");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("curse")) then
		e.self:Say("They cursed my mind, ruined the only thing that I had, the thing that made them what they are.' For once his face appears clear of the madness and is overwhelmed with anger. 'I can not do my work in this condition! I can't!' He looks at you, his mad eyes looking deep into you, as if they could see your soul. 'You want something of me, something that only I can give you. Well, I can't! They took it from me, my mind. If you want anything from me, you must [" .. eq.say_link("free") .. "] me or there is nothing I can do.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("free")) then
		e.self:Emote("struggles again to retain his control. 'I can force my tormentors from my mind, but only one at a time. I can never be free unless you destroy them. If you do that for me, I will do all that I can to help you. With your power it should be easy for you to defeat them singly. Will you do this for me?");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("will do")) then
		e.self:Say("Thank you. It will take a moment for me to force each of them out. You must destroy them quickly or they will invade my mind again.");
		eq.set_timer("start",5000);
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("still desire it") and eventcomplete==1) then
		e.self:Say("Very well. Here it is. Only use it in the area where the owner of that head was killed. Now, I have much time to make up for. ' He laughs with much of the same dementia that was evident before");
		e.other:SummonItem(62836); --Soul Stone
		e.self:SetLevel(65);
		e.self:TempName("Soulbender Geadin Gyths");
		e.self:CastSpell(36, 0); -- Spell: Gate
		eq.set_timer("gate",3000);		
	end	
end


function event_timer(e)
	if(e.timer=="start") then
		eventcomplete=0;
		eq.stop_timer("start");
		e.self:Emote("tightens all the muscles in his body as he exerts his will over his tormentors");
		eq.spawn2(392104,0,0,e.self:GetX()-15,e.self:GetY()-15,e.self:GetZ(),e.self:GetHeading()); -- NPC: a_haunt
	elseif (e.timer=="gate") then
		eq.depop_with_timer();
	end
end

function event_signal(e)
	eventcomplete=1;
	e.self:Emote("laughs outrageously for a long moment, then looks somewhat embarrassed at his own outburst. 'Thank you for your help, I shall never forget what you have done for me. Now, you have a skull that you need to converse with. This I know because your soul is open to me. I can conjure something that will help you with this, if you [" .. eq.say_link("still desire it") .. "].");
end