sub EVENT_DEATH {
  quest::emote("cries out, her booming alto echoing with contempt,");
  quest::say("Your victory here is hollow. With my death, the way to the lower reaches is unsealed. The denizens below destroy everything they touch. You will suffer their wrath!");
  quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
  quest::setglobal("inktdoor",1,3,"H6");
  quest::spawn2(296027,0,0,165,-496,-27,64);
}