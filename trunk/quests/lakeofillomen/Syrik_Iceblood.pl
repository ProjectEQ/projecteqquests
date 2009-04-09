# bloodgill steel weapons quest
# intro to release garudon quest

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Oh, hello. You caught me while I was in thought. Currently I am researching the methodology used in smithing weapons during the age of [Veksar]. If you wish to help, let me know. I will take any [help] available, be it friend or foe to the legions of Cabilis.");
  }
  if ($text=~/help/i) {
    quest::say("We can tell from the weapons that we have taken back from the Bloodgill goblins, that their smithing process must have been very unique for them to remain so sharp after four thousand years of use. Cabilis would like to study the weapons and learn this technique so we can better outfit our troopers. If you will bring me four of the same weapon I will spread your name through our city, and one day you may be able to walk the streets. I am looking for Steel Ch'Ror, Mak'Stor, So'Shar, Ta'Nak, Ga'Nak, and Re'Stek. Until then I will reward you with whatever coin I can get from turning them in for you.");
  }
  if ($text=~/veksar/i) {
    quest::say("Veksar was an opulent resort enjoyed by privileged nobles and generals of the empire. It was built near a small freshwater spring with legendary restorative properties, this small outpost was considered one of the finest treasures of the realm. Highly-ranked Iksar from the empire came here to cure their illness and extend their lives with the mystical [waters]. This town was originally created by the Kylong tribe of Iksar, but was assimilated into the ranks of Venril Sathir when he united the five tribes. Many [legendary Iksar] lived there.");
  }
  if ($text=~/legendary iksar/i) {
    quest::say("When the Kunzar armies marched upon the Kylong, the three greatest Kylong mystics shattered the medallion of Kylong, a holy relic of their tribe, and fled their mountain homes in order to prevent the Kunzar from reassembling it. These three Kylong were [Verix Kylox], [Dakon Sythrax], and [Sirk Vemat]. As they fled from their tribe they knew that the chances to form the medallion together would be less if the Kylong split up. Verix attempted to hide in the hills of the Dreadlands. Dakon headed north to the Field of Bone. Sirk Vemat headed to the Burning Woods to hide in the forest.");
  }
  if ($text=~/verix kylox/i) {
    quest::say("Venril Sathir found Verix Kylox the shaman while he was combining the lands for undead. Venril was angered by his lack of devotion. For his punishment he was sacrificed, but resurrected to become a part of Venril's undead army.");
  }
  if ($text=~/dakon sythrax/i) {
    quest::say("Dakon Sythrax the necromancer fled to the Field of Bone. It was here that he raised a small troop of skeletons to build an underwater dungeon where he could hide his treasures. He hid the amulet and some of his more powerful tomes here. One of which was a great [book of necromancy]. The possessor of the book could have full control over an army of undead. He left the skeletons to do his work and returned to surrender to the Kunzar's forces. He was sent to Veksar to work through his days studying the effects of the spring.");
  }
  if ($text=~/book of necromancy/i) {
    quest::say("Xalgoz later discovered the cove and he took the medallion back to the five towers of Teraaz, which is now referred to as Kaesora. He left all of the tomes because he did not find them of particular interest. Decades after the war between the dragons and Iksar, a troll that fell from a passing ship found Sythrax's small cove. The skeletons milled around in disarray. After finding the book and reading what of it he could he found that the skeletons would do his bidding. I have heard rumors that Sythrax was able to assume the form of a great lich to live through the decades. His hatred for being trapped, and for being forced to work for Venril has built over the ages. He only wants to escape this place so he can retrieve his medallion and books that he believes to be in the Field of Bone.");
  }
  if ($text=~/sirk vemat/i) {
    quest::say("The Sarnak captured Sirk Vemat the warrior. They took him to Chardok where they forced him to work in mining out caves that would be used as their city. He still carried the medallion of the Kylong. He knew that in death they would find it on his body so he decided to hide it. He dug a hole as deep into the mountain as he could and placed it in the hole and covered it over. I have heard tales that a slaving rat by the name of Niblek would find the necklace. Niblek's love for shiny things meant that he would keep it with him, but would offer it as trade to anyone that had his favorite type of gems.");
  }
  if ($text=~/waters/i) {
    quest::say("Veksar was guarded from the constant attack of dragons and the skulking bands of goblins living in the nearby hills. For years the city thrived with all sorts of visitors. Soldiers harmed by the war were sent there to mend their wounds. High-ranking officials came here to relax and escape the tedium of war. Even Iksar commoners came here desperate to cure whatever ailed them. Since the war with the dragons was always escalating, a massive dome was built overhead to keep the attacks of the dragons away. In spite of efforts, the [dragons] found a way to attack.");
  }
  if ($text=~/dragons/i) {
    quest::say("Trakanon sent many dragons here to scout out why this town was so popular. After learning about the Iksar being healed, he know that he had to take action on the city. He formed a plan to first cripple the cities walls so that their own dome would trap them, and then flood the water of the healing spring. This would not only trap them, but also dilute the waters, preventing any further healing from taking place. [Garudon] would lead in the direct attack of the town.");
  }
  if ($text=~/garudon/i) {
    quest::say("During the formation of Trakanon's ranks he did not garner the support he desired. One of the first dragons to come to his side was Garudon. He quickly grew to be Trakanon's most trusted ally, and aided in drawing support from the dragon ranks. Because of his high ranking position Garudon would lead the [fight] against Veksar.");
  }
  if ($text=~/fight/i) {
    quest::say("The Dragons clawed at the supporting pillars of the dome. The town began to shake and the dome began to fall. The Dragons fled from the pillars, but one was trapped. Garudon was caught in a snare set up by the town's defense. Crumbling to the ground the dome sealed their fate. Garudon fought with the Iksar from under the dome with no hope of escaping. The Dragons then called upon the waters to flow, and flood the valley. The spring was flooded, its magical properties lost forever. The soldiers finally brought down Garudon. With his last breath he let out a flame that scorched much of the dome and then fell from the air, crashing through the ceiling of the theater that was built to entertain the Iksar on the mend. Most of his [bones] still remain there, while others were ground up in necromantic ceremonies.");
  }
  if ($text=~/bones/i) {
    quest::say("Scout reports tell of his bones laying scattered across the floor of the theater. Because a constant surge of necromancy was needed to keep the citizens of Veksar animated it could not be stopped. They would have to find a way to prevent the magic from flowing into the theater and reanimating Garudon himself. The mystic words painted onto the wall of the theater seem to point to the fact that the flow of necromancy into the theater is stifled. This is all the lore of the town of Veksar that I can recall.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 65506 => 4)) {
    quest::doanim(48);
  }
  elsif (plugin::check_handin(\%itemcount, 65507 => 4)) {
    quest::doanim(48);
  }
  elsif (plugin::check_handin(\%itemcount, 65508 => 4)) {
    quest::doanim(48);
  }
  elsif (plugin::check_handin(\%itemcount, 65509 => 4)) {
    quest::doanim(48);
  }
  elsif (plugin::check_handin(\%itemcount, 65510 => 4)) {
    quest::doanim(48);
  }
  elsif (plugin::check_handin(\%itemcount, 65511 => 4)) {
    quest::doanim(48);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("Excellent work, $name. We will study the architecture of these weapons to better the legions of Cabilis. Soon your name will be known among the Iksar.");
  quest::faction(318,10); #syrik iceblood
  quest::faction(193,10); #legion of cabilis
  quest::faction(30,10); #cabilis residents
  quest::faction(282,10); #scaled mystics
  quest::faction(62,10); #crusaders of greenmist
  quest::faction(317,10); #swift tails
  quest::exp(50000);
  quest::givecash(0,6,12,12);
}

# EOF zone: lakeofillomen ID: 85155 NPC: Syrik_Iceblood

