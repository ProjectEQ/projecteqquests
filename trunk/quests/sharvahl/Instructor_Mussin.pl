sub EVENT_SPAWN {
	quest::settimer(1,10);
	quest::settimer(2,20);
	quest::settimer(3,30);
	quest::settimer(4,40);
	quest::settimer(5,50);
	quest::settimer(6,60);
	quest::settimer(7,70);
	quest::settimer(8,80);
	quest::settimer(9,90);
	quest::settimer(10,100);
	quest::settimer(11,110);
	quest::settimer(12,120);
	quest::settimer(13,150);
	quest::settimer(14,160);
	quest::settimer(15,165);
	quest::settimer(16,170);
	quest::settimer(17,175);
	quest::settimer(18,180);
	quest::settimer(19,185);
	quest::settimer(21,195);
	quest::settimer(22,240);
}

sub EVENT_TIMER {
	if($timer==1) {
	quest::signalwith(155310,1,1);
	quest::signalwith(155309,1,1);
	quest::signalwith(155308,1,1);
	quest::say("There are several routes available to you as a citizen of Shar Vahl. All citizens are expected to actively participate in the maintenance of our security.");
	quest::stoptimer(1);
	}
	if($timer==2) {
	quest::say("If you have a professional preference, please feel free to explore that area. You are just here to learn the basics of combat and survival.");
	quest::stoptimer(2);
	}
	if($timer==3) {
	quest::say("You'll learn soon enough. There are more than a few dangers beyond these walls. Combat is far from pleasant, but never something to fear. Vah watches over us all.");
	quest::stoptimer(3)
	}
	if($timer==4) {
	quest::say("All right students, before we hand you a set of practice weapons and allow you to unleash your youthful fury on each other, I will run through a series of attacks with you. Proper form is very important and can be attained through both armed and unarmed practice.");
	quest::stoptimer(4);
	}
	if($timer==5) {
	quest::say("You may want to watch this demonstration carefully, because I am going to see how well you paid attention in a few moments. I'd rather find out that you are unable to think and move at the same time now... rather than after one of those grunts down in the pit cracks your furry little skull open. Eyes on me, Recruits!");
	quest::stoptimer(5);
	}
	if($timer==6) {
	quest::say("This first move is a simple kick. If you are planning on becoming a Khala Dun or Khati Sha, you'd better get familiar with this move. The kick complements any series of attacks and can come in quite handy as a means of knocking an enemy off their guard or distracting them for a moment.");
	plugin::DoAnim(kick);
	quest::stoptimer(6);
	}
	if($timer==7) {
	quest::say("The bash is another standard Khala Dun Technique. You will need to use your center of balance and leverage to exert as much force into your enemy as possible. The weight of your body bashing into the enemy will usually leave them off balance and dazed for a few moments. That time should be more than enough for you to stage a secondary attack.");
	plugin::DoAnim(bash);
	quest::stoptimer(7);
	}
	if($timer==8) {
	quest::say("Next, the Taruun stab technique! This move isn't just for our shadow stalking citizens. Almost everyone should keep this move well practiced and ready!");
	plugin::DoAnim(pierce);
	quest::stoptimer(8);
	}
	if($timer==9) {
	quest::say("This move works if you are using a staff, spear, or some other form of polearm. You can disable your enemy, by quickly thrusting your weapon into their abdomen. It usually takes the wind right out of them.");
	plugin::DoAnim("2hblunt");
	quest::stoptimer(9);
	}
	if($timer==10) {
	quest::say("The two-handed overhead slash! Your enemy's skull will never be the same after the successful completion of this move! Be warned this technique is much slower than many of the others available to you and can leave you open to swift counter attacks.");
	plugin::DoAnim("2hslash");
	quest::stoptimer(10);
	}
	if($timer==11) {
	quest::say("The single-handed overhead swing is a common maneuver and should be practiced to perfection. Watch the way I distribute my weight and move my upper body. You should keep your head up and your eyes focused during every swing. Even with a simple move such as this.");
	plugin::DoAnim(mainhand);
	quest::stoptimer(11);
	}
	if($timer==12) {
	quest::say("Okay, now go over those moves for a moment and prepare to show me what you have learned.");
	quest::stoptimer(12);
	}
	if($timer==13) {
	quest::say("Please stand and prepare to demonstrate the attacks as I call them out. I understand that your form will be a little sloppy, but that is what practice is for. Will will keep practicing these moves until you can show me that you can be trusted to not injure yourselves with the wooden practice weapons.");
	quest::signalwith(155310,2,1);
	quest::signalwith(155309,2,1);
	quest::signalwith(155308,2,1);
	quest::stoptimer(13);
	}
	if($timer==14) {
	quest::say("First move... the Kick! Attack!");
	quest::signalwith(155310,3,1);
	quest::signalwith(155309,3,1);
	quest::signalwith(155308,3,1);
	plugin::DoAnim(clap);
	quest::stoptimer(14);
	}
	if($timer==15) {
	quest::say("Now... the Bash! Attack!");
	quest::signalwith(155310,4,1);
	quest::signalwith(155309,4,1);
	quest::signalwith(155308,4,1);
	plugin::DoAnim(clap);
	quest::stoptimer(15);
	}
	if($timer==16) {
	quest::say("Next... the One-handed Stab! Attack!");
	quest::signalwith(155310,5,1);
	quest::signalwith(155309,5,1);
	quest::signalwith(155308,5,1);
	plugin::DoAnim(clap);
	quest::stoptimer(16);
	}
	if($timer==17) {
	quest::say("Arlight... Two-handed thrust! Attack!");
	quest::signalwith(155310,6,1);
	quest::signalwith(155309,6,1);
	quest::signalwith(155308,6,1);
	plugin::DoAnim(clap);
	quest::stoptimer(17);
	}
	if($timer==18) {
	quest::say("Now... smash with both hands! Attack!");
	quest::signalwith(155310,7,1);
	quest::signalwith(155309,7,1);
	quest::signalwith(155308,7,1);
	plugin::DoAnim(clap);
	quest::stoptimer(18);
	}
	if($timer==19) {
	quest::say("Okay...the One-handed swing! Attack!");
	quest::signalwith(155310,8,1);
	quest::signalwith(155309,8,1);
	quest::signalwith(155308,8,1);
	plugin::DoAnim(clap);
	quest::stoptimer(19);
	}
	if($timer==21) {
	quest::say("Go ahead and take a seat. As a whole you looked very good. Take a break and we will get ready to go through it again.");
	quest::signalwith(155310,9,1);
	quest::signalwith(155309,9,1);
	quest::signalwith(155308,9,1);
	quest::stoptimer(21);
	}
	if($timer==22) {
	quest::settimer(1,10);
	quest::settimer(2,20);
	quest::settimer(3,30);
	quest::settimer(4,40);
	quest::settimer(5,50);
	quest::settimer(6,60);
	quest::settimer(7,70);
	quest::settimer(8,80);
	quest::settimer(9,90);
	quest::settimer(10,100);
	quest::settimer(11,110);
	quest::settimer(12,120);
	quest::settimer(13,150);
	quest::settimer(14,160);
	quest::settimer(15,165);
	quest::settimer(16,170);
	quest::settimer(17,175);
	quest::settimer(18,180);
	quest::settimer(19,185);
	quest::settimer(21,195);
	}
}
