sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Oi there! Its nice to meet you. You must excuse me for I am currently working on a special spell for my studies. I would love to talk but I have to teach a class very soon to the new [initiates] and I don't have my lesson prepared yet. Are you also a [young initiate of the Eldritch Collective]? If you are then I hope you will be ready for the lesson.");
  }
  if($text=~/initiate/i) {
    quest::say("Excellent. You must understand that I am very pressed for time but if you are a young initiate of the Collective then I always have time to share my knowledge with you. If you are interested I have some [training] for you to begin. These tasks will help you prepare for the upcoming lesson as well!");
  }
  if($text=~/training/i) {
    quest::say("I have a number of tasks that I ask new recruits of the Eldritch Collective to complete. These task will test both your ability to fight as well as your navigational skills, 2 very important factors on your road to infinite knowledge. When you are ready to begin your journeys I will present you with a Tinkered Sewing Kit that you will use to gather numerous [important components].");
  }
  if($text=~/important components/i) {
    quest::say("All right then, here is your Tinkered Sewing Kit. In this sewing kit you will combine a number of recipes that will be used for creating your Eldritch Collective Initiate Armor. When you are ready to craft a certain armor piece all you must to is tell me which piece you [want] to craft. I will then present you with the component recipe along with the applicable pattern for [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. When you have completed the material for whatever piece you asked for you will combine it in a sewing kit with the appropriate pattern to fashion your armor piece. I do suggest though that you attempt your robe last as the components are more difficult then any other piece to collect.");
    quest::summonitem(17256);
  }
  if ($text=~/trousers/i) {
    quest::say("One will need to question your intellectual abilities if they see you running around without any pants on so let's make sure that doesn't happen. To create your trousers material you will need to combine 4 Grikbar Kobold Scalps, 1 Aviak Beak, 1 Runaway Clockwork Motor and Cloth Pants in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Trousers of the Collective Initiate.");
    quest::summonitem(22587);
  }
  if ($text=~/sleeves/i) {
    quest::say("Your sleeves will be a very important part of your armor set. To create your sleeves material you will need to combine 2 Grikbar Kobold Scalps, 2 Coyote Skulls and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sleeves of the Collective Initiate.");
    quest::summonitem(22586);
  }
  if ($text=~/sandals/i) {
    quest::say("Sandals are always a wise idea because you never know what you where your adventures will take you. To create your sandal material you will need to combine 3 Grikbar Kobold Scalps, 1 Kobold Tooth, 2 Harpy Wings, 1 Russet Oxide and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sandals of the Collective Initiate.");
    quest::summonitem(22585);
  }
  if ($text=~/robe/i) {
    quest::say("I am very pleased to see that you have progressed through your training in such a timely manner, you should be very proud! To create your robe material you will need to combine 5 Grikbar Kobold Scalps, 1 Young Ebon Drake Bile, 1 Brownie Brain, 1 Diseased Bone Marrow, 1 Cloth Shirt and the evil Faeronoliop`s Staff in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Robe of the Collective Initiate. Please return to me once you have fashioned your robe for I might have a few [final tasks] for you to complete.");
    quest::summonitem(22589);
  }
  if ($text=~/gloves/i) {
    quest::say("Its is very important that your hands are well guarded while you are attempting to practice magic because your hands will channel your energies thus having them injured would put a great burden on your training. To create your gloves material you will need to combine 3 Grikbar Kobold Scalps, 1 Grikbar Kobold Fur, 1 Giant Rat Pelt, 1 Giant Rat Ear and 1 Brownie Leg in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Gloves of the Collective Initiate.");
    quest::summonitem(22588);
  }
  if ($text=~/final tasks/i) {
    quest::say("Well I have been studying some new annals that were presented to me by some high councilmen in Rivervale. They had found them will excavating some ruins in the Gorge of King Xorbb and were unable to decipher what they meant. I had them bound in a special tome but unfortunately some pickpockets stole them from me in hopes that they would bring them great power I suppose. If you can find these 4 pages for me I would be very grateful for I would be able to finish my studies of them. Will you [seek out the stolen tome pages]?");
  }
  if ($text=~/seek out the stolen tome pages/i) {
    quest::say("I am very pleased to hear that you are willing to help and from your track record I have no doubt in my mind that you will be able to retrieve these pages. I would guess that they were given to the Dark Reflection casters for study after they were stolen from me so that would be where I would look. These casters do not understand our cause and serve dark gods so lethal force may be necessary. Just please be careful and make sure you have worthy adventuring partners with you because the battle may not be easy.");
  }
  if ($text=~/cap/i) {
    quest::say("A true initiate of the Eldritch Collective must always have a trusty cap on to protect any blows to the head. To create your cap material you will need to combine 2 Grikbar Kobold Scalps, 1 Mountain Lion Pelt, 1 Wolf Meat and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Cap of the Collective Initiate");
    quest::summonitem(22583);
  }
  if($text =~ /bracer/i) {
    quest::say("Bracers are a wise idea and will keep you well guarded young Celebus. To create your bracer material you will need to combine 1 Grikbar Kobold Scalps, 1 Plague Rat Tail, 1 Minotaur Scalp and a Cloth Wristband in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Bracer of the Collective Initiate.");
    quest::summonitem(22584);
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9116 => 1, 9117 => 1, 9118 => 1, 9119 => 1)) {
    quest::say("I knew you could do it! You have proven yourself worthy of your god and of your Guild! All the highest ranking officials of the Collective will surely hear of your good deeds. Upon studying these pages a bit further it seems it forms a book of incantations that will aid you in furthering your studies. Please take this magical book for I have learned all I can from it. Good luck!");
    quest::summonitem(9120);
    quest::faction(91, 10);
    quest::faction(71, -15);
    quest::faction(322, -15);
    quest::faction(115, 10);
    quest::faction(176, 10);
    quest::exp(25);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:Not_Found -- Xalirilan_Zarinokosalio