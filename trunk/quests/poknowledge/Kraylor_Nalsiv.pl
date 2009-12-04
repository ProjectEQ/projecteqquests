#Kraylor_Nalsiv.pl
#Epic Titles
#The quest system apparently doesn't export a variable containing the clients gender, and we need that.
#The quest system also lacks the ability to set a players title, we need that. -Kilelen

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Greetings $name! I've heard tell of powerful items unique to your profession. If you happen to come into possession of one [return] to me and tell me the tale behind it.");
	}
	
	if ($text=~/return/i) {
		
		if(!defined $qglobals{EpicTitle}) {
			#Epic 1.0 list			
			#Wiz epic
			if ($hasitem{14341}) {
				Epic1_Common;
				quest::setTitle("Catalyst");
			}
			
			#Enc epic
			if ($hasitem{10650}) {
				Epic1_Common;
				quest::setTitle("Mindbender");
			}
			
			#Mag epic
			if ($hasitem{28034} || $hasitem{55273}) {
				Epic1_Common;
				quest::setTitle("Thaumaturge");
			}
			
			#Nec epic
			if ($hasitem{20544}) {
				Epic1_Common;
				quest::setTitle("Dark Apprentice");
			}
			
			#Clr epic
			if ($hasitem{5532}) {
				Epic1_Common;
				quest::setTitle("Curate");
			}
			
			#Shm epic
			if ($hasitem{10651} || $hasitem{36223}) {
				Epic1_Common;
				quest::setTitle("Heyokah");
			}
			
			#Dru epic
			if ($hasitem{20490}) {
				Epic1_Common;
				quest::setTitle("Naturewalker");
			}
			
			#War epic
			if ($hasitem{17859} || $hasitem{17869}) {
				Epic1_Common;
				quest::setTitle("Champion");
			}
			
			#Rog epic
			if ($hasitem{11057}) {
				Epic1_Common;
				quest::setTitle("Swashbuckler");
			}
			
			#Mnk epic
			if ($hasitem{10652}) {
				Epic1_Common;
				quest::setTitle("Apostle");
			}
			
			#Rng epic
			if ($hasitem{20488}) {
				Epic1_Common;
				quest::setTitle("Windcaller");
			}
			
			#Pal epic
			if ($hasitem{10099}) {
				Epic1_Common;
				quest::setTitle("Lightbringer");
			}
			
			#Sk epic
			if ($hasitem{14383}) {
				Epic1_Common;
				if ($gender == 1) {#Not sure how to check for gender yet, researching it.
					quest::setTitle("Pain Mistress");
				}
				else {
					quest::setTitle("Pain Lord");
				}
			}
			
			#Brd epic
			if ($hasitem{20542}) {
				Epic1_Common;
				quest::setTitle("Composer");
			}
			
			#Bst epic
			if ($hasitem{8495} || $hasitem{8496}) {
				Epic1_Common;
				quest::setTitle("Feralkin");
			}
			
			#Ber epic
			if ($hasitem{68299}) {
				Epic1_Common;
				quest::setTitle("Aggressor");
			}
		}
		elsif (defined $qglobals{EpicTitle} && $qglobals{EpicTitle} == 1) {
			#Epic 1.5 list
			#Wiz epic
			if ($hasitem{12665}) {
				Epic2_Common;
				quest::setTitle("Scholar");
			}
			
			#Enc epic
			if ($hasitem{52952}) {
				Epic2_Common;
				quest::setTitle("Coercer");
			}
			
			#Mag epic
			if ($hasitem{19092}) {
				Epic2_Common;
				quest::setTitle("Master");
			}
			
			#Nec epic
			if ($hasitem{62581}) {
				Epic2_Common;
				quest::setTitle("Deathspeaker");
			}
			
			#Clr epic
			if ($hasitem{9955}) {
				Epic2_Common;
				if ($gender == 1) {#Not sure how to check for gender yet, researching it.
					quest::setTitle("Priestess");
				}
				else {
					quest::setTitle("Priest");
				}
			}
			
			#Shm epic
			if ($hasitem{57400}) {
				Epic2_Common;
				quest::setTitle("Fateseer");
			}
			
			#Dru epic
			if ($hasitem{62863}) {
				Epic2_Common;
				quest::setTitle("Forest Scion");
			}
			
			#War epic
			if ($hasitem{60321}) {
				Epic2_Common;
				quest::setTitle("Conqueror");
			}
			
			#Rog epic
			if ($hasitem{52347}) {
				Epic2_Common;
				quest::setTitle("Infiltrator");
			}
			
			#Mnk epic
			if ($hasitem{61025}) {
				Epic2_Common;
				quest::setTitle("Enlightened");
			}
			
			#Rng epic
			if ($hasitem{62627}) {
				Epic2_Common;
				quest::setTitle("Earthguard");
			}
			
			#Pal epic
			if ($hasitem{64031}) {
				Epic2_Common;
				quest::setTitle("Redeemer");
			}
			
			#Sk epic
			if ($hasitem{50003}) {
				Epic2_Common;
				quest::setTitle("Archfiend");
			}
			
			#Brd epic
			if ($hasitem{77631}) {
				Epic2_Common;
				quest::setTitle("Wyrmkin");
			}
			
			#Bst epic
			if ($hasitem{52911}) {
				Epic2_Common;
				quest::setTitle("Wildcaller");
			}
			
			#Ber epic
			if ($hasitem{18398}) {
				Epic2_Common;
				quest::setTitle("Axe Master");
			}
		}
		
		elsif (defined $qglobals{EpicTitle} && $qglobals{EpicTitle} == 2) {
			#Epic 2.0 list
			#Wiz epic
			if ($hasitem{16576}) {
				Epic3_Common;
				quest::setTitle("Planeshifter");
			}
			
			#Enc epic
			if ($hasitem{52962}) {
				Epic3_Common;
				quest::setTitle("Enigma");
			}
			
			#Mag epic
			if ($hasitem{19839}) {
				Epic3_Common;
				quest::setTitle("Primal");
			}
			
			#Nec epic
			if ($hasitem{64067}) {
				Epic3_Common;
				quest::setTitle("Grand Occultist");
			}
			
			#Clr epic
			if ($hasitem{20076}) {
				Epic3_Common;
				if ($gender == 1) {#Not sure how to check for gender yet, researching it.
					quest::setTitle("High Priestess");
				}
				else {
					quest::setTitle("High Priest");
				}
			}
			
			#Shm epic
			if ($hasitem{57405}) {
				Epic3_Common;
				quest::setTitle("Spiritwalker");
			}
			
			#Dru epic
			if ($hasitem{62880}) {
				Epic3_Common;
				quest::setTitle("Earthkeeper");
			}
			
			#War epic
			if ($hasitem{60332}) {
				Epic3_Common;
				quest::setTitle("Decimator");
			}
			
			#Rog epic
			if ($hasitem{52348}) {
				Epic3_Common;
				quest::setTitle("Nightblade");
			}
			
			#Mnk epic
			if ($hasitem{67742}) {
				Epic3_Common;
				quest::setTitle("Ascendant");
			}
			
			#Rng epic
			if ($hasitem{62649}) {
				Epic3_Common;
				quest::setTitle("Farwarden");
			}
			
			#Pal epic
			if ($hasitem{48147}) {
				Epic3_Common;
				quest::setTitle("Valiant");
			}
			
			#Sk epic
			if ($hasitem{48136}) {
				Epic3_Common;
				quest::setTitle("Darkreaper");
			}
			
			#Brd epic
			if ($hasitem{77640}) {
				Epic3_Common;
				quest::setTitle("Blade Dancer");
			}
			
			#Bst epic
			if ($hasitem{57054}) {
				Epic3_Common;
				quest::setTitle("Savage Spirit");
			}
			
			#Ber epic
			if ($hasitem{18609}) {
				Epic3_Common;
				quest::setTitle("Rageheart");
			}
		}
		
		else {
			quest::say("Hmmm, it doesn't look like you have any items I haven't seen before.");
		}
	}
}

sub EVENT_ITEM {
	plugin::return_items(\%itemcount); #return items if not the ones required
}

# Some things happen often, should have subs for them.
sub Epic1_Common {
	quest::say("That is truly a wonderous creation you have. Congratulations on your triumphs! I see great things in your future. Return to me should you acquire more powerful tools of your profession.");
	quest::setglobal(EpicTitle,1,0,"F");
}

sub Epic2_Common {
	quest::say("I have heard tales of items such as that, but never thought to meet someone who had actually obtained one. My thanks for letting me know about your latest triumph.");
	quest::setglobal(EpicTitle,2,0,"F");
}

sub Epic3_Common {
	quest::say("Ah! Most impressive! I haven't seen an artifact of that power in ages. You have truly earned renown among your peers.");	quest::setglobal(EpicTitle,3,0,"F");
}
#END of FILE Zone:poknowledge ID:202337 --Kraylor_Nalsiv.pl