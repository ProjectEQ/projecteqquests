#send signal to Durgin_Skell(237743) that a slippery sludge has died


sub EVENT_DEATH_COMPLETE {
  quest::signalwith(237743,1,1);
}