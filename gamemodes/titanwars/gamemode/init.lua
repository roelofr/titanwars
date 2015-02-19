include( 'shared.lua' )
include( 'sv_beta.lua' )

GM.PlayerSpawnTime = {}

--[[---------------------------------------------------------
   Name: gamemode:Initialize( )
   Desc: Called immediately after starting the gamemode 
-----------------------------------------------------------]]
function GM:Initialize( )
end


--[[---------------------------------------------------------
   Name: gamemode:InitPostEntity( )
   Desc: Called as soon as all map entities have been spawned
-----------------------------------------------------------]]
function GM:InitPostEntity( )	
end


--[[---------------------------------------------------------
   Name: gamemode:Think( )
   Desc: Called every frame
-----------------------------------------------------------]]
function GM:Think( )
end


--[[---------------------------------------------------------
   Name: gamemode:ShutDown( )
   Desc: Called when the Lua system is about to shut down
-----------------------------------------------------------]]
function GM:ShutDown( )
end

--[[---------------------------------------------------------
   Name: gamemode:DoPlayerDeath( )
   Desc: Carries out actions when the player dies 		 
-----------------------------------------------------------]]
function GM:DoPlayerDeath( ply, attacker, dmginfo )

	ply:CreateRagdoll()
	
end


--[[---------------------------------------------------------
   Name: gamemode:EntityTakeDamage( ent, info )
   Desc: The entity has received damage	 
-----------------------------------------------------------]]
function GM:EntityTakeDamage( ent, info )
end


--[[---------------------------------------------------------
   Name: gamemode:CreateEntityRagdoll( entity, ragdoll )
   Desc: A ragdoll of an entity has been created
-----------------------------------------------------------]]
function GM:CreateEntityRagdoll( entity, ragdoll )
end

--[[---------------------------------------------------------
	Show the default team selection screen
-----------------------------------------------------------]]
function GM:ShowTeam( ply )

	if (!GAMEMODE.TeamBased) then return end

end

--
-- CheckPassword( steamid, networkid, server_password, password, name )
--
-- Called every time a non-localhost player joins the server. steamid is their 64bit
-- steamid. Return false and a reason to reject their join. Return true to allow
-- them to join. 
--
function GM:CheckPassword( steamid, networkid, server_password, password, name )

	-- The server has sv_password set
	if ( server_password != "" ) then

		-- The joining clients password doesn't match sv_password
		if ( server_password != password ) then
			return false, "#GameUI_ServerRejectBadPassword"
		end

	end
	
    if not gamemode.Call("CanEnterBeta", steamid ) then
        return false, "Sorry, we're currently in a closed beta"
	end
    
	return true

end



--[[---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
-----------------------------------------------------------]]
function GM:PlayerLoadout( pl )

	pl:Give( "weapon_crowbar" )
	
end