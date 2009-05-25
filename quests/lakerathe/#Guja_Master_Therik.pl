sub EVENT_SAY {
  if ($text=~/amphibious abilities/i) {
    quest::say("That's why you're here, recruit! The lake is a great place to train swimming and aquatic combat. And those skills are core to the Guja way of life. We use land and sea to assault our foes. Whoops. . .I'm going on again. Let's get to your [training].");
  }
  if ($text=~/training/i) {
    quest::say("First off, you need to get your swimming as high as possible. Get it to 130 and we can start. The numbers? Oh, that's just Sugal's own little accounting. Tell me when your [swimming] is [ready].");
  }
  if($client->GetSkill(50) >= 130) {
  if ($text=~/swimming is ready/i) {
    quest::say("Good! Kick those legs. Ready for your first amphibious attack? Good. Gnolls wander all around the lake edge. Conceal yourself in the water. Stalk them. Slay them. Then bring me 4 of their tongues to show you've done your work.");
  }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63099 =>1 )) {
    quest::say("Ha! Oh my, it's been awhile. So Sugal is still kicking, eh? Sending me frog teeth. . .what a pain he is. Hmm . . .something wrong? Oh! You haven't fully developed your [amphibious abilities]. I'll get to the point.");
  }
  if (plugin::check_handin(\%itemcount, 63100 =>4 )) {
    quest::say("Good trophies those are. Let's test your skills again. This time, the target is up to you. But you must fight only in the water. Hunt the fish and goblins that fill this lake. Find me 4 lake pebbles. The aquatics here swallow them as ballast. Bring them back and I'll know you've slit some bellies.");
    quest::summonitem(63112);
  }
  if (plugin::check_handin(\%itemcount, 63101 =>4 )) {
    quest::say("Sugal is an amazing judge of talent. Take this second marker for the moment. But, unfortunately, we must follow procedure. Every Guja is required to prove their ability in the water beyond a doubt. And only a fight will do. Give me both of your markers and your Guja token when you are ready. I'll call a beast from deep within the lake. Make sure to take the creature's eye. . .assuming you live. I will want it as proof of your success.");
    quest::summonitem(63113);
  }
  if (plugin::check_handin(\%itemcount, 63112 =>1, 63113 =>1, 63091 =>1 )) {
    quest::spawn2(51171,0,0,1613,156,-224,155); 
  }
  if (plugin::check_handin(\%itemcount, 14166 =>1 )) {
    quest::say("Well done. You have earned a notch for your token, warrior. You are but a step away from joining our ranks. But that step is a long one. Practice your skills, for they will need to be very advanced. Then return to Sugal and give him your token.");
    quest::summonitem(63098);
  }
}