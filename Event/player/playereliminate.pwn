#include <a_samp>


public OnPlayerDeath(playerid, killerid, reason)
{
	if(eventp_JoinedTD[playerid] != -1)
	{
		Event[eventp_JoinedID[playerid]][event_LeftPlayers]--;	
		eventp_Spawned[playerid] = false;
		eventp_JoinedID[playerid] = -1;
		KillTimer(eventp_IsInRangeChecker[playerid]);
	}
	return 1;
}

#if defined _ALS_OnPlayerDeath
#undef OnPlayerDeath
#else
#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath Event_OnPlayerDeath
#if defined Event_OnPlayerDeath
forward Event_OnPlayerDeath();
#endif
