#This iksar crusader is actually Hero Goxnok, for the fifth leg of the Greenmist quest. He gives you a coin that you give back to him in Firiona Vie, to get him out of his disguise and speaking to you.

sub EVENT_SAY {
 if($text=~/hail/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::emote("clicks his heels together at attention. 'Hail, follower of Pain. Have you been sent to me?'");
  }
 elsif($text=~/sent/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::emote("spies the khukri sheath at your side. 'This cannot be. I was told a duke would attend the matter. Still, if the Lords have sent you, then you must be able to complete the task. The [traitor] most certainly must be stopped from delivering the [Charasis Tome]. The [recipients] appear quite formidable and I cannot handle such a deed, not single-handed.'");
  }
 elsif($text=~/traitor/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::say("I am afraid I do not know. The babble is that he is from Cabilis, but he could have been a disguised sarnak. Who knows? The tink is that at night within the Outland territory, near the old skinless outpost, they are to meet. We should depart at once. Go get outfitted and let me know when you are [ready to depart].");
  }
 elsif($text=~/charasis tome/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::say("The Charasis Tome, the tome of the old city of Charasis. It was taken from this temple and must be returned. The one sent to apprehend the traitor who stole the tome must be [ready to depart] with me at once.");
  }
 elsif($text=~/recipients/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::emote("shows signs of fear and his face turns olive. 'I do not know. The [spider riders]!! I have only heard tales of them from dying lizards. Evil skinless stubs. From the wounds inflicted on the lizards, I can tell they are vicious opponents. Bloated and frayed flesh, disembowelment. Their steeds must have also joined the fray, for some of the victims were covered in webs.'");
  }
 elsif($text=~/spider riders/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::say("As I have reported, the babble states they appear to be skinless stubs who ride giant spiders. Most encounters occur when the moon is high. Little is known about them and only in recent weeks have they begun to appear.");
  }
 elsif($text=~/ready to depart/i){ #Test of Betrayal (Greenmist Quest 5/8)
  quest::emote("slings his pack on his back and locks his sheath. 'Very well. I shall follow shortly. You must depart on your own. Go to the plains of the old skinless outpost. Beware, they have returned and patrol the hillside. Keep an eye on the gates of the outpost. I will be disguised within their ranks, I shall kneel as a sign. Give me this coin as your token.'");
  quest::summonitem(12691);
  }
}

#Submitted by: Jim Mills