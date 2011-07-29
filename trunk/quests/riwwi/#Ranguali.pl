sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("squints and stares as if sizing you up.");
    quest::say("Another adventurer come to the coliseum looking for fame and glory? Hmph. You have no idea what you're up against. [Taskmistress Krisz] would destroy you in the blink of an eye. She keeps the slaves here in line and she keeps the Legion of Mata Muram in line. Only a fool would dare to even look at her wrong, much less incur her wrath.");
  }
  if ($text=~/taskmistress krisz/i) {
    quest::say("Did you not hear a word I said? She's dangerous beyond your wildest imagination. I've seen her cut a man in half with a single swing.' He shrugs and continues, 'If by some chance you're several orders of magnitude more powerful than the other imbeciles that faced her and failed, come speak with me after you've defeated Krisz. There are [rewards] to be had for besting the Taskmistress and I've made it my business to learn all about them.");
  }
  if ($text=~/rewards/i) {
    if(plugin::check_hasitem($client,52133)) {
       quest::say("'Well now. I see you recovered a section of the Taskmistress's fur. She always did pride herself on the sheen of her coat.' He nods and continues, 'You can take advantage of her grooming habits by sewing together a bag from the fur. Unfortunately there's not enough here to work with. You would need four more lengths of Pristine Ixt Fur.'");
  }
   elsif(plugin::check_hasitem($client,52119)) {
     quest::say("Yes, that is exactly what I wanted to see. The head of Taskmistress Krisz herself. There's bound to be someone out there that would reward you handsomely for this grisly trophy. She made an awful lot of enemies. Keep your eyes open.");
   }
   elsif(plugin::check_hasitem($client,52116)) {
     quest::emote("grins, his eyes gleaming.");
     quest::say("Incredible work, $name. You did it! I wish I could have seen the look on her face when she died. Now, what you have here is half of a legendary weapon called Equifinis. All you need to do is locate the other half and reforge the blade. The hilt should merge with its missing half easily when heated over the coals of a forge.");
   }  
   elsif(plugin::check_hasitem($client,52118)) {
     quest::say("And what's this, $name? A block of special clay that you wrested from Krisz. It's magical, obviously. Even a novice potter could sculpt with the clay if they had the right sketch to work from. Hmm. Assuming you located such a sketch, it would only require water and sculpting tools to finish the job.");
   }
   else {
     quest::emote("looks at you quizzically");
     quest::say("You . . . have to kill her first. You realize this? Come back to me if and ONLY if you've killed Krisz and have something to show for it. Otherwise, don't waste my time.");
   }
 }  
}   