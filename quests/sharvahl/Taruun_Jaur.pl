sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Aye, the Sergeant's had us in the moor all week. It's been a long week too. The critters out there are behaving all peculiar.");
  }
  if ($signal == 2) {
    quest::say("Well, I'll tell you a quick story if you fill my mug again. Sound like a deal? Otherwise, I'll just head over to Rawlf's place and let him hear it.");
  }
  if ($signal == 3) {
    quest::say("Okay... here it goes... We were all sneaking along on patrol one night. We had just broke camp and were moving along the ledge near the big Hollowshade wolf cave. When we got near the cave, we notice a large pack of those nasty buggers... like eight or nine massive wolves... and they were coming right at us!");
  }
  if ($signal == 4) {
    quest::say("No no... this is where it gets weird. The creatures just walked right through our patrol. They acted like they didn't even see us. We were all tensed up and ready for a fight and those beasts just ignored us. We stood still for a few moments and let them pass. Then it got a bit weirder.");
  }
}
