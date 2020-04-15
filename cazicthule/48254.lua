function event_waypoint_arrive(e)
	if(e.wp == 10 and tracker < 1) then
		e.self:Say("Well look at this thing! A splendid example of a Tae Ew sacrificial death mask or something. At first glance, this thing looked like beautifully carved wood, but alas it is just skin.");
    		eq.set_timer("adds", 6 * 1000);
		tracker = 1;
	elseif(e.wp == 26 and tracker == 1) then
		e.self:Say("My map is paying off. This mask is just where they said it would be. Just give me a minute to scribble this down and we'll continue. Please continue to scan the room. I'll feel much better if you're eaten first... err... if you watch my back.");
   		eq.set_timer("adds", 6 * 1000);
		tracker = 2;
  	elseif(e.wp == 40 and tracker == 2) then
		e.self:Say("Well, that was a nice little trek. Take a breather while I note this area in my journal. I know that you must be tired. I haven't seen a head as large as yours in quite some time. Lean it against the wall or something. We'll need to leave in a moment.");
    		eq.set_timer("adds", 6 * 1000);
		tracker = 3;
  	elseif(e.wp == 65 and tracker == 3) then
		e.self:Say("Oh joy, there's nothing down this hallway. That will teach me to follow you again. Let me look at my map and see if I can undo your handy work. One moment please. Shheeesh!");
    		eq.set_timer("adds", 6 * 1000);
		tracker = 4;
  	elseif(e.wp == 76 and tracker == 4) then
		e.self:Say("Ack ack ack! Eat them not me!");
    		eq.set_timer("adds", 6 * 1000);
    		eq.set_timer("Named", 60 * 1000);
		tracker = 5;
  	elseif(e.wp == 96 and tracker == 5) then
		e.self:Say("Well, here we are. See, you didn't even have to break a sweat. I'm all ready to... hmm... wait, I seem to have dropped my favorite quill. Did you pick it up by chance? I'll add a little something to your payment if you did.");
	  	eq.spawn2(48255,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Gimlik_Cogboggle_
	  	eq.depop();
	end
end

function event_waypoint_depart(e)
	if(e.wp == 10) then
		e.self:Say("Alrighty, off we go!");
	elseif(e.wp == 26) then
    		e.self:Say("Alrighty, off we go!");
	elseif(e.wp == 40) then
    		e.self:Say("Alrighty, off we go!");
	elseif(e.wp == 65) then
    		e.self:Say("Alrighty, off we go!");
	elseif(e.wp == 76) then
    		e.self:Say("Alrighty, off we go!");
	end
end

function event_timer(e)
if (e.timer == "adds") then
eq.stop_timer("adds");
which = math.random(1,6);
	if  (which == 1) then
		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
	elseif (which == 2) then
		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
	elseif (which == 3) then
		  eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
    	elseif (which == 4) then
		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
    	elseif (which == 5) then
		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
    	elseif (which == 6) then
		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
      		eq.spawn2(eq.ChooseRandom(48195, 48234),0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC(s): #a_Tae_Ew_Hunter (48195)
    	end
elseif (e.timer == "Named") then
      		eq.stop_timer("Named");
      		eq.spawn2(48209,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); -- NPC: #a_Thul_Tae_Ew_Tracker
  end
end

function event_spawn(e)
	tracker = 0;
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
