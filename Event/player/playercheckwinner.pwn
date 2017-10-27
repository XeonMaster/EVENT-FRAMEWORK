

forward event_CheckWinner(eventid);
public event_CheckWinner(eventid)
{
	if(Event[eventid][event_LeftPlayers] == 1)
	{
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if(eventp_JoinedID[i][eventid] != -1)
			{
				Event[eventid][event_Started] = false;
				Event[eventid][event_PlayerCantJoin] = false;
				Event[eventid][event_LeftPlayers] = 0;
				eventp_Spawned[i] = false;
				eventp_JoinedID[i][eventid] = -1;			
				SpawnPlayer(i);
				KillTimer(event_CheckWinerTimer);
				break;
			}
		}
	}
}
