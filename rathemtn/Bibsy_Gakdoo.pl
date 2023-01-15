# items: 55031, 55033, 55034
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("Bibsy Gakdoo stares at you, it is obvious he is ignoring you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55031 => 1)) {
    quest::say("Bibsy Gakdoo at your service, milord. I do have an extensive background in the art of jewel crafting and the full ranges of my services are at your disposal most noble one. Come take a seat if you may and listen to a [story].");
     }
     if ($text=~/story/i) {
       quest::say("Legends tell of a human paladin of Marr named Arthikus. This paladin was the most devout of Marr's followers and the keeper of the sacred Marr's Emerald. Marr's emerald was a beautiful gem, blessed by Marr and given to only his most devout and pious of followers. Arthikus was the only paladin ever known to wield this item. Bearing this proud relic, Arthikus was frequently seen wandering the Oasis of Marr destroying all undead that he could find. One day on one of his excursions into the desert he met a beautiful gypsy girl named Evaa, the daughter of a gypsy merchant. It was well known to the Paladins of Marr that this Gypsy family made shady deals with various necromancers to keep the undead from attacking their merchant caravan. Despite this, Arthikus continued to see Evaa and eventually fell in love with her. Are you [still awake], sire?");
     }
     if ($text=~/still awake/i) {
       quest::say("Arthikus's superiors strictly forbid him from getting involved with the gypsy but Arthikus did not listen. Evaa's family also strictly prohibited this affair. This forced the two to continue their relationship under a veil of secrecy. They met every night at midnight under the desert stars. Unknown to the couple, Evaa's father knew that the two were still involved with each other. Frightened that the necromancers he dealt with for protection might discover that his daughter was romantically involved with a paladin and infuriated by the defiance of his daughter, he plotted to end Arthikus's life. Are you paying attention to my story, milord? Do you wish to [hear more]?'");
     }
     if ($text=~/hear more/i) {
       quest::say("He immediately contacted one of the necromancers he had dealt with in the past and paid him to assasinate Arthikus. One night as Arthikus and Evaa had just finished their late-night meeting, a vile necromancer by the name of Gralkor launched a surprise attack against Arthikus. The battle raged for what seemed like hours. In the end however, Arthikus was slain by the mighty necromancer and raised as the undead to serve him in the form of a rotting mummy. Arthikus's will was strong however, even in undeath. He eventually broke free of his master's rule and killed him. Filled with rage and sorrow, he headed to the gypsy camp. Now, even more powerful in his undead form he found Evaa's father and murdered him. You look tired. Are you certain you wish for me to [continue]?");
     }
     if ($text=~/continue/i) {
       quest::say("Arthikus could not stop himself however. Filled with uncontrollable anger and hate, he destroyed the entire gypsy camp. Afterwards as he was surveying the destruction that he wrought, he saw Evaa. She was lying on the ground. He had broken her neck. Arthikus could not believe what he had done. Insanity overtook his mind. He looked up to the sky and cried out. His mournful shouts filled the desert. He renounced Marr and his ways and took Marr's Emerald in his hand and crushed it. He looked at the pieces of the emerald in his hand and vowed that all those that ventured into the Oasis would be destroyed. Tis a sad tale, don't you [agree], milord?");
     }
     if ($text=~/agree/i) {
       quest::say("They say that Arthikus still wanders the Oasis, attacking all those who come near him. If he still has any of the pieces of Marr's Emerald on him, I believe I could use them to imbue your Ring with more power. If you do find a piece of the Emerald, please come back to see me and hand me a piece of the Emerald and your Ring, and I will see what I can do for you, milord.");
     }
     if (plugin::check_handin(\%itemcount, 55033 => 1)) {
       quest::say("So the legend was true! Er, uh not that I doubted the validity of Marr's legends, milord.' Bibsy takes the Ring and the piece of the Emerald and sets them on the table. He then pulls out a small set of tools and begins to place the Emerald into the Ring. After a short while he hands the Ring back to you. 'Here you are. I do believe it is my finest work yet. Marr's blessing to you, milord!");
       quest::faction( 1719, 10); # Faction: Citizens of Gukta
       quest::faction( 1709, 10); # Faction: Protectors of Gukta
       quest::faction( 1716, 10); # Faction: High Council of Gukta
       quest::faction( 1717, 10); # Faction: Lorekeepers of Gukta
       quest::faction( 1718, 10); # Faction: Guktan Elders
       quest::summonitem(55034); # Item: Marr's Ring of Piety
       
     }
}
