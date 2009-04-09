sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("What how did you see me? Never mind I guess it doesn't matter at this point. Our [goal] has become unattainable.");
 }
 if($text =~ /What goal/i) {
	quest::say("When my younger brother heard that something had happened here in these ruins he went looking for fortune and glory with a [party] made up of old friends.");
 }
 if($text =~ /What party/i) {
	quest::say("As far as I know they are all treasure seekers and explorers like him, but his fate has become less of a priority to me as my attention has been placed on my other [brothers] that accompanied me here.");
 }
 if($text =~ /What brothers/i) {
	quest::say("Well to make a long story short, my other brothers and I tracked the party here, but when we found that disenchanted earth elemental we all stopped to investigate. What we found was quite extraordinary. A piece of [paper] that looked like it had been ripped from a journal was clenched in the hand of this elemental.");
 }
 if($text =~ /What paper/i) {
	quest::say("The paper detailed an ancient magic spell that we believe is responsible for the constructs that recently inhabited these ruins. Now gnomes being gnomes we all begin to wonder if we could decipher the ancient text the spell was written in and use the spell for the greater good of our kind. But then I begin to have a [doubt].");
 }
 if($text =~ /What doubt/i) {
	quest::say("Well after thinking about it a little I realized that there must be a reason why this magic had not been found. Many have passed through these ruins and this had never been discovered by anyone. It must have been hidden for a reason and as such I told my brothers that we should leave it here as it could bring more bad then good. That's when something [happened] I was not prepared for.");
 }
 if($text =~ /What happened/i) {
	quest::say("One of them, Stiggles, turned to me and told me to shut my trap. The other, Tani turned to him and demanded that he give him the paper. They begin to argue back and forth and then a small scuffle broke out between the two. I tried to break it up, but before I could I heard the paper rip in two. Standing across from each other with a torn piece of paper in their hands they looked at me and gated home leaving me here in danger and very [worried].");
 }
 if($text =~ /Worried/i) {
	quest::say("This power cannot be given to my kin. It is dangerous and I must figure out how to get those pieces back. . . Hey you seem pretty interested in this to have listened so long. You think you could do me a [favor]?");
 }
 if($text =~ /What favor/i) {
	quest::say("Find my brothers and when you do give them each a note I have written for them. Hopefully it will help them understand why the information contained on that piece of paper must be kept here. Finding them will not be easy but I can tell you that Stiggles use to spend a lot of his time alone in a dragon graveyard inhabited by phase spiders. Tani may be near the home of the Sarnaks, he was looking into some intriguing discovery around there before he decided to accompany me here. They should give you the piece they have and then I will need you to bring them back here to me so I can fix this mess.");
        quest::summonitem("67053");
        quest::summonitem("67054");
 }
}


