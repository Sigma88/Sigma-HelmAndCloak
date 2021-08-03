-- ElvUI Compatibility
if ElvUI then
	local _, SHC = ...;
	local E = unpack(ElvUI);
	local S = E:GetModule('Skins');
	
	S:HandleCheckBox(SHC.HelmButton, true);
	SHC.HelmButton:SetWidth(10);
	SHC.HelmButton:SetHeight(10);
	SHC.HelmButton:ClearAllPoints();
	SHC.HelmButton:SetPoint("BOTTOMLEFT", 2, 1.5);
	
	SHC.HelmButtonBG = CreateFrame("Frame", nil, SHC.HelmButton);
	SHC.HelmButtonBG:ClearAllPoints();
	SHC.HelmButtonBG:SetPoint("CENTER", SHC.HelmButton, "CENTER", 0, 0);
	SHC.HelmButtonBG:SetWidth(10);
	SHC.HelmButtonBG:SetHeight(10);
	SHC.HelmButtonBG.t = SHC.HelmButtonBG:CreateTexture(nil, "BACKGROUND");
	SHC.HelmButtonBG.t:SetAllPoints();
	SHC.HelmButtonBG.t:SetColorTexture(0,0,0.4,0.8);
	SHC.HelmButtonBG:SetFrameLevel(4);
	SHC.HelmButton:SetFrameLevel(4);
	
	
	S:HandleCheckBox(SHC.CloakButton, true);
	SHC.CloakButton:SetWidth(10);
	SHC.CloakButton:SetHeight(10);
	SHC.CloakButton:ClearAllPoints();
	SHC.CloakButton:SetPoint("BOTTOMLEFT", 2, 1.5);
	
	SHC.CloakButtonBG = CreateFrame("Frame", nil, SHC.CloakButton);
	SHC.CloakButtonBG:ClearAllPoints();
	SHC.CloakButtonBG:SetPoint("CENTER", SHC.CloakButton, "CENTER", 0, 0);
	SHC.CloakButtonBG:SetWidth(10);
	SHC.CloakButtonBG:SetHeight(10);
	SHC.CloakButtonBG.t = SHC.CloakButtonBG:CreateTexture(nil, "BACKGROUND");
	SHC.CloakButtonBG.t:SetAllPoints();
	SHC.CloakButtonBG.t:SetColorTexture(0,0,0.4,0.8);
	SHC.CloakButtonBG:SetFrameLevel(4);
	SHC.CloakButton:SetFrameLevel(4);
end
