sub EVENT_SAY {
  if(($ulevel >= 46) && ($class=="Monk")) {
    if($text=~/hail/i) {
      # Monk Epic 1.0
      quest::say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. If you come across any [rare finds] we may be interested in purchasing them.");
    }
    elsif($text=~/rare finds/i) {
      # Monk Epic 1.0
      quest::say("Yes, any rare books, tomes, essays, or other literature you find may be of interest to me. Although the finds I am interested in are quite high profile and would most likely only be found in the possession of very powerful or influential beings. Give me what you find and I will pay you what it is worth to us.");
    }
    elsif($text=~/lheao/i) {
      # Monk Epic 1.0
      quest::say("Lheao was my predecessor here at the library of Erudin. He has since retired, just a few years ago. Im sure he would be most impressed with your find and other insightful conversation on the subject. Although Im not sure one of your profession would be interested in such a scholarly endeavor, no offense. If you are interested, find him and tell him you found the book Immortals. Im not sure where he has retired to, but I hear it is near an ocean somewhere.");
    }
    elsif($text=~/power of the immortals/i) {
      # Monk Epic 1.5
      quest::say("Power of the Immortals? Hmmm... well of course I know about that, but at the moment I have more pressing issues at hand. Im sorry I could not be of more help, but maybe after my assistant has returned I can help you.");
    }
    elsif($text=~/disciple/i) {
      # Monk Epic 1.5
      quest::say("It is unknown to many that Kaiaren had another student before Vorash. He was a disciple that wanted to learn the true power of mind and body. Sage Kaiaren had so much respect for him that he decided that he was going to take Kaiarens place among the Order of the Celestial Fists when it was his turn to choose a new member. This disciples name was [Vortix].");
    }
    elsif($text=~/vortix/i) {
      # Monk Epic 1.5
      quest::say("When Vortix was training with Kaiaren, he learned many techniques that Vorash never had time to learn because of kaiarens suspicions of him. The only soul that may know of these lost disciplines is Vortix. Unfortunately, he went into hiding shortly after kaiarens battle with Vorash. He became a coward hiding from the public and began to write himself out of history to live the life of an outcast. If he cannot be found you can also find his [book].");
    }
    elsif($text=~/book/i) {
      # Monk Epic 1.5
      quest::say("Well I shouldn't say book. It was really a diary of sorts. Kaiaren wrote a diary and it contained all of his disciplines. There may also be a way to reverse the effects of Vorashs attacks located within it. Unfortunately, Vorix would also be the only one that would know the diary's location. Go now and try to locate Vortix and ask him where Kaiarens [diary] may be. Who referred you to me in the first place? Maybe he knows more than he appears to. I remember that Vortix will only address those that call to him by name.");
    }
  }
  else {
    if($text=~/hail/i) {
      quest::say("Good day, citizen. Please remember to keep your voice down in our library. Feel free to browse the extensive collection of books we have on display. Learning is all about you. Our library is the greatest collection of educational literature in the world, as you can no doubt see. Return to me again when you are an experienced monk.");
    }
  }
}

sub EVENT_ITEM {
  # Handin: Immortals (book)
  if((plugin::check_handin(\%itemcount, 18195 => 1)) && ($ulevel >= 46) && ($class=="Monk")) {
    # Monk Epic 1.0
    quest::emote("gasps at the sight of the rare book.");
    quest::say("This is a great find indeed! I can only imagine who you had to.. persuade to give you the book. Our library would be very interested in acquiring this and I am prepared to give you this referral that marks you as a friend of the library. If only [Lheao] could see this.");
    quest::summonitem(1682); #Danl's Reference
  }
  # Handin: Danl's Missing Book
  elsif((plugin::check_handin(\%itemcount, 48132 => 1)) && ($ulevel >=46) && ($class=="Monk")) {
    # Monk Epic 1.5
    quest::say("Whats this? How did you know I was missing these pages? I still do not know how you always find a way to help but you have again. Now what is it you can to ask me before? Ah yes, it was regarding the Immortals. It is no coincidence that the pages you just brought me came from the very book you are referring to.");
    quest::emote("mumbles a few words you do not understand and the pages magically are inserted back into the book and become legible again.");
    quest::say("Well I suppose I do owe you the information you had come here seeking. Unfortunately, I do not know much more than what is in this book already. The other references I have found do speak of another [disciple] of Kaiaren.");
  }
  else {
    quest::say("I have no need for this item $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}
# End of File