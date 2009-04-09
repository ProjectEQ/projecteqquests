# Starting quest for luclin smithing
# Master Barkhem in Shar Vahl
# other npcs, repair orders : Khala_Dun_Jasir, Khala_Dun_Aihjin, Khala_Dun_Bokh, Khala_Dun_Koby
# other npcs, end of the quest : Master_Taruun_Rakutah

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say('Welcome to my shop. Please feel free to look around at the armor we have available. If you are looking for work, just let me know.');
  }
  if ($text=~/Looking for work/i) {
    quest::say("That's great news! I could really use a hand. I have constructed some shield frames ideal for use with the carapaces found on [bloodlings]. Unfortunately I do not have the time to collect any of the shells. You can either purchase the frames and keep the shields for yourself, or you can return them to me and I will compensate you for your troubles.");
  }
  if ($text=~/Bloodlings/i) {
    quest::say("Cht`Thk bloodlings are parasites found in the thickets just beyond the south gate. You best be careful, they have a habit of sucking the blood from a person and spreading diseases.");
  }
  if ($text=~/repair order/i) {
    quest::say("Huh? Oh, here is a repair order for the Guards' shields, I will only give you one at a time as I do not want you overworking yourself so early in your education.");
    quest::summonitem(29803);
  }
  if ($text=~/spirit anchor/i) {
    quest::say("Have you not met Tiamon out in the Thicket yet? He is always telling anyone who wants to listen all about spirit anchors. Let me sum it up for you- the shadeweavers hunt the beings of shadow in the thicket to make their special shadow armor called Xakra. Now if you or I were to try to don this armor, it wouldn't last long as the shadows are not bound to this plane. Tiamon developed a method of [binding the spirits] in such a way that they will last. Mind you, he works with needles and threads- I work with the tools of a smith.");
  }
  if ($text=~/binding the spirits/i) {
    quest::say("When something has been exposed to great ritual and culture, like the stones used to build a city or the instrument of one of our bardic historians, it kind of develops its own memories, you might say, and becomes a suitable spirit anchor. When he was Master Smith of SharVahl City, Kagazz began collecting the discarded weapons and armor of our fallen heroes and melting them down to make smithing tools. In this way he honored their achievements by passing their experience into new weapons and armor for our young heroes-to-be. As it turns out, these anvils are very strong spirit anchors, so strong that you can [rend shadow] itself.");
  }
  if ($text=~/rend shadow/i) {
    quest::say("That's right. You will be working with the very fabric of shadow and sound, but we'll get to the sound part later. For now, hunt the shades in the Thicket; they hold moderate pieces of the power that you can use to experiment with. The mallet I gave you can be used to gather the shadows into a solid mass if you strike them on this anvil. You're probably best starting with something simple like Shadow disks to begin with.");
  }
  if ($text=~/shadow disk/i) {
    quest::say("Take swirling shadows from the shades in the Thicket and combine them with some metal bits to make a Shadow disk. Fill this box with disks and return it to me with my old mallet,' he pauses, considering your progress and smiling slightly, 'you will have earned your own at that point. Afterwards, I will show you how to manipulate sound to empower the shadows.");
    quest::summonitem(17498); # Barkhem's box
  }
  if ($text=~/humming orb/i) {
    quest::say("You'll need to get a shrieking substance from the sonic wolves that roam the moor and then combine it with a wailing substance from an owlbear. You'll want to pound those two together onto some metal rings with your mallet and anvil to form the humming orb. About three orbs should be plenty. Bring them back to me with your new mallet and I will have something very special to show you.");
  }
  if ($text=~/Shadowscream steel/i) {
    quest::say("Shadowscream steel is made by striking the swirling shadows on your anvil with the Humming Luclinite Hammer and adding a sonic punch. For example, you might place two swirling shadows into a boot mold with a humming orb to make a pair of Shadowscream Steel Boots- use medium sized molds, the magical properties of the material will adjust to any size body. Come to think of it, I have a standing boot order you should be able to fill, it would make a great first job.'");
  }
  if ($text=~/standing boot order/i) {
    quest::say("Rakutah of the Taruun had asked if I would make a few pairs of boots for his new recruits, but alas I have not had the time. If you think you are ready for the job, make up a pair and show them to him. I have every bit of faith in you, $name.");
  }
}

sub EVENT_ITEM {
  # give 2 Bloodling shields : buy 2 carapace shield frame from Barkhem, fill them with Cht`Thk carapaces, combine
  if (plugin::check_handin(\%itemcount, 30658 => 2)) {
    quest::emote("smiles and nods his head in approval before speaking. 'This is some quality work my friend. Although you could use some practice in your style, I can sense true potential in your smithing skills. This was too large for me to use for a shield, but I think you can craft it into some fairly good armor. Just treat it in a forge with nepeta oil and the proper mold, the oil should soften it up enough to become pliable. Once fired in the forge it will harden to the mold. I'd love to see how It turns out.'");
    quest::summonitem(30664);
    quest::summonitem(30664);
  }
  # You can buy Nepeta Oil Extract from a merchant named Chialle in the southern part of Shar Vahl. The mail sectional mold is sold by Apprentice Garr, near Master Barkhem. Combine the oil, mold and two plates in a forge (trivial 32) to create a Bloodling Plate Mail.
  # give Bloodling plate mail
  if (plugin::check_handin(\%itemcount, 30646 => 1) || plugin::check_handin(\%itemcount, 30647 => 1) || plugin::check_handin(\%itemcount, 30648 => 1) || plugin::check_handin(\%itemcount, 30649 => 1) || plugin::check_handin(\%itemcount, 30650 => 1) || plugin::check_handin(\%itemcount, 30651 => 1) || plugin::check_handin(\%itemcount, 30652 => 1) || plugin::check_handin(\%itemcount, 30653 => 1) || plugin::check_handin(\%itemcount, 30654 => 1) || plugin::check_handin(\%itemcount, 30655 => 1) || plugin::check_handin(\%itemcount, 30656 => 1) || plugin::check_handin(\%itemcount, 30657 => 1)) {
    quest::say("I knew that old thing would make a fine bit of armor in the right hands. Talent like yours should not go to waste! Take this, it is the mallet that I used to smith my very first bit, you can learn with it until you earn something better. Here is your first lesson $name, use this mallet to pound out the dents in the guard's shields. The ones guarding the bridges into town will need it most, as they can not leave their posts. Show each guard a [repair order] and have them sign off on it when you are through.");
    quest::summonitem(29802);
  }
 
  # Give Master Barkhem the four work orders, from the 4 khala dun
  if (plugin::check_handin(\%itemcount, 29806 => 1, 29809 => 1, 29812 => 1, 29815 => 1)) {
    quest::emote("shuffles through the work orders. 'Well they have some lovely things to say about your work!'");
    quest::emote("disappears into the back room for a moment only to return dragging some sort of large iron block in his hands and crashes it down on the counter. 'Do you know what this is? I see you nodding your head, and yes it is an anvil... but it is so much more. This is a specially crafted anvil for only my most promising students as not just anyone has it within them to smith on a [spirit anchor].'");
    quest::faction(132,10);
    quest::exp(500);
    quest::summonitem(29816); # Vah Shir Anvil
  }
 
  # Receive Barkhem's Box. Gather eight Swirling Shadows (dropped by shade NPCs in Luclin -- easiest farmable, Lesser Shades in Shadeweaver's Thicket.). Now inside a forge, combine 1 x Swirling Shadows + 1 x Metal Bits + 1 x Vah Shir Anvil + 1 x Vah Shir Apprentice Mallet to create a Shadow Disk (trivial 108). Repeat this process seven more times. Place the eight Shadow Disks into Barkhem's Box to create a Box of Shadow Disks.
  # Head back to Master Barkhem and hand him the box and apprentice mallet.
  # box of shadow disks 29819 (from 8 shadow disk 29818)
  # apprentice mallet 29802
  if (plugin::check_handin(\%itemcount, 29802 => 1, 29819 => 1)) {
    quest::say("Well done, $name! I trust you are beginning to see the power that shadow can grant you. Now it is time for you to learn to manipulate sound. Here is your very own mallet, use it to form the substance of sound into tangible matter. Pound yourself out a few humming orbs and I'll know you're ready to combine shadow and sound into a precarious balance of forces.");
    quest::faction(132,10);
    quest::exp(500);
    quest::summonitem(29820); # Luclinite Mallet
  }
 
  # Create three Humming Orbs and head back to Master Barkhem for your final turn-in. Give the orbs + your Luclinite Mallet in exchange for a Humming Luclinite Mallet, used to make Shadowscream armor.
  # 3 humming orbs 29823 + Luclinite Mallet
  if (plugin::check_handin(\%itemcount, 29820=> 1, 29823 => 3)) {
    quest::emote("looks genuinely pleased with your craftsmanship. He sets down one of the orbs onto a special anvil and swings your mallet high in the air crashing it down on the orb causing it to shatter with a terrible shriek. He repeats this action with each of the remaining orbs and hands you back the now humming mallet. 'Here, $name, this mallet will enable you to combine shadow with sound. Smith wisely and be careful what you create with it,' Barkhem pauses, looking quite serious, 'it is very powerful. You'll be able to make Shadowscream steel with it.'");
    quest::faction(132,10);
    quest::exp(500);
    quest::summonitem(29824); # Humming Luclinite Mallet
  }
 
  # receive Rakutah's Seal
  if (plugin::check_handin(\%itemcount, 29826 => 1)) {
    quest::say("Back already, $name? I've only just sent you out and you've finished your very first professional job, well done! I'm very proud of your progression! My wife and I have made you a pair of greaves that I'm sure you'll love to wear. Take them as a reward on a job well done. I have pressing matters that require my attention right now, or else I'd teach you more about the powers of shadow and sound. Experiment with the Shadowscream steel until I can teach you more.");
    quest::faction(132,10);
    quest::exp(500);
    quest::summonitem(29827); # Barkhem Fancy Pantaloons
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155200 -- Master_Barkhem

