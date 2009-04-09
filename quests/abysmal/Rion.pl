# Pepe's Got a Brand New Bag
# Created by Gonner

sub EVENT_SAY {
if($brandnewbag == 1 && $text=~/pepe/i){
	quest::say("I fear I do not know where Pepe is at the moment. He tends to get lost quite a bit. Poor lad is a bit addled. When his mother was on her death bed, I promised her I would look after him though. I don't think he would wander away from the city. At least I hope not. If you find him, ask him to give you my scraping tool. Take this doll too. It is his most prized possession. I am surprised he left it behind.");  
	quest::summonitem(55571); # Lamontt
	quest::summonitem(55570); # Venomous Stonemite Poison Sac
}

}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 55576 => 1, 55570 => 1)) { # Note to Rion and Venomous Stonemite Poison Sac
	quest::say("Yes, yes. Hmm, a note from Simmons. Hmm, yes. I do believe I can do it, but my assistant Pepe has wandered off somewhere with all my tools. If you can track [Pepe] down and get my tools back, I think I can help you. Oh and here is your venom sac. Hold on to it for now and if you find my tools, hand them to me along with the venom sac.");  
	quest::exp(400000);
	quest::setglobal("brandnewbag", 1, 5, "F");
	quest::givecash("3","0","0","3");
}

if (plugin::check_handin(\%itemcount, 55573 => 1, 55570 => 1)) { # Scraping Tool and Venomous Stonemite Poison Sac
	quest::say("Very good. I will do my best. Rion begins to carefully remove the poison from the venom sac. 'Here you go. This should do.");  
	quest::exp(400000);
	quest::summonitem(55574); # Prepared Stonemite Sac
	quest::summonitem(55573); # Scraping Tool
	
}
plugin::return_items(\%itemcount);
}

# END of FILE Zone:abysmal  ID:279262 -- Rion.pl

