sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("Lady Deira closes her eyes and gives a formal, polite bow to you");
    quest::say("I am Lady Deira, Veteran of Thunder and one of several ambassadors to the Jaggedpine from Qeynos. It is a pleasure to make your acquaintance, although I fear that I am not one for words or company at the moment. I have [duties] to uphold and must give the fullest of my attentions to the fort.");
  }
  if ($text=~/duties/i) {
    quest::say("When his majesty, Antonious IV, ordered the removal of the barricades that had separated the Jaggedpine forest from the rest of the Qeynos lands, the council of Qeynos hand-picked several ambassadors to venture to the forest and provide the proper support of both military needs and social reconstruction purposes. I was sent to aid in fortifying the military front to ward off the attacks of the gnolls and any other intruders that might climb through the gnolls' burrow. It has proven to be a very trying task as the gnolls are quite persistent in their attacks of Fort Jaggedpine and the fort's residents are rather. . . [lost] in the ways of modern warfare.");
  }
  if ($text=~/lost/i) {
    quest::say("I do not mean to insult either their integrity nor their abilities, it is merely that they have been cut off from us for so long and have never had the chance to benefit from the experiences of the passing times. Granted, much unfortunate turmoil and darkness has enshrouded our world and they were sparred the suffering of Norrath for some time, but the lessons learned have been denied to them. They are capable scouts and unrivaled artisans who hold tradition in a sense of honor that is to be commended and respected, but they know little about war or defense. Their existence has been peaceful -- nearly tranquil in comparison and they struggle now. However, this does not mean that there is no hope to maintain the precious balance they have established and upheld since before the construction of the great cities of Norrath, nor does it mean that they are incapable; merely [undisciplined].");
  }
  if ($text=~/undisciplined/i) {
    quest::say("Again, I do not speak out against the abilities that they do have -- they are able warders of nature and I do not underestimate the cunning of their scouts. It is when the obstacle is unknown that they find themselves without the knowledge to appropriately defend, nor are they trained to handle an onslaught of attacks that has been so generously afforded in the recent days. My duties are not only to aid in the protection of the fort and the people of the Jaggedpine, but I am also here to train their citizens in the manner of defense and offense of battle. They have been most receptive to my coming and have shown much interest in what lessons I have been able to offer thus far and in return, they have been most gracious in their hospitality and shared [secrets] of our mutual faith.");
  }
  if ($text=~/secrets/i) {
    quest::say("The people of Fort Jaggedpine are master artisans and their faith to The Rainkeeper is pure -- having been spared the change of the modern eras. Their ancient ways are some of the very precious and priceless jewels that we strive to protect in our presence here; but shields and steel can do only so much to protect and assure that this ancient culture survives. It must be passed on from generation to generation and faithful to faithful. I, like all of my fellow ambassadors from Qeynos, am devoted in spirituality to The Rainkeeper and thus the keepers of the ancient ways have been well received to our presence and inquiries. I recently have been taught the ancient secrets of their blacksmiths -- secrets that until recently held little to [no place] in the recent culture of the Jaggedpine.");
  }
  if ($text=~/no place/i) {
    quest::say("When the Jaggedpine forest was ordered to be sealed, only those who were directly connected with the natural world in their profession were allowed to remain in the forest's confines. This was a decision made not out of prejudice, but out of a fundamental necessity to maintain the bare minimum that was thought needed to preserve that which they sought to spare from the approaching corruption of the time. The warriors, knights, rogues, and the minority of the arcane scientists loyal to The Rainkeeper and the philosophy guarded by his faithful were warmly and hospitably accepted into the already existing guildhalls of the Qeynos city proper. However, the traditions of these minority professions dedicated to the philosophies and culture of The Rainkeeper did not die -- they merely faded for a while. But they are very much [alive once again].");
  }
  if ($text=~/alive once again/i) {
    quest::say("With the reunion of the Jaggedpine forest with its sister, the Surefall Glade and reinstatement into the kingdom of Qeynos, the old ways of the minority followers have resurfaced. As I am a warrior whom has been dedicated to The Rainkeeper since I first took up the blade, I have been given the honor of being introduced and tutored in the [ways of my ancestors].");
  }
  if ($text=~/ways of your ancestors/i) {
    quest::say("There are several rites that the Veterans of the Storm, the title bestowed to the warriors and knights loyal to The Rainkeeper, perform to place themselves among the ranks of The Rainkeeper's faithful. Unfortunately, this time of turmoil has kept much of these rites from being properly resurrected and performed, although they are not forgotten and the intentions to introduce them once again to the faithful remain strong still. However, there is one practice that the artisans and elders of Fort Jaggedpine have been able to relay to me. They are very traditional by nature and wished to reunite their distant brethren not only with the forest but also with the ways of their ancestors before them, so they invited me to learn the rites of the [Tempest Guard] and wield our ancient symbol.");
  }
  if ($text=~/Tempest Guard/i) {
    quest::say("The Tempest Guard is a title bestowed among the most devout and capable of the Storm's Veterans. I do not say this in boast or overconfidence, mind you. I walked the tremulous path and strove to earn this ancient and sacred place among my kin. Now, I am one of few to hold the title, for true warriors and knights dedicated to The Rainkeeper are rare and finding those whose hearts are truly set upon the path of storms are rarer yet. As I exist as a bearer of this rank, I am also one of the mentors that guide it. If a veteran of the storm views themselves as [worthy to bear the Tempest Guard symbol], then I shall be the one that tests the validity of their views.");
  }
  if ($text=~/worthy to bear the Tempest Guard symbol/i) {
    quest::say("Very well and it is now that we shall begin. As with all things of the Jaggedpine and the ancient ways, you must endeavor on your own accord and initiative to achieve recognition among the ranks of this society. I shall give you the guidance toward the path, but you must willingly walk it -- and you must do so in facing many great dangers. The first steps that you must take are ones of material acquisition, or on a more fine of point, you must obtain the [items] that will be constructed into your symbol, should you prove worthy of it in the end.");
  }
  if ($text=~/items/i) {
    quest::say("You will be sent, as your first task, to retrieve two items that will be critical to the fulfillment and possible success of your trial. The Earthen Crown of the Underfoot, the first of the two items you must obtain, resides in the depths of The Hole. One named Tzitzi the Crazed holds the crown. Beware him, for although his madness is consuming, his cunning and wile are not to be underestimated. The second item that you must return to me with the crown is [Nyrein's Tome], which is rumored to exist in the depths of Kedge Keep.");
  }
}

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 8918 => 1, 8917 => 1)) {
 quest::say("You have done well thus far and I commend your actions and success. Now, the trials shall continue and this shall be the walk that tests your faith -- judging its suitability to bear the symbol. Take this, Nyrein's Prayer, to one known as Lord Mrallon in the city of Qeynos. He is aware of the rites of the Tempest Guard and will know full well of the path that has been set before you. With the prayer, he will expect the [Tempest Rune] that you must obtain before seeking him. Once you have the rune, you shall return it and the prayer to Lord Mrallon and should you prove successful in this task and thus worthy of the final trial, he shall guide you further.");
   quest::summonitem(8919);
   quest::faction(271,50);
   quest::faction(159,50);
   quest::faction(265,50);
   quest::faction(135,50);
   quest::exp(1000);
  } 
}