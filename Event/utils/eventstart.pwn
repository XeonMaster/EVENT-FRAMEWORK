new 
	event_StartTime[MAX_EVENTS],
	event_StartCounterTimer[MAX_EVENTS],
	event_CheckWinerTimer[MAX_EVENTS]
;
	
forward public event_StartCounter(eventid);

stock event_Start(eventid, intime)
{
	Event[eventid][event_Started] = true;
	event_StartTime[eventid] = intime;
	event_StartCounterTimer[eventid] = SetTimerEx("event_StartCounter", 1000, true, "i", eventid);
	return 1;
}

public event_StartCounter(eventid)
{
	if(event_StartTime == 0)
	{
		KillTimer(event_StartCounterTimer[eventid]);
		if(Event[eventid][event_LeftPlayers] == 1)
		{
			SendClientMessageToAll(-1, "Event Canceled, Only 1 player joined.");
			Event[eventp_JoinedID[eventid]][event_Started] = false;
			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++) if(eventp_JoinedID[i] != -1) SpawnPlayer(i);

		}
		else
		{
			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
			{
				if(!eventp_JoinedID[i] == -1) continue;
				TogglePlayerControllable(i, true);
				Event[eventp_JoinedID[i]][event_PlayerCantJoin] = true;
				event_CheckWinerTimer[eventid] = SetTimer("event_CheckWinner", 100, true, "i", eventid);
			}
		}
	}
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(eventp_JoinedID[i] != -1)
		{
			new string[27];
			format(string, sizeof(string), "EVENT STARING IN %d SECOND", event_StartTime[eventid]);
			GameTextForPlayer(i, string, 1000, 1);
		}
	}
	event_StartTime[eventid]--;
}
