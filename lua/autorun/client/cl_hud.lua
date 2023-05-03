include("autorun/sh_hudscp.lua")

hook.Add("HUDPaint", "MonHUD", function()
	local scrw,scrh = ScrW(), ScrH()
    local ply = LocalPlayer()
    local hp = ply:Health()
    local maxhp = ply:GetMaxHealth()
	local boxW = scrw * .1
    local boxH = scrh * .02
    -- start health
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 1.1,  boxW, boxH)
    surface.SetDrawColor(255,0,0)
	surface.DrawRect(scrw - boxW * 9.98, scrh - boxH * 1.1,  boxW * (hp / maxhp), boxH)
    -- end health
end) 