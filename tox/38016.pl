#right skeleton
# items: 62829, 62828, 13894, 9304, 12195, 13073, 13074
my $questclient;
my $success;

sub EVENT_SAY {
 if ($class eq "Druid") {
	
  if ($text=~/animated heads/i) {
    quest::say("Heh, so you've heard of that, have you. Too funny if you ask me. Who would [" . quest::saylink("i want to animate a skull",false,"want") . "] to animate a skull? Darn things can't do any useful work. They can't even talk!");
	quest::settimer("d1",2);	
  }
  if ($text=~/animate a skull/i) {
    quest::say("That's rich!");
	quest::settimer("d2",2);
  }
  if ($text=~/song/i) {
    quest::say("Yo ho. No sun!!");
	quest::say("A skeleton's day is never done.");
  }
  if ($text=~/i will do it/i) {
    quest::say("Ya better hold this.");
	$client->SummonItem(62829); # Item: Worthless Mining Pick
	quest::settimer("pathback",1200);
	quest::moveto(-317.17,-2532.23,-41.15,0,1);
	quest::depop_withtimer(38017);
	quest::settimer("movetwo",12);
	$questclient=$name;
	#$questclient->SummonItem(62828);
	
	$success=0;
	#tell heretic pet i've started
	$start = $entity_list->GetMobByNpcTypeID(38139);
	$moving = $start->CastToNPC();
	$moving->SignalNPC(5);
  }    
 }
}

sub EVENT_TIMER {
  if ($timer eq "pathback") {
    quest::stoptimer("pathback");    
    quest::moveto(-294.16,-2356.42,-41.28,0,1);
	quest::settimer("pathbacktwo",25);
  }
  if ($timer eq "pathbacktwo") {
    quest::stoptimer("pathbacktwo");    
    quest::moveto(-317.17,-2532.23,-41.15,0,1);
	quest::settimer("pathbackthree",18);
  }
  if ($timer eq "pathbackthree") {
    quest::stoptimer("pathbackthree");    
    quest::moveto(-389,-2577,-41.15,0,1);
	if ($success) {
		quest::settimer("giveitem",12);
		$success=0;
	}	
  }  
  if ($timer eq "giveitem") {
	quest::stoptimer("giveitem");
	quest::say("Well, you somehow managed to not piss off the heretic pet and you sang the song often enough, though I don't think your heart was in it. Here's the scroll you wanted. Of course an animated head just moves around. Without a soul in it, it's pretty worthless.");
	$entity_list->GetClientByName("$questclient")->SummonItem(62828); #Animating Heads
  } 
  if ($timer eq "movetwo") {
    quest::stoptimer("movetwo");    
    quest::moveto(-294.16,-2356.42,-41.28,0,1);
	quest::settimer("movethree",20);
  }
  if ($timer eq "movethree") {
    quest::stoptimer("movethree");    
    quest::moveto(-505.35,-2400,-45.64,0,1);
  }  
  if ($timer eq "d1") {
    quest::stoptimer("d1");    
    quest::say("Don't you have some living person you can annoy?");
  }
  if ($timer eq "d2") {
    quest::stoptimer("d2");    
	quest::say("You actually WANT that spell? You do know that, so far anyway, only Elia has been able to cast it, right? Not that anyone's trying all that hard. Besides, what could you possibly offer us to get you a copy of the scroll? Nothing, that's what.");
	quest::settimer("d3",2);
  }
  if ($timer eq "d3") {
    quest::stoptimer("d3");    
    quest::say("Hold on there, pal. There's bound to be something that we can get from this. . . druid. Let me think about it for a minute.");
	quest::settimer("d4",2);
  }
  if ($timer eq "d4") {
    quest::stoptimer("d4");    
	quest::say("Hah!");
	quest::settimer("d5",2);
  }
  if ($timer eq "d5") {
    quest::stoptimer("d5");    
    quest::say("Friend, your mind was devoured by maggots years ago. You couldn't think you way out of this tunnel if your unlife depended on it.");
	quest::settimer("d6",2);
  }
  if ($timer eq "d6") {
    quest::stoptimer("d6");    
    quest::say("Shut your trap already. After the centuries that we've been working here, side by side, you'd think that by now you'd have run out of stupid things to say.");
	quest::settimer("d7",2);
  }
  if ($timer eq "d7") {
    quest::stoptimer("d7");    
    quest::say("Hang on, that's it! Look around you, this place is spotless and yet they make us pretend to clean up and poke at the rocks like we're doing something useful. We just want to take a break for a few hours, wander down to the beach, scare someone, maybe even feast on someone's bones or something. That's not askin' too much, is it? All you gotta do is stand here with a pick and tell that idiot heretic pet that you are on the job.");
	quest::settimer("d8",2);
  } 
  if ($timer eq "d8") {
    quest::stoptimer("d8");    
    quest::say("Oh, and ya gotta sing the song.");
	quest::settimer("d9",2);
  }
  if ($timer eq "d9") {
    quest::stoptimer("d9");    
    quest::say("Yah, ya gotta sing the [" . quest::saylink("song") . "]. Stand right were I am and sing it a lot. If you do that, we'll get a copy of that stupid spell for ya, for all the good it will do. So [" . quest::saylink("i will do it", false, "will you do it") . "]? We don't have all day to wait for... oh, well, yeah, I guess we do.");
  }
  if ($timer eq "d10") {
    quest::stoptimer("d10");    
    quest::say("We will speed up when you return our mining caps. There are falling rocks all over this place!! We could get killed!!");
  }   
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
	quest::settimer("pathback",1);
	$success=1;
  }
  if ($signal == 9) {
	quest::say("We are not your pets!!");
	quest::settimer("d10",2);
  }
}


sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 13894 => 1)){
    quest::say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
    quest::summonitem(quest::ChooseRandom(9304,12195,13073,13074)); # Item(s): Bone Shield (9304), Fractured Femur (12195), Bone Chips (13073), Zombie Skin (13074)
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:tox  ID:78028 -- a_skeleton 

