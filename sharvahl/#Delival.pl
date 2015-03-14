sub EVENT_SPAWN {
	quest::enable_spawn2(32803);
	quest::settimer("worry",120);
}

sub EVENT_TIMER {
	if($timer eq "worry"){
		quest::emote("sees you come into the room but looks just past you, 'Shainai is that you?'");
	}
	if($timer eq "safe"){
		quest::enable_spawn2(32803);
	}
}

sub EVENT_SIGNAL {
	my $a = 155340;
	my $x = $npc->GetX();
	my $y = $npc->GetY();
	my $z = $npc->GetZ(); 
	my $h = $npc->GetHeading();
	if($signal==1){
		quest::spawn2($a,0,0,$x,$y,$z,$h);
		quest::depop_withtimer();	
	}
	if($signal==2){
		quest::settimer("safe",700);
	}
}

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hello there, $name. I do not suppose you have seen a little girl running around with a box of [buttons]? I sent [Shainai] over to Master Barkhem's place so I can finish these uniforms I am working on.");
	}
	if($text=~/Shainai/i) {
		quest::say("Shainai is my little girl. While I am [inactive] I would like to see her as much as possible so I brought her with me here. I am starting to worry that she may have gotten lost near the palace. If you see her and have the time to escort her back here I would be indebted to you, friend.");
	}
	if($text=~/buttons/i) {
		quest::say("I need the buttons to finish making uniforms for the officers that live upstairs.  When I was injured in the field, this was the best way for me to help out.  My mum used to make uniforms for the Royal Khala Dun when I was a child and I guess I picked up a thing or two.  Still, it will be nice when I am able to get back out there and fight.");
	}
	if($text=~/inactive/i) {
		quest::emote("averts his eyes, 'I was on a raid in the forest that went bad.  That was when we lost Shainai's mother.  Truth be told, as much as I am eager to get back out in the field, the opportunity to spend this little bit of extra time with Shainai is priceless.'");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 4460 => 1)) {
		quest::emote("looks at what you handed him as his face turns to rage, 'What is... this... this is the box I sent Shainai out with!  Where is she?  What have you done?  You stole from my little girl!!  Maybe worst!!!!!'");
	}
  plugin::return_items(\%itemcount);
}