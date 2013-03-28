#BeginFile qeynos2\Vegalys_Keldrane.pl (2051)
#Quest file for North Qeynos - Vegalys Keldrane: Investigators Badge (Badge #1)

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings to you, citizen. By order of the Council of Qeynos I have been given the duty of apprehending the individuals [responsible] for unleashing this terrible plague upon the people and the lands of Antonius Bayle. The more I look into this matter, the more I come to find that this will be no easy task.");
  }
  if($text=~/responsible/i) {
    quest::say("The plague unleashed upon the Plains of Karana is the work of the followers of Bertoxxulous. Those responsible belong to group known as the Bloodsabers though there were others involved as well. Some time back, they launched a plot to overthrow Antonius Bayle and our ruling council. Their [plan] failed.");
  }
  if($text=~/plan/i) {
    quest::say("Their plan was to unleash a plague so deadly and virulent that it would wipe out all life from here to Highpass Hold. They planned to brand themselves and their foul allies with a rune that would have rendered them immune to the effects of this plague. From that point they would have been able to simply walk in, easily defeat the weakened stragglers and declare themselves the rulers of this kingdom by default. But they were [careless].");
  }
  if($text=~/careless/i) {
    quest::say("The sudden influx of scoundrels and loathsome individuals was our first tip off. They required a rather enormous number of supplies, materials and manpower to construct the ornate altars, craft and enchant their runed branding irons and supply their armies with the weapons needed for the cleanup work afterward. They needed to rely upon [outside help].");
  }
  if($text=~/outside help/i) {
    quest::say("They mostly chose to hire bandits and brigands who are foolishly more concerned with immediate profits than the long-term effects of their actions. But once they knew we were on to them they even started hiring some of the more 'civil' gnolls, if there is such a thing. Gnolls tend to be easy to push around, stupid, and they work very cheaply. They knew their time was short and they were desperate. Choosing to work with untrustworthy, lazy scoundrels caused the whole thing to begin to [unravel], praise Rodcet!");
  }
  if($text=~/unravel/i) {
    quest::say("Their workers were careless. Aside from noticing the unsavory element in our city, our citizens began to run across many of the strange items and materials that were being trafficked into our city en masse. It was at that point that the citizens began to [complain] quite loudly about all of this.");
  }
  if($text=~/complain/i) {
    quest::say("Obviously, they questioned the meaning behind these events and rightfully so. They were frightened much as they are now. I admit, I was remiss in my duties for not noticing it sooner. One of the biggest complainers during this time was a man by the name of [Earron Huntlan], proprieter of the famed Lion's Mane tavern. Though he is just a simple merchant, he did us a great service.");
  }
  if($text=~/Earron Huntlan/i) {
    quest::say("Earron is quite a character. He gets all kinds of travelers stopping by his inn for a drink or whatever other business. His patrons started telling stories of being mugged and harassed by these loathsome individuals in the very streets of our fair city. Of course, he was concerned. So he became a kind of advocate for this cause, ringing the [alarm] bell as it were. I admit, at first I did not believe the conspiracy. I simply could not believe it was all happening under our nose.");
  }
  if($text=~/alarm/i) {
    quest::say("Well, he succeeded in whipping the populace into a frenzy. He even got the famous wizard Al'Kabor to help him out by determining the nature of the strange items many of our citizens were finding. Getting that man to do anything not directly related to his research is not an easy thing to accomplish either. Needless to say, at that point I saw the truth and the Prime Healer forgive me for not seeing it sooner. Were it not for the investigations and general outcry of [concerned citizens], we might not be standing here talking today.");
  }
  if($text=~/concerned citizens/i) {
    quest::say("Yes, it was citizens like you that helped to save Qeynos that day. We uncovered their plot, captured the man who was in charge and put him to death. Of course, the Bloodsabers retaliated and using their incomplete research still managed to unleash the plague we face now. Though devastating in its own right, you must admit it is rather mild compared to what it might have been. I thank you for your interest. Perhaps you would be willing to [help] me?");
  }
  if($text=~/help/i) {
    quest::say("Excellent! The more I learn from my investigators the more I find that these Bloodsabers have stretched their tendrils of influence all throughout our beloved city. Nevertheless, we are committed to exposing these fiends once and for all. Perhaps you would like to become an [investigator]?");
  }
  if($text=~/investigator/i) {
    quest::say("Very well then, $name. We will not allow just anyone to wear the official Investigator's Badge and please forgive me. . . But it is hard to tell where one's loyalties lie these days. If you are truly [serious] then there is a duty you must perform first to show you are on the side of Antonius Bayle, the council and the good people Qeynos.");
  }
  if($text=~/serious/i) {
    quest::say("There is a guard by the name of Robbie Shilster that patrols the Northern Plains of Karana. He is allied with our enemies and completely corrupt. He is flagrant in his trafficking of contraband goods. His orders are to guard the great wooden bridge to stave off the insect swarms. But our investigators report that he simply stands to the side and watches as the swarm rolls through. You are to execute this man for his treason and bring me his helm. Then, we will talk.");
  }
  if($text=~/advance further/i) {
    #quest::say("At this point, I am mainly in need of loyal and trustworthy investigators. I must first gather information on who these people are and exactly how far their influences stretch. However, once I begin to implement the next phase of this operation, you may be able to assist us once again if you prove to be talented enough. For now, simply continue to observe and report."); Figuring out where this text goes between badge 1 and 2...
    quest::say("Interested in advancing further are you? Excellent, we are ready to begin the next phase of our operation. We have gathered a great deal of information as a result of the latest series of arrests. We do require [interrogators] that are able to pry the information we require out those less than willing to talk."); #Temporarily removed: 'Also, Velarte Selire at the Temple of Life is looking for help with his [research]. You may wish to talk with him.'
  }
  if($text=~/interrogators/i) {
    quest::say("If you are interested in joining the ranks of our interrogators and helping Qeynos further as we bring these fiends and murderers to justice, turn in your investigator's Badge and I will give you the briefing document you need. I already know I can trust my investigators, so there is no need to further test you.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2173 => 1)) { #Cracked Corrupt Guard Helm
    quest::say("Thank you for bringing this person to justice. Please read this manual very, VERY carefully. Commit it to memory. We do everything strictly by the book. We are a people of law and order and I simply won't tolerate a breach of protocol. Investigators are expected to accurately report findings, are authorized to issue warrants and to notarize official documents for all lands under the jurisdiction of Antonius Bayle and the council. I sincerely hope you can earn your Investigator's Badge.");
    quest::summonitem(18289); #Investigator's Briefing
    quest::faction(9,10);    #Antonius Bayle
    quest::faction(135,10);  #Guards of Qeynos
    quest::faction(273,-10); #Ring of Scale
    quest::faction(164,-10); #Kane Bayle
    quest::faction(217,10);  #Merchants of Qeynos
    quest::exp(2000);
  }
  elsif(plugin::check_handin(\%itemcount, 2386 => 1)) { #Investigator's Badge
    quest::say("Very well, here is the briefing document. Please read it very carefully. I wish you luck friend, this mission could prove to be dangerous.");
    quest::summonitem(18292); #Interrogator's Briefing
  }
  plugin::return_items(\%itemcount);
}
#EndFile qeynos2\Vegalys_Keldrane.pl (2051)