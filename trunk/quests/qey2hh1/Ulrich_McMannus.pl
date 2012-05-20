sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Welcome to the village of McMannus. We sell many goods. Feel free to look around - just keep your hands to yourself. Good day.");
	}
	if($text=~/searching for the fugitive/i){
		quest::say("Searching for someone, eh?  You will most likely never find them on the plains.  This is a vast area.  I could have Frostbite help you search.  He is quite good at [tracking prey].");
	}
	if($text=~/tracking prey/i){
		quest::say("Frostbite can track down anyone, be they man or beast.  All one needs to do is obtain a SWEATY piece of clothing recently worn by the one you seek."); 
	}
}

#END of FILE Zone:qey2hh1  ID:5187 -- Ulrich_McMannus 

