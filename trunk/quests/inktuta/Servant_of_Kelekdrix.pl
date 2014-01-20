sub EVENT_SAY {
	if ($text=~/hail/i) {
		if($qglobals{$instid.'_inktuta_status'} == 0) {
			quest::emote("screams");
			quest::say("No, don't kill me!' He relaxes slightly and gives you a strange look. 'Have you been afflicted by the curse? Are you mad!? Have you any idea [who Kelekdrix] is? She will be here any moment to destroy you all. Leave now, or there will be dire [consequences]!");
		}
	}
	if ($text=~/consequences/i || $text=~/who Kelekdrix/i) {
		quest::say("Very well, $name. You brought this upon yourself.");
		quest::spawn2(296024,0,0,565,-495,6,0); #Kelekdrix,_Herald_of_Trushar
		my $instid = quest::GetInstanceID("inktuta",0);
		quest::setglobal($instid.'_inktuta_status',1,3,"H6");
		
		if ($text=~/consequences/i) {
			quest::setglobal($instid.'_inktuta_bonus',1,3,"H6");
		} elsif ($text=~/who Kelekdrix/i) {
			quest::setglobal($instid.'_inktuta_bonus',2,3,"H6");
		}
		quest::depop_withtimer();
	}
    
  }