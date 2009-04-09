# Nioti's Predicament
# Created by Gonner

sub EVENT_SAY {
if($text=~/hail/i){
	quest::say("I had a wrench around here somewhere.")  
	
	}
}


sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55557 => 1,55561 => 1)) { # Note to Gilipus and Worker's Badge - number 2

	quest::say("Yes, what is it? Just a moment, I cannot read without my glasses.");
	quest::emote("rummages through his numerous pockets looking for his reading glasses. 'Oh this is most embarrassing. Seems I have lost my reading glasses. Oh wait, I know where they are. They are on this bench here.' Just as Gilipus reaches for his glasses, a small mechanical rat snatches them and hurriedly scuttles away. 'Oh drat. This isn't good at all. That defective cleaner just took my reading glasses! Think you could go get them? What defective cleaner you ask? I don't know for certain. I couldn't make out the serial number. If you can find my glasses, I will read this note you brought me.");
	quest::exp(70000);	
	quest::summonitem(55562); # Worker's Badge - Number three
}

if (plugin::check_handin(\%itemcount, 55562 => 1,55555 => 1)) { # Worker's Badge - number three and Gilipus's Reading Glasses
	quest::say("Thank you. That is much better.' Gilipus begins to read the note. 'You need something to remove rust? Yes, I do believe I have just the thing for you. Just bring me some rubbing alcohol and I can make what you need. Now where are my tools?");
	quest::exp(80000);  
	quest::summonitem(55563); # Worker's badge - number four
}

if (plugin::check_handin(\%itemcount, 55563 => 1,12418 => 1)) { # Worker's badge - number four and Rubbing Alcohol
	quest::say("Hello what can I do for you? Oh yes, you needed something to remove rust. This rubbing alcohol should help you. Good thing you thought to bring it.' Gilipus begins to mix some different chemicals together in a small vial. 'Here you go. This should work. I think. By the way, have you seen a small notebook? It was green with a picture of a lovely cog on it."); 
	quest::exp(90000); 
	quest::summonitem(55564); # Worker's badge - number five
	quest::summonitem(55556); # Vial of Anti-Rusting Agent
}

}

# END of FILE Zone:Ak'Anon ID:55159 -- Gilipus.pl

