# items: 31758
sub EVENT_SPAWN {
	quest::settimer(1,300);
	quest::emote(" crouches to the ground cowering. 'Enough, you have proven your might. I will talk! Just cease your assault!  'What knowledge do I have that the Validus Custodus is so eager to obtain? If you spare me I assure you I will answer truthfully.'");
    
}

sub EVENT_SAY {
   if(($text=~/valdanov/i) && (defined $qglobals{vampyre_vahshir_combat})){
      quest::say("I have not seen Valdanov Zevfeer in many years. He came to me once when I was still newly reborn wanting to extract a vial of my blood.  When I refused he attacked me and extracted it against my will. I was still new and unfamiliar with my vampyric powers, Valdanov's [abilities] were far more developed than my own.");
   }
   if(($text=~/abilities/i) && (defined $qglobals{vampyre_vahshir_combat})){
      quest::say("His vampyric abilities of course. Valdanov had either been reborn in undeath far before myself or had a powerful mentor and the time and facilities in which to train. I did my best to resist his attack but I was still subdued by his superior skills and strength. He dropped this key in the struggle. I have no use for it, consider it yours. I must be going before I'm seen by the others. Oh no! It's too late! We've been spotted! May you continue your investigations in the afterlife!");
      quest::summonitem(31758); #Old Bone Key
      quest::emote("  rapidly transforms into swirling mist indistinguishable from the wind swept mountain fog as other forms begin to solidify from the fog nearby.");
      quest::spawn2(172185,0,0,$x-5,$y-5,$z,$h); #a_coterie_general
      quest::spawn2(172185,0,0,$x-5,$y+5,$z,$h); #a_coterie_general
      quest::spawn2(172185,0,0,$x+5,$y+5,$z,$h); #a_coterie_general
      quest::spawn2(172185,0,0,$x+5,$y-5,$z,$h); #a_coterie_general
      quest::delglobal("vampyre_vahshir_combat");
      quest::depop();
   }
}

sub EVENT_TIMER {
      quest::delglobal("vampyre_vahshir_combat");
      quest::depop();
}	  
