# Part of SK Epic 1.0

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(342);
  if ($text=~/Hail/i) {
    quest::say("Begone!! You do not have the will to do the things I require!");
  }
  if ($text=~/will of Innoruuk/i) {
    quest::say("You speak of a myth, friend. Such an object does not exist in this age and the secret of its creation lies locked in my mind, where it shall stay. It has been passed down through generations in my line, not to be revealed to a soul until the prophecy has come to pass.");
  }
  if ($text=~/prophecy/i && $faction >= 42 && $faction < 44) {
    quest::say("My apologies, $name, I have said too much already. Instead, I have an errand to occupy your thoughts. Take this as proof that you are sent from me and find my brother in Paineel. I haven't spoken with him in some time now and his well being is essential to our family's destiny.");
    quest::summonitem(14375);
  }
  if ($text=~/prophecy/i && $faction >= 44) {
    quest::say("I suppose it is time for the secret to be shared. Ages ago, two brothers were born. Glohnor was highly favored by the pompous Lightbringer, whose name we do not utter. Lhranc was chosen by the Prince of Hate to bring destruction and turmoil to the sons of men. The one thing they shared in common was their love of the fair priestess, Kyrenna. Kyrenna fell deeply in love with Glohnor. When Lhranc discovered this, he was overcome with rage and unwisely attacked his brother, who happened to be far more adept in combat. The fight cost Lhranc dearly. He lost his dignity as well as an eye in the struggle. He was ordered to leave Freeport and live his life in exile from the only home he had ever known.");
  }
  if ($text=~/Lhranc/i && $faction >= 44) {
    quest::say("Lhranc wandered the deserts of Ro for weeks, sinking deeper into depression and giving in to rage. Reports from the local merchants and caravans had him roaming the dunes muttering to himself incoherently. Eventually, he was forgotten, blending in with the hermits and madmen common to that region, forgotten by all save one.");
  }
  if ($text=~/one/i && $faction >= 44) {
      quest::say("Innoruuk had not forsaken Lhranc. Once his rage and hate had matured and sufficiently altered his soul, the dark prince summoned him and gave him dominion over the demons that had enslaved his mind. He was given a weapon that made him powerful enough to slay any enemy that stood in his way. He was to become the first human to harness the power of the almighty shadowknight. After years of traveling and teaching mankind his newfound abilities, Lhranc sneaked back into Freeport through a series of sewers in search of revenge against his brother and in hopes of kidnapping Kyrenna, the source of his obsession. Waiting until Glohnor was alone, Lhranc sprang from the shadows and slew his brother. This was the act that brought about his curse.");
  }
  if ($text=~/curse/i && $faction >= 44) {
    quest::say("As I said, Glohnor was highly favored by the Lightbringer. When the contemptible god of honor discovered what had been done, he transformed Lhranc into a deformed spectral knight and placed him in the ruined city. Lhranc then used what remained of his power to summon Kyrenna to his side and bind her there in a timeless, seamless sphere. He struggled for centuries to break her will and convince her to serve Innoruuk, certain that together they could remove his curse. But then, there was the prediction.");
  }
  if ($text=~/prediction/i && $faction >= 44) {
    quest::say("The prophecy states that one day Kyrenna will escape the clutches of Lhranc and that she will resurrect Glohnor. Together, it reads, they will destroy Lhranc and undo all he has done. I trust that I do not need to tell you, $name, that this would decimate our foothold in Norrath. When the prophecy was written, its words spread across the land. A dark council was held to construct a plan that would frustrate the words of the prophets. My ancestors were responsible for robbing Glohnor's tomb and securing his remains. For generations we have been charged with the duty of guarding those remains and the secret plan, should the corpse be discovered.");
  }
  if ($text=~/secret plan/i && $faction >= 44) {
    quest::say("The plan is a last resort only to be tried if Kyrenna indeed escapes and the remains are discovered. Judging by my brother's words that time is now. It will take the most powerful hero all the courage and dedication he can muster to complete the ritual.");
  }
  if ($text=~/I will complete the ritual/i && $faction >= 44) {
    quest::say("It would seem we have no choice, and this is our only hope. I must first make a dark shroud. To do this I must stain it with the blood of an innocent. Go find me this rare blood so I can start the creating of the shroud.");
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(342);
  if ($itemcount {14376} == 1 && $faction >= 43) {
    quest::emote("reads the note, eyes widening in panic. He raises his eyes to you and says, 'This is grave news, friend. If the prophecy is allowed to be fulfilled, our strength will vanish into obscurity. Goodness and purity will spread like a plague across the land and the servants of Hate will be powerless to stop it!'");
    quest::faction(342, 1);
  }
  if ($itemcount {14381} == 1 && $faction >= 51) {
    quest::say("Here, you take this shroud. You must now find the spirit of glohnor and place this item on him. This should force him back into his mummified body and then you must destroy this newly raised form and return to me its wrappings.");
    quest::faction(342, 7);
    quest::summonitem(14377);
  }
  if ($itemcount {14379} == 1 && $faction >= 58) {
    quest::say("You've done it! Your efforts will stand as a tribute to our kind for time eternal, my friend. Although nothing could possibly serve as a just reward for your accomplishments, please accept this as well as my eternal gratitude. It has been fashioned from the wraps of the mummy and shall protect you well.");
    quest::faction(342, 7);
    quest::summonitem(14370);
  }
}

# Quest by mystic414

