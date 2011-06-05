my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("story",10);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("This is the tale of Taruun, the first Vah Shir scout.");
  }
  if ($count == 2) {
    quest::say("Taruun was discovered as a small child. He was found wandering the Old World continent of Odus alone. His face was scarred and his fur was burned in patches. It was apparent that he had been with out food for some time. The orphan was very near death when Kerran hunters found him and brought him back to their village.");
  }
  if ($count == 3) {
    quest::say("The Shir tribe adopted the child and nursed him back to health. The tribe searched for some trace of his family, but did not succeed in finding them. The young cub was either unable or unwilling to speak which made the hunt for his origins that much more difficult. After several years of searching all efforts to find his family were officially ended and the boy was adopted into the tribe. That is when they gave him the name Taruun.");
  }
  if ($count == 4) {
    quest::say("As Taruun grew it became clear that he would never grow to be like the other Kerrans. It was obvious to those who knew him that whatever trauma he suffered had scarred him deeply. He never spoke, nor even growled for that matter. He kept to himself mostly, somtimes wandering off on his own for days.");
  }
  if ($count == 5) {
    quest::say("As time passed, he demonstrated abilities that no Kerran had possessed before. All Kerrans could move quietly while they hunted, but Taruun was different. He moved silently, undetectable by even his fellow Kerrans. Added to this was an amazing ability to instantly blend into any background. He did so without the normal visual effects that a shaman displays while casting a spell of invisibility. Taruune could disappear at will.");
  }
  if ($count == 6) {
    quest::say("The boy never spoke, but he proved his value to the tribe during those first years. He often returned from his solo treks into the wilderness with more food than an entire gathering of hunters. The tribal elders watched this and grew curious.");
  }
  if ($count == 7) {
    quest::say("One morning the tribal elders asked the youth if they could send hunters with him on one of his treks. He simply nodded and motion for the elder hunters to follow. The hunters had learned to respect young Taruun prior to that day and followed the youth with open minds. It is fortunate for all ofus that they did so. The skills that they learned in that expedition and all of the ones that followed it are still used today.");
  }
  if ($count == 8) {
    quest::say("Taruun continued to take hunters with him for several years after that first trip. The hunters that he taught passed their knowledge to the hunters that follwed behind them. Seasons passed and the tribe flourished and grew under the tutelage of silent youth. This continued until the day that he left the tribe. No one can remember when or why the youth left. Some speculate that he was a spirit. Other had said that he never existed. I prefer to think that he was a fleeting part of the shadows, destined to move with the sun.");
  }
  if ($count == 9) {
    quest::say("Our people all learn the story of Taruun at an early age. The boy never spoke the name himself, but his actions and skill spoke like no words could. Our elders say that the story of Taruun is a lesson in humility. He helped our tribe without the use of words and with no desire for gratitude. That is why we have named out scouts after the youth. They are the epitome of what he represented to our people.");
  }
  if ($count == 10) {
    quest::say("That is the story of Taruun, the child that taught a tribe to survive. He is the namesake of our scout sect. It was an honor to be able to recite this story for you.");
    quest::settimer("story",300);
  }
  if ($count == 11) {
    quest::say("This is the story of Dar Khura. As with the other sects of the Vah Shir, the Dar Khura took their name from one of our greatest historic figured We honor the memory of our fallen leaders through our actions each day. It is the duty of every Vah Shir to epitomize the values that make our civilization strong, for without these values we are no better than the creatures that wallow in the filth of the darkest caves.");
    quest::settimer("story",10);
  }
  if ($count == 12) {
    quest::say("Dar Khura was the spiritual advisor to Vah Kerrath himself even before the ascension... or shifting. After the great event, it was his solemn conviction that we had not ascended to this world by mere chance, but that we were led here for a special purpose. Dar Khura focused on discovering that purpose and leading the tribe to fulfill their destiny.");
  }
  if ($count == 13) {
    quest::say("Shortly after our city's first walls were completed, Dar Khura went to King Kerrath and told him of a recurring vision he had been experiencing. In the dream, the shaman perceived some unknown force tampering with the balance of the spirit realm.");
  }
  if ($count == 14) {
    quest::say("An overwhelming feeling of urgency and desperation lingered with the Spiritist each time he awoke from the visions. Dar expressed to the king that it was his opinion that this was the purpose for their being delivered to this place.");
  }
  if ($count == 15) {
    quest::say("The king found Dar Khura's words to be compelling. So convinced was the king that by the end of the day a decree went out to the tribe to afford Dar Khura any resource he needed to carry on his search. This research bore fruit sooner than any of the tribal elders could have expected.");
  }
  if ($count == 16) {
    quest::say("Dar Khura's research was quick to provided insight into one of the races of this new place. The Spiritists grew to know this race as the Akheva. They were determined to be a semi-immortal race.");
  }
  if ($count == 17) {
    quest::say("Research found that when one is slain, it is reborn anew. Over time, Dar Khura discovered that when an Akheva was reborn, a sacred member of the spirit realm was destroyed. This, he surmised, was the meaning of his initial visions.");
  }
  if ($count == 18) {
    quest::say("Dar Khura gathered an element of soldiers and moved into the darkness with the hope of gathering more information on this new race. That morning Dar Khura and his soldiers moved out of the sanctuary of the city walls and into the darkness. That was the last time that Dar Khura and his noble group of soldiers were seen. Only speculation was left behind.");
  }
  if ($count == 19) {
    quest::say("Our people have named the Shamanic sect of our tribe after that visionary spiritual leader. May the eyes of Vah watch over his spirit as they do ours.");
    quest::settimer("story",290);
  }
  if ($count == 20) {
    $count = 0;
    quest::settimer("story",10);
  }
}