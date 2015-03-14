# Lady Deira
# Crown of the Tempest Guard Quest

sub EVENT_SAY {
  if ($faction <= 2) {   
   if ($text=~/hail/i) {
      quest::emote("closes her eyes and gives a formal, polite bow to $name.");
      quest::say("I am Lady Deira, Veteran of Thunder and one of several ambassadors to the Jaggedpine from Qeynos. It is a pleasure to make your acquaintance, although I fear that I am not one for words or company at the moment. I have [duties] to uphold and must give the fullest of my attentions to the fort.");
   }
   if ($text=~/duties/i) {
      quest::say("When his majesty, Antonious IV, ordered the removal of the barricades that had separated the Jaggedpine forest from the rest of the Qeynos lands, the council of Qeynos hand-picked several ambassadors to venture to the forest and provide the proper support of both military needs and social reconstruction purposes. I was sent to aid in fortifying the military front to ward off the attacks of the gnolls and any other intruders that might climb through the gnolls' burrow. It has proven to be a very trying task as the gnolls are quite persistent in their attacks of Fort Jaggedpine and the fort's residents are rather. . . [lost] in the ways of modern warfare.");
   }
   if ($text=~/lost/i) {
      quest::say("I do not mean to insult either their integrity nor their abilities, it is merely that they have been cut off from us for so long and have never had the chance to benefit from the experiences of the passing times. Granted, much unfortunate turmoil and darkness has enshrouded our world and they were spared the suffering of Norrath for some time, but the lessons learned have been denied to them. They are capable scouts and unrivaled artisans who hold tradition in a sense of honor that is to be commended and respected, but they know little about war or defense. Their existence has been peaceful -- nearly tranquil in comparison and they struggle now. However, this does not mean that there is no hope to maintain the precious balance they have established and upheld since before the construction of the great cities of Norrath, nor does it mean that they are incapable; merely [undisciplined].");
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
   if ($text=~/Tempest Guard[.|?|!|]$/i) {
      quest::say("The Tempest Guard is a title bestowed among the most devout and capable of the Storm's Veterans. I do not say this in boast or overconfidence, mind you. I walked the tremulous path and strove to earn this ancient and sacred place among my kin. Now, I am one of few to hold the title, for true warriors and knights dedicated to The Rainkeeper are rare and finding those whose hearts are truly set upon the path of storms are rarer yet. As I exist as a bearer of this rank, I am also one of the mentors that guide it. If a veteran of the storm views themselves as [worthy to bear the Tempest Guard symbol], then I shall be the one that tests the validity of their views.");
   }
   if ($text=~/worthy to bear the Tempest Guard symbol/i) {
      quest::say("Very well and it is now that we shall begin. As with all things of the Jaggedpine and the ancient ways, you must endeavor on your own accord and initiative to achieve recognition among the ranks of this society. I shall give you the guidance toward the path, but you must willingly walk it -- and you must do so in facing many great dangers. The first steps that you must take are ones of material acquisition, or on a more fine of point, you must obtain the [items] that will be constructed into your symbol, should you prove worthy of it in the end.");
   }
   if ($text=~/items/i) {
      quest::say("You will be sent, as your first task, to retrieve two items that will be critical to the fulfillment and possible success of your trial. The Earthen Crown of the Underfoot, the first of the two items you must obtain, resides in the depths of The Hole. One named Tzitzi the Crazed holds the crown. Beware him, for although his madness is consuming, his cunning and wile are not to be underestimated. The second item that you must return to me with the crown is [Nyrein's Tome], which is rumored to exist in the depths of Kedge Keep.");
   }
   if ($text=~/Nyrein's Tome/i) {
      quest::say("When great cities were still in the dawn of their conception, Nyrein Shadowstorm was the first to bear the title of Tempest Guard. She was an able warrior who had defended her homeland of the Jaggedpine time and time again -- warding away the bestial foes of the Unkempt Wood and slaying the would-be raiders of the other nomadic tribes that sought to reave the precious forest for their own. It is said that the spirit of Karana himself blessed her -- guised in the form of a raging tempest that accompanied her through the campaign that would secure the Jaggedpine for our ancestors. It was then that she was bestowed the name of Tempest Guard and the circle of the Veterans of the Storm was set in-place. In her final campaign centuries past, she fell beneath the spell of the Kedge. What resides of her there is but a hollow shell -- the true Nyrein ascended into the Eye of Karana's Storm long ago and her physical essence is sadly but a tormented servant of the deep.");
   }
   if ($text=~/Tempest Rune/i) {
      quest::say("Long before the order of the Veterans of the Storm had been established; long before the Jaggedpine had been fully settled by our nomadic ancestors, a brave young scout came upon a most powerful item by the grace of an unlikely chance. This item was a simple white stone, yet engraved upon it was a beautiful, complex rune. The young warrior found the item to be more beautiful than anything he had seen before -- more beautiful than the lush forest; more beautiful than even the great tempest that had recently scorched the earth of his people's land. The young warrior thought the rune to be a gift from the storm -- from Karana himself. He returned it to the elders of his tribe, who also found the great beauty of this simple white stone to be divine. The young warrior was [entrusted with the stone] while the elders and early artisans introduced the design into their cultural and spiritual works.");
   }
   if ($text=~/entrusted with the stone/i) {
      quest::say("Our ancestors were not selfish people and although the stone's beauty overwhelmed them with an unspeakable spiritual purity, they knew that it had not fallen into this warrior's hand by simple chance. They felt that the great god of the storms had wished for the stone to fall into this young man's possession, and so they respectfully obliged what they interpreted to be their deity's will. As time passed and the completion of Karana's Shrine was near, the elders called upon the then able warrior to attend the final ceremony of the shrine's completion. It was then that the warrior knew the stone's purpose and as the storm was captured into the very rock of the shrine, he placed the stone upon one of the branches of the sacred tree that the shrine was built around. The lightning from the final moments of the storm was absorbed into the rune. Eventually, this rune would become a sacred symbol for all who pledge their blades to The Rainkeeper. However, [history] would weave a new turn to that tale.");
   }
   if ($text=~/history/i) {
      quest::say("When Antonious III ordered the sealing of the Jaggedpine Forest, Anumnan Dathry, then a Tempest Guard, was one of many who understood the need and supported the decision. The years passed and Anumnan grew old, putting aside his sword for the life of a priest. He would see his only heir would rise to hold the honor of Tempest Guard, however, his son would betray the Knights of Thunder. In this knight's eyes, the betrayal was not one performed out of malice; on the contrary, he felt that his slaying of the order's then senior knight was an act of pure devotion, for it was his thought that his superior had fallen into the clutches of a venomous shadow that lurks even now in the depths of Qeynos. It was thought that Anumnan's son had been manipulated by this evil and the slaughter of the knight was one orchestrated by the shadow he sought to purge. Anumnan then faced the gravest [decision] that any father and devoted priest fears.");
   }
   if ($text=~/decision/i) {
      quest::say("Anumnan, a high priest of The Rainkeeper and confidant of the Veteran order, was asked to aid in the judgment to be passed onto his only living heir, as it was his duty to his order and deity. As a priest, he knew what he had to do -- as a father, he fell into the clutches of a silent suffering that viscously wove anger, regret, pity, and undying love. It was his duty to aid the Council of the Storm in this decision and in the end, he agreed with the council to execute the fallen knight. The night his son's body was respectfully laid to final rest within the sacred temple of The Rainkeeper, Anumnan was confronted with a [truth] that would change him forever and set him on a pitiable path of insanity.");
   }
   if ($text=~/truth/i) {
      quest::say("As Anumnan paid his respects to his lost child in solitude and peace, a cloaked woman approached him. Callously, she held the aged priest to the envenomed point of her dagger and forced him to imbibe her tale. It was then that she revealed to Anumnan the truth -- the truth that his son's accusations and actions were not only correct and justified, but they had saved the entire order from complete corruption within the infectious shadow. She would reveal to Anumnan the name of the one who had betrayed his son and the order; the name of the one who had worked beside the corrupted knight and originally painted his son as their scapegoat. Before Anumnan could question the woman, she disappeared back into the darkness that had delivered her and this fateful news, leaving him alone in his consuming [doubt].");
   }
   if ($text=~/doubt/i) {
      quest::say("Anumnan carried with him the entirety of doubt -- for he doubted everything now. He doubted the woman and her tale, he doubted her motives that in his mind were countless, he doubted himself, and he doubted his sacred order and faith. This doubt would eventually drive Anumnan mad and two years later, lead his hand to slay the one who bore the name the woman had uttered to him upon his son's grave. Out of respect for Anumnan, his son, and the order, we speak neither the name of our martyred brother nor that of the villain who had come so close to the Knights of Thunder's ruin. It is said that the crazed Anumnan hired several rogues to execute every ranking member of the Veterans of the Storm and return to him as proof of their demise the single, sacred rune that they wore about their necks. You see, $name, Anumnan originally sought council with his closest of allies within the order when he began to doubt, but their ears [would not have his tale].");
   }
   if ($text=~/would not have his tale/i) {
      quest::say("The order knew of Anumnan's grief and was saddened by the priest's sudden confusion, doubt, and questions. They kept his confidence well, however, and did not speak beyond their own circle of Anumnan's account of the rogue, but his madness would twist his allies' compassion into callous ignorance. Anumnan grew to believe that the corruption the rogue had spoken unto him had already seeped into the order and he began to nurture a festering lust for vengeance. Anumnan was never caught by Qeynos, but it is said that he sought refuge within the city of Freeport. Our intelligence was only able to find the remnants of Anumnan's tale reduced to that of a pitiable madman who dwells in the southern desert of Ro. Seek Anumnan and return him to the Eye of Karana's Storm that his caged spirit has sought for so long. Anumnan will also carry the rune that you seek, for as he destroyed the others, including his own, he still wears the one that had once belonged to his departed son.");
   }
  } else {
   quest::say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Rainkeeper.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 2) {
   if (plugin::check_handin(\%itemcount, 8918 => 1, 8917 => 1)) {
      quest::say("You have done well thus far and I commend your actions and success. Now, the trials shall continue and this shall be the walk that tests your faith -- judging its suitability to bear the symbol. Take this, Nyrein's Prayer, to one known as Lord Mrallon in the city of Qeynos. He is aware of the rites of the Tempest Guard and will know full well of the path that has been set before you. With the prayer, he will expect the [Tempest Rune] that you must obtain before seeking him. Once you have the rune, you shall return it and the prayer to Lord Mrallon and should you prove successful in this task and thus worthy of the final trial, he shall guide you further.");
         quest::summonitem(8919);
         quest::faction(271,50); #Residents of Jaggedpine
         quest::faction(159,50); #Jaggedpine Treefolk
         quest::faction(265,50); #Protectors of Pine
         quest::faction(135,50); #Guards of Qeynos
         quest::exp(1000);
   }
   if (plugin::check_handin(\%itemcount, 8952 => 1)) {
      quest::emote("gives a warm, gentle smile and a deep bow of respect to $name as she extends a white steel crown ornamented with a single blue gem.");
      quest::say("Welcome to the Veterans of the Storm, and we honor you as Tempest Guard $name. Bear this symbol in humility and as a sign of your eternal pledge in service and protection of all that The Rainkeeper holds dear and sacred.");
      quest::summonitem(8954); #Crown of the Tempest Guard
      quest::faction(271,100); #Residents of Jaggedpine
      quest::faction(159,100); #Jaggedpine Treefolk
      quest::faction(265,100); #Protectors of Pine
      quest::faction(135,100); #Guards of Qeynos
      quest::exp(2000);
   }
  }
   plugin::return_items(\%itemcount);
}