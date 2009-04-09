#i believe this NPCs name is mispelt on Allas it has MalikEn not MalikIn

sub EVENT_SAY
{
	if($text=~/hail/i)
		{
		quest::say("Good day to you, $name. I hope that you are enjoying the sanctuary that this beautiful city of ours provides. We go through great efforts to keep this city not only clean, but extremely safe as well. Have you ever wondered about the [lengths] to which we have to work to maintain the safety of a city as fine as this?");
		}
	if($text=~/lengths/i)
		{
		quest::say("We have to work with great diligence and determination to maintain the security of this sanctum. There are elements that are set on defiling our work here. These antagonists seem to prefer attempts at corrupting people from within our ranks. Weak minds are inevitable, so corruption is unavoidable. That is why the Eye is necessary. We are not here to pry or spy on anyone. We simply maintain the security of our sanctum and weed out any unsavory elements. If you're interested in learning more about [the Eye], I can assign you a [simple task] or two.");
		}
	if($text=~/the eye/i)
		{
		quest::say("The Eye keeps us informed of all that goes on beyond the walls. They are responsible for security and purity inside the walls as well. They also monitor the other three Praesertum.");
		}
	if($text=~/simple task/i)
		{
		quest::say("Simple tasks go a great distance to establish trust. I may know of someone who can help you establish yourself within the ranks of the Eye. If you are interested in performing a task of that nature I can get you started at this time. Would you like to [begin]?");
		}
	if($text=~/begin/i)
		{
		quest::say("Very well, $name. Please, take this coin to Questioner Ontu. She will advise you on your next course of action. There is a decided lack of direction in this matter, for a member of the Eye should always be able to find people. This will be good practice for you. Take care. I hope to speak to you again soon.");
		quest::summonitem(3876); #here there were 3 identical A Heavy Coin all with no lore 3876 3877 abd 3878 after finding no way to distinguish them i chose this one
		}
	if($text=~/meaning/i)
		{
		quest::say("Very good, for I have another task to offer you if you would like to continue. This one is a bit more complicated. Im sure that you can handle it, but I need you to be sure as well. I need this to be a suprise. Do you think that you are [prepared] to handle an issue that will require both stealth and secracy?");
		}
	if($text=~/prepared/i)
		{
		quest::say("Please take the coin I have just given you and find my friend, Consis Sinsolus. He can often be found walking in one of the park areas. I'm beginning to believe that he has a mild infatuation with trees. Please take the coin that i have given you and slip it into my friend's left coat pocket. When you do so, please remove the coin that you will find in his pocket and bring it to me. Accomplish this task without error and I may have a special task for you. Take care not to get caught. I would prefer the swap remain a suprise for him to discover on his own.");
		}
	if($text=~/attacks/i)
		{
		quest::say("We have found evidence that there is a traitor within the ranks of one of the other Praesurtum. We need you to help us remove this traitor and his contact in Katta Castellum. You will need to take this poison and pour it into our [target]'s ear while he sleeps.");
		quest::summonitem(3880);
		}
	if($text=~/target/i)
		{
		quest::say("The traitor's name is Ornis Tranum. You should be able to get into his house with little to no resistance. Just be sure to take care when entering and leaving the building. We do not need to bring attention to the Eye in this matter. Once you have poured the poison into Ornis' ear, he will be unable to move. Just place the coin that you took from Consis on Ornis' body and leave. Bring me the empty poison vial, so that I can be sure that no evidence was left behind. Once that is done, we can deal with his contact.");
		}
}

sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3877 => 1)) {
    quest::say("Good job! I'm glad that you have returned. I'm also very glad that you were able to see this task as what it was, a purpose to be fulfilled. I'm not sure that you understand, so please allow me to elaborate. The coin that i handed you has great value. That value is obvious in the fact that the coin is made of a precious metal and carries with it more wright than a standard coin. That said, you did not take the coin for your personal gain. You simple carried out your purpose. The fact that you can be trusted has earned you that coin. Do you understand the [meaning of the task] now?");
    quest::summonitem(3878);
  }
  if (plugin::check_handin(\%itemcount, 3879 => 1)) {
    quest::say("Splendid job, $name! You managed that task quite nicely. Please, keep the coin. The most important part of that task was the fact that you did not stop to question what was being asked of you. That sort of trust is commendable. The Eye is looking for people like you. We need people who display not only integrity, but trust. Trust in our purpose here and you will do well. Out means may seem a bit harsh at times, but we are here to protect our people from an enemy whose methods are without honor. It is one of those very [attacks] on our people that I will need your help with at this time.");
    quest::summonitem(3879);
  }
  if (plugin::check_handin(\%itemcount, 3882 => 1)) {
    quest::say("Your worth to us is not going unnoticed. There are many people within the Eye that are very pleased with your progress. Finish this next task and we will have something for you. Your willingness to assist us with this most unpleasant task is a great display of allegiance. We are very excited about your future with us, but let's finish with this before we talk further. Take this poison and do with it as you did to Ornis. This time the target is a guard within Katta Castellum. His name is Erallic. Find him when he is asleep after a guard shift and kill him. Be sure to bring me the empty vial and be careful. They will have guards posted. Stealth is key in this matter. Take care.");
    quest::summonitem(3881);
  }
  if (plugin::check_handin(\%itemcount, 3883 => 1)) {
    quest::say("It is good to see you again friend. Your deeds are well known within the ranks of the Eye. You have allowed us to remove several traintors from the walls of this sanctum. We are extremely tankful for you dedication and efforts. Please take this gift and watch for us to call upon you again in the bear future.");
    quest::faction(37,-2); #Citizens of Seru
    quest::faction(139,-2); #Hand of Seru
    quest::faction(142,-2); #Heart of Seru
    quest::faction(96,2); #Eye of Seru
    quest::faction(298,-2); #Shoulders of Seru
    quest::faction(168,-2); #Katta Castellum Citizens
    quest::exp(100);
    quest::summonitem(3884);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#End of File zone: sseru ID: 159311 159574 -- Examiner Malikin
#By Kovou