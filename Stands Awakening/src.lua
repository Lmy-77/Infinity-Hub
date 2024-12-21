local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Input_0 = l_ReplicatedStorage_0.Main.Input;
local l_Anchor_0 = l_ReplicatedStorage_0.Anchor;
local _ = l_ReplicatedStorage_0.Trail;
local l_Menacing_0 = l_ReplicatedStorage_0.Main.Menacing;
local _ = l_ReplicatedStorage_0.KnockClient;
local _ = l_ReplicatedStorage_0.Knocked;
local _ = l_ReplicatedStorage_0.GetUp;
local l_Trail_1 = l_ReplicatedStorage_0.Trail;
local v9 = false;
if game:GetService("UserInputService").TouchEnabled then
    v9 = true;
end;
local v10 = 16;
local v11 = 50;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_MobileGUI_0 = l_PlayerGui_0:WaitForChild("MobileGUI");
local l_CombatBar_0 = l_PlayerGui_0:WaitForChild("CombatBar");
local l_TopBar_0 = l_CombatBar_0:WaitForChild("TopBar");
local l_BottomBar_0 = l_CombatBar_0:WaitForChild("BottomBar");
local _ = game:GetService("TweenService");
local _ = game:GetService("StarterGui");
l_CombatBar_0.Enabled = true;
l_BottomBar_0.Position = UDim2.new(0, 0, 1, 0);
l_TopBar_0.Position = UDim2.new(0, 0, -0.2, 0);
repeat
    wait();
until l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.Humanoid;
local l_Character_0 = l_LocalPlayer_0.Character;
local l_Torso_0 = l_Character_0.Torso;
local l_Humanoid_0 = l_Character_0.Humanoid;
local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
for _, v25 in pairs(l_ReplicatedStorage_0.Effects.Dust:GetChildren()) do
    v25:Clone().Parent = l_HumanoidRootPart_0;
end;
local v26 = {
    DodgeDebounce = false, 
    BlockDebounce = false, 
    JabDebounce = false, 
    BoostDebounce = false, 
    CounterDebounce = false, 
    KickDebounce = false, 
    SkyDancerDebounce = false, 
    HeavyPunchDebounce = false, 
    DashDebounce = false, 
    PunchDebounce = false, 
    WallPunchDebounce = false
};
mouse = l_LocalPlayer_0:GetMouse();
cam = workspace.CurrentCamera;
local _ = l_Character_0:WaitForChild("ExBoost");
local l_Hitbox_0 = l_Character_0:WaitForChild("Hitbox");
local v29 = false;
local l_Head_0 = l_Character_0.Head;
local l_Torso_1 = l_Character_0.Torso;
local v32 = l_Character_0["Right Arm"];
local v33 = l_Character_0["Left Arm"];
local v34 = l_Character_0["Right Leg"];
local v35 = l_Character_0["Left Leg"];
local _ = l_Character_0.HumanoidRootPart;
local l_HitCount_0 = l_Character_0:WaitForChild("HitCount");
local l_Stand_0 = l_Character_0:WaitForChild("Stand");
local l_Disabled_0 = l_Character_0:WaitForChild("Disabled");
local _ = l_Stand_0:WaitForChild("LeftEffect");
local l_RightEffect_0 = l_Stand_0:WaitForChild("RightEffect");
local _ = l_Stand_0:WaitForChild("Block");
local v43 = {};
for _, v45 in pairs(l_Stand_0:GetChildren()) do
    if v45:IsA("Animation") then
        v43[v45.Name] = l_Humanoid_0:LoadAnimation(v45);
    end;
end;
local v46 = Instance.new("BoolValue", l_LocalPlayer_0.Character);
v46.Name = "SoundCheck";
v46.Value = false;
local l_HitCount_1 = l_PlayerGui_0:WaitForChild("HitCount");
local l_Frame_0 = l_HitCount_1:WaitForChild("Frame");
l_HitCount_1.Enabled = true;
local v49 = {};
for _, v51 in pairs(l_Torso_1:GetChildren()) do
    if v51:IsA("Sound") then
        v49[v51.Name] = l_Torso_1[v51.Name];
    end;
end;
local v52 = {};
for _, v54 in pairs(script.Cooldowns:GetChildren()) do
    if v54:IsA("BoolValue") then
        v52[v54.Name] = script.Cooldowns[v54.Name];
    end;
end;
local v55 = 1;
wait(0.5);
local l_Animate_0 = l_Character_0:WaitForChild("Animate");
DustChange = function(v57) --[[ Line: 134 ]] --[[ Name: DustChange ]]
    for _, v59 in pairs(l_HumanoidRootPart_0:GetChildren()) do
        if v59.Name == "Dust" then
            if v57 == false then
                v59.ParticleEmitter.Lifetime = NumberRange.new(0, 0);
            else
                v59.ParticleEmitter.Lifetime = NumberRange.new(1, 1);
            end;
            v59.ParticleEmitter.Enabled = v57;
        end;
    end;
end;
DustChange(false);
local v60 = false;
local v61 = false;
local v62 = false;
local v63 = false;
local l_UserInputService_0 = game:GetService("UserInputService");
local v65 = false;
l_UserInputService_0.InputBegan:Connect(function(v66) --[[ Line: 158 ]]
    if v66.KeyCode == Enum.KeyCode.X then
        v65 = true;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v67) --[[ Line: 164 ]]
    if v67.KeyCode == Enum.KeyCode.X then
        v65 = false;
    end;
end);
for _, v69 in pairs(l_Frame_0:GetChildren()) do
    if v69:IsA("TextLabel") then
        v69.TextTransparency = 1;
        v69.TextStrokeTransparency = 1;
    end;
end;
local v70 = false;
state = function() --[[ Line: 181 ]] --[[ Name: state ]]
    local l_l_Humanoid_0_State_0 = l_Humanoid_0:GetState();
    if l_l_Humanoid_0_State_0 == Enum.HumanoidStateType.Freefall then
        v70 = true;
        return;
    else
        if l_l_Humanoid_0_State_0 == Enum.HumanoidStateType.Running then
            v70 = false;
        end;
        return;
    end;
end;
SkyDancer = function() --[[ Line: 191 ]] --[[ Name: SkyDancer ]]
    if v62 then
        return;
    elseif v63 then
        return;
    elseif v29 then
        return;
    elseif v61 then
        return;
    elseif v29 then
        return;
    elseif v26.SkyDancerDebounce then
        return;
    else
        v29 = true;
        v26.SkyDancerDebounce = true;
        l_Humanoid_0.JumpPower = 0;
        l_Input_0:FireServer("Alternate", "super", true);
        state();
        local v72 = nil;
        coroutine.resume(coroutine.create(function() --[[ Line: 212 ]]
            local v73 = l_HumanoidRootPart_0.CFrame * CFrame.new(0, -4, 0) * CFrame.fromOrientation(-1.5707963267948966, 1.5707963267948966, 3.141592653589793);
            coroutine.resume(coroutine.create(function() --[[ Line: 217 ]]
                _G.Effect("Counter VFX", nil, Color3.fromRGB(255, 0, 4), v73);
            end));
            if not v70 then
                v72 = Instance.new("BodyPosition", l_Character_0.HumanoidRootPart);
                v72.MaxForce = Vector3.new(1e999, 65000, 1e999, 0);
                v72.P = 50000;
                v72.Position = l_HumanoidRootPart_0.Position + Vector3.new(0, 8, 0, 0);
            elseif v70 then
                v72 = Instance.new("BodyPosition", l_Character_0.HumanoidRootPart);
                v72.MaxForce = Vector3.new(1e999, 65000, 1e999, 0);
                v72.P = 50000;
                v72.Position = l_HumanoidRootPart_0.Position + Vector3.new(0, 4, 0, 0);
            end;
            v43.SkyJump:Play();
            v49.SkyDanceJump:Play();
            wait(0.2);
            l_Humanoid_0.AutoRotate = false;
            l_HumanoidRootPart_0.Anchored = true;
            local v74 = false;
            local v75 = nil;
            local v76 = nil;
            local function v79() --[[ Line: 253 ]] --[[ Name: Slam ]]
                v74 = true;
                game.Debris:AddItem(v72, 0);
                l_Humanoid_0.AutoRotate = true;
                if game.Lighting.TS.Value == false then
                    l_HumanoidRootPart_0.Anchored = false;
                end;
                local v77 = Instance.new("BodyPosition", l_Character_0.HumanoidRootPart);
                v77.MaxForce = Vector3.new(1e999, 85000, 1e999, 0);
                v77.P = 50000;
                v77.Position = l_HumanoidRootPart_0.Position - Vector3.new(0, 24, 0, 0);
                game.Debris:AddItem(v77, 0.3);
                v43.SkyDancer:Play();
                v49.Voice2:Play();
                wait(0.1);
                if v75 ~= nil then
                    v75:Disconnect();
                end;
                if v76 ~= nil then
                    v76:Disconnect();
                end;
                l_Input_0:FireServer("Alternate", "Sky");
                coroutine.resume(coroutine.create(function() --[[ Line: 286 ]]
                    for _ = 1, 15 do
                        wait(0.02);
                        Hito("SkyDance", l_Hitbox_0, l_Hitbox_0.CFrame, 0);
                    end;
                end));
                v29 = false;
                l_Humanoid_0.JumpPower = v11;
                wait(0.1);
                if v72 ~= nil then
                    v72:Destroy();
                end;
            end;
            v75 = mouse.KeyDown:Connect(function(v80) --[[ Line: 308 ]]
                if v80 == "v" and v74 == false then
                    v79();
                end;
            end);
            v76 = l_MobileGUI_0.V.MouseButton1Down:Connect(function() --[[ Line: 319 ]]
                if v74 == false then
                    v79();
                end;
            end);
            wait(0.8);
            if v74 == false then
                if v75 ~= nil then
                    v75:Disconnect();
                end;
                if Connect2 ~= nil then
                    Connect2:Disconnect();
                end;
                l_Humanoid_0.AutoRotate = true;
                if game.Lighting.TS.Value == false then
                    l_HumanoidRootPart_0.Anchored = false;
                end;
                v29 = false;
                l_Humanoid_0.JumpPower = v11;
                wait(0.1);
                if v72 ~= nil then
                    v72:Destroy();
                end;
            end;
            l_Input_0:FireServer("Alternate", "super", false);
            l_Input_0:FireServer("Alternate", "Sky");
        end));
        return;
    end;
end;
Block = function() --[[ Line: 369 ]] --[[ Name: Block ]]
    if v62 then
        return;
    elseif v63 then
        return;
    elseif v29 then
        return;
    elseif v26.BlockDebounce then
        return;
    elseif v61 then
        return;
    else
        v26.BlockDebounce = true;
        v11 = 0;
        v10 = 0;
        l_Humanoid_0.WalkSpeed = v10;
        l_Humanoid_0.JumpPower = v11;
        v61 = true;
        v29 = true;
        local v81 = true;
        l_Input_0:FireServer("Alternate", "Block");
        local v83 = l_Input_0.OnClientEvent:Connect(function(v82) --[[ Line: 389 ]]
            if v82 == "block" then
                spawn(function() --[[ Line: 392 ]]
                    while wait(0.01) and v81 ~= false do
                        if v65 == false and v9 == false then
                            v81 = false;
                            l_Input_0:FireServer("x", "Up");
                        end;
                    end;
                end);
            end;
        end);
        local v84 = nil;
        if v9 then
            v84 = l_MobileGUI_0.X.MouseButton1Down:Connect(function() --[[ Line: 412 ]]
                v81 = false;
                l_Input_0:FireServer("x", "Up");
            end);
        end;
        local v86 = l_Input_0.OnClientEvent:Connect(function(v85) --[[ Line: 418 ]]
            if v85 == "end" then
                v81 = false;
            end;
        end);
        v43.Block:Play(0.1, 1, 1);
        v49.Guard:Play();
        l_Humanoid_0.JumpPower = 0;
        repeat
            wait();
        until v81 == false or not l_Character_0 or l_Character_0.Disabled.Value == true or l_Character_0.Parried.Value == true;
        v83:Disconnect();
        v86:Disconnect();
        if v9 then
            v84:Disconnect();
        end;
        v11 = 50;
        v10 = 18;
        if l_Character_0.Disabled.Value == false and l_Character_0.Parried.Value == false then
            l_Humanoid_0.WalkSpeed = v10;
            l_Humanoid_0.JumpPower = v11;
        end;
        v43.Block:Stop(0.1);
        v29 = false;
        v61 = false;
        return;
    end;
end;
local v87 = false;
l_UserInputService_0.InputBegan:Connect(function(v88) --[[ Line: 459 ]]
    if v88.KeyCode == Enum.KeyCode.F then
        v87 = true;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v89) --[[ Line: 465 ]]
    if v89.KeyCode == Enum.KeyCode.F then
        v87 = false;
    end;
end);
Counter = function() --[[ Line: 471 ]] --[[ Name: Counter ]]
    if v62 then
        return;
    elseif v63 then
        return;
    elseif v29 then
        return;
    elseif v26.CounterDebounce then
        return;
    elseif v61 then
        return;
    else
        v26.CounterDebounce = true;
        v11 = 0;
        v10 = 0;
        l_Humanoid_0.WalkSpeed = v10;
        l_Humanoid_0.JumpPower = v11;
        v61 = true;
        v29 = true;
        local v90 = true;
        l_Input_0:FireServer("Alternate", "Counter");
        local v91 = false;
        spawn(function() --[[ Line: 493 ]]
            local v92 = 0.4;
            repeat
                v92 = v92 - game:GetService("RunService").Heartbeat:Wait();
            until v92 <= 0 or v87 == false or v91 == true and v9;
            if v92 <= 0 and v87 == true or v91 == true and v9 then
                _G.FOVUpdate("Add", -5);
                v92 = 0.4;
                repeat
                    v92 = v92 - game:GetService("RunService").Heartbeat:Wait();
                until v92 <= 0 or v87 == false or v91 == true and v9;
                if v92 <= 0 and v87 == true or v91 == true and v9 then
                    _G.FOVUpdate("Add", -5);
                end;
            end;
        end);
        local v94 = l_Input_0.OnClientEvent:Connect(function(v93) --[[ Line: 519 ]]
            if v93 == "block2" then
                spawn(function() --[[ Line: 522 ]]
                    while wait(0.01) and v90 ~= false do
                        if v87 == false and v9 == false then
                            v90 = false;
                            l_Input_0:FireServer("f", "Up");
                        end;
                    end;
                end);
            end;
        end);
        local v96 = l_Input_0.OnClientEvent:Connect(function(v95) --[[ Line: 539 ]]
            if v95 == "end" then
                v90 = false;
            end;
        end);
        local v97 = nil;
        if v9 then
            v91 = true;
            v97 = l_MobileGUI_0.F.MouseButton1Down:Connect(function() --[[ Line: 552 ]]
                v90 = false;
                l_Input_0:FireServer("f", "Up");
                v91 = false;
            end);
        end;
        v43.Idle:Play(0.1, 1, 1);
        v49.Guard:Play();
        v49.Flames:Play();
        l_Humanoid_0.JumpPower = 0;
        repeat
            wait();
        until v90 == false or not l_Character_0 or l_Character_0.Disabled.Value == true or l_Character_0.Parried.Value == true or v91 == false and v9 == true;
        v94:Disconnect();
        v96:Disconnect();
        v11 = 50;
        v10 = 18;
        _G.FOVUpdate("Reset", 70);
        if l_Character_0.Disabled.Value == false and l_Character_0.Parried.Value == false then
            l_Humanoid_0.WalkSpeed = v10;
            l_Humanoid_0.JumpPower = v11;
        end;
        v43.Idle:Stop(0.1);
        v29 = false;
        v61 = false;
        return;
    end;
end;
Boost = function() --[[ Line: 586 ]] --[[ Name: Boost ]]
    if v62 then
        return;
    elseif v29 then
        return;
    elseif v63 then
        return;
    elseif v26.BoostDebounce then
        return;
    elseif l_Character_0.HitCount.Value < 30 then
        return;
    else
        v26.BoostDebounce = true;
        v62 = true;
        v29 = true;
        l_Humanoid_0.JumpPower = 0;
        l_Humanoid_0.WalkSpeed = 0;
        v43.ExBoost:Play();
        v49.Lunge:Play();
        wait(0.28);
        l_Input_0:FireServer("Alternate", "Boost");
        wait(0.5);
        l_Humanoid_0.JumpPower = 50;
        l_Humanoid_0.WalkSpeed = v10;
        v29 = false;
        v62 = false;
        return;
    end;
end;
Jab = function() --[[ Line: 624 ]] --[[ Name: Jab ]]
    if v62 then
        return;
    elseif v29 then
        return;
    elseif v63 then
        return;
    elseif v26.JabDebounce then
        return;
    else
        v26.JabDebounce = true;
        v29 = true;
        l_Humanoid_0.JumpPower = 0;
        l_Humanoid_0.WalkSpeed = 13;
        v43.Tackle:AdjustSpeed(1 * v55);
        v43.Tackle:Play();
        v49.Lunge:Play();
        l_Input_0:FireServer("Alternate", "super", true);
        wait(0.15 / v55);
        l_Input_0:FireServer("Alternate", "Jab");
        if v29 == false then
            l_Humanoid_0.JumpPower = 50;
            l_Humanoid_0.WalkSpeed = 16;
            return;
        else
            coroutine.resume(coroutine.create(function() --[[ Line: 654 ]]
                _G.Effect("standlesslunger", nil, nil, l_HumanoidRootPart_0.CFrame);
            end));
            local v98 = Instance.new("BodyVelocity", l_HumanoidRootPart_0);
            v98.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v98.Name = "ve2";
            v98.P = 100000;
            v98.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * 50;
            coroutine.resume(coroutine.create(function() --[[ Line: 666 ]]
                for _ = 1, 15 do
                    task.wait();
                    local v100 = Ray.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.CFrame.LookVector * 3);
                    local l_workspace_PartOnRay_0, _ = workspace:FindPartOnRay(v100, l_Character_0);
                    if l_workspace_PartOnRay_0 and l_workspace_PartOnRay_0.Parent:FindFirstChild("Humanoid") and v98 ~= nil then
                        game.Debris:AddItem(v98, 0);
                        print("?");
                    end;
                end;
            end));
            coroutine.resume(coroutine.create(function() --[[ Line: 682 ]]
                for _ = 1, 10 do
                    wait();
                    Hito("Lunge", l_Hitbox_0, l_Hitbox_0.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 0.3);
                end;
            end));
            game.Debris:AddItem(v98, 0.25);
            wait(0.3 / v55);
            if v29 == false then
                l_Humanoid_0.JumpPower = 50;
                l_Humanoid_0.WalkSpeed = 16;
                return;
            else
                l_Input_0:FireServer("Alternate", "super", false);
                l_Humanoid_0.JumpPower = 50;
                l_Humanoid_0.WalkSpeed = 16;
                v29 = false;
                return;
            end;
        end;
    end;
end;
local v104 = 0;
local v105 = 0;
local v106 = false;
Punch = function() --[[ Line: 715 ]] --[[ Name: Punch ]]
    if v29 and v62 == false then
        return;
    elseif v26.PunchDebounce then
        print("Debounce 2");
        return;
    elseif v63 then
        return;
    elseif v106 == true then
        print("Debounce 4");
        return;
    else
        v29 = true;
        v62 = true;
        v106 = true;
        l_Input_0:FireServer("Alternate", "super", true);
        v104 = v104 + 1;
        local l_StandRarm_0 = l_Stand_0.StandRarm;
        local v108 = nil;
        if v104 == 1 then
            l_StandRarm_0 = l_Stand_0.StandLarm;
            v43.LMB1:AdjustSpeed(1 * v55);
            v43.LMB1:Play();
            v49.Swing:Play();
            v108 = v43.LMB1;
        elseif v104 == 2 then
            l_StandRarm_0 = l_Stand_0.StandRarm;
            v43.LMB2:AdjustSpeed(1 * v55);
            v43.LMB2:Play();
            v108 = v43.LMB2;
            v49.Swing:Play();
        elseif v104 == 3 then
            l_StandRarm_0 = l_Stand_0.StandLarm;
            v43.LMB3:AdjustSpeed(1 * v55);
            v43.LMB3:Play();
            v108 = v43.LMB3;
            v49.Swing:Play();
        elseif v104 == 4 then
            l_StandRarm_0 = l_Stand_0.StandRarm;
            v43.LMB4:AdjustSpeed(1 * v55);
            v43.LMB4:Play();
            v49.Swing:Play();
            v108 = v43.LMB4;
        end;
        if v104 == 4 then
            v26.PunchDebounce = true;
            l_Input_0:FireServer("Alternate", "Punch");
            v104 = 0;
            v105 = 0;
        end;
        if l_Character_0.Disabled.Value == true then
            v26.PunchDebounce = true;
            l_Input_0:FireServer("Alternate", "Punch");
            v104 = 0;
            v62 = false;
            v106 = false;
            l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
            l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
            l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
            if l_HumanoidRootPart_0:FindFirstChild("ve") ~= nil then
                l_HumanoidRootPart_0:FindFirstChild("ve"):Destroy();
            end;
            return;
        else
            l_Humanoid_0.JumpPower = 0;
            l_Humanoid_0.WalkSpeed = 8;
            wait(0.03 / v55);
            if v29 == false then
                v26.PunchDebounce = true;
                l_Input_0:FireServer("Alternate", "Punch");
                v104 = 0;
                v62 = false;
                v106 = false;
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
                if l_HumanoidRootPart_0:FindFirstChild("ve") ~= nil then
                    l_HumanoidRootPart_0:FindFirstChild("ve"):Destroy();
                end;
                return;
            else
                l_StandRarm_0.SweepTrail1.Enabled = true;
                l_StandRarm_0.SweepTrail2.Enabled = true;
                l_StandRarm_0.SweepTrail3.Enabled = true;
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, true);
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, true);
                l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, true);
                wait(0.03 / v55);
                local v109 = tostring((math.random(1, 1000)));
                coroutine.resume(coroutine.create(function() --[[ Line: 845 ]]
                    for _ = 1, 13 do
                        task.wait();
                        hito("Punch", l_StandRarm_0, l_StandRarm_0.CFrame * CFrame.fromOrientation(math.rad((math.random(-90, 90))), 0, (math.rad((math.random(-50, 50))))), 4, 1, "no", v109);
                    end;
                end));
                wait(0.1);
                if v29 == false then
                    v26.PunchDebounce = true;
                    l_Input_0:FireServer("Alternate", "Punch");
                    v104 = 0;
                    v62 = false;
                    v106 = false;
                    l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
                    l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
                    l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
                    if l_HumanoidRootPart_0:FindFirstChild("ve") ~= nil then
                        l_HumanoidRootPart_0:FindFirstChild("ve"):Destroy();
                    end;
                    return;
                else
                    v62 = false;
                    v106 = false;
                    v29 = false;
                    if v104 ~= 0 then
                        v108:AdjustSpeed(0.7);
                    else
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
                    end;
                    local v111 = 0.4;
                    repeat
                        v111 = v111 - game:GetService("RunService").Heartbeat:Wait();
                    until v111 <= 0 or v62 == true;
                    if v62 == true then
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
                        v108:Stop();
                        return;
                    else
                        v108:Stop();
                        l_Input_0:FireServer("Alternate", "super", false);
                        l_StandRarm_0.SweepTrail1.Enabled = false;
                        l_StandRarm_0.SweepTrail2.Enabled = false;
                        l_StandRarm_0.SweepTrail3.Enabled = false;
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail1, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail2, false);
                        l_Trail_1:FireServer(l_StandRarm_0.SweepTrail3, false);
                        if v62 == false and v26.PunchDebounce == false then
                            v26.PunchDebounce = true;
                            l_Input_0:FireServer("Alternate", "Punch");
                            v104 = 0;
                            v105 = 0;
                        end;
                        if v62 == false then
                            l_Humanoid_0.JumpPower = v11;
                            l_Humanoid_0.WalkSpeed = v10;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
local v112 = 0;
local v113 = false;
local v114 = 0;
local v115 = nil;
local v116 = false;
local v117 = false;
DashPunch = function() --[[ Line: 946 ]] --[[ Name: DashPunch ]]
    if v29 and v62 == false then
        return;
    elseif v26.DashDebounce then
        return;
    elseif v63 then
        return;
    elseif v116 == true then
        return;
    else
        v112 = 0;
        local l_v114_0 = v114;
        v29 = true;
        v62 = true;
        v116 = true;
        l_Input_0:FireServer("Alternate", "super", true);
        (function() --[[ Line: 960 ]] --[[ Name: Dodgee ]]
            local v119 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 23;
            v119 = if l_Character_0.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0, 0) then l_Character_0.Humanoid.MoveDirection * 23 else l_Character_0.HumanoidRootPart.CFrame.LookVector * 23;
            local v120 = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.Position + l_Character_0.Humanoid.MoveDirection);
            if l_HumanoidRootPart_0:FindFirstChild("ve2") then
                l_HumanoidRootPart_0:WaitForChild("ve2"):Destroy();
            end;
            coroutine.resume(coroutine.create(function() --[[ Line: 976 ]]
                _G.Effect("Dash Global", nil, Color3.fromRGB(255, 0, 4), v120);
            end));
            v43.Quickstep:Play();
            v49.Star:Play();
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(100000, 0, 100000, 0);
            l_BodyVelocity_0.P = 1e999;
            l_BodyVelocity_0.Velocity = v119;
            l_BodyVelocity_0.Parent = l_Character_0.HumanoidRootPart;
            game.Debris:AddItem(l_BodyVelocity_0, 0.25);
            coroutine.resume(coroutine.create(function() --[[ Line: 994 ]]
                for _ = 1, 10 do
                    wait();
                    local v123 = Ray.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.CFrame.LookVector * 4);
                    local l_workspace_PartOnRay_1, _ = workspace:FindPartOnRay(v123, l_Character_0);
                    if l_workspace_PartOnRay_1 and l_workspace_PartOnRay_1.Parent:FindFirstChild("Humanoid") then
                        game.Debris:AddItem(l_BodyVelocity_0, 0);
                        print("?");
                    end;
                end;
            end));
        end)();
        v114 = v114 + 1;
        local l_v32_0 = v32;
        l_v32_0 = v32;
        v115 = l_RightEffect_0;
        l_v32_0 = v33;
        if v114 == 1 then
            l_v32_0 = l_Stand_0.StandRarm;
            v115 = v32;
            v43.LeftDash:Stop();
            v43.RightDash:AdjustSpeed(1 * v55);
            v43.RightDash:Play();
        elseif v114 == 2 then
            l_v32_0 = l_Stand_0.StandLarm;
            v43.RightDash:Stop();
            v43.LeftDash:AdjustSpeed(1 * v55);
            v43.LeftDash:Play();
            v115 = v33;
        elseif v114 == 3 then
            l_v32_0 = l_Stand_0.StandRarm;
            v43.LeftDash:Stop();
            v43.RightDash:AdjustSpeed(1 * v55);
            v43.RightDash:Play();
            v115 = v32;
        end;
        v115.TrailFire.Fire.Enabled = true;
        l_Trail_1:FireServer(v115.TrailFire.Fire, true);
        if v114 == 3 then
            v26.DashDebounce = true;
        end;
        v49.Swing:Play();
        v49.Flames:Play();
        l_Humanoid_0.JumpPower = 0;
        l_Humanoid_0.WalkSpeed = 12;
        wait(0.2 / v55);
        v116 = false;
        if v29 == false then
            if v26.DashDebounce == false then
                v26.DashDebounce = true;
                l_Input_0:FireServer("Alternate", "DashPunch");
                v115.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v115.TrailFire.Fire, false);
                v114 = 0;
                v62 = false;
            end;
            return;
        else
            local v127 = tostring((math.random(1, 1000)));
            coroutine.resume(coroutine.create(function() --[[ Line: 1090 ]]
                for _ = 1, 10 do
                    wait();
                    hito("DashPunch", l_v32_0, l_v32_0.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 5, 1, "no", v127);
                end;
            end));
            wait(0.2);
            if v29 == false then
                if v26.DashDebounce == false then
                    v26.DashDebounce = true;
                    l_Input_0:FireServer("Alternate", "DashPunch");
                    v115.TrailFire.Fire.Enabled = false;
                    l_Trail_1:FireServer(v115.TrailFire.Fire, false);
                    v114 = 0;
                    v62 = false;
                end;
                return;
            else
                l_Input_0:FireServer("Alternate", "super", false);
                v115.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v115.TrailFire.Fire, false);
                local v129 = 1.2;
                repeat
                    v129 = v129 - game:GetService("RunService").Heartbeat:Wait();
                until v129 <= 0 or l_v114_0 == v114;
                v115.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v115.TrailFire.Fire, false);
                v62 = false;
                v29 = false;
                v26.DashDebounce = true;
                l_Input_0:FireServer("Alternate", "DashPunch");
                v114 = 0;
                l_v114_0 = 0;
                if v62 == false then
                    l_Humanoid_0.JumpPower = v11;
                    l_Humanoid_0.WalkSpeed = v10;
                end;
                return;
            end;
        end;
    end;
end;
HeavyPunch = function() --[[ Line: 1185 ]] --[[ Name: HeavyPunch ]]
    if v62 then
        print("y");
        return;
    elseif v29 then
        print("y2");
        return;
    elseif v63 then
        print("y3");
        return;
    elseif v26.HeavyPunchDebounce == true then
        print("y4 ");
        return;
    else
        v26.HeavyPunchDebounce = true;
        v29 = true;
        l_Input_0:FireServer("Alternate", "HeavyPunch");
        v49.Swing:Play();
        v46.Value = true;
        v49.Flames:Play();
        l_Humanoid_0.WalkSpeed = 16;
        l_Humanoid_0.JumpPower = 0;
        v43.Uppercut:AdjustSpeed(0.8 * v55);
        v43.Uppercut:Play(0.1, 1, 1);
        l_Input_0:FireServer("Alternate", "super", true);
        v33.TrailFire.Fire.Enabled = true;
        l_Trail_1:FireServer(v33.TrailFire.Fire, true);
        wait(0.15 / v55);
        if v29 == false then
            l_Humanoid_0.JumpPower = v11;
            l_Humanoid_0.WalkSpeed = v10;
            v33.TrailFire.Fire.Enabled = false;
            l_Trail_1:FireServer(v33.TrailFire.Fire, false);
            return;
        else
            coroutine.resume(coroutine.create(function() --[[ Line: 1220 ]]
                for _ = 1, 17 do
                    wait();
                    hito("HeavyPunch", l_Stand_0.StandLarm, l_Stand_0.StandLarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 4, 0.75);
                end;
            end));
            wait(0.35 / v55);
            if v29 == false then
                l_Humanoid_0.JumpPower = v11;
                l_Humanoid_0.WalkSpeed = v10;
                v33.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v33.TrailFire.Fire, false);
                return;
            else
                l_Input_0:FireServer("Alternate", "super", false);
                l_Humanoid_0.JumpPower = v11;
                l_Humanoid_0.WalkSpeed = v10;
                v33.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v33.TrailFire.Fire, false);
                v29 = false;
                return;
            end;
        end;
    end;
end;
Kick = function() --[[ Line: 1252 ]] --[[ Name: Kick ]]
    if v62 then
        print("y");
        return;
    elseif v29 then
        print("y2");
        return;
    elseif v63 then
        print("y3");
        return;
    elseif v26.KickDebounce == true then
        print("y4 ");
        return;
    else
        v26.KickDebounce = true;
        v29 = true;
        l_Input_0:FireServer("Alternate", "super", true);
        l_Input_0:FireServer("Alternate", "Kick");
        v49.Swing:Play();
        v46.Value = true;
        v49.Flames:Play();
        l_Humanoid_0.JumpPower = 0;
        l_Humanoid_0.WalkSpeed = 15;
        v43.Kick:AdjustSpeed(0.5 * v55);
        v43.Kick:Play();
        v34.TrailFire.Fire.Enabled = true;
        l_Trail_1:FireServer(v34.TrailFire.Fire, true);
        wait(0.09 / v55);
        if v29 == false then
            l_Humanoid_0.JumpPower = v11;
            l_Humanoid_0.WalkSpeed = v10;
            v34.TrailFire.Fire.Enabled = false;
            l_Trail_1:FireServer(v34.TrailFire.Fire, false);
            return;
        else
            local v131 = Instance.new("BodyVelocity", l_HumanoidRootPart_0);
            v131.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v131.Name = "ve2";
            v131.P = 100000;
            v131.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * 18;
            game.Debris:AddItem(v131, 0.15);
            coroutine.resume(coroutine.create(function() --[[ Line: 1295 ]]
                for _ = 1, 15 do
                    wait();
                    hito("Kick", v34, v34.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 4, 0.75);
                end;
            end));
            wait(0.3 / v55);
            if v29 == false then
                l_Humanoid_0.JumpPower = v11;
                l_Humanoid_0.WalkSpeed = v10;
                v34.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v34.TrailFire.Fire, false);
                return;
            else
                l_Input_0:FireServer("Alternate", "super", false);
                v34.TrailFire.Fire.Enabled = false;
                l_Trail_1:FireServer(v34.TrailFire.Fire, false);
                l_Humanoid_0.JumpPower = v11;
                l_Humanoid_0.WalkSpeed = v10;
                v29 = false;
                return;
            end;
        end;
    end;
end;
local v133 = 0;
Dodge = function() --[[ Line: 1329 ]] --[[ Name: Dodge ]]
    if v60 then
        return;
    elseif v63 then
        return;
    else
        local v134 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 28;
        v134 = if l_Character_0.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0, 0) then l_Character_0.Humanoid.MoveDirection * 28 else l_Character_0.HumanoidRootPart.CFrame.LookVector * 28;
        if v26.DodgeDebounce then
            return;
        elseif v133 == 1 then
            return;
        else
            v133 = v133 + 1;
            if v29 then
                v60 = true;
                v29 = false;
            end;
            local v135 = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.Position + l_Character_0.Humanoid.MoveDirection);
            if l_HumanoidRootPart_0:FindFirstChild("ve2") then
                l_HumanoidRootPart_0:WaitForChild("ve2"):Destroy();
            end;
            coroutine.resume(coroutine.create(function() --[[ Line: 1358 ]]
                _G.Effect("Dash Global", nil, Color3.fromRGB(255, 0, 4), v135);
            end));
            l_Input_0:FireServer("Alternate", "DodgeVFX");
            if v133 == 1 then
                l_Input_0:FireServer("Alternate", "Dodge");
            end;
            v29 = true;
            v43.Quickstep:Play();
            v49.Star:Play();
            local l_BodyVelocity_1 = Instance.new("BodyVelocity");
            l_BodyVelocity_1.MaxForce = Vector3.new(100000, 0, 100000, 0);
            l_BodyVelocity_1.P = 1e999;
            l_BodyVelocity_1.Velocity = v134;
            l_BodyVelocity_1.Parent = l_Character_0.HumanoidRootPart;
            game.Debris:AddItem(l_BodyVelocity_1, 0.25);
            wait(0.2 / v55);
            v60 = false;
            v29 = false;
            return;
        end;
    end;
end;
Drop = function() --[[ Line: 1385 ]] --[[ Name: Drop ]]
    v29 = true;
    v49.Swing:Play();
    v46.Value = true;
    v49.Flames:Play();
    l_Humanoid_0.JumpPower = 0;
    l_Humanoid_0.WalkSpeed = 1;
    v43.Drop:AdjustSpeed(1);
    v43.Drop:Play();
    v33.TrailFire.Fire.Enabled = true;
    l_Trail_1:FireServer(v33.TrailFire.Fire, true);
    wait(0.05 / v55);
    if v29 == false then
        l_Humanoid_0.JumpPower = v11;
        l_Humanoid_0.WalkSpeed = v10;
        v33.TrailFire.Fire.Enabled = false;
        l_Trail_1:FireServer(v33.TrailFire.Fire, false);
        return;
    else
        coroutine.resume(coroutine.create(function() --[[ Line: 1414 ]]
            for _ = 1, 15 do
                wait();
                hito("Drop", l_Stand_0.StandLarm, l_Stand_0.StandLarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 4, 0.75);
            end;
        end));
        wait(0.3 / v55);
        if v29 == false then
            l_Humanoid_0.JumpPower = v11;
            l_Humanoid_0.WalkSpeed = v10;
            v33.TrailFire.Fire.Enabled = false;
            l_Trail_1:FireServer(v33.TrailFire.Fire, false);
            return;
        else
            v33.TrailFire.Fire.Enabled = false;
            l_Trail_1:FireServer(v33.TrailFire.Fire, false);
            l_Humanoid_0.JumpPower = v11;
            l_Humanoid_0.WalkSpeed = v10;
            v29 = false;
            return;
        end;
    end;
end;
local v138 = false;
Pose = function() --[[ Line: 1446 ]] --[[ Name: Pose ]]
    if v29 == false and v138 == false then
        if v138 == false then
            v29 = true;
            v63 = true;
            v43.Pose1:Play();
            v49.PoseMusic:Play();
            l_Menacing_0:FireServer(true);
            spawn(function() --[[ Line: 1454 ]]
                v43.Pose1.Stopped:Wait();
                v43.Pose1:Stop();
                v43.Pose2:Play();
            end);
            l_Humanoid_0.WalkSpeed = 0;
            l_Humanoid_0.JumpPower = 0;
            v10 = 0;
            v11 = 0;
            wait(1.5);
            v138 = true;
            return;
        end;
    elseif v138 == true then
        v43.Pose1:Stop(0.3);
        v43.Pose2:Stop(0.3);
        v49.PoseMusic:Stop();
        v10 = 16;
        v11 = 50;
        if l_Disabled_0.Value == false then
            l_Humanoid_0.WalkSpeed = v10;
            l_Humanoid_0.JumpPower = v11;
        elseif l_Disabled_0.Value == true then
            l_Humanoid_0.WalkSpeed = v10;
            l_Humanoid_0.JumpPower = v11;
        end;
        v29 = false;
        v63 = false;
        v138 = false;
        l_Menacing_0:FireServer(false);
    end;
end;
local v139 = {
    "R", 
    "LMB", 
    "Q", 
    "V", 
    "C", 
    "H", 
    "Z", 
    "F", 
    "P", 
    "E", 
    "X", 
    "J", 
    "C"
};
local v140 = false;
local function v142(v141) --[[ Line: 1509 ]] --[[ Name: KEY ]]
    if v60 then
        return;
    elseif l_Torso_1.Anchored == true then
        return;
    elseif l_Disabled_0.Value == true then
        return;
    elseif l_Character_0.Knock.Value == true then
        return;
    elseif l_Humanoid_0.Health < 1 then
        return;
    elseif v61 then
        return;
    else
        if v141 == "q" then
            HeavyPunch();
        end;
        if v141 == "v" then
            SkyDancer();
        end;
        if v141 == "r" then
            Jab();
        end;
        if v141 == "e" then
            DashPunch();
        end;
        if v141 == "h" then
            Kick();
        end;
        if v141 == "f" then
            Counter();
        end;
        if v141 == "lmb" then
            Punch();
        end;
        if v141 == "x" then
            Block();
        end;
        if v141 == "p" then
            Pose();
        end;
        if v141 == "c" then
            Dodge();
        end;
        if v141 == "j" then
            if v140 == false then
                v140 = true;
                return;
            else
                v140 = false;
            end;
        end;
        return;
    end;
end;
mouse.Button1Down:connect(function() --[[ Line: 1564 ]]
    if v9 then
        return;
    else
        v142("lmb");
        return;
    end;
end);
l_Input_0.OnClientEvent:Connect(function(v143) --[[ Line: 1570 ]]
    if v143 == "drop" then
        Drop();
    end;
end);
if v9 then
    for _, v145 in pairs(v139) do
        local v146 = l_MobileGUI_0[tostring(v145)];
        v146.Visible = true;
        v146.MouseButton1Down:Connect(function() --[[ Line: 1581 ]]
            v142(v146.Name:lower());
        end);
    end;
end;
mouse.KeyDown:connect(function(v147) --[[ Line: 1588 ]]
    v142(v147);
end);
local function _(v148) --[[ Line: 1592 ]] --[[ Name: GetTouchingParts ]]
    local v149 = v148.Touched:Connect(function() --[[ Line: 1593 ]]

    end);
    local l_v148_TouchingParts_0 = v148:GetTouchingParts();
    v149:Disconnect();
    return l_v148_TouchingParts_0;
end;
Hito = function(v152, _, v154, v155) --[[ Line: 1599 ]] --[[ Name: Hito ]]
    local l_l_Hitbox_0_0 = l_Hitbox_0;
    local v157 = l_l_Hitbox_0_0.Touched:Connect(function() --[[ Line: 1593 ]]

    end);
    local l_l_l_Hitbox_0_0_TouchingParts_0 = l_l_Hitbox_0_0:GetTouchingParts();
    v157:Disconnect();
    for _, v160 in pairs(l_l_l_Hitbox_0_0_TouchingParts_0) do
        if v160.Parent:FindFirstChild("Humanoid") and v160.Parent ~= l_Character_0 and v160.Parent:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
            local _ = v160.Parent;
            local l_HumanoidRootPart_2 = v160.Parent:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = v160.Parent:FindFirstChild("Humanoid");
            l_Input_0:FireServer("Damage", v152, nil, nil, l_Humanoid_1, v154);
            local l_StringValue_0 = Instance.new("StringValue");
            l_StringValue_0.Name = "alabo";
            l_StringValue_0.Parent = l_HumanoidRootPart_2;
            delay(v155, function() --[[ Line: 1616 ]]
                l_StringValue_0:Destroy();
            end);
        end;
    end;
end;
hito = function(v165, v166, v167, v168, v169, v170, v171) --[[ Line: 1633 ]] --[[ Name: hito ]]
    if l_Disabled_0.Value == true then
        return;
    else
        for _, v173 in pairs(workspace:GetChildren()) do
            if v166.Anchored == true then
                return;
            elseif v173:FindFirstChild("Humanoid") and v173:FindFirstChild("HumanoidRootPart") and v173 ~= l_Character_0 and (v173:FindFirstChild("HumanoidRootPart").Position - v166.Position).magnitude < v168 and v173:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
                if v166.Anchored then
                    return;
                elseif v171 ~= nil and v173:FindFirstChild("HumanoidRootPart"):FindFirstChild(v171) then
                    return;
                else
                    local l_Humanoid_2 = v173:FindFirstChild("Humanoid");
                    local l_HumanoidRootPart_3 = v173:FindFirstChild("HumanoidRootPart");
                    l_Input_0:FireServer("Damage", v165, nil, nil, l_Humanoid_2, v167);
                    if v165 == "DashPunch" then
                        v117 = true;
                    end;
                    if v170 == "yea" then
                        v113 = true;
                        print("give");
                    end;
                    local l_StringValue_1 = Instance.new("StringValue");
                    l_StringValue_1.Name = "alabo";
                    l_StringValue_1.Parent = l_HumanoidRootPart_3;
                    if v171 ~= nil then
                        print("added");
                        l_StringValue_1.Name = v171;
                    end;
                    delay(v169, function() --[[ Line: 1664 ]]
                        l_StringValue_1:Destroy();
                    end);
                end;
            end;
        end;
        return;
    end;
end;
game.Lighting.TS.Changed:Connect(function() --[[ Line: 1671 ]]
    if game.Lighting.TS.Value == true then
        l_Anchor_0:FireServer(l_Torso_1, true);
        l_Anchor_0:FireServer(v32, true);
        l_Anchor_0:FireServer(v33, true);
        l_Anchor_0:FireServer(v34, true);
        l_Anchor_0:FireServer(v35, true);
        l_Anchor_0:FireServer(l_Head_0, true);
        return;
    else
        if game.Lighting.TS.Value == false then
            l_Anchor_0:FireServer(l_Torso_1, false);
            l_Anchor_0:FireServer(v32, false);
            l_Anchor_0:FireServer(v33, false);
            l_Anchor_0:FireServer(v34, false);
            l_Anchor_0:FireServer(v35, false);
            l_Anchor_0:FireServer(l_Head_0, false);
        end;
        return;
    end;
end);
if game.Lighting.TS.Value == true then
    l_Anchor_0:FireServer(l_Torso_1, true);
    l_Anchor_0:FireServer(v32, true);
    l_Anchor_0:FireServer(v33, true);
    l_Anchor_0:FireServer(v34, true);
    l_Anchor_0:FireServer(v35, true);
    l_Anchor_0:FireServer(l_Head_0, true);
end;
local l_Death_0 = l_ReplicatedStorage_0.Main.Death;
l_Humanoid_0.HealthChanged:connect(function() --[[ Line: 1702 ]]
    if l_Humanoid_0.Health < 1 then
        l_Humanoid_0:SetStateEnabled(3, false);
        l_Humanoid_0:SetStateEnabled(15, false);
        l_Death_0:FireServer(false);
    end;
end);
script.ChildAdded:Connect(function(v178) --[[ Line: 1712 ]]
    if v178.ClassName ~= "Script" then
        return;
    else
        local l_CD_0 = v178:WaitForChild("CD");
        local _ = v178:WaitForChild("STAND");
        local l_Value_0 = v178:WaitForChild("NAME").Value;
        local l_Value_1 = l_CD_0.Value;
        if l_Value_0 == "C" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1723 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.DodgeDebounce = false;
            v133 = 0;
            return;
        elseif l_Value_0 == "LMB" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1730 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.PunchDebounce = false;
            return;
        elseif l_Value_0 == "WALL + S" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1737 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.WallPunchDebounce = false;
            return;
        elseif l_Value_0 == "E" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1744 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.DashDebounce = false;
            return;
        elseif l_Value_0 == "R" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1751 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.JabDebounce = false;
            return;
        elseif l_Value_0 == "H" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1758 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.KickDebounce = false;
            return;
        elseif l_Value_0 == "V" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1765 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.SkyDancerDebounce = false;
            return;
        elseif l_Value_0 == "Q" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1772 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.HeavyPunchDebounce = false;
            return;
        elseif l_Value_0 == "F" then
            coroutine.resume(coroutine.create(function() --[[ Line: 1779 ]]
                _G.CD(l_Value_0, l_Value_1);
            end));
            wait(l_Value_1);
            v26.CounterDebounce = false;
            return;
        else
            if l_Value_0 == "X" then
                coroutine.resume(coroutine.create(function() --[[ Line: 1787 ]]
                    _G.CD(l_Value_0, l_Value_1);
                end));
                wait(l_Value_1);
                v26.BlockDebounce = false;
            end;
            return;
        end;
    end;
end);
local v183 = false;
local v184 = false;
local v185 = false;
local _ = math.random(0.5, 1.5);
local v187 = 8;
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 1806 ]]
    if Running and v184 and v46.Value == false then
        DustChange(true);
    elseif Running == false or v184 == false or v46.Value == true then
        DustChange(false);
    end;
    if l_Character_0.HumanoidRootPart:FindFirstChild("JuggleKnock") then
        l_Humanoid_0.WalkSpeed = 0;
        return;
    elseif l_Character_0.HumanoidRootPart:FindFirstChild("Stunned") then
        l_Humanoid_0.WalkSpeed = 0;
        l_Humanoid_0.JumpPower = 0;
        return;
    elseif l_Character_0.Parried.Value == true then
        l_Humanoid_0.WalkSpeed = 0;
        l_Humanoid_0.JumpPower = 0;
        return;
    else
        if v29 == false then
            l_Humanoid_0.WalkSpeed = v10;
            l_Humanoid_0.JumpPower = v11;
        end;
        return;
    end;
end);
local _ = l_Humanoid_0:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 1841 ]]
    if l_Character_0.Parried.Value == true then
        return;
    else
        if v183 == false and v185 == false and v184 == false and v29 == false then
            l_Humanoid_0.WalkSpeed = v10;
            v185 = true;
            v184 = false;
            _G.FOVUpdate("Reset", 70);
        end;
        if v183 then
            if l_Humanoid_0.MoveDirection.Magnitude > 0 then
                if v184 == false then
                    v184 = true;
                    v185 = false;
                    v187 = 12;
                    _G.FOVUpdate("Add", 15);
                    return;
                end;
            elseif v185 == false then
                v185 = true;
                v184 = false;
                _G.FOVUpdate("Reset", 70);
            end;
        end;
        return;
    end;
end);
local function _() --[[ Line: 1881 ]] --[[ Name: Run ]]
    v185 = false;
    v184 = false;
    if l_Humanoid_0.MoveDirection.Magnitude > 0 and v184 == false then
        v184 = true;
        v185 = false;
        v187 = 12;
        _G.FOVUpdate("Add", 15);
    end;
    v183 = true;
    v10 = 20;
    l_Humanoid_0.WalkSpeed = v10;
end;
local function _() --[[ Line: 1902 ]] --[[ Name: EndRun ]]
    v183 = false;
    v185 = false;
    v184 = false;
    v187 = 8;
    v10 = 16;
    if v29 == false then
        l_Humanoid_0.WalkSpeed = v10;
    end;
    _G.FOVUpdate("Reset", 70);
end;
local l_UserInputService_1 = game:GetService("UserInputService");
l_UserInputService_1.InputBegan:Connect(function(v192) --[[ Line: 1919 ]]
    if v192.KeyCode == Enum.KeyCode.Z and v29 == false then
        v185 = false;
        v184 = false;
        if l_Humanoid_0.MoveDirection.Magnitude > 0 and v184 == false then
            v184 = true;
            v185 = false;
            v187 = 12;
            _G.FOVUpdate("Add", 15);
        end;
        v183 = true;
        v10 = 20;
        l_Humanoid_0.WalkSpeed = v10;
    end;
end);
l_UserInputService_1.InputEnded:Connect(function(v193) --[[ Line: 1925 ]]
    if v193.KeyCode == Enum.KeyCode.Z then
        v183 = false;
        v185 = false;
        v184 = false;
        v187 = 8;
        v10 = 16;
        if v29 == false then
            l_Humanoid_0.WalkSpeed = v10;
        end;
        _G.FOVUpdate("Reset", 70);
    end;
end);
local v194 = false;
l_MobileGUI_0.Z.MouseButton1Down:Connect(function() --[[ Line: 1931 ]]
    if v194 then
        return;
    else
        v194 = true;
        v185 = false;
        v184 = false;
        if l_Humanoid_0.MoveDirection.Magnitude > 0 and v184 == false then
            v184 = true;
            v185 = false;
            v187 = 12;
            _G.FOVUpdate("Add", 15);
        end;
        v183 = true;
        v10 = 20;
        l_Humanoid_0.WalkSpeed = v10;
        if v9 then
            local _ = l_MobileGUI_0.Z.MouseButton1Down:Connect(function() --[[ Line: 1937 ]]
                v183 = false;
                v185 = false;
                v184 = false;
                v187 = 8;
                v10 = 16;
                if v29 == false then
                    l_Humanoid_0.WalkSpeed = v10;
                end;
                _G.FOVUpdate("Reset", 70);
                v194 = false;
            end);
        end;
        return;
    end;
end);
Sound = workspace:FindFirstChild("Music");
local l_IsMuted_0 = Sound.IsMuted;
l_Character_0.ExBoost:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1948 ]]
    if l_Character_0.ExBoost.Value == false then
        game.StarterGui.Raid.Volume = 0;
        v55 = 1;
        if l_IsMuted_0.Value == false then
            Sound.Volume = 0.3;
            return;
        end;
    elseif l_Character_0.ExBoost.Value == true then
        v55 = 1.5;
        Sound.Volume = 0;
        game.StarterGui.Raid.Volume = 5;
        game.StarterGui.Raid:Play();
    end;
end);
local l_TweenService_1 = game:GetService("TweenService");
l_HitCount_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1965 ]]
    l_Frame_0.HitCount.Text = tostring(l_HitCount_0.Value);
    l_Frame_0.HitCountS.Text = tostring(l_HitCount_0.Value);
end);
l_Input_0.OnClientEvent:Connect(function(v198) --[[ Line: 1970 ]]
    if v198 == "appear" then
        for _, v200 in pairs(l_Frame_0:GetChildren()) do
            if v200:IsA("TextLabel") then
                l_TweenService_1:Create(v200, TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                    TextTransparency = 0
                }):Play();
                l_TweenService_1:Create(v200, TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                    TextStrokeTransparency = 0.5
                }):Play();
            end;
        end;
        return;
    else
        if v198 == "noappear" then
            for _, v202 in pairs(l_Frame_0:GetChildren()) do
                if v202:IsA("TextLabel") then
                    l_TweenService_1:Create(v202, TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                        TextTransparency = 1
                    }):Play();
                    l_TweenService_1:Create(v202, TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                        TextStrokeTransparency = 1
                    }):Play();
                end;
            end;
        end;
        return;
    end;
end);
l_Humanoid_0.StateChanged:Connect(function(_, v204) --[[ Line: 1991 ]]
    if v204 == Enum.HumanoidStateType.Running then
        Running = true;
        return;
    else
        Running = false;
        return;
    end;
end);
l_Humanoid_0:GetPropertyChangedSignal("WalkSpeed"):Connect(function() --[[ Line: 2000 ]]
    if l_Humanoid_0.WalkSpeed >= 17 then
        l_Animate_0.walk:Destroy();
        local v205 = l_ReplicatedStorage_0.Stuff:Clone();
        v205.Name = "walk";
        v205.Anim.Name = "WalkAnim";
        v205.Parent = l_Animate_0;
        v205.WalkAnim.AnimationId = "rbxassetid://8262059856";
        return;
    else
        if l_Humanoid_0.WalkSpeed <= 16 then
            l_Animate_0.walk.WalkAnim.AnimationId = "rbxassetid://8262059856";
            l_Animate_0.walk:Destroy();
            local v206 = l_ReplicatedStorage_0.Stuff:Clone();
            v206.Name = "walk";
            v206.Anim.Name = "WalkAnim";
            v206.Parent = l_Animate_0;
            v206.WalkAnim.AnimationId = "rbxassetid://11583261731";
        end;
        return;
    end;
end);
local _ = game.Players.LocalPlayer;
local l_HumanoidRootPart_4 = l_Character_0:WaitForChild("HumanoidRootPart");
local l_Head_1 = l_Character_0:WaitForChild("Head");
local l_Humanoid_3 = l_Character_0:WaitForChild("Humanoid");
local l_UserInputService_2 = game:GetService("UserInputService");
ledgeavailable = true;
holding = false;
NumberOfJumps = 3;
local v212 = {
    "MountainLight", 
    "Wall", 
    "Mountain", 
    "Window", 
    "funny", 
    "Foliage"
};
GETNEARESTPLAYER = function(v213, v214) --[[ Line: 2044 ]] --[[ Name: GETNEARESTPLAYER ]]
    local v215 = game.Workspace:children();
    local _ = nil;
    local l_v214_0 = v214;
    local v218 = nil;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    for v222 = 1, #v215 do
        v220 = v215[v222];
        if v220.className == "Model" and v220 ~= script.Parent and v220:FindFirstChild("Stand") and v220 ~= l_Character_0 then
            v218 = v220:findFirstChild("Torso");
            v219 = v220:findFirstChild("Humanoid");
            if v218 ~= nil and v219 ~= nil and v219.Health > 0 and (v218.Position - v213).magnitude < l_v214_0 then
                v221 = v218.Parent;
                l_v214_0 = (v218.Position - v213).magnitude;
            end;
        end;
    end;
    return v221;
end;
climb = function() --[[ Line: 2070 ]] --[[ Name: climb ]]
    _G.ModifyShiftlock = false;
    NumberOfJumps = NumberOfJumps - 1;
    local v223 = Instance.new("BodyVelocity", l_HumanoidRootPart_4);
    l_HumanoidRootPart_4.Anchored = false;
    v223.MaxForce = Vector3.new(100000, 100000, 100000, 0);
    l_Humanoid_0.AutoRotate = true;
    v26.WallPunchDebounce = true;
    local v224 = nil;
    local v225 = nil;
    if mouse.Target and mouse.Target.Parent:FindFirstChild("Humanoid") then
        local l_HumanoidRootPart_5 = mouse.Target.Parent:FindFirstChild("HumanoidRootPart");
        if (l_HumanoidRootPart_5.Position - l_HumanoidRootPart_0.Position).magnitude < 40 then
            v223.Velocity = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_5.Position).lookVector * 50;
            v224 = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_5.Position);
            v225 = l_HumanoidRootPart_5.Position;
        end;
    else
        local v227 = GETNEARESTPLAYER(l_Torso_0.Position, 45);
        if v227 ~= nil then
            v223.Velocity = CFrame.new(l_HumanoidRootPart_0.Position, v227.Torso.Position).lookVector * 75;
            v224 = CFrame.new(l_HumanoidRootPart_0.Position, v227.Torso.Position);
            v225 = v227.Torso.Position;
        elseif v227 == nil then
            v223.Velocity = CFrame.new(l_HumanoidRootPart_0.Position, mouse.Hit.Position).lookVector * 75;
            v224 = CFrame.new(l_HumanoidRootPart_0.Position, mouse.Hit.Position);
            v225 = mouse.Hit.Position;
        end;
    end;
    local l_StandRarm_1 = l_Stand_0.StandRarm;
    l_Trail_1:FireServer(v32.TrailFire.Fire, true);
    l_StandRarm_1.SweepTrail1.Enabled = true;
    l_StandRarm_1.SweepTrail2.Enabled = true;
    l_StandRarm_1.SweepTrail3.Enabled = true;
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail1, true);
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail2, true);
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail3, true);
    v49.Flames:Play();
    if l_HumanoidRootPart_0:FindFirstChild("ve2") then
        l_HumanoidRootPart_0:WaitForChild("ve2"):Destroy();
    end;
    coroutine.resume(coroutine.create(function() --[[ Line: 2131 ]]
        _G.Effect("Dash Wall", nil, Color3.fromRGB(255, 12, 12), v224);
    end));
    v43.IdleWall:Stop();
    v43.WallClimb:Play();
    v43.WallPunch:Play();
    v29 = true;
    v62 = true;
    game.Debris:AddItem(v223, 0.15);
    holding = false;
    l_Input_0:FireServer("Alternate", "WallPunch", v225);
    coroutine.resume(coroutine.create(function() --[[ Line: 2148 ]]
        for _ = 1, 25 do
            wait();
            Hito("WallPunch", l_Torso_0, l_Torso_0.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 0.1);
        end;
    end));
    wait(0.65);
    l_Trail_1:FireServer(v32.TrailFire.Fire, false);
    l_StandRarm_1.SweepTrail1.Enabled = false;
    l_StandRarm_1.SweepTrail2.Enabled = false;
    l_StandRarm_1.SweepTrail3.Enabled = false;
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail1, false);
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail2, false);
    l_Trail_1:FireServer(l_StandRarm_1.SweepTrail3, false);
    if l_Character_0.Knock.Value == false then
        l_Humanoid_0:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
    end;
    v29 = false;
    v62 = false;
    ledgeavailable = true;
end;
l_UserInputService_2.JumpRequest:Connect(function() --[[ Line: 2176 ]]
    if not holding then
        return;
    else
        if v26.WallPunchDebounce == false then
            climb();
        end;
        return;
    end;
end);
while game:GetService("RunService").Heartbeat:Wait() do
    local v230 = Ray.new(l_Head_1.CFrame.p, l_Head_1.CFrame.LookVector * 1.4);
    local l_workspace_PartOnRay_2, _ = workspace:FindPartOnRay(v230, l_Character_0);
    if l_workspace_PartOnRay_2 and ledgeavailable and not holding and v140 and v26.WallPunchDebounce == false and l_Humanoid_3.FloorMaterial == Enum.Material.Air and table.find(v212, l_workspace_PartOnRay_2.Name) and NumberOfJumps >= 1 then
        print(NumberOfJumps);
        l_Humanoid_0.AutoRotate = false;
        _G.ModifyShiftlock = true;
        l_HumanoidRootPart_4.Anchored = true;
        holding = true;
        v43.IdleWall:Play();
        ledgeavailable = false;
    end;
    while l_HumanoidRootPart_4.Anchored == true do
        wait();
    end;
    if l_Humanoid_3.FloorMaterial ~= Enum.Material.Air then
        NumberOfJumps = 3;
    end;
end;
