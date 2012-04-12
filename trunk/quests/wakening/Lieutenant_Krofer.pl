sub EVENT_SAY { 
	if((($text=~/hail/i) || ($text=~/next assignment/i) || ($text=~/prepared/i)) && ($faction > 5)) {
		my $random = int(rand(3));
		if ($random == 0) {
			quest::say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
		}
		if ($random == 1) {
			quest::say("Is that your BREATH, or did something die in here?  Now go away!");
		}
		if ($random == 2) {
			quest::say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		}
	}
	if(($text=~/hail/i) && ($faction <= 5)){
		quest::say("Unless you're the new mercenary reinforcements I suggest you remove yourself from my presence before I decorate the bottom of my boot with your intestines.");
	}
	if((($text=~/next assignment/i) || ($text=~/prepared/i)) && ($faction == 5)){
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	}
	if(($text=~/next assignment/i) && (defined $qglobals{tunarean_regiment})) {
		quest::say("Well, ready or not, this must be done now. Out there in the forest are our enemies. For us to be successful, we must know what they are doing and how they are going about it. Our probing attacks have revealed little so we've decided to send you out to gather any info you can. There must be some sort of messenger out there, bring any info you might find.");
	}
	if(($text=~/prepared/i) && (defined $qglobals{tunarean_regiment})) {
		quest::say("Very well. We've decided to attack the small Sifaye village northeast of here and I want you to coordinate the attack. I will send you into Kael Drakkel with a request for troop assistance. After the squad is assembled you will lead them to the staging point where you will oversee the battle. Here is the request. Take it to Drioc in the city and return here with the troops.");
		quest::summonitem(1706); # Krofer's Requisition
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1702 => 1)) { # Mercenary Assignment
		quest::say("Drioc sent you? I suppose one can't expect much from a mercenary. Well then, $name, your first assignment will be to clear out some of this forest's annoying populace. Bring me the meat of one of the raptors, the meat of two panthers, and the remains of one of those living puddles of black sludge found in the caves. You will then have your payment.");
		quest::exp(1000);
		quest::ding();
		quest::setglobal("krofer_assignment", 1, 0, "F");
	}
	if((plugin::check_handin(\%itemcount, 22851 => 2, 22852 =>1, 1703 =>1))&& (defined $qglobals{krofer_assignment})) { # 2x panther meat, raptor meat, Tar Goo Strand
		quest::say("Well, I suppose you may be worth something more than fodder after all. Here is your payment. Speak to me again when you are ready for your next assignment. For now, get some rest, you will need it.");
		quest::ding();
		quest::faction(189,10);
		quest::faction(188,10);
		quest::faction(179,10);
		quest::faction(42,-30);
		quest::exp(1000);
		quest::givecash(1,7,0,12);
		quest::delglobal("krofer_assignment");
		quest::setglobal("tunarean_regiment", 1, 0, "F");
	}
	if((plugin::check_handin(\%itemcount, 1704 =>1))&& (defined $qglobals{tunarean_regiment})) { # Sifaye messenger's report
		quest::say("Excellent, $name. With this we can plan an attack that might actually accomplish something. Here is your payment. You have also earned this cloak, it should help protect you from the clawing undergrowth of this savage land. Your next mission will be more complex and dangerous, however we may be able to spare a laborer or two to assist you. Rest now, and tell me when you are prepared.");
		quest::ding();
		quest::faction(189,10);
		quest::faction(188,10);
		quest::faction(179,10);
		quest::faction(42,-30);
		quest::exp(1000);
		quest::givecash(0,5,4,11);
		quest::summonitem(1705); # Velium Studded Cloak
	}
	if(plugin::check_handin(\%itemcount, 1707 => 1)) { # Signed Requisition
		quest::emote("takes the note and looks it over, then sighs and says, 'This will have to be enough. The squad should be here shortly. When they arrive you will march with them to the staging area near the village of those insect Sifaye. When you are satisfied with the formation, give the corporal the order to attack and observe the battle. After the village is destroyed return this report to me and we'll plan our next move.'");
		quest::exp(1000);
		quest::ding();
		quest::summonitem(1708); # Mission Report
		quest::spawn2(119168,0,0,-4975,-699,-182,63);  # Corporal_Hlash
		quest::spawn2(119166,0,0,-4954,-697,-182,63);  # Berzerker_Dolvad
		quest::spawn2(119167,0,0,-4954,-671,-182,63);  # Berzerker_Voldak
		quest::spawn2(119169,0,0,-4976,-672,-182,63);  # Disciple_Atharm
	}	
	plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	quest::spawn2(119173,0,0,$x,$y,$z,$h);
	$npc->Depop(1);
}

