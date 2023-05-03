include("autorun/sh_hudscp.lua")

hook.Add("HUDPaint", "MonHUD", function()
    -- start variables
	local scrw,scrh = ScrW(), ScrH() -- screen size automatic for the player
    local ply = LocalPlayer() -- player
    local hp = ply:Health() -- health player
    local maxhp = ply:GetMaxHealth() -- max health player
	local boxW = scrw * .1 -- width 
    local boxH = scrh * .02 -- height
    local armor = ply:Armor()
    local maxarmor = ply:GetMaxArmor()
    --end variable

    -- start health
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 1.1,  boxW, boxH)
    surface.SetDrawColor(255,0,0)
	surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 1.1,  boxW * (hp / maxhp), boxH)
    -- end health
    -- start armor

    if armor < 0 then armor = 0 elseif armor > 100 then armor = 100 end
    if armor != 0 then
        surface.SetDrawColor(0,0,0,200)
        surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 2.2,  boxW, boxH)
        surface.SetDrawColor(0,0,255)
        surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 2.2,  boxW * (armor / maxarmor), boxH) 
    end
    -- end armor
end) 


--Ancien HUD
local HideElements = { "DarkRP_HUD", "DarkRP_LocalPlayerHUD", "DarkRP_EntityDisplay", "DarkRP_Agenda", "DarkRP_Hungermod" }
 
local disable = {
CHudHealth = true,
CHudBattery = true,
CHudAmmo = true,
CHudSecondaryAmmo = true,
DarkRP_HUD = true,
DarkRP_Hungermod = true,
}
 
hook.Add( 'HUDShouldDraw', 'Inumix:HUD:HideDefault', function( object )
if ( disable[ object ] ) then
return false
end
end )