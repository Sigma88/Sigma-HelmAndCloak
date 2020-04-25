local SHC = CreateFrame("Frame");

SHC:RegisterEvent("PLAYER_ENTERING_WORLD");
SHC:RegisterEvent("UNIT_INVENTORY_CHANGED");

function SHC.ShowHelm(flag)
	local helm = GetInventoryItemLink("player", 1);
	
	if helm then
		if not Sigma_HelmAndCloak then
			Sigma_HelmAndCloak = {};
		end
		
		if flag then
			Sigma_HelmAndCloak[helm] = "On";
		else
			Sigma_HelmAndCloak[helm] = "Off";
		end
	end
	SHC.HelmButton:SetChecked(flag);
	SHC.baseShowHelm(flag);
end

SHC.baseShowHelm = ShowHelm;
ShowHelm = SHC.ShowHelm;

function SHC.ShowCloak(flag)
	local cloak = GetInventoryItemLink("player", 15);
	
	if cloak then
		if not Sigma_HelmAndCloak then
			Sigma_HelmAndCloak = {};
		end
		
		if flag then
			Sigma_HelmAndCloak[cloak] = "On";
		else
			Sigma_HelmAndCloak[cloak] = "Off";
		end
	end
	SHC.CloakButton:SetChecked(flag);
	SHC.baseShowCloak(flag);
end

SHC.baseShowCloak = ShowCloak;
ShowCloak = SHC.ShowCloak;

function SHC:OnEvent(event, arg1)
	if event == "PLAYER_ENTERING_WORLD" then
		SHC:Update();
	end
	if event == "UNIT_INVENTORY_CHANGED" and arg1 == "player" then
		SHC:Update();
	end
end

function SHC:Update()
	-- Check if there is saved data
	if not Sigma_HelmAndCloak then
		Sigma_HelmAndCloak = {};
	end
	-- Check if the helm is listed
	local helm = GetInventoryItemLink("player", 1);
	if helm then
		if not Sigma_HelmAndCloak[helm] then
			if ShowingHelm() then
				Sigma_HelmAndCloak[helm] = "On";
			else
				Sigma_HelmAndCloak[helm] = "Off";
			end
		else
			ShowHelm(Sigma_HelmAndCloak[helm] == "On");
		end
	end
	-- Check if the cloak is listed
	local cloak = GetInventoryItemLink("player", 15);
	if cloak then
		if not Sigma_HelmAndCloak[cloak] then
			if ShowingCloak() then
				Sigma_HelmAndCloak[cloak] = "On";
			else
				Sigma_HelmAndCloak[cloak] = "Off";
			end
		else
			ShowCloak(Sigma_HelmAndCloak[cloak] == "On");
		end
	end
end

SHC:SetScript("OnEvent", SHC.OnEvent);

-- Helm Button
SHC.HelmButton = CreateFrame("CheckButton", nil, CharacterHeadSlot, "UICheckButtonTemplate");
SHC.HelmButton:SetPoint("BOTTOMLEFT");
SHC.HelmButton:SetWidth(15);
SHC.HelmButton:SetHeight(15);
SHC.HelmButton.BG = SHC.HelmButton:CreateTexture(nil, "BACKGROUND")
SHC.HelmButton.BG:SetPoint("CENTER")
SHC.HelmButton.BG:SetColorTexture(0, 0, 0, 0.75)
SHC.HelmButton.BG:SetWidth(9);
SHC.HelmButton.BG:SetHeight(8);
SHC.HelmButton:SetScript("OnClick", function() ShowHelm(not ShowingHelm()); end);
SHC.HelmButton:SetScript("OnShow", function() SHC.HelmButton:SetChecked(ShowingHelm()); end);

-- Cloak Button
SHC.CloakButton = CreateFrame("CheckButton", nil, CharacterBackSlot, "UICheckButtonTemplate");
SHC.CloakButton:SetPoint("BOTTOMLEFT");
SHC.CloakButton:SetWidth(15);
SHC.CloakButton:SetHeight(15);
SHC.CloakButton.BG = SHC.CloakButton:CreateTexture(nil, "BACKGROUND")
SHC.CloakButton.BG:SetPoint("CENTER")
SHC.CloakButton.BG:SetColorTexture(0, 0, 0, 0.75)
SHC.CloakButton.BG:SetWidth(9);
SHC.CloakButton.BG:SetHeight(8);
SHC.CloakButton:SetScript("OnClick", function() ShowCloak(not ShowingCloak()); end);
SHC.CloakButton:SetScript("OnShow", function() SHC.CloakButton:SetChecked(ShowingCloak()); end);
