local Aye = Aye;
if not Aye.load then return end;

Aye.default.global.AutoReadyCheck = {
	enable = true,						-- Enable Auto Ready Check
	AFKdisable = true,					-- Disable Auto Ready Check if AFK
	DNDdisable = false,					-- Disable Auto Ready Check if DND
	DeadDisable = true,					-- Disable Auto Ready Check if Dead or Ghost
	CombatDisable = true,				-- Disable Auto Ready Check if in Combat
	NotFullHealthDisable = true,		-- Disable Auto Ready Check if Not at Full Health
	NotFullPowerDisable = true,			-- Disable Auto Ready Check if Not at Full Power
	NoBiSFlaskDisable = true,			-- Disable Auto Ready Check if player have No BiS Flask
	NoRuneDisable = false,				-- Disable Auto Ready Check if player have No Rune
	NotWellFedDisable = true,			-- Disable Auto Ready Check if no BiS Well Fed buff
	WellFedTier = 3,					-- Minimum required Well Fed Tier (5 is BiS only)
	BuffTimeEnable = true,				-- Enable Minimum Buff Time setting
	BuffTime = 10,						-- Disable Auto Ready Check if players buff is close to expire (with remaining time left ≤ given minutes)
	GuildGroupDisable = true,			-- Disable Auto Ready Check in Guild group
	LFGDisable = false,					-- Disable Auto Ready Check in LFG group
	PvPDisable = false,					-- Disable Auto Ready Check on PvP (arena, battleground)
	OutsideInstanceDisable = false,		-- Disable Auto Ready Check outside Instance
	GuildGroupForceEnable = false,		-- Force Enable Auto Ready Check in Guild group
	LFGForceEnable = true,				-- Force Enable Auto Ready Check in LFG group
	PvPForceEnable = true,				-- Force Enable Auto Ready Check on PvP (arena, battleground)
	OutsideInstanceForceEnable = false,	-- Force Enable Auto Ready Check outside Instance
	ForceEnableIfMythicBenched = true,	-- Force Enable if Mythic Benched
};