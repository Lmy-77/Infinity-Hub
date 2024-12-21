script = nil;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
if not l_LocalPlayer_0:FindFirstChild("PlayerGui") then
    while true do
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChild("PlayerGui");
        if not l_PlayerGui_0 then
            wait();
            if l_PlayerGui_0 then
                break;
            end;
        else
            break;
        end;
    end;
end;
local l_FirstChild_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("Basic Admin UI");
while true do
    l_FirstChild_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("Basic Admin UI");
    if not l_FirstChild_0 then
        wait();
        if l_FirstChild_0 then
            break;
        end;
    else
        break;
    end;
end;
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local _ = game:GetService("ServerStorage");
local l_StarterGui_0 = game:GetService("StarterGui");
local _ = game:GetService("StarterPack");
local l_TestService_0 = game:GetService("TestService");
local _ = game:GetService("StarterPlayer");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Teams");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local _ = game:GetService("InsertService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("TeleportService");
local _ = game:GetService("Debris");
local _ = game:GetService("Chat");
local l_HttpService_0 = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local v25 = l_ReplicatedStorage_0:WaitForChild("Basic Admin");
local l_RemoteEvent_0 = v25:WaitForChild("RemoteEvent");
local l_RemoteFunction_0 = v25:WaitForChild("RemoteFunction");
local _ = tick();
local l_l_FirstChild_0_FirstChild_0 = l_FirstChild_0:FindFirstChild("Base Clip");
if not l_l_FirstChild_0_FirstChild_0 then
    while true do
        l_l_FirstChild_0_FirstChild_0 = l_FirstChild_0:FindFirstChild("Base Clip");
        if not l_l_FirstChild_0_FirstChild_0 then
            l_RunService_0.Heartbeat:Wait();
            if l_l_FirstChild_0_FirstChild_0 ~= nil then
                break;
            end;
        else
            break;
        end;
    end;
end;
local v30 = {
    Permission = nil, 
    Key = nil,
    Prefix = nil, 
    actionPrefix = nil, 
    Version = nil, 
    capeData = {}, 
    hatData = nil, 
    faceData = nil, 
    commandsTable = nil, 
    Debounces = {
        Cape = false, 
        Face = false, 
        Hat = false
    }
};
local v31 = tostring(l_RemoteEvent_0.FireServer);
local v32 = tostring(l_RemoteFunction_0.InvokeServer);
local function _() --[[ Line: 84 ]] --[[ Name: crashPlayer ]]
    spawn(function() --[[ Line: 85 ]]
        local function v33() --[[ Line: 86 ]] --[[ Name: Crash ]]
            while true do
                pcall(function() --[[ Line: 89 ]]
                    print(game[("%s|"):rep(268435455)]);
                    v33();
                end);
            end;
        end;
        v33();
    end);
end;
local function v38(v35) --[[ Line: 100 ]] --[[ Name: integrityCheck ]]
    if v35 == 1 then
        if tostring(l_RemoteEvent_0.FireServer) ~= v31 then
            pcall(l_LocalPlayer_0.Kick, l_LocalPlayer_0);
            spawn(function() --[[ Line: 85 ]]
                local function v36() --[[ Line: 86 ]] --[[ Name: Crash ]]
                    while true do
                        pcall(function() --[[ Line: 89 ]]
                            print(game[("%s|"):rep(268435455)]);
                            v36();
                        end);
                    end;
                end;
                v36();
            end);
            return false;
        else
            return true;
        end;
    elseif v35 == 2 then
        if tostring(l_RemoteFunction_0.InvokeServer) ~= v32 then
            pcall(l_LocalPlayer_0.Kick, l_LocalPlayer_0);
            spawn(function() --[[ Line: 85 ]]
                local function v37() --[[ Line: 86 ]] --[[ Name: Crash ]]
                    while true do
                        pcall(function() --[[ Line: 89 ]]
                            print(game[("%s|"):rep(268435455)]);
                            v37();
                        end);
                    end;
                end;
                v37();
            end);
            return false;
        else
            return true;
        end;
    else
        return;
    end;
end;
local v39 = {};
local function v41(...) --[[ Line: 122 ]] --[[ Name: invokeServer ]]
    if v38(2) then
        if not v30.Key then
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            v39[l_BindableEvent_0] = true;
            l_BindableEvent_0.Event:Wait();
            v39[l_BindableEvent_0] = nil;
            l_BindableEvent_0:Destroy();
        end;
        return l_RemoteFunction_0:InvokeServer(v30.Key, ...);
    else
        return;
    end;
end;
local function v43(...) --[[ Line: 135 ]] --[[ Name: fireServer ]]
    if v38(1) then
        if not v30.Key then
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            v39[l_BindableEvent_1] = true;
            l_BindableEvent_1.Event:Wait();
            v39[l_BindableEvent_1] = nil;
            l_BindableEvent_1:Destroy();
        end;
        l_RemoteEvent_0:FireServer(v30.Key, ...);
    end;
end;
local function v51(v44, v45, v46, v47, v48) --[[ Line: 148 ]] --[[ Name: Tween ]]
    local v49 = l_TweenService_0:Create(v44, TweenInfo.new(v45, v46.Style, v46.Direction), v47);
    local v50 = nil;
    v50 = v49.Completed:Connect(function() --[[ Line: 159 ]]
        if v50 ~= nil then
            v50:Disconnect();
            v50 = nil;
        end;
        v49:Destroy();
    end);
    v49:Play();
    if v48 then
        v49.Completed:Wait();
        return;
    else
        return v49;
    end;
end;
local v52 = {
    Notifs = {}, 
    Frames = {}
};
local function v58(v53) --[[ Line: 176 ]] --[[ Name: figureFrames ]]
    local v54 = 0;
    local v55 = #v53;
    while v55 > 0 do
        local v56 = v53[v55];
        if v56 then
            v54 = v54 + (v56.AbsoluteSize.X + 10);
            local v57 = UDim2.new(0, v54 - 250, 0.5, -150);
            if v56.Position ~= v57 then
                v51(v56, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = v57
                });
                if v57.X.Offset > l_l_FirstChild_0_FirstChild_0.AbsoluteSize.X - 250 and v56.Name ~= v56.Name .. "_RemovingThis" then
                    v56.Name = v56.Name .. "_RemovingThis";
                    table.remove(v53, v55);
                    v51(v56, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(1, 5, 0.5, -150)
                    }).Completed:Connect(function() --[[ Line: 190 ]]
                        v56:Destroy();
                    end);
                end;
            end;
        end;
        v55 = v55 - 1;
    end;
end;
figureNotifs = function(v59, v60) --[[ Line: 200 ]] --[[ Name: figureNotifs ]]
    local v61 = 0;
    local v62 = #v59;
    while v62 > 0 do
        local v63 = v59[v62];
        if v63 then
            v61 = v61 + v63.AbsoluteSize.Y + 5;
            local v64 = UDim2.new(0, 0, 1, -v61);
            if v63.Position ~= v64 then
                v51(v63, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = v64
                });
                if v64.Y.Offset < -v60.AbsoluteSize.Y then
                    local l_Inner_0 = v63:WaitForChild("Inner");
                    v51(l_Inner_0, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(0, 0, 1, 0)
                    });
                else
                    local l_Inner_1 = v63:WaitForChild("Inner");
                    v51(l_Inner_1, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                end;
            end;
        end;
        v62 = v62 - 1;
    end;
end;
local v67 = false;
local v68 = nil;
local v69 = nil;
local v70 = true;
l_LocalPlayer_0.Changed:connect(function(v71) --[[ Line: 232 ]]
    if v71 == "Character" then
        repeat
            wait();
        until l_LocalPlayer_0.Character;
        v30.Flying = false;
    end;
end);
local function _() --[[ Line: 241 ]] --[[ Name: createLabel ]]
    if not l_FirstChild_0:FindFirstChild("Label Clone") then
        local l_l_FirstChild_0_FirstChild_1 = l_FirstChild_0:FindFirstChild("Mouse Label");
        if l_l_FirstChild_0_FirstChild_1 then
            l_l_FirstChild_0_FirstChild_1 = l_l_FirstChild_0_FirstChild_1:Clone();
            l_l_FirstChild_0_FirstChild_1.Name = "Label Clone";
            local l_Label_0 = l_l_FirstChild_0_FirstChild_1:FindFirstChild("Label");
            if l_Label_0 then
                l_l_FirstChild_0_FirstChild_1.Parent = l_FirstChild_0;
                mouseLabel = l_Label_0;
            end;
        end;
    end;
end;
local function v448(v75, v76) --[[ Line: 256 ]] --[[ Name: Display ]]
    local v77 = {};
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local function v85(v84) --[[ Line: 266 ]] --[[ Name: clearConnections ]]
        if #v84 > 0 then
            repeat
                v84[1]:Disconnect();
                table.remove(v84, 1);
            until #v84 == 0;
        end;
    end;
    if v75 == "Message" then
        for _, v87 in next, l_l_FirstChild_0_FirstChild_0:GetChildren() do
            if v87.Name == "Message Clone" then
                v87.Name = "Message Removing";
                v51(v87, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(0, 0, 1, 0)
                }).Completed:Connect(function() --[[ Line: 280 ]]
                    v87:Destroy();
                end);
            end;
        end;
        local v88 = v76[1];
        local v89 = v76[2];
        local v90 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Message Template"):Clone();
        v90.Name = "Message Clone";
        v90.Size = UDim2.new(1, 0, 0, l_l_FirstChild_0_FirstChild_0.AbsoluteSize.Y);
        v90.Position = UDim2.new(0, 0, -1, 0);
        v90.Parent = l_l_FirstChild_0_FirstChild_0;
        v90.Visible = true;
        local l_TextButton_0 = v90:WaitForChild("TextButton");
        local l_Top_0 = v90:WaitForChild("Top");
        local l_Body_0 = v90:WaitForChild("Body");
        local l_Title_0 = l_Top_0:WaitForChild("Title");
        local v95 = l_Body_0:WaitForChild("To Name Later");
        local l_Left_0 = l_Top_0:WaitForChild("Left");
        l_Title_0.Text = v88;
        v95.Text = v89;
        local l_Y_0 = v95.TextBounds.Y;
        l_Y_0 = l_Y_0 < 30 and 30 or l_Y_0 + 15;
        local l_Offset_0 = l_Top_0.Size.Y.Offset;
        v90.Size = UDim2.new(1, 0, 0, l_Y_0 + l_Offset_0);
        local _ = function() --[[ Line: 310 ]] --[[ Name: Resize ]]
            local v99 = nil;
            local _, l_result_0 = pcall(function() --[[ Line: 312 ]]
                v99 = l_l_FirstChild_0_FirstChild_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 313 ]]
                    v90.Size = UDim2.new(1, 0, 0, l_l_FirstChild_0_FirstChild_0.AbsoluteSize.Y);
                    local l_Y_1 = v95.TextBounds.Y;
                    l_Y_1 = l_Y_1 < 30 and 30 or l_Y_1 + 15;
                    local l_Offset_1 = l_Top_0.Size.Y.Offset;
                    v90.Size = UDim2.new(1, 0, 0, l_Y_1 + l_Offset_1);
                    if v90 ~= nil and v90.Parent == l_l_FirstChild_0_FirstChild_0 then
                        v51(v90, 0.5, {
                            Style = Enum.EasingStyle.Quint, 
                            Direction = Enum.EasingDirection.Out
                        }, {
                            Position = UDim2.new(0, 0, 0.5, -v90.Size.Y.Offset / 2)
                        });
                        return;
                    else
                        if v99 then
                            v99:Disconnect();
                        end;
                        return;
                    end;
                end);
            end);
            if l_result_0 and v99 then
                v99:Disconnect();
                return;
            else
                return;
            end;
        end;
        v51(v90, 0.5, {
            Style = Enum.EasingStyle.Quint, 
            Direction = Enum.EasingDirection.Out
        }, {
            Position = UDim2.new(0, 0, 0.5, -v90.Size.Y.Offset / 2)
        }).Completed:Connect(function() --[[ Line: 339 ]]
            local v105 = nil;
            local _, l_result_1 = pcall(function() --[[ Line: 312 ]]
                v105 = l_l_FirstChild_0_FirstChild_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 313 ]]
                    v90.Size = UDim2.new(1, 0, 0, l_l_FirstChild_0_FirstChild_0.AbsoluteSize.Y);
                    local l_Y_2 = v95.TextBounds.Y;
                    l_Y_2 = l_Y_2 < 30 and 30 or l_Y_2 + 15;
                    local l_Offset_2 = l_Top_0.Size.Y.Offset;
                    v90.Size = UDim2.new(1, 0, 0, l_Y_2 + l_Offset_2);
                    if v90 ~= nil and v90.Parent == l_l_FirstChild_0_FirstChild_0 then
                        v51(v90, 0.5, {
                            Style = Enum.EasingStyle.Quint, 
                            Direction = Enum.EasingDirection.Out
                        }, {
                            Position = UDim2.new(0, 0, 0.5, -v90.Size.Y.Offset / 2)
                        });
                        return;
                    else
                        if v105 then
                            v105:Disconnect();
                        end;
                        return;
                    end;
                end);
            end);
            if l_result_1 and v105 then
                v105:Disconnect();
                return;
            else
                return;
            end;
        end);
        table.insert(v77, l_TextButton_0.MouseButton1Click:connect(function() --[[ Line: 343 ]]
            v85(v77);
            if v90.Name == "Message Clone" then
                v90.Name = "Message Removing";
                v51(v90, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(0, 0, 1, 0)
                }).Completed:Connect(function() --[[ Line: 347 ]]
                    v90:Destroy();
                end);
            end;
        end));
        local v110 = #v95.Text * 0.1 + 1;
        local v111, v112 = string.find(v110, "%p");
        if v111 and v112 then
            v110 = if tonumber((string.sub(v110, v111))) >= 0.5 then tonumber((string.sub(v110, 1, v111))) + 1 else tonumber((string.sub(v110, 1, v111)));
        end;
        if v110 > 15 then
            v110 = 15;
        elseif v110 <= 1 then
            v110 = 2;
        end;
        l_Left_0.Text = v110 .. ".00";
        for v113 = v110, 1, -1 do
            if l_Left_0 then
                l_Left_0.Text = v113 .. ".00";
                wait(1);
            else
                break;
            end;
        end;
        l_Left_0.Text = "Closing..";
        wait(0.3);
        if v90.Name == "Message Clone" then
            v85(v77);
            v90.Name = "Message Removing";
            v51(v90, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 1, 0)
            }).Completed:Connect(function() --[[ Line: 379 ]]
                v90:Destroy();
            end);
        end;
    elseif v75 == "List" then
        if not l_FirstChild_0:FindFirstChild("Label Clone") then
            local l_l_FirstChild_0_FirstChild_2 = l_FirstChild_0:FindFirstChild("Mouse Label");
            if l_l_FirstChild_0_FirstChild_2 then
                l_l_FirstChild_0_FirstChild_2 = l_l_FirstChild_0_FirstChild_2:Clone();
                l_l_FirstChild_0_FirstChild_2.Name = "Label Clone";
                local l_Label_1 = l_l_FirstChild_0_FirstChild_2:FindFirstChild("Label");
                if l_Label_1 then
                    l_l_FirstChild_0_FirstChild_2.Parent = l_FirstChild_0;
                    mouseLabel = l_Label_1;
                end;
            end;
        end;
        local v116 = v76[1];
        local v117 = v76[2];
        local v118 = v76[3];
        local v119 = v76[4];
        local v120 = v76[5];
        local v121 = l_l_FirstChild_0_FirstChild_0:WaitForChild("List Template"):Clone();
        v82 = v121;
        v121.Name = "List Clone";
        local l_Alert_0 = v121:WaitForChild("Alert");
        local l_View_0 = l_Alert_0:WaitForChild("View");
        local l_Clipper_0 = l_Alert_0:WaitForChild("Decoration"):WaitForChild("Clipper");
        local l_Title_1 = l_Clipper_0:WaitForChild("Title");
        local l_ScrollingFrame_0 = v121:WaitForChild("ScrollingFrame");
        local l_Template_0 = l_ScrollingFrame_0:WaitForChild("Template");
        l_Template_0.Visible = false;
        local l_Controls_0 = v121:WaitForChild("Controls");
        local l_Exit_0 = l_Controls_0:WaitForChild("Exit");
        local l_Search_0 = l_Controls_0:WaitForChild("Search");
        local l_Refresh_0 = l_Controls_0:WaitForChild("Refresh");
        local l_Decoration_0 = l_Controls_0:WaitForChild("Decoration");
        v83 = l_Decoration_0;
        local l_Search_1 = l_Decoration_0:WaitForChild("Search");
        local l_TextBox_0 = l_Search_1:WaitForChild("TextBox");
        local l_Title_2 = l_Decoration_0:WaitForChild("Title");
        l_Title_2.Text = v116;
        if v120 then
            local v136 = 0;
            local v137 = nil;
            do
                local l_v136_0, l_v137_0 = v136, v137;
                l_v137_0 = l_Title_1:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 419 ]]
                    l_v137_0:Disconnect();
                    l_v136_0 = l_Title_1.TextBounds.X;
                    l_Title_1.Size = UDim2.new(0, l_v136_0, 1, 0);
                    if l_v136_0 > l_Clipper_0.AbsoluteSize.X then
                        local function v141() --[[ Line: 424 ]] --[[ Name: tweenAlert ]]
                            local l_BindableEvent_2 = Instance.new("BindableEvent");
                            l_BindableEvent_2.Parent = l_Alert_0;
                            if v121 and v121.Parent ~= nil then
                                v51(l_Title_1, 3, {
                                    Style = Enum.EasingStyle.Linear, 
                                    Direction = Enum.EasingDirection.Out
                                }, {
                                    Position = UDim2.new(0, -l_v136_0, 0, 0)
                                }).Completed:Connect(function() --[[ Line: 428 ]]
                                    l_Title_1.Position = UDim2.new(1, 5, 0, 0);
                                    if l_Title_1 and l_Title_1.Parent ~= nil then
                                        pcall(function() --[[ Line: 431 ]]
                                            v51(l_Title_1, 3, {
                                                Style = Enum.EasingStyle.Linear, 
                                                Direction = Enum.EasingDirection.Out
                                            }, {
                                                Position = UDim2.new(0, 0, 0, 0)
                                            }).Completed:Connect(function() --[[ Line: 432 ]]
                                                wait(2);
                                                l_BindableEvent_2:Fire();
                                            end);
                                        end);
                                    end;
                                end);
                            else
                                l_BindableEvent_2:Fire();
                            end;
                            l_BindableEvent_2.Event:Wait();
                            l_BindableEvent_2:Destroy();
                        end;
                        delay(2, function() --[[ Line: 445 ]]
                            while v121 ~= nil and v121.Parent ~= nil and l_Alert_0.Visible == true and l_Alert_0.Visible do
                                v141();
                            end;
                        end);
                    end;
                end);
                table.insert(v77, l_v137_0);
                l_Title_1.Text = v120;
                l_ScrollingFrame_0.Position = UDim2.new(0, 5, 0, 65);
                l_ScrollingFrame_0.Size = UDim2.new(1, -10, 1, -70);
                l_Alert_0.Visible = true;
                local v142 = nil;
                v142 = l_View_0.MouseButton1Down:Connect(function() --[[ Line: 463 ]]
                    l_v137_0:Disconnect();
                    v142:Disconnect();
                    l_Alert_0.Visible = false;
                    l_ScrollingFrame_0.Position = UDim2.new(0, 5, 0, 35);
                    l_ScrollingFrame_0.Size = UDim2.new(1, -10, 1, -40);
                    v43("Notification Transfer", {
                        "PSA", 
                        v120
                    });
                end);
                table.insert(v77, v142);
            end;
        end;
        if v118 and not v117 then
            l_Refresh_0.Visible = false;
            l_Decoration_0.Size = UDim2.new(1, -60, 0, 30);
        elseif not v118 and v117 then
            l_Search_0.Visible = false;
            l_Refresh_0.Position = UDim2.new(1, -60, 0, 0);
            l_Decoration_0.Size = UDim2.new(1, -60, 0, 30);
        elseif not v118 and not v117 then
            l_Decoration_0.Size = UDim2.new(1, -30, 0, 30);
            l_Search_0.Visible = false;
            l_Refresh_0.Visible = false;
        end;
        v121.Position = UDim2.new(0, -v121.Size.X.Offset - 5, 0.5, -150);
        v121.Parent = l_l_FirstChild_0_FirstChild_0;
        v121.Visible = true;
        table.insert(v77, l_Exit_0.MouseButton1Click:connect(function() --[[ Line: 491 ]]
            if v121.Name == "List Clone" then
                v121.Name = "List Removing";
                for v143, v144 in pairs(v52.Frames) do
                    if v144 == v121 then
                        table.remove(v52.Frames, v143);
                    end;
                end;
                v58(v52.Frames);
                v51(v121, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(v121.Position.X.Scale, v121.Position.X.Offset, 1, 5)
                }).Completed:Connect(function() --[[ Line: 500 ]]
                    v121:Destroy();
                end);
            end;
        end));
        local function v148(v145) --[[ Line: 506 ]] --[[ Name: tableTest ]]
            for _, v147 in next, v145 do
                if type(v147) == "table" then
                    return "Table";
                elseif type(v147) == "string" or type(v147) == "number" or type(v147) == "boolean" then
                    return "Other";
                end;
            end;
        end;
        local _ = function(v149, v150) --[[ Line: 516 ]] --[[ Name: queryTable ]]
            local v151 = {};
            pcall(function() --[[ Line: 518 ]]
                for _, v153 in pairs(v149) do
                    if string.lower(v153):match(string.lower(v150)) then
                        table.insert(v151, v153);
                    end;
                end;
            end);
            return v151;
        end;
        local v155 = {};
        local v156 = nil;
        local v157 = {};
        v157.__index = v157;
        v157.new = function() --[[ Line: 533 ]] --[[ Name: new ]]
            return (setmetatable({}, v157));
        end;
        v157.Break = function(v158) --[[ Line: 535 ]] --[[ Name: Break ]]
            v155[v158] = true;
        end;
        local l_v116_0 = v116 --[[ copy: 10 -> 50 ]];
        v157.NewLoop = function(v160, v161) --[[ Line: 539 ]] --[[ Name: NewLoop ]]
            for _, v163 in pairs(l_ScrollingFrame_0:GetChildren()) do
                if v163.Name ~= "Template" then
                    v163:Destroy();
                end;
            end;
            local v164 = 0;
            if #v161 >= 1 then
                for _, v166 in pairs(v161) do
                    if v155[v160] then
                        v155[v160] = nil;
                        return;
                    else
                        local v167 = l_Template_0:clone();
                        if l_v116_0 == "Commands" and v148(v161) == "Table" then
                            if v166[2] then
                                v167.Text = v166[2];
                                if v166[5] and v166[5][1] then
                                    v167.Text = v167.Text .. v166[5][1];
                                    v167.Name = v166[5][1];
                                else
                                    v167.Name = v166[1];
                                    v167.Text = v167.Text .. v166[1];
                                end;
                            end;
                        elseif l_v116_0 == "Donor Data" and v148(v161) == "Table" then
                            v167.Text = v166[1];
                            v167.Name = v166[1];
                        elseif l_v116_0 == "Permanent Bans" and v148(v161) == "Table" then
                            v167.Text = v166[2] .. ", " .. v166[1];
                            v167.Name = v166[1];
                        else
                            if #v166 > 1000 then
                                v167.Text = v166:sub(1, 1000) .. "\n(Message was truncated from " .. #v166 .. " characters to 1000 characters)";
                            else
                                v167.Text = v166;
                            end;
                            v167.Name = v166:sub(1, 25);
                        end;
                        if v164 == 0 then
                            v167.Position = UDim2.new(0, 5, 0, v167.Size.Y.Offset * v164 + 5 * v164);
                            v164 = 1;
                        else
                            v167.Position = UDim2.new(0, 5, 0, v167.Size.Y.Offset * v164 + 5 * v164);
                            v164 = v164 + 1;
                        end;
                        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, v167.Size.Y.Offset * v164 + 5 * v164);
                        v167.Parent = l_ScrollingFrame_0;
                        v167.TextTransparency = 1;
                        v167.Visible = true;
                        l_TweenService_0:Create(v167, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 0
                        }):Play();
                        local l_Frame_0 = v167:FindFirstChild("Frame");
                        if l_Frame_0 then
                            l_Frame_0.BackgroundTransparency = 1;
                            l_TweenService_0:Create(l_Frame_0, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0.85
                            }):Play();
                        end;
                        l_RunService_0.RenderStepped:wait();
                        if v164 >= 1500 then
                            v167.Name = "Displaying 1500 of " .. #v161 .. " results.";
                            v167.Text = "Displaying 1500 of " .. #v161 .. " results.";
                            return;
                        end;
                    end;
                end;
                return;
            else
                local v169 = l_Template_0:clone();
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, v169.Size.Y.Offset * 0 + 0);
                v169.Text = "No Data";
                v169.Parent = l_ScrollingFrame_0;
                v169.Name = "No Data";
                v169.Visible = true;
                l_TweenService_0:Create(v169, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextTransparency = 0
                }):Play();
                local l_Frame_1 = v169:FindFirstChild("Frame");
                if l_Frame_1 then
                    l_TweenService_0:Create(l_Frame_1, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.85
                    }):Play();
                end;
                return;
            end;
        end;
        local v171 = {};
        do
            local l_v119_0, l_v156_0 = v119, v156;
            table.insert(v77, l_ScrollingFrame_0.ChildAdded:connect(function(v174) --[[ Line: 644 ]]
                if v174:IsA("TextLabel") then
                    if not v171[v174] then
                        v171[v174] = {};
                    end;
                    if not v171[v174].MouseEnter then
                        v171[v174].MouseEnter = v174.MouseEnter:connect(function() --[[ Line: 650 ]]
                            if not v171[v174].MouseMoved then
                                v171[v174].MouseMoved = v174.MouseMoved:connect(function() --[[ Line: 652 ]]
                                    if not v78 then
                                        if l_v116_0 == "Commands" then
                                            local v175 = false;
                                            for _, v177 in pairs(l_v119_0) do
                                                if v177[5] and v177[5][1] and (v174.Name == v177[5][1] or v174.Name == (v177[2] or "") .. v177[5][1]) then
                                                    v175 = true;
                                                    mouseLabel.Text = v177[2] .. v177[5][1] .. " " .. v177[5][2] .. "\n" .. v177[5][3];
                                                end;
                                            end;
                                            if not v175 then
                                                mouseLabel.Text = v174.Text;
                                            end;
                                        elseif l_v116_0 == "Donor Data" then
                                            local v178 = false;
                                            for _, v180 in pairs(l_v119_0) do
                                                if v174.Name == v180[1] then
                                                    v178 = true;
                                                    mouseLabel.Text = v180[1] .. "\n" .. v180[2];
                                                end;
                                            end;
                                            if not v178 then
                                                mouseLabel.Text = v174.Text;
                                            end;
                                        elseif l_v116_0 == "Permanent Bans" then
                                            local v181 = false;
                                            for _, v183 in pairs(l_v119_0) do
                                                if tostring(v174.Name) == tostring(v183[1]) then
                                                    v181 = true;
                                                    local v184 = "";
                                                    if v183[3] then
                                                        v184 = "\nBanned by: " .. v183[3];
                                                    end;
                                                    mouseLabel.Text = v183[2] .. ", " .. v183[1] .. v184;
                                                end;
                                            end;
                                            if not v181 then
                                                mouseLabel.Text = v174.Text;
                                            end;
                                        else
                                            mouseLabel.Text = v174.Text;
                                        end;
                                        local l_X_0 = mouseLabel.TextBounds.X;
                                        local l_Y_3 = mouseLabel.TextBounds.Y;
                                        mouseLabel.Parent.Size = UDim2.new(0, l_X_0 + 20, 0, l_Y_3 + 15);
                                        if l_l_LocalPlayer_0_Mouse_0.X > l_FirstChild_0.AbsoluteSize.X - mouseLabel.Parent.AbsoluteSize.X and mouseLabel.Parent.AbsoluteSize.X <= l_FirstChild_0.AbsoluteSize.X then
                                            mouseLabel.Parent.AnchorPoint = Vector2.new(1, 1);
                                        else
                                            mouseLabel.Parent.AnchorPoint = Vector2.new(0, 1);
                                        end;
                                        mouseLabel.Parent.Position = UDim2.new(0, l_l_LocalPlayer_0_Mouse_0.X, 0, l_l_LocalPlayer_0_Mouse_0.Y);
                                        mouseLabel.Parent.Visible = true;
                                    end;
                                end);
                            end;
                        end);
                    end;
                    if not v171[v174].MouseLeave then
                        v171[v174].MouseLeave = v174.MouseLeave:connect(function() --[[ Line: 714 ]]
                            mouseLabel.Text = "";
                            mouseLabel.Parent.Visible = false;
                        end);
                    end;
                    if not v171[v174].Changed then
                        v171[v174].Changed = v174.Changed:connect(function(v187) --[[ Line: 720 ]]
                            if v187 == "Parent" and v174.Parent == nil and v171[v174] then
                                if v171[v174].MouseLeave then
                                    v171[v174].MouseLeave:Disconnect();
                                    v171[v174].MouseLeave = nil;
                                end;
                                if v171[v174].MouseEnter then
                                    v171[v174].MouseEnter:Disconnect();
                                    v171[v174].MouseEnter = nil;
                                end;
                                if v171[v174].MouseMoved then
                                    v171[v174].MouseMoved:Disconnect();
                                    v171[v174].MouseMoved = nil;
                                end;
                                v171[v174] = nil;
                            end;
                        end);
                    end;
                end;
            end));
            table.insert(v77, l_Search_0.MouseButton1Click:connect(function() --[[ Line: 743 ]]
                if l_Title_2.Visible then
                    l_Title_2.Visible = false;
                    l_Search_1.Visible = true;
                else
                    l_Title_2.Visible = true;
                    l_Search_1.Visible = false;
                    l_Title_2.Visible = true;
                end;
                l_TextBox_0.Text = "Search..";
            end));
            local v188 = false;
            table.insert(v77, l_Refresh_0.MouseButton1Click:connect(function() --[[ Line: 757 ]]
                if not v117 then
                    return;
                else
                    if not v188 then
                        v188 = true;
                        local v189 = v41("Refresh", l_v116_0);
                        if v189 then
                            l_v119_0 = v189;
                            if l_v156_0 then
                                l_v156_0:Break();
                            end;
                            local v190 = v157.new();
                            l_v156_0 = v190;
                            v190:NewLoop(l_v119_0);
                        end;
                        wait(0.15);
                        v188 = false;
                    end;
                    return;
                end;
            end));
            table.insert(v77, l_TextBox_0.Changed:connect(function(v191) --[[ Line: 776 ]]
                if v191 == "Text" then
                    if l_TextBox_0.Text ~= "" and l_TextBox_0.Text ~= "Search.." then
                        if l_v156_0 then
                            l_v156_0:Break();
                        end;
                        local v192 = nil;
                        if v148(l_v119_0) == "Table" then
                            local v193 = {};
                            for _, v195 in next, l_v119_0 do
                                if l_v116_0 == "Permanent Bans" then
                                    table.insert(v193, v195[2]);
                                else
                                    table.insert(v193, v195[1]);
                                end;
                            end;
                            local l_Text_0 = l_TextBox_0.Text;
                            local v197 = {};
                            local l_v193_0 = v193 --[[ copy: 2 -> 9 ]];
                            pcall(function() --[[ Line: 518 ]]
                                for _, v200 in pairs(l_v193_0) do
                                    if string.lower(v200):match(string.lower(l_Text_0)) then
                                        table.insert(v197, v200);
                                    end;
                                end;
                            end);
                            v192 = v197;
                        else
                            local l_l_v119_0_0 = l_v119_0;
                            local l_Text_1 = l_TextBox_0.Text;
                            local v203 = {};
                            local l_l_l_v119_0_0_0 = l_l_v119_0_0 --[[ copy: 2 -> 8 ]];
                            pcall(function() --[[ Line: 518 ]]
                                for _, v206 in pairs(l_l_l_v119_0_0_0) do
                                    if string.lower(v206):match(string.lower(l_Text_1)) then
                                        table.insert(v203, v206);
                                    end;
                                end;
                            end);
                            v192 = v203;
                        end;
                        local v207 = v157.new();
                        l_v156_0 = v207;
                        v207:NewLoop(v192);
                        return;
                    else
                        if l_v156_0 then
                            l_v156_0:Break();
                        end;
                        local v208 = v157.new();
                        l_v156_0 = v208;
                        v208:NewLoop(l_v119_0);
                    end;
                end;
            end));
            spawn(function() --[[ Line: 810 ]]
                local v209 = v157.new();
                l_v156_0 = v209;
                v209:NewLoop(l_v119_0);
            end);
            table.insert(v52.Frames, v121);
            v58(v52.Frames);
        end;
    elseif v75 == "Donor" then
        local v210 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Donor Template");
        local v211 = v210:Clone();
        v82 = v211;
        v211.Name = "Donor Clone";
        local l_Controls_1 = v211:WaitForChild("Controls");
        local l_Exit_1 = l_Controls_1:WaitForChild("Exit");
        local l_ScrollingFrame_1 = v211:WaitForChild("ScrollingFrame");
        local l_Decoration_1 = l_Controls_1:WaitForChild("Decoration");
        v83 = l_Decoration_1;
        local l_Title_3 = l_Decoration_1:WaitForChild("Title");
        local l_Overlay_0 = v211:WaitForChild("Overlay");
        local l_Color_0 = l_Overlay_0:WaitForChild("Color");
        local l_Material_0 = l_Overlay_0:WaitForChild("Material");
        local l_GuessConvert_0 = l_Overlay_0:WaitForChild("GuessConvert");
        local l_Colors_0 = l_Color_0:WaitForChild("Colors");
        local l_Cancel_0 = l_Color_0:WaitForChild("Cancel");
        local l_ScrollingFrame_2 = l_Material_0:WaitForChild("ScrollingFrame");
        local l_Template_1 = l_ScrollingFrame_2:WaitForChild("Template");
        local l_Cancel_1 = l_Material_0:WaitForChild("Cancel");
        local l_ScrollingFrame_3 = v211:WaitForChild("ScrollingFrame");
        local l_Cape_0 = l_ScrollingFrame_3:WaitForChild("Cape");
        local l_TextButton_1 = l_Cape_0:WaitForChild("TextButton");
        local l_Remove_0 = l_Cape_0:WaitForChild("Remove");
        local l_BrickColor_0 = l_Cape_0.Frame:WaitForChild("BrickColor");
        local l_BrickColorPick_0 = l_Cape_0.Frame:WaitForChild("BrickColorPick");
        l_Title_3.Text = "Donor Perks";
        table.insert(v77, l_BrickColor_0.FocusLost:connect(function() --[[ Line: 854 ]]
            if l_BrickColor_0.Text ~= "" then
                local v232 = BrickColor.new(l_BrickColor_0.Text);
                if tostring(v232) == "Medium stone grey" and l_BrickColor_0.Text ~= "Medium stone grey" then
                    l_BrickColor_0.Text = "Invalid BrickColor";
                    return;
                else
                    v30.capeData.bColor = tostring(v232);
                    l_BrickColor_0.Text = v30.capeData.bColor;
                end;
            end;
        end));
        for _, v234 in next, l_Colors_0:GetChildren() do
            if v234:IsA("ImageButton") then
                local l_Value_0 = v234:WaitForChild("PartColor").Value;
                v234.MouseButton1Click:connect(function() --[[ Line: 869 ]]
                    v30.capeData.bColor = tostring(l_Value_0);
                    l_BrickColor_0.Text = tostring(l_Value_0);
                    l_Color_0.Visible = false;
                    l_Overlay_0.Visible = false;
                    l_ScrollingFrame_1.Visible = true;
                end);
            end;
        end;
        local v236 = {
            "Glass", 
            "Brick", 
            "Cobblestone", 
            "Concrete", 
            "CorrodedMetal", 
            "DiamondPlate", 
            "Fabric", 
            "Foil", 
            "Granite", 
            "Grass", 
            "Ice", 
            "Marble", 
            "Metal", 
            "Neon", 
            "Pebble", 
            "Plastic", 
            "Sand", 
            "Slate", 
            "SmoothPlastic", 
            "Wood", 
            "WoodPlanks"
        };
        local _ = function(v237) --[[ Line: 903 ]] --[[ Name: checkMaterial ]]
            for _, v239 in next, v236 do
                if tostring(v237) == tostring(v239) then
                    return v239;
                end;
            end;
            return nil;
        end;
        table.insert(v77, l_Cancel_0.MouseButton1Click:connect(function() --[[ Line: 912 ]]
            l_Overlay_0.Visible = false;
            l_ScrollingFrame_1.Visible = true;
            l_Color_0.Visible = false;
            l_BrickColor_0.Text = "";
        end));
        table.insert(v77, l_BrickColorPick_0.MouseButton1Click:connect(function() --[[ Line: 919 ]]
            if not l_Overlay_0.Visible then
                l_ScrollingFrame_1.Visible = false;
                l_Overlay_0.Visible = true;
                l_Color_0.Visible = true;
            end;
        end));
        local l_Transparency_0 = l_Cape_0.Frame:WaitForChild("Transparency");
        local l_Material_1 = l_Cape_0.Frame:WaitForChild("Material");
        local l_MaterialPick_0 = l_Cape_0.Frame:WaitForChild("MaterialPick");
        local l_Image_0 = l_Cape_0.Frame:WaitForChild("Image");
        local _ = function(v245, v246) --[[ Line: 932 ]] --[[ Name: checkAsset ]]
            if tonumber(v245) then
                local v247 = nil;
                local l_status_2, _ = pcall(function() --[[ Line: 935 ]]
                    v247 = l_MarketplaceService_0:GetProductInfo((tonumber(v245)));
                end);
                if l_status_2 and v247.AssetTypeId == v246 then
                    return true;
                else
                    --[[ close >= 2 ]]
                end;
            end;
            return false;
        end;
        local function v278(v251) --[[ Line: 947 ]] --[[ Name: BeginGuessing ]]
            local v252 = {};
            local l_Confirm_0 = l_GuessConvert_0:WaitForChild("Confirm");
            local l_No_0 = l_GuessConvert_0:WaitForChild("No");
            local l_Cancel_2 = l_GuessConvert_0:WaitForChild("Cancel");
            local l_Previous_0 = l_GuessConvert_0:WaitForChild("Previous");
            local l_Loading_0 = l_GuessConvert_0:WaitForChild("Loading");
            local l_ImageFrame_0 = l_GuessConvert_0:WaitForChild("Frame"):WaitForChild("ImageFrame");
            local l_ImageLabel_0 = l_ImageFrame_0:WaitForChild("ImageLabel");
            local l_Info_0 = l_ImageFrame_0:WaitForChild("Info");
            local l_Name_0 = l_Info_0:WaitForChild("Name");
            local l_Id_0 = l_Info_0:WaitForChild("Id");
            local l_CreatorType_0 = l_Info_0:WaitForChild("CreatorType");
            local l_CreatorId_0 = l_Info_0:WaitForChild("CreatorId");
            local l_CreatorName_0 = l_Info_0:WaitForChild("CreatorName");
            local l_BindableEvent_3 = Instance.new("BindableEvent");
            local v267 = tonumber(v251);
            local v268 = false;
            local v269 = false;
            local function v277(v270) --[[ Line: 970 ]] --[[ Name: Guess ]]
                if v268 == true then
                    return;
                else
                    v268 = true;
                    l_Confirm_0.AutoButtonColor = false;
                    l_No_0.AutoButtonColor = false;
                    l_Previous_0.AutoButtonColor = false;
                    l_Cancel_2.AutoButtonColor = false;
                    l_Loading_0.Visible = true;
                    local v271 = nil;
                    local v272 = nil;
                    local v273 = nil;
                    local v274 = nil;
                    repeat
                        v267 = v267 + v270;
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 983 ]]
                            v273 = l_MarketplaceService_0:GetProductInfo(v267);
                        end);
                        v271 = l_status_3;
                        v272 = l_result_3;
                        if not v271 then
                            wait(0.5);
                        elseif v273.AssetTypeId ~= 1 then
                            l_Id_0.Data.Text = v273.AssetId .. " (" .. (v251 - v267 > 0 and "-" .. v251 - v267 or "+" .. (string.sub(v251 - v267, 2) ~= "" and string.sub(v251 - v267, 2) or "0")) .. ")";
                            if v269 ~= true then
                                l_RunService_0.Heartbeat:Wait();
                            else
                                break;
                            end;
                        else
                            v274 = true;
                        end;
                    until v271 == true and v273 ~= nil and v274 == true or v269 == true;
                    if not v269 then
                        l_ImageLabel_0.Image = "rbxassetid://" .. v267;
                        l_Name_0.Data.Text = v273.Name;
                        l_Id_0.Data.Text = v273.AssetId .. " (" .. (v251 - v267 > 0 and "-" .. v251 - v267 or "+" .. (string.sub(v251 - v267, 2) ~= "" and string.sub(v251 - v267, 2) or "0")) .. ")";
                        l_CreatorType_0.Data.Text = v273.Creator.CreatorType;
                        l_CreatorId_0.Data.Text = v273.Creator.CreatorTargetId;
                        l_CreatorName_0.Data.Text = v273.Creator.Name;
                        l_Loading_0.Visible = false;
                        l_Confirm_0.AutoButtonColor = true;
                        l_No_0.AutoButtonColor = true;
                        l_Previous_0.AutoButtonColor = true;
                        l_Cancel_2.AutoButtonColor = true;
                    end;
                    wait(0.1);
                    v268 = false;
                    return;
                end;
            end;
            v277(-1);
            l_ScrollingFrame_1.Visible = false;
            l_Overlay_0.Visible = true;
            l_GuessConvert_0.Visible = true;
            table.insert(v252, l_No_0.MouseButton1Click:Connect(function() --[[ Line: 1023 ]]
                v277(-1);
            end));
            table.insert(v252, l_Previous_0.MouseButton1Click:Connect(function() --[[ Line: 1027 ]]
                v277(1);
            end));
            table.insert(v252, l_Confirm_0.MouseButton1Click:Connect(function() --[[ Line: 1031 ]]
                if not v268 then
                    v85(v252);
                    l_Loading_0.Visible = false;
                    l_Confirm_0.AutoButtonColor = true;
                    l_No_0.AutoButtonColor = true;
                    l_Previous_0.AutoButtonColor = true;
                    l_Cancel_2.AutoButtonColor = true;
                    l_ScrollingFrame_1.Visible = true;
                    l_Overlay_0.Visible = false;
                    l_GuessConvert_0.Visible = false;
                    l_BindableEvent_3:Fire(v267);
                end;
            end));
            table.insert(v252, l_Cancel_2.MouseButton1Click:Connect(function() --[[ Line: 1049 ]]
                v85(v252);
                v269 = true;
                l_Loading_0.Visible = false;
                l_Confirm_0.AutoButtonColor = true;
                l_No_0.AutoButtonColor = true;
                l_Previous_0.AutoButtonColor = true;
                l_Cancel_2.AutoButtonColor = true;
                l_ScrollingFrame_1.Visible = true;
                l_Overlay_0.Visible = false;
                l_GuessConvert_0.Visible = false;
                l_BindableEvent_3:Fire();
            end));
            table.insert(v252, v211:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1065 ]]
                if v211.Parent == nil then
                    v85(v252);
                end;
            end));
            return l_BindableEvent_3.Event:Wait();
        end;
        local v279 = false;
        do
            local l_v279_0 = v279;
            table.insert(v77, l_Image_0.FocusLost:connect(function() --[[ Line: 1076 ]]
                local v281 = false;
                local v282 = false;
                if l_Image_0.Text ~= "" and not l_v279_0 then
                    l_v279_0 = true;
                    l_Image_0.ClearTextOnFocus = false;
                    l_Image_0.TextEditable = false;
                    local l_Text_2 = l_Image_0.Text;
                    l_Image_0.Text = l_Text_2 .. " (Converting)";
                    local v284;
                    if tonumber(l_Text_2) then
                        local v285 = nil;
                        local l_status_4, _ = pcall(function() --[[ Line: 935 ]]
                            v285 = l_MarketplaceService_0:GetProductInfo((tonumber(l_Text_2)));
                        end);
                        if l_status_4 and v285.AssetTypeId == 13 then
                            v284 = true;
                            --[[ close >= 2 ]]
                            v281 = true;
                        else
                            --[[ close >= 2 ]]
                        end;
                    end;
                    if not v281 then
                        v284 = false;
                    end;
                    v281 = false;
                    if v284 then
                        local v288 = v278(l_Text_2);
                        if v288 ~= nil then
                            v30.capeData.bImage = v288;
                            l_Image_0.Text = "Converted!";
                            wait(1);
                            l_Image_0.Text = v288;
                            l_Image_0.ClearTextOnFocus = true;
                            l_Image_0.TextEditable = true;
                        else
                            l_Image_0.Text = "Couldn't convert.";
                            l_Image_0.ClearTextOnFocus = true;
                            l_Image_0.TextEditable = true;
                        end;
                    else
                        local v289;
                        if tonumber(l_Text_2) then
                            local v290 = nil;
                            local l_status_5, _ = pcall(function() --[[ Line: 935 ]]
                                v290 = l_MarketplaceService_0:GetProductInfo((tonumber(l_Text_2)));
                            end);
                            if l_status_5 and v290.AssetTypeId == 1 then
                                v289 = true;
                                --[[ close >= 3 ]]
                                v282 = true;
                            else
                                --[[ close >= 3 ]]
                            end;
                        end;
                        if not v282 then
                            v289 = false;
                        end;
                        v282 = false;
                        if v289 then
                            l_Image_0.Text = l_Text_2;
                            v30.capeData.bImage = l_Text_2;
                            l_Image_0.ClearTextOnFocus = true;
                            l_Image_0.TextEditable = true;
                        else
                            l_Image_0.Text = "Not an image or a decal.";
                            l_Image_0.ClearTextOnFocus = true;
                            l_Image_0.TextEditable = true;
                        end;
                    end;
                    l_v279_0 = false;
                end;
            end));
            table.insert(v77, l_Cancel_1.MouseButton1Click:connect(function() --[[ Line: 1117 ]]
                l_ScrollingFrame_2.CanvasPosition = Vector2.new(0, 0);
                l_Overlay_0.Visible = false;
                l_ScrollingFrame_1.Visible = true;
                l_Material_0.Visible = false;
                l_Material_1.Text = "";
            end));
            table.insert(v77, l_Material_1.FocusLost:connect(function() --[[ Line: 1125 ]]
                local v293 = false;
                if l_Material_1.Text ~= "" then
                    local l_capeData_0 = v30.capeData;
                    local l_Text_3 = l_Material_1.Text;
                    local v296;
                    for _, v298 in next, v236 do
                        if tostring(l_Text_3) == tostring(v298) then
                            v296 = v298;
                            v293 = true;
                        end;
                        if v293 then
                            break;
                        end;
                    end;
                    if not v293 then
                        v296 = nil;
                    end;
                    v293 = false;
                    l_capeData_0.bMaterial = v296 or "SmoothPlastic";
                    l_Material_1.Text = tostring(v30.capeData.bMaterial);
                end;
            end));
            table.insert(v77, l_Transparency_0.FocusLost:connect(function() --[[ Line: 1132 ]]
                if l_Transparency_0.Text ~= "" then
                    local v299 = tonumber(l_Transparency_0.Text);
                    if v299 then
                        if v299 < 0 or v299 > 0.9 then
                            l_Transparency_0.Text = "Out of range. (0 - 0.9)";
                            return;
                        else
                            v30.capeData.bTrans = v299;
                            return;
                        end;
                    else
                        l_Transparency_0.Text = "Not a number.";
                    end;
                end;
            end));
            spawn(function() --[[ Line: 1147 ]]
                local v300 = 0;
                for _, v302 in pairs(v236) do
                    local v303 = l_Template_1:clone();
                    v303:WaitForChild("TextLabel").Text = v302;
                    v303.Name = v302;
                    if v300 == 0 then
                        v303.Position = UDim2.new(0, 1, 0, 30 * v300 + 5 * v300);
                        v300 = 1;
                    else
                        v303.Position = UDim2.new(0, 1, 0, 30 * v300 + 5 * v300);
                        v300 = v300 + 1;
                    end;
                    l_ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, 30 * v300 + 5 * v300);
                    v303.Parent = l_ScrollingFrame_2;
                    v303.Visible = true;
                    v303.MouseButton1Click:connect(function() --[[ Line: 1164 ]]
                        v30.capeData.bMaterial = tostring(v303.Name);
                        l_Material_1.Text = tostring(v303.Name);
                        l_Material_0.Visible = false;
                        l_Overlay_0.Visible = false;
                        l_ScrollingFrame_1.Visible = true;
                        l_ScrollingFrame_2.CanvasPosition = Vector2.new(0, 0);
                    end);
                end;
                l_ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, l_ScrollingFrame_2.CanvasSize.Y.Offset - 5);
            end);
            table.insert(v77, l_MaterialPick_0.MouseButton1Click:connect(function() --[[ Line: 1176 ]]
                if not l_Overlay_0.Visible then
                    l_Overlay_0.Visible = true;
                    l_Material_0.Visible = true;
                    l_ScrollingFrame_1.Visible = false;
                end;
            end));
            local v304 = false;
            table.insert(v77, l_TextButton_1.MouseButton1Click:connect(function() --[[ Line: 1186 ]]
                if l_v279_0 then
                    v304 = true;
                    l_TextButton_1.Text = "Converting..";
                    repeat
                        wait();
                    until not l_v279_0;
                    v304 = false;
                end;
                if not v30.Debounces.Cape and not v304 then
                    v30.Debounces.Cape = true;
                    repeat
                        wait();
                    until not l_UserInputService_0:GetFocusedTextBox();
                    l_TextButton_1.Text = "Applying..";
                    local v305, v306 = v41("Cape", v30.capeData);
                    if v305 then
                        l_TextButton_1.Text = "Applied!";
                        wait(1);
                        l_TextButton_1.Text = "Apply";
                    elseif not v305 then
                        l_TextButton_1.Text = v306 or "Error";
                        wait(1);
                        l_TextButton_1.Text = "Apply";
                    end;
                    wait(0.25);
                    v30.Debounces.Cape = false;
                end;
            end));
            table.insert(v77, l_Remove_0.MouseButton1Click:connect(function() --[[ Line: 1216 ]]
                if not v30.Debounces.Cape then
                    v30.Debounces.Cape = true;
                    v30.capeData.bColor = nil;
                    v30.capeData.bImage = nil;
                    v30.capeData.bMaterial = nil;
                    v30.capeData.bTrans = nil;
                    l_Remove_0.Text = "Removing..";
                    local v307, v308 = v41("Un Cape");
                    if v307 then
                        l_Remove_0.Text = "Removed!";
                        wait(1);
                        l_Remove_0.Text = "Remove";
                    elseif not v307 then
                        l_Remove_0.Text = v308 or "Error";
                        wait(1);
                        l_Remove_0.Text = "Remove";
                    end;
                    wait(0.25);
                    v30.Debounces.Cape = false;
                end;
            end));
            local l_Hat_0 = l_ScrollingFrame_3:WaitForChild("Hat");
            local l_TextButton_2 = l_Hat_0:WaitForChild("TextButton");
            local l_Remove_1 = l_Hat_0:WaitForChild("Remove");
            local l_Hat_1 = l_Hat_0.Frame:WaitForChild("Hat");
            local l_Face_0 = l_ScrollingFrame_3:WaitForChild("Face");
            local l_TextButton_3 = l_Face_0:WaitForChild("TextButton");
            local l_Face_1 = l_Face_0.Frame:WaitForChild("Face");
            table.insert(v77, l_Face_1.FocusLost:connect(function() --[[ Line: 1248 ]]
                local v316 = false;
                if l_Face_1.Text ~= "" then
                    v30.Debounces.faceLoading = true;
                    l_Face_1.ClearTextOnFocus = false;
                    l_Face_1.TextEditable = false;
                    local l_Text_4 = l_Face_1.Text;
                    local v318;
                    if tonumber(l_Text_4) then
                        local v319 = nil;
                        local l_status_6, _ = pcall(function() --[[ Line: 935 ]]
                            v319 = l_MarketplaceService_0:GetProductInfo((tonumber(l_Text_4)));
                        end);
                        if l_status_6 and v319.AssetTypeId == 18 then
                            v318 = true;
                            --[[ close >= 2 ]]
                            v316 = true;
                        else
                            --[[ close >= 2 ]]
                        end;
                    end;
                    if not v316 then
                        v318 = false;
                    end;
                    v316 = false;
                    if v318 then
                        v30.faceData = l_Face_1.Text;
                    else
                        l_Face_1.Text = "Invalid Id..";
                    end;
                    l_Face_1.ClearTextOnFocus = true;
                    l_Face_1.TextEditable = true;
                    v30.Debounces.faceLoading = false;
                end;
            end));
            table.insert(v77, l_Remove_1.MouseButton1Click:connect(function() --[[ Line: 1265 ]]
                if not v30.Debounces.ClearHats then
                    v30.Debounces.ClearHats = true;
                    l_Remove_1.Text = "Removing..";
                    local v322, v323 = v41("Remove Hats");
                    if v322 then
                        l_Remove_1.Text = "Removed!";
                        wait(1);
                        l_Remove_1.Text = "Remove Hats";
                    else
                        l_Remove_1.Text = v323 or "Error";
                        wait(1);
                        l_Remove_1.Text = "Remove Hats";
                    end;
                    wait(1);
                    v30.Debounces.ClearHats = false;
                end;
            end));
            table.insert(v77, l_TextButton_3.MouseButton1Click:connect(function() --[[ Line: 1284 ]]
                if not v30.Debounces.Face then
                    v30.Debounces.Face = true;
                    while true do
                        l_TextButton_3.Text = "Applying..";
                        if not l_UserInputService_0:GetFocusedTextBox() and v211.Parent ~= nil then
                            wait();
                            if not l_UserInputService_0:GetFocusedTextBox() and not v30.Debounces.faceLoading then
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                    if v30.faceData then
                        local v324, v325 = v41("Face", v30.faceData);
                        v30.faceData = nil;
                        if v324 then
                            l_TextButton_3.Text = "Applied!";
                            wait(1);
                            l_TextButton_3.Text = "Apply";
                        else
                            l_TextButton_3.Text = v325 or "Error";
                            wait(1);
                            l_TextButton_3.Text = "Apply";
                        end;
                        l_Face_1.Text = "Face Id..";
                    else
                        l_TextButton_3.Text = "Enter an Id.";
                        wait(1);
                    end;
                    v30.Debounces.Face = false;
                    l_TextButton_3.Text = "Apply";
                end;
            end));
            table.insert(v77, l_Hat_1.FocusLost:connect(function() --[[ Line: 1316 ]]
                local v326 = false;
                local v327 = false;
                local v328 = false;
                local v329 = false;
                local v330 = false;
                local v331 = false;
                local v332 = false;
                local v333 = false;
                if l_Hat_1.Text ~= "" then
                    v30.Debounces.hatLoading = true;
                    l_Hat_1.ClearTextOnFocus = false;
                    l_Hat_1.TextEditable = false;
                    local l_Text_5 = l_Hat_1.Text;
                    local v335;
                    if tonumber(l_Text_5) then
                        local v336 = nil;
                        local l_l_Text_5_0 = l_Text_5 --[[ copy: 1 -> 10 ]];
                        local l_status_7, _ = pcall(function() --[[ Line: 935 ]]
                            v336 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_0)));
                        end);
                        if l_status_7 and v336.AssetTypeId == 8 then
                            v335 = true;
                            --[[ close >= 2 ]]
                            v326 = true;
                        else
                            --[[ close >= 2 ]]
                        end;
                    end;
                    if not v326 then
                        v335 = false;
                    end;
                    v326 = false;
                    if not v335 then
                        l_Text_5 = l_Hat_1.Text;
                        if tonumber(l_Text_5) then
                            local v340 = nil;
                            local l_l_Text_5_1 = l_Text_5 --[[ copy: 1 -> 9 ]];
                            local l_status_8, _ = pcall(function() --[[ Line: 935 ]]
                                v340 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_1)));
                            end);
                            if l_status_8 and v340.AssetTypeId == 41 then
                                v335 = true;
                                --[[ close >= 2 ]]
                                v327 = true;
                            else
                                --[[ close >= 2 ]]
                            end;
                        end;
                        if not v327 then
                            v335 = false;
                        end;
                        v327 = false;
                        if not v335 then
                            l_Text_5 = l_Hat_1.Text;
                            if tonumber(l_Text_5) then
                                local v344 = nil;
                                local l_l_Text_5_2 = l_Text_5 --[[ copy: 1 -> 8 ]];
                                local l_status_9, _ = pcall(function() --[[ Line: 935 ]]
                                    v344 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_2)));
                                end);
                                if l_status_9 and v344.AssetTypeId == 42 then
                                    v335 = true;
                                    --[[ close >= 2 ]]
                                    v328 = true;
                                else
                                    --[[ close >= 2 ]]
                                end;
                            end;
                            if not v328 then
                                v335 = false;
                            end;
                            v328 = false;
                            if not v335 then
                                l_Text_5 = l_Hat_1.Text;
                                if tonumber(l_Text_5) then
                                    local v348 = nil;
                                    local l_l_Text_5_3 = l_Text_5 --[[ copy: 1 -> 7 ]];
                                    local l_status_10, _ = pcall(function() --[[ Line: 935 ]]
                                        v348 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_3)));
                                    end);
                                    if l_status_10 and v348.AssetTypeId == 43 then
                                        v335 = true;
                                        --[[ close >= 2 ]]
                                        v329 = true;
                                    else
                                        --[[ close >= 2 ]]
                                    end;
                                end;
                                if not v329 then
                                    v335 = false;
                                end;
                                v329 = false;
                                if not v335 then
                                    l_Text_5 = l_Hat_1.Text;
                                    if tonumber(l_Text_5) then
                                        local v352 = nil;
                                        local l_l_Text_5_4 = l_Text_5 --[[ copy: 1 -> 6 ]];
                                        local l_status_11, _ = pcall(function() --[[ Line: 935 ]]
                                            v352 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_4)));
                                        end);
                                        if l_status_11 and v352.AssetTypeId == 44 then
                                            v335 = true;
                                            --[[ close >= 2 ]]
                                            v330 = true;
                                        else
                                            --[[ close >= 2 ]]
                                        end;
                                    end;
                                    if not v330 then
                                        v335 = false;
                                    end;
                                    v330 = false;
                                    if not v335 then
                                        l_Text_5 = l_Hat_1.Text;
                                        if tonumber(l_Text_5) then
                                            local v356 = nil;
                                            local l_l_Text_5_5 = l_Text_5 --[[ copy: 1 -> 5 ]];
                                            local l_status_12, _ = pcall(function() --[[ Line: 935 ]]
                                                v356 = l_MarketplaceService_0:GetProductInfo((tonumber(l_l_Text_5_5)));
                                            end);
                                            if l_status_12 and v356.AssetTypeId == 45 then
                                                v335 = true;
                                                --[[ close >= 2 ]]
                                                v331 = true;
                                            else
                                                --[[ close >= 2 ]]
                                            end;
                                        end;
                                        if not v331 then
                                            v335 = false;
                                        end;
                                        v331 = false;
                                        if not v335 then
                                            l_Text_5 = l_Hat_1.Text;
                                            if tonumber(l_Text_5) then
                                                local v360 = nil;
                                                local l_status_13, _ = pcall(function() --[[ Line: 935 ]]
                                                    v360 = l_MarketplaceService_0:GetProductInfo((tonumber(l_Text_5)));
                                                end);
                                                if l_status_13 and v360.AssetTypeId == 46 then
                                                    v335 = true;
                                                    --[[ close >= 2 ]]
                                                    v332 = true;
                                                else
                                                    --[[ close >= 2 ]]
                                                end;
                                            end;
                                            if not v332 then
                                                v335 = false;
                                            end;
                                            v332 = false;
                                            if not v335 then
                                                l_Hat_1.Text = "Invalid Id..";
                                                v333 = true;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if not v333 then
                        v30.hatData = l_Hat_1.Text;
                    end;
                    v333 = false;
                    l_Hat_1.ClearTextOnFocus = true;
                    l_Hat_1.TextEditable = true;
                    v30.Debounces.hatLoading = false;
                end;
            end));
            local l_v210_0 = v210 --[[ copy: 10 -> 49 ]];
            table.insert(v77, l_TextButton_2.MouseButton1Click:connect(function() --[[ Line: 1332 ]]
                if not v30.Debounces.Hat then
                    v30.Debounces.Hat = true;
                    while true do
                        l_TextButton_2.Text = "Applying..";
                        if not l_UserInputService_0:GetFocusedTextBox() and l_v210_0.Parent ~= nil then
                            wait();
                            if not l_UserInputService_0:GetFocusedTextBox() and not v30.Debounces.hatLoading then
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                    if v30.hatData then
                        local v364, v365 = v41("Hat", v30.hatData);
                        v30.hatData = nil;
                        if v364 then
                            l_TextButton_2.Text = "Applied!";
                            wait(1);
                            l_TextButton_2.Text = "Apply";
                        elseif not v364 then
                            l_TextButton_2.Text = v365 or "Error";
                            wait(1);
                            l_TextButton_2.Text = "Apply";
                        end;
                        l_Hat_1.Text = "Hat Id..";
                    else
                        l_TextButton_2.Text = "Enter an Id.";
                        wait(1);
                    end;
                    v30.Debounces.Hat = false;
                    l_TextButton_2.Text = "Apply";
                end;
            end));
            v211.Position = UDim2.new(0, -v211.Size.X.Offset - 5, 0.5, -150);
            v211.Parent = l_l_FirstChild_0_FirstChild_0;
            v211.Visible = true;
            table.insert(v77, l_Exit_1.MouseButton1Click:connect(function() --[[ Line: 1368 ]]
                if v211.Name == "Donor Clone" then
                    v211.Name = "Donor Removing";
                    for v366, v367 in pairs(v52.Frames) do
                        if v367 == v211 then
                            table.remove(v52.Frames, v366);
                        end;
                    end;
                    v58(v52.Frames);
                    v51(v211, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(v211.Position.X.Scale, v211.Position.X.Offset, 1, 5)
                    }).Completed:Connect(function() --[[ Line: 1377 ]]
                        v211:Destroy();
                    end);
                end;
            end));
            table.insert(v52.Frames, v211);
            v58(v52.Frames);
        end;
    elseif v75 == "PBans" then
        if not l_FirstChild_0:FindFirstChild("Label Clone") then
            local l_l_FirstChild_0_FirstChild_3 = l_FirstChild_0:FindFirstChild("Mouse Label");
            if l_l_FirstChild_0_FirstChild_3 then
                l_l_FirstChild_0_FirstChild_3 = l_l_FirstChild_0_FirstChild_3:Clone();
                l_l_FirstChild_0_FirstChild_3.Name = "Label Clone";
                local l_Label_2 = l_l_FirstChild_0_FirstChild_3:FindFirstChild("Label");
                if l_Label_2 then
                    l_l_FirstChild_0_FirstChild_3.Parent = l_FirstChild_0;
                    mouseLabel = l_Label_2;
                end;
            end;
        end;
        local v370 = l_l_FirstChild_0_FirstChild_0:WaitForChild("PBans Template"):Clone();
        v82 = v370;
        local l_Controls_2 = v370:WaitForChild("Controls");
        local l_Alert_1 = v370:WaitForChild("Alert");
        local l_View_1 = l_Alert_1:WaitForChild("View");
        local l_Clipper_1 = l_Alert_1:WaitForChild("Decoration"):WaitForChild("Clipper");
        local l_Title_4 = l_Clipper_1:WaitForChild("Title");
        local l_Exit_2 = l_Controls_2:WaitForChild("Exit");
        local l_Data_0 = v370:WaitForChild("Data");
        local l_ScrollingFrame_4 = l_Data_0:WaitForChild("ScrollingFrame");
        local l_Template_2 = l_ScrollingFrame_4:WaitForChild("Template");
        l_Template_2.Visible = false;
        local l_Status_0 = v370:WaitForChild("Status");
        local l_Frame_2 = l_Status_0:WaitForChild("Frame");
        local l_Decoration_2 = l_Controls_2:WaitForChild("Decoration");
        v83 = l_Decoration_2;
        l_Decoration_2:WaitForChild("Title").Text = "Permanent Bans";
        local v383 = v76[1];
        if v383 then
            local v384 = 0;
            local v385 = nil;
            do
                local l_v384_0, l_v385_0 = v384, v385;
                l_v385_0 = l_Title_4:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 1417 ]]
                    l_v385_0:Disconnect();
                    l_v384_0 = l_Title_4.TextBounds.X;
                    l_Title_4.Size = UDim2.new(0, l_v384_0, 1, 0);
                    if l_v384_0 > l_Clipper_1.AbsoluteSize.X then
                        local function v389() --[[ Line: 1422 ]] --[[ Name: tweenAlert ]]
                            local l_BindableEvent_4 = Instance.new("BindableEvent");
                            if v370 and v370.Parent ~= nil then
                                v51(l_Title_4, 3, {
                                    Style = Enum.EasingStyle.Linear, 
                                    Direction = Enum.EasingDirection.Out
                                }, {
                                    Position = UDim2.new(0, -l_v384_0, 0, 0)
                                }).Completed:Connect(function() --[[ Line: 1425 ]]
                                    l_Title_4.Position = UDim2.new(1, 5, 0, 0);
                                    if l_Title_4 and l_Title_4.Parent ~= nil then
                                        pcall(function() --[[ Line: 1428 ]]
                                            v51(l_Title_4, 3, {
                                                Style = Enum.EasingStyle.Linear, 
                                                Direction = Enum.EasingDirection.Out
                                            }, {
                                                Position = UDim2.new(0, 0, 0, 0)
                                            }).Completed:Connect(function() --[[ Line: 1429 ]]
                                                wait(2);
                                                l_BindableEvent_4:Fire();
                                            end);
                                        end);
                                    end;
                                end);
                            else
                                l_BindableEvent_4:Fire();
                            end;
                            l_BindableEvent_4.Event:Wait();
                            l_BindableEvent_4:Destroy();
                        end;
                        delay(2, function() --[[ Line: 1442 ]]
                            while v370 ~= nil and v370.Parent ~= nil and l_Alert_1.Visible == true and l_Alert_1.Visible do
                                v389();
                            end;
                        end);
                    end;
                end);
                l_Title_4.Text = v383;
                l_Status_0.Position = UDim2.new(0, 5, 0, 65);
                l_Data_0.Position = UDim2.new(0, 5, 0, 170);
                l_Data_0.Size = UDim2.new(1, -10, 1, -175);
                l_Alert_1.Visible = true;
                local v390 = nil;
                v390 = l_View_1.MouseButton1Down:Connect(function() --[[ Line: 1462 ]]
                    l_v385_0:Disconnect();
                    v390:Disconnect();
                    l_Alert_1.Visible = false;
                    l_Status_0.Position = UDim2.new(0, 5, 0, 35);
                    l_Data_0.Position = UDim2.new(0, 5, 0, 140);
                    l_Data_0.Size = UDim2.new(1, -10, 1, -145);
                    v43("Notification Transfer", {
                        "PSA", 
                        v383
                    });
                end);
            end;
        end;
        local l_TextButton_4 = l_Status_0:WaitForChild("TextButton");
        local l_Box_0 = l_Frame_2:WaitForChild("Box");
        local l_Switch_0 = l_Frame_2:WaitForChild("Switch");
        v370.Position = UDim2.new(0, -v370.Size.X.Offset - 5, 0.5, -150);
        v370.Parent = l_l_FirstChild_0_FirstChild_0;
        v370.Visible = true;
        local v394 = "Username";
        local v395 = {};
        local v396 = nil;
        local v397 = {};
        v397.__index = v397;
        v397.new = function() --[[ Line: 1488 ]] --[[ Name: new ]]
            return (setmetatable({}, v397));
        end;
        v397.Break = function(v398) --[[ Line: 1490 ]] --[[ Name: Break ]]
            v395[v398] = true;
        end;
        v397.NewLoop = function(v399, v400) --[[ Line: 1494 ]] --[[ Name: NewLoop ]]
            for _, v402 in pairs(l_ScrollingFrame_4:GetChildren()) do
                if v402.Name ~= "Template" then
                    v402:Destroy();
                end;
            end;
            local v403 = {};
            table.insert(v77, l_ScrollingFrame_4.ChildAdded:connect(function(v404) --[[ Line: 1503 ]]
                if v404:IsA("TextLabel") then
                    if not v403[v404] then
                        v403[v404] = {};
                    end;
                    if not v403[v404].MouseEnter then
                        v403[v404].MouseEnter = v404.MouseEnter:connect(function() --[[ Line: 1509 ]]
                            if not v403[v404].MouseMoved then
                                v403[v404].MouseMoved = v404.MouseMoved:connect(function() --[[ Line: 1511 ]]
                                    if not v78 then
                                        if v404.Text == "This ban is a legacy ban." then
                                            mouseLabel.Text = "Basic Admin did some data restructuring, and this ban was from the old data structure.";
                                        else
                                            mouseLabel.Text = v404.Text;
                                        end;
                                        local l_X_1 = mouseLabel.TextBounds.X;
                                        local l_Y_4 = mouseLabel.TextBounds.Y;
                                        mouseLabel.Parent.Size = UDim2.new(0, l_X_1 + 20, 0, l_Y_4 + 15);
                                        if l_l_LocalPlayer_0_Mouse_0.X > l_FirstChild_0.AbsoluteSize.X - mouseLabel.Parent.AbsoluteSize.X and mouseLabel.Parent.AbsoluteSize.X <= l_FirstChild_0.AbsoluteSize.X then
                                            mouseLabel.Parent.AnchorPoint = Vector2.new(1, 1);
                                        else
                                            mouseLabel.Parent.AnchorPoint = Vector2.new(0, 1);
                                        end;
                                        mouseLabel.Parent.Position = UDim2.new(0, l_l_LocalPlayer_0_Mouse_0.X, 0, l_l_LocalPlayer_0_Mouse_0.Y);
                                        mouseLabel.Parent.Visible = true;
                                    end;
                                end);
                            end;
                        end);
                    end;
                    if not v403[v404].MouseLeave then
                        v403[v404].MouseLeave = v404.MouseLeave:connect(function() --[[ Line: 1536 ]]
                            mouseLabel.Text = "";
                            mouseLabel.Parent.Visible = false;
                        end);
                    end;
                    if not v403[v404].Changed then
                        v403[v404].Changed = v404.Changed:connect(function(v407) --[[ Line: 1542 ]]
                            if v407 == "Parent" and v404.Parent == nil and v403[v404] then
                                if v403[v404].MouseLeave then
                                    v403[v404].MouseLeave:Disconnect();
                                    v403[v404].MouseLeave = nil;
                                end;
                                if v403[v404].MouseEnter then
                                    v403[v404].MouseEnter:Disconnect();
                                    v403[v404].MouseEnter = nil;
                                end;
                                if v403[v404].MouseMoved then
                                    v403[v404].MouseMoved:Disconnect();
                                    v403[v404].MouseMoved = nil;
                                end;
                                v403[v404] = nil;
                            end;
                        end);
                    end;
                end;
            end));
            local v408 = 0;
            if #v400 >= 1 then
                for _, v410 in pairs(v400) do
                    if v395[v399] then
                        v395[v399] = nil;
                        return;
                    else
                        local v411 = l_Template_2:clone();
                        v411.Text = v410;
                        v411.Name = v410;
                        if v408 == 0 then
                            v411.Position = UDim2.new(0, 5, 0, v411.Size.Y.Offset * v408 + 5 * v408);
                            v408 = 1;
                        else
                            v411.Position = UDim2.new(0, 5, 0, v411.Size.Y.Offset * v408 + 5 * v408);
                            v408 = v408 + 1;
                        end;
                        l_ScrollingFrame_4.CanvasSize = UDim2.new(0, 0, 0, v411.Size.Y.Offset * v408 + 5 * v408);
                        v411.Parent = l_ScrollingFrame_4;
                        v411.TextTransparency = 1;
                        v411.Visible = true;
                        l_TweenService_0:Create(v411, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 0
                        }):Play();
                        local l_Frame_3 = v411:FindFirstChild("Frame");
                        if l_Frame_3 then
                            l_Frame_3.BackgroundTransparency = 1;
                            l_TweenService_0:Create(l_Frame_3, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0.85
                            }):Play();
                        end;
                        l_RunService_0.RenderStepped:wait();
                    end;
                end;
                return;
            else
                local v413 = l_Template_2:clone();
                l_ScrollingFrame_4.CanvasSize = UDim2.new(0, 0, 0, v413.Size.Y.Offset * 0 + 0);
                v413.Text = "No Data";
                v413.Parent = l_ScrollingFrame_4;
                v413.Name = "No Data";
                v413.Visible = true;
                l_TweenService_0:Create(v413, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    TextTransparency = 0
                }):Play();
                local l_Frame_4 = v413:FindFirstChild("Frame");
                if l_Frame_4 then
                    l_TweenService_0:Create(l_Frame_4, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.85
                    }):Play();
                end;
                return;
            end;
        end;
        do
            local l_v394_0, l_v396_0 = v394, v396;
            local function v421() --[[ Line: 1633 ]] --[[ Name: Check ]]
                if not v30.Debounces.checkPban and l_Box_0.Text ~= "Username.." and l_Box_0.Text ~= "User ID.." then
                    v30.Debounces.checkPban = true;
                    while true do
                        l_TextButton_4.Text = "Checking..";
                        if not l_UserInputService_0:GetFocusedTextBox() and v370.Parent ~= nil then
                            wait();
                            if not l_UserInputService_0:GetFocusedTextBox() then
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                    local v417, v418 = v41("Check PBan", l_v394_0, l_Box_0.Text);
                    spawn(function() --[[ Line: 1646 ]]
                        local v419 = v397.new();
                        l_v396_0 = v419;
                        local l_v418_0 = v418;
                        if v418 and type(v418) ~= "table" then
                            l_v418_0 = {};
                            if not v417 then
                                table.insert(l_v418_0, "Error: " .. v418);
                            else
                                table.insert(l_v418_0, v418);
                            end;
                        end;
                        v419:NewLoop(l_v418_0);
                    end);
                    l_TextButton_4.Text = "Check";
                    v30.Debounces.checkPban = false;
                end;
            end;
            table.insert(v77, l_TextButton_4.MouseButton1Down:Connect(function() --[[ Line: 1666 ]]
                v421();
            end));
            table.insert(v77, l_Switch_0.MouseButton1Down:Connect(function() --[[ Line: 1670 ]]
                if not v30.Debounces.checkPban then
                    if l_v394_0 == "Username" then
                        l_Box_0.Text = "User ID..";
                        l_Switch_0.Text = "UN";
                        l_v394_0 = "ID";
                        return;
                    else
                        l_Box_0.Text = "Username..";
                        l_Switch_0.Text = "ID";
                        l_v394_0 = "Username";
                    end;
                end;
            end));
            local v422 = nil;
            table.insert(v77, l_Box_0.FocusLost:Connect(function(v423) --[[ Line: 1686 ]]
                if not v30.Debounces.checkPban then
                    if l_Box_0.Text == "" then
                        if l_v394_0 == "Username" then
                            l_Box_0.Text = "User ID..";
                        else
                            l_Box_0.Text = "Username..";
                        end;
                    end;
                    v422 = l_Box_0.Text;
                    if v423 then
                        v421();
                        return;
                    end;
                else
                    l_Box_0.Text = v422;
                end;
            end));
            table.insert(v77, l_Exit_2.MouseButton1Click:connect(function() --[[ Line: 1704 ]]
                for v424, v425 in pairs(v52.Frames) do
                    if v425 == v370 then
                        table.remove(v52.Frames, v424);
                    end;
                end;
                v58(v52.Frames);
                v51(v370, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(v370.Position.X.Scale, v370.Position.X.Offset, 1, 5)
                }).Completed:Connect(function() --[[ Line: 1711 ]]
                    v370:Destroy();
                end);
            end));
            spawn(function() --[[ Line: 1716 ]]
                local v426 = v397.new();
                l_v396_0 = v426;
                v426:NewLoop({
                    "Enter data to search."
                });
            end);
            table.insert(v52.Frames, v370);
            v58(v52.Frames);
        end;
    elseif v75 == "Hint" then
        for _, v428 in next, l_l_FirstChild_0_FirstChild_0:GetChildren() do
            if v428.Name == "Hint Clone" then
                v428.Name = "Hint Removing";
                v51(v428, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(0, 0, 0, -v428.AbsoluteSize.Y)
                }).Completed:Connect(function() --[[ Line: 1728 ]]
                    v428:Destroy();
                end);
            end;
        end;
        local v429 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Hint Template"):Clone();
        v429.Name = "Hint Clone";
        local l_TextButton_5 = v429:WaitForChild("TextButton");
        local l_Top_1 = v429:WaitForChild("Top");
        local l_Body_1 = v429:WaitForChild("Body");
        local l_Title_5 = l_Top_1:WaitForChild("Title");
        local v434 = l_Body_1:WaitForChild("To Name Later");
        l_TextButton_5.MouseButton1Click:connect(function() --[[ Line: 1743 ]]
            if v429.Name ~= "Hint Removing" then
                v429.Name = "Hint Removing";
                v51(v429, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(0, 0, 0, -v429.AbsoluteSize.Y)
                }).Completed:Connect(function() --[[ Line: 1746 ]]
                    v429:Destroy();
                end);
            end;
        end);
        l_Title_5.Text = v76[1];
        v434.Text = v76[2];
        v429.Parent = l_l_FirstChild_0_FirstChild_0;
        v429.Visible = true;
        v429.Position = UDim2.new(0, 0, -1, 0);
        v51(v429, 0.3, {
            Style = Enum.EasingStyle.Quint, 
            Direction = Enum.EasingDirection.Out
        }, {
            Position = UDim2.new(0, 0, 0, 0)
        });
        local v435 = #v434.Text * 0.1 + 1;
        if v435 <= 1 then
            v435 = 2.5;
        elseif v435 > 10 then
            v435 = 10;
        end;
        wait(v435);
        if v429.Name ~= "Hint Removing" then
            v429.Name = "Hint Removing";
            v51(v429, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 0, -v429.AbsoluteSize.Y)
            }).Completed:Connect(function() --[[ Line: 1767 ]]
                v429:Destroy();
            end);
        end;
    end;
    if v82 ~= nil and v83 ~= nil then
        local function _(v436) --[[ Line: 1774 ]] --[[ Name: update ]]
            local v437 = v436.Position - v80;
            local v438 = v81.Y.Offset + v437.Y;
            local v439 = v81.X.Offset + v437.X;
            v82.Position = UDim2.new(v81.X.Scale, v439, v81.Y.Scale, v438);
        end;
        table.insert(v77, v83.InputBegan:Connect(function(v441) --[[ Line: 1783 ]]
            if v441.UserInputType == Enum.UserInputType.MouseButton1 or v441.UserInputType == Enum.UserInputType.Touch then
                v78 = true;
                v80 = v441.Position;
                v81 = v82.Position;
            end;
        end));
        table.insert(v77, v83.InputEnded:Connect(function(v442) --[[ Line: 1791 ]]
            if v442.UserInputType == Enum.UserInputType.MouseButton1 or v442.UserInputType == Enum.UserInputType.Touch then
                v78 = false;
            end;
        end));
        table.insert(v77, v83.InputChanged:Connect(function(v443) --[[ Line: 1797 ]]
            if v443.UserInputType == Enum.UserInputType.MouseMovement or v443.UserInputType == Enum.UserInputType.Touch then
                v79 = v443;
            end;
        end));
        table.insert(v77, l_UserInputService_0.InputChanged:Connect(function(v444) --[[ Line: 1803 ]]
            if v444 == v79 and v78 == true then
                local v445 = v444.Position - v80;
                local v446 = v81.Y.Offset + v445.Y;
                local v447 = v81.X.Offset + v445.X;
                v82.Position = UDim2.new(v81.X.Scale, v447, v81.Y.Scale, v446);
            end;
        end));
    end;
    if v82 ~= nil then
        table.insert(v77, v82:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1811 ]]
            if v82.Parent == nil then
                v85(v77);
            end;
        end));
    end;
end;
local function _(v449, v450, v451) --[[ Line: 1819 ]] --[[ Name: pendNotif ]]
    spawn(function() --[[ Line: 1820 ]]
        local l_Container_0 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Container");
        local v453 = l_Container_0:WaitForChild("Template"):Clone();
        local l_Inner_2 = v453:WaitForChild("Inner");
        local l_Controls_3 = l_Inner_2:WaitForChild("Controls");
        local l_Title_6 = l_Controls_3.Decoration:WaitForChild("Title");
        local l_Exit_3 = l_Controls_3:WaitForChild("Exit");
        local l_Open_0 = l_Inner_2:WaitForChild("Open");
        local l_Desc_0 = l_Inner_2:WaitForChild("Desc");
        v453.Name = "Notif Clone";
        v453.Visible = true;
        v453.Parent = l_Container_0;
        l_Title_6.Text = v449;
        l_Desc_0.Text = v450;
        local v460 = Instance.new("Sound", l_Workspace_0.CurrentCamera);
        v460.Name = "Notification";
        v460.SoundId = "rbxassetid://255881176";
        v460.Volume = 1;
        v460.Pitch = 1;
        v460.PlayOnRemove = true;
        v460:Destroy();
        v453.Position = UDim2.new(0, 0, 1, 0);
        l_Inner_2.Position = UDim2.new(0, 0, 1, 0);
        v51(l_Inner_2, 0.3, {
            Style = Enum.EasingStyle.Quint, 
            Direction = Enum.EasingDirection.Out
        }, {
            Position = UDim2.new(0, 0, 0, 0)
        });
        if v451[5] then
            local v461 = Instance.new("StringValue", v453);
            v461.Name = "Tag";
            v461.Value = v451[5];
        end;
        local v462 = nil;
        v462 = l_Exit_3.MouseButton1Click:connect(function() --[[ Line: 1855 ]]
            v462:Disconnect();
            if v451[5] then
                v43("Notification Transfer", {
                    "Complete Message", 
                    v451[5]
                });
            end;
            for v463, v464 in pairs(v52.Notifs) do
                if v464 == v453 then
                    table.remove(v52.Notifs, v463);
                end;
            end;
            v453:Destroy();
            figureNotifs(v52.Notifs, l_Container_0);
        end);
        local v465 = nil;
        v465 = l_Open_0.MouseButton1Click:connect(function() --[[ Line: 1870 ]]
            v465:Disconnect();
            v43("Notification Transfer", v451);
            for v466, v467 in pairs(v52.Notifs) do
                if v467 == v453 then
                    table.remove(v52.Notifs, v466);
                end;
            end;
            v453:Destroy();
            figureNotifs(v52.Notifs, l_Container_0);
        end);
        table.insert(v52.Notifs, v453);
        figureNotifs(v52.Notifs, l_Container_0);
    end);
end;
local v469 = nil;
local function v503(v470, v471, v472) --[[ Line: 1888 ]] --[[ Name: moveOn ]]
    v470:Previous();
    local function v490(v473) --[[ Line: 1890 ]] --[[ Name: Fade ]]
        local l_BindableEvent_5 = Instance.new("BindableEvent");
        local l_BindableEvent_6 = Instance.new("BindableEvent");
        local v476 = {};
        local v477 = {};
        local v478 = nil;
        v478 = l_BindableEvent_6.Event:Connect(function(v479) --[[ Line: 1895 ]]
            table.insert(v477, v479);
            if #v476 == #v477 then
                v478:Disconnect();
                l_BindableEvent_6:Destroy();
                v472:Destroy();
                l_BindableEvent_5:Fire();
            end;
        end);
        for _, v481 in next, v472:GetDescendants() do
            if v481:IsA("Frame") or v481:IsA("TextBox") or v481:IsA("TextLabel") or v481:IsA("TextButton") then
                table.insert(v476, v481);
            end;
        end;
        for _, v483 in next, v476 do
            local v484 = l_TweenService_0:Create(v483, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundTransparency = 1
            });
            local v485 = nil;
            do
                local l_v485_0 = v485;
                l_v485_0 = v484.Completed:Connect(function() --[[ Line: 1916 ]]
                    l_v485_0:Disconnect();
                    v484:Destroy();
                    l_BindableEvent_6:Fire(v483);
                end);
                v484:Play();
                if v483:IsA("TextBox") or v483:IsA("TextLabel") or v483:IsA("TextButton") then
                    local v487 = l_TweenService_0:Create(v483, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        TextTransparency = 1
                    });
                    local v488 = nil;
                    do
                        local l_v488_0 = v488;
                        l_v488_0 = v487.Completed:Connect(function() --[[ Line: 1929 ]]
                            l_v488_0:Disconnect();
                            v487:Destroy();
                            l_BindableEvent_6:Fire(v483);
                        end);
                        v487:Play();
                    end;
                end;
            end;
        end;
        if v473 then
            l_BindableEvent_5.Event:Wait();
            l_BindableEvent_5:Destroy();
        end;
    end;
    v490();
    local v491 = nil;
    v491 = v470.PageLeave:Connect(function(v492) --[[ Line: 1944 ]]
        if v492 == v472 then
            v491:Disconnect();
            v492:Destroy();
        end;
    end);
    local v493 = nil;
    v493 = v470.PageEnter:Connect(function(v494) --[[ Line: 1951 ]]
        if v494 == v472 then
            v493:Disconnect();
            v494:Destroy();
        end;
    end);
    local v495 = nil;
    v495 = v470.Stopped:Connect(function(v496) --[[ Line: 1958 ]]
        if v496 == v472 then
            v495:Disconnect();
            v496:Destroy();
        end;
    end);
    local v497 = 0;
    for _, v499 in next, v471:GetChildren() do
        if v499:IsA("Frame") then
            v497 = v497 + 1;
        end;
    end;
    v472.Changed:Connect(function() --[[ Line: 1970 ]]
        if v472.Parent == nil then
            local v500 = 0;
            for _, v502 in next, v471:GetChildren() do
                if not v502:IsA("UIPageLayout") then
                    v500 = v500 + 1;
                end;
            end;
            if v500 == 0 then
                v490(true);
                v471.Visible = false;
            end;
        end;
    end);
end;
local function v563(v504, v505, v506, v507) --[[ Line: 1986 ]] --[[ Name: displayPM ]]
    local v508 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Direct Messages");
    local l_Holder_0 = v508:WaitForChild("Holder");
    local l_Inner_3 = v508:WaitForChild("Inner");
    local l_UIPageLayout_0 = l_Inner_3:WaitForChild("UIPageLayout");
    if not v506 then
        local v512 = "From " .. v504;
        local v513 = {
            "Receive", 
            v504, 
            v505, 
            true, 
            v507
        };
        local l_spawn_0 = spawn;
        local v515 = "Personal Message";
        l_spawn_0(function() --[[ Line: 1820 ]]
            local l_Container_1 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Container");
            local v517 = l_Container_1:WaitForChild("Template"):Clone();
            local l_Inner_4 = v517:WaitForChild("Inner");
            local l_Controls_4 = l_Inner_4:WaitForChild("Controls");
            local l_Title_7 = l_Controls_4.Decoration:WaitForChild("Title");
            local l_Exit_4 = l_Controls_4:WaitForChild("Exit");
            local l_Open_1 = l_Inner_4:WaitForChild("Open");
            local l_Desc_1 = l_Inner_4:WaitForChild("Desc");
            v517.Name = "Notif Clone";
            v517.Visible = true;
            v517.Parent = l_Container_1;
            l_Title_7.Text = v515;
            l_Desc_1.Text = v512;
            local v524 = Instance.new("Sound", l_Workspace_0.CurrentCamera);
            v524.Name = "Notification";
            v524.SoundId = "rbxassetid://255881176";
            v524.Volume = 1;
            v524.Pitch = 1;
            v524.PlayOnRemove = true;
            v524:Destroy();
            v517.Position = UDim2.new(0, 0, 1, 0);
            l_Inner_4.Position = UDim2.new(0, 0, 1, 0);
            v51(l_Inner_4, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 0, 0)
            });
            if v513[5] then
                local v525 = Instance.new("StringValue", v517);
                v525.Name = "Tag";
                v525.Value = v513[5];
            end;
            local v526 = nil;
            v526 = l_Exit_4.MouseButton1Click:connect(function() --[[ Line: 1855 ]]
                v526:Disconnect();
                if v513[5] then
                    v43("Notification Transfer", {
                        "Complete Message", 
                        v513[5]
                    });
                end;
                for v527, v528 in pairs(v52.Notifs) do
                    if v528 == v517 then
                        table.remove(v52.Notifs, v527);
                    end;
                end;
                v517:Destroy();
                figureNotifs(v52.Notifs, l_Container_1);
            end);
            local v529 = nil;
            v529 = l_Open_1.MouseButton1Click:connect(function() --[[ Line: 1870 ]]
                v529:Disconnect();
                v43("Notification Transfer", v513);
                for v530, v531 in pairs(v52.Notifs) do
                    if v531 == v517 then
                        table.remove(v52.Notifs, v530);
                    end;
                end;
                v517:Destroy();
                figureNotifs(v52.Notifs, l_Container_1);
            end);
            table.insert(v52.Notifs, v517);
            figureNotifs(v52.Notifs, l_Container_1);
        end);
        return;
    else
        local v532 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Personal Message Template"):Clone();
        if v469 and v469.Connected then
            v469:Disconnect();
        end;
        v469 = l_UIPageLayout_0.Changed:Connect(function(v533) --[[ Line: 2004 ]]
            if v533 == "CurrentPage" then
                v51(l_Inner_3, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Size = UDim2.new(0, 420, 0.1, l_UIPageLayout_0.CurrentPage.Size.Y.Offset)
                });
            end;
        end);
        l_Inner_3.Visible = true;
        if v507 then
            local v534 = Instance.new("StringValue", v532);
            v534.Name = "Tag";
            v534.Value = v507;
        end;
        local l_Top_2 = v532:WaitForChild("Top");
        local l_Controls_5 = l_Top_2:WaitForChild("Controls");
        local l_Title_8 = l_Controls_5.Decoration:WaitForChild("Title");
        local l_Bottom_0 = v532:WaitForChild("Bottom");
        local l_Exit_5 = l_Controls_5:WaitForChild("Exit");
        local v540 = l_Top_2.Body["To Name Later"];
        local l_TextBox_1 = l_Bottom_0.Frame.Entry:WaitForChild("TextBox");
        local l_TextButton_6 = l_TextBox_1:WaitForChild("TextButton");
        local l_Send_0 = l_Bottom_0.Frame.Options:WaitForChild("Send");
        local l_Cancel_3 = l_Bottom_0.Frame.Options:WaitForChild("Cancel");
        local l_Toggled_0 = l_Bottom_0.Frame.Options:WaitForChild("Read"):WaitForChild("Toggled");
        l_Toggled_0.Size = UDim2.new(0, 0, 0, 0);
        l_Toggled_0.Visible = true;
        v532.Name = "PM Clone";
        v532.Parent = l_Holder_0;
        v532.Visible = true;
        if v507 then
            l_Title_8.Text = "Message from " .. v504;
        else
            l_Send_0.Visible = false;
            l_Cancel_3.Text = "Close";
            l_Title_8.Text = v504;
        end;
        local v546 = nil;
        v546 = v540.Changed:Connect(function(v547) --[[ Line: 2049 ]]
            if v547 == "TextBounds" then
                v546:Disconnect();
                local l_Y_5 = v540.TextBounds.Y;
                l_Top_2.Size = UDim2.new(1, 0, 0, l_Y_5 + 47);
                v532.Size = UDim2.new(0, 420, 0, l_Top_2.AbsoluteSize.Y + l_Bottom_0.AbsoluteSize.Y + 5);
                v51(l_Inner_3, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Size = UDim2.new(0, 420, 0.1, v532.Size.Y.Offset)
                });
                v532.Parent = l_Inner_3;
                if v506 then
                    l_UIPageLayout_0:JumpTo(v532);
                end;
            end;
        end);
        if not v505 or v505 == "" then
            v505 = "This message is empty.";
        end;
        v540.Text = v505;
        if v507 then
            local v549 = nil;
            do
                local l_v549_0 = v549;
                l_v549_0 = l_Send_0.MouseButton1Click:connect(function() --[[ Line: 2071 ]]
                    l_v549_0:Disconnect();
                    v43("Notification Transfer", {
                        "Send", 
                        v504, 
                        l_TextBox_1.Text, 
                        false, 
                        v507
                    });
                    v503(l_UIPageLayout_0, l_Inner_3, v532);
                end);
            end;
        end;
        local v551 = nil;
        v551 = l_Exit_5.MouseButton1Click:connect(function() --[[ Line: 2079 ]]
            v551:Disconnect();
            v43("Notification Transfer", {
                "Complete Message", 
                v507
            });
            v503(l_UIPageLayout_0, l_Inner_3, v532);
        end);
        local v552 = nil;
        v552 = l_Cancel_3.MouseButton1Click:connect(function() --[[ Line: 2086 ]]
            v552:Disconnect();
            v43("Notification Transfer", {
                "Complete Message", 
                v507
            });
            v503(l_UIPageLayout_0, l_Inner_3, v532);
        end);
        local v553 = nil;
        l_TextButton_6.MouseButton1Down:Connect(function() --[[ Line: 2093 ]]
            if not v553 then
                v553 = tick();
                l_TextBox_1:CaptureFocus();
                return;
            else
                if tick() - v553 < 0.25 then
                    l_TextBox_1.Text = "";
                    l_TextBox_1:CaptureFocus();
                else
                    l_TextBox_1:CaptureFocus();
                end;
                v553 = tick();
                return;
            end;
        end);
        local v554 = nil;
        l_TextBox_1.Focused:Connect(function() --[[ Line: 2109 ]]
            v554 = l_HttpService_0:GenerateGUID(false);
            local l_v554_0 = v554;
            delay(0.5, function() --[[ Line: 2112 ]]
                if v554 == l_v554_0 and l_TextBox_1:IsFocused() and l_TextButton_6 then
                    l_TextButton_6.Visible = false;
                end;
            end);
        end);
        if v507 then
            local v556 = nil;
            do
                local l_v556_0 = v556;
                l_v556_0 = l_TextBox_1.FocusLost:connect(function(v558) --[[ Line: 2123 ]]
                    l_TextButton_6.Visible = true;
                    if v558 then
                        l_v556_0:Disconnect();
                        v43("Notification Transfer", {
                            "Send", 
                            v504, 
                            l_TextBox_1.Text, 
                            false, 
                            v507
                        });
                        v503(l_UIPageLayout_0, l_Inner_3, v532);
                    end;
                end);
            end;
        else
            l_TextBox_1.Text = "You cannot reply to this message.";
        end;
        local v559 = nil;
        l_TextBox_1.Changed:Connect(function(v560) --[[ Line: 2136 ]]
            if v560 == "TextBounds" then
                l_Bottom_0.Size = UDim2.new(1, 0, 0, 200);
                if l_TextBox_1.TextFits then
                    if v507 then
                        v559 = l_TextBox_1.Text;
                    else
                        v559 = "You cannot reply to this message.";
                        l_TextBox_1.Text = v559;
                    end;
                    local l_Y_6 = l_TextBox_1.TextBounds.Y;
                    l_Bottom_0.Size = UDim2.new(1, 0, 0, l_Y_6 + 57);
                    l_Bottom_0.Position = UDim2.new(0, 0, 1, -l_Bottom_0.Size.Y.Offset);
                    return;
                else
                    l_TextBox_1.Text = v559 or "";
                end;
            end;
        end);
        l_Bottom_0.Changed:Connect(function(v562) --[[ Line: 2157 ]]
            if v562 == "Size" then
                v532.Size = UDim2.new(0, 420, 0, l_Top_2.Size.Y.Offset + l_Bottom_0.Size.Y.Offset + 5);
                v51(l_Inner_3, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Size = UDim2.new(0, 420, 0.1, v532.Size.Y.Offset)
                });
            end;
        end);
        return;
    end;
end;
local function _(v564) --[[ Line: 2164 ]] --[[ Name: viewPlayer ]]
    if v564 == nil then
        workspace.CurrentCamera.CameraType = "Custom";
        workspace.CurrentCamera.FieldOfView = 70;
        workspace.CurrentCamera.CameraSubject = l_LocalPlayer_0.Character.Humanoid;
        return;
    else
        if v564 then
            workspace.CurrentCamera.CameraSubject = v564;
        end;
        return;
    end;
end;
local v566 = {};
spawn(function() --[[ Line: 2175 ]]
    repeat
        l_RunService_0.Heartbeat:wait();
    until v30.donorEnabled ~= nil;
    l_RunService_0.RenderStepped:connect(function() --[[ Line: 2179 ]]
        for _, v568 in next, l_Players_0:GetPlayers() do
            if v568.Character and v568.Character:FindFirstChild("BAE Cape") and v568.Character:FindFirstChild("Humanoid") then
                local v569 = v568.Character["BAE Cape"];
                local l_Humanoid_0 = v568.Character.Humanoid;
                if v569:FindFirstChild("Motor") then
                    local l_Motor_0 = v569.Motor;
                    local v572 = nil;
                    v572 = if l_Humanoid_0.RigType == Enum.HumanoidRigType.R15 then v568.Character:WaitForChild("UpperTorso") else v568.Character:WaitForChild("Torso");
                    if v566[v568.UserId] == nil then
                        v566[v568.UserId] = {};
                    end;
                    v566[v568.UserId].Angle = 0;
                    local _ = v572.Velocity.magnitude;
                    if v566[v568.UserId].Wave then
                        v566[v568.UserId].Angle = v566[v568.UserId].Angle + v572.Velocity.magnitude / 11 * 0.01;
                        v566[v568.UserId].Wave = false;
                    else
                        v566[v568.UserId].Wave = true;
                    end;
                    v566[v568.UserId].Angle = v566[v568.UserId].Angle + math.min(v572.Velocity.magnitude / 11, 0.6);
                    l_Motor_0.MaxVelocity = math.min(v572.Velocity.magnitude / 111, 0.03);
                    l_Motor_0.DesiredAngle = -v566[v568.UserId].Angle;
                    if l_Motor_0.CurrentAngle < -0.15 and l_Motor_0.DesiredAngle > -0.15 then
                        l_Motor_0.MaxVelocity = 0.04;
                    end;
                end;
            elseif v566[v568.UserId] then
                v566[v568.UserId] = nil;
            end;
        end;
    end);
end);
local function _(v574) --[[ Line: 2219 ]] --[[ Name: keyDown ]]
    return l_UserInputService_0:IsKeyDown(v574);
end;
local function v604(v576) --[[ Line: 2223 ]] --[[ Name: flyPlayer ]]
    if v576 then
        if not v30.Flying and v30.canFly then
            v30.Flying = true;
            if not l_LocalPlayer_0.Character then
                return;
            else
                local l_HumanoidRootPart_0 = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart");
                local l_Humanoid_1 = l_LocalPlayer_0.Character:WaitForChild("Humanoid");
                local _ = 100;
                local _ = 5;
                local v581, v582, v583 = Vector3.new();
                local v584 = Instance.new("BodyGyro", l_HumanoidRootPart_0);
                local v585 = Instance.new("BodyVelocity", l_HumanoidRootPart_0);
                v584.D = 200;
                v585.P = 5000;
                v584.CFrame = l_HumanoidRootPart_0.CFrame;
                local v586 = Instance.new("BoolValue", l_HumanoidRootPart_0);
                v586.Name = "Fly";
                v586.Changed:connect(function(v587) --[[ Line: 2249 ]]
                    if v587 then
                        local v588 = if v587 then Vector3.new(8999999488, 8999999488, 8999999488, 0) else Vector3.new();
                        local l_l_Humanoid_1_0 = l_Humanoid_1;
                        local l_v584_0 = v584;
                        local l_v585_0 = v585;
                        l_l_Humanoid_1_0.PlatformStand = v587;
                        l_v584_0.MaxTorque = v588;
                        l_v585_0.MaxForce = v588;
                        Apple = l_Humanoid_1.Changed:connect(function(_) --[[ Line: 2253 ]]
                            if not v30.Flying then
                                Apple:disconnect();
                            end;
                            l_Humanoid_1.Jump = false;
                        end);
                    end;
                end);
                v586.Value = true;
                spawn(function() --[[ Line: 2264 ]]
                    local v593 = false;
                    repeat
                        if v586.Value then
                            wait();
                            local l_MoveDirection_0 = l_Humanoid_1.MoveDirection;
                            local l_CoordinateFrame_0 = game.Workspace.CurrentCamera.CoordinateFrame;
                            v582 = l_MoveDirection_0;
                            v583 = l_CoordinateFrame_0;
                            v582 = (v583:inverse() * CFrame.new(v583.p + v582)).p;
                            v581 = v581 * 0.95;
                            l_MoveDirection_0 = l_UserInputService_0:GetFocusedTextBox();
                            local v596 = math.max(-100, (math.min(100, v581.x + v582.x * 5)));
                            local v597 = -100;
                            local v598;
                            if not l_MoveDirection_0 then
                                local l_Space_0 = Enum.KeyCode.Space;
                                if l_UserInputService_0:IsKeyDown(l_Space_0) then
                                    v598 = v581.y + 5;
                                    v593 = v598;
                                end;
                                if not v593 then
                                    l_Space_0 = Enum.KeyCode.LeftControl;
                                    if l_UserInputService_0:IsKeyDown(l_Space_0) then
                                        v598 = v581.y - 5;
                                        v593 = v598;
                                    end;
                                end;
                            end;
                            if not v593 then
                                if not v593 then
                                    v598 = v581.y;
                                end;
                            end;
                            v593 = false;
                            v581 = Vector3.new(v596, math.max(v597, (math.min(v598))), (math.max(-100, (math.min(100, v581.z + v582.z * 5)))));
                            l_CoordinateFrame_0 = v584;
                            v596 = v585;
                            local l_v583_0 = v583;
                            v597 = (v583 * CFrame.new(v581)).p - v583.p;
                            l_CoordinateFrame_0.cframe = l_v583_0;
                            v596.velocity = v597;
                        else
                            wait();
                        end;
                    until not v586.Value;
                end);
                return;
            end;
        else
            return;
        end;
    else
        if l_LocalPlayer_0.Character then
            local l_HumanoidRootPart_1 = l_LocalPlayer_0.Character:WaitForChild("HumanoidRootPart");
            local l_Humanoid_2 = l_LocalPlayer_0.Character:WaitForChild("Humanoid");
            if l_HumanoidRootPart_1:FindFirstChild("Fly") and l_HumanoidRootPart_1:FindFirstChild("BodyGyro") and l_HumanoidRootPart_1:FindFirstChild("BodyVelocity") then
                if v30.Flying then
                    v30.Flying = false;
                    l_Humanoid_2.PlatformStand = false;
                    l_HumanoidRootPart_1:FindFirstChild("BodyGyro"):Destroy();
                    l_HumanoidRootPart_1:FindFirstChild("BodyVelocity"):Destroy();
                    local l_Fly_0 = l_HumanoidRootPart_1:FindFirstChild("Fly");
                    if l_Fly_0.Value then
                        l_Fly_0.Value = false;
                        l_Fly_0:Destroy();
                    end;
                else
                    return;
                end;
            end;
        end;
        return;
    end;
end;
local function v605() --[[ Line: 2301 ]] --[[ Name: Console ]]
    pcall(function() --[[ Line: 2302 ]]
        local _ = function(v606, v607) --[[ Line: 2303 ]] --[[ Name: queryTable ]]
            local v608 = nil;
            local _, _ = pcall(function() --[[ Line: 2305 ]]
                if v607 == nil then
                    return;
                else
                    for _, v610 in pairs(v606) do
                        if string.find(string.lower(v610[1]), string.lower(v607)) == 1 then
                            v608 = v610[1];
                        end;
                    end;
                    return;
                end;
            end);
            return v608;
        end;
        local v614 = nil;
        local l_Console_0 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Console");
        local l_Frame_5 = l_Console_0:WaitForChild("Frame");
        local l_TextBox_2 = l_Frame_5:WaitForChild("TextBox");
        local l_TextLabel_0 = l_Frame_5:WaitForChild("TextLabel");
        if not v67 then
            v67 = true;
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
            spawn(function() --[[ Line: 2325 ]]
                for _, v620 in pairs(l_l_FirstChild_0_FirstChild_0:GetChildren()) do
                    if v620.Name == "Hint Clone" then
                        v620.Name = "Hint Removing";
                        v51(v620, 0.3, {
                            Style = Enum.EasingStyle.Quint, 
                            Direction = Enum.EasingDirection.Out
                        }, {
                            Position = UDim2.new(0, 0, 0, -v620.AbsoluteSize.Y)
                        }).Completed:Connect(function() --[[ Line: 2329 ]]
                            v620:Destroy();
                        end);
                    end;
                end;
            end);
            l_Console_0.Position = UDim2.new(0, 0, 0, -31);
            l_TextLabel_0.Text = "Enter a command..";
            l_TextBox_2.Text = "";
            l_Console_0.Visible = true;
            l_TextBox_2:CaptureFocus();
            v51(l_Console_0, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 0, 0)
            });
        else
            v67 = false;
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            l_TextLabel_0.Text = "Enter a command..";
            l_TextBox_2.Text = "";
            l_TextBox_2:ReleaseFocus();
            v51(l_Console_0, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 0, -l_Console_0.AbsoluteSize.Y)
            });
        end;
        if not v68 then
            v68 = l_TextBox_2.Changed:connect(function() --[[ Line: 2351 ]]
                v614 = nil;
                if #l_TextBox_2.Text >= 1 then
                    local l_commandsTable_0 = v30.commandsTable;
                    local l_Text_6 = l_TextBox_2.Text;
                    local v623 = nil;
                    local l_l_Text_6_0 = l_Text_6 --[[ copy: 2 -> 6 ]];
                    local l_l_commandsTable_0_0 = l_commandsTable_0 --[[ copy: 1 -> 7 ]];
                    local v626;
                    do
                        local l_v623_0 = v623;
                        local _, _ = pcall(function() --[[ Line: 2305 ]]
                            if l_l_Text_6_0 == nil then
                                return;
                            else
                                for _, v629 in pairs(l_l_commandsTable_0_0) do
                                    if string.find(string.lower(v629[1]), string.lower(l_l_Text_6_0)) == 1 then
                                        l_v623_0 = v629[1];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v626 = l_v623_0;
                    end;
                    v614 = v626;
                    if v614 and v614 ~= l_TextBox_2.Text then
                        l_TextLabel_0.Text = v614;
                    else
                        l_TextLabel_0.Text = "";
                    end;
                elseif #l_TextBox_2.Text == 0 then
                    l_TextLabel_0.Text = "Enter a command..";
                end;
                if l_TextBox_2.Text:lower():match("\t") then
                    local l_commandsTable_1 = v30.commandsTable;
                    local v633 = l_TextBox_2.Text:match("%a+");
                    local v634 = nil;
                    local v635;
                    do
                        local l_v634_0 = v634;
                        local _, _ = pcall(function() --[[ Line: 2305 ]]
                            if v633 == nil then
                                return;
                            else
                                for _, v638 in pairs(l_commandsTable_1) do
                                    if string.find(string.lower(v638[1]), string.lower(v633)) == 1 then
                                        l_v634_0 = v638[1];
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v635 = l_v634_0;
                    end;
                    v614 = v635;
                    if not v614 then
                        return;
                    else
                        l_TextBox_2.Text = v614;
                        v70 = false;
                        l_TextBox_2:ReleaseFocus();
                        l_TextBox_2:CaptureFocus();
                        v70 = true;
                        return;
                    end;
                else
                    if l_TextBox_2.Text == "'" then
                        l_TextBox_2.Text = "";
                    end;
                    return;
                end;
            end);
        end;
        if not v69 then
            v69 = l_TextBox_2.FocusLost:connect(function(v641) --[[ Line: 2377 ]]
                if v641 and l_TextBox_2.Text ~= "" then
                    v43("Execute", l_TextBox_2.Text);
                end;
                if v70 then
                    v605();
                end;
            end);
        end;
    end);
end;
l_UserInputService_0.InputBegan:connect(function(v642, _) --[[ Line: 2391 ]]
    local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
    if l_l_UserInputService_0_FocusedTextBox_0 then
        return;
    else
        if not l_l_UserInputService_0_FocusedTextBox_0 and v642.UserInputType == Enum.UserInputType.Keyboard then
            local l_KeyCode_0 = v642.KeyCode;
            if l_KeyCode_0 == Enum.KeyCode.Quote then
                if v30.Key and v30.Permission and v30.Permission >= 1 then
                    pcall(function() --[[ Line: 2302 ]]
                        local _ = function(v646, v647) --[[ Line: 2303 ]] --[[ Name: queryTable ]]
                            local v648 = nil;
                            local _, _ = pcall(function() --[[ Line: 2305 ]]
                                if v647 == nil then
                                    return;
                                else
                                    for _, v650 in pairs(v646) do
                                        if string.find(string.lower(v650[1]), string.lower(v647)) == 1 then
                                            v648 = v650[1];
                                        end;
                                    end;
                                    return;
                                end;
                            end);
                            return v648;
                        end;
                        local v654 = nil;
                        local l_Console_1 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Console");
                        local l_Frame_6 = l_Console_1:WaitForChild("Frame");
                        local l_TextBox_3 = l_Frame_6:WaitForChild("TextBox");
                        local l_TextLabel_1 = l_Frame_6:WaitForChild("TextLabel");
                        if not v67 then
                            v67 = true;
                            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
                            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
                            spawn(function() --[[ Line: 2325 ]]
                                for _, v660 in pairs(l_l_FirstChild_0_FirstChild_0:GetChildren()) do
                                    if v660.Name == "Hint Clone" then
                                        v660.Name = "Hint Removing";
                                        v51(v660, 0.3, {
                                            Style = Enum.EasingStyle.Quint, 
                                            Direction = Enum.EasingDirection.Out
                                        }, {
                                            Position = UDim2.new(0, 0, 0, -v660.AbsoluteSize.Y)
                                        }).Completed:Connect(function() --[[ Line: 2329 ]]
                                            v660:Destroy();
                                        end);
                                    end;
                                end;
                            end);
                            l_Console_1.Position = UDim2.new(0, 0, 0, -31);
                            l_TextLabel_1.Text = "Enter a command..";
                            l_TextBox_3.Text = "";
                            l_Console_1.Visible = true;
                            l_TextBox_3:CaptureFocus();
                            v51(l_Console_1, 0.3, {
                                Style = Enum.EasingStyle.Quint, 
                                Direction = Enum.EasingDirection.Out
                            }, {
                                Position = UDim2.new(0, 0, 0, 0)
                            });
                        else
                            v67 = false;
                            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
                            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
                            l_TextLabel_1.Text = "Enter a command..";
                            l_TextBox_3.Text = "";
                            l_TextBox_3:ReleaseFocus();
                            v51(l_Console_1, 0.3, {
                                Style = Enum.EasingStyle.Quint, 
                                Direction = Enum.EasingDirection.Out
                            }, {
                                Position = UDim2.new(0, 0, 0, -l_Console_1.AbsoluteSize.Y)
                            });
                        end;
                        if not v68 then
                            v68 = l_TextBox_3.Changed:connect(function() --[[ Line: 2351 ]]
                                v654 = nil;
                                if #l_TextBox_3.Text >= 1 then
                                    local l_commandsTable_2 = v30.commandsTable;
                                    local l_Text_7 = l_TextBox_3.Text;
                                    local v663 = nil;
                                    local l_l_Text_7_0 = l_Text_7 --[[ copy: 2 -> 6 ]];
                                    local l_l_commandsTable_2_0 = l_commandsTable_2 --[[ copy: 1 -> 7 ]];
                                    local v666;
                                    do
                                        local l_v663_0 = v663;
                                        local _, _ = pcall(function() --[[ Line: 2305 ]]
                                            if l_l_Text_7_0 == nil then
                                                return;
                                            else
                                                for _, v669 in pairs(l_l_commandsTable_2_0) do
                                                    if string.find(string.lower(v669[1]), string.lower(l_l_Text_7_0)) == 1 then
                                                        l_v663_0 = v669[1];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v666 = l_v663_0;
                                    end;
                                    v654 = v666;
                                    if v654 and v654 ~= l_TextBox_3.Text then
                                        l_TextLabel_1.Text = v654;
                                    else
                                        l_TextLabel_1.Text = "";
                                    end;
                                elseif #l_TextBox_3.Text == 0 then
                                    l_TextLabel_1.Text = "Enter a command..";
                                end;
                                if l_TextBox_3.Text:lower():match("\t") then
                                    local l_commandsTable_3 = v30.commandsTable;
                                    local v673 = l_TextBox_3.Text:match("%a+");
                                    local v674 = nil;
                                    local v675;
                                    do
                                        local l_v674_0 = v674;
                                        local _, _ = pcall(function() --[[ Line: 2305 ]]
                                            if v673 == nil then
                                                return;
                                            else
                                                for _, v678 in pairs(l_commandsTable_3) do
                                                    if string.find(string.lower(v678[1]), string.lower(v673)) == 1 then
                                                        l_v674_0 = v678[1];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end);
                                        v675 = l_v674_0;
                                    end;
                                    v654 = v675;
                                    if not v654 then
                                        return;
                                    else
                                        l_TextBox_3.Text = v654;
                                        v70 = false;
                                        l_TextBox_3:ReleaseFocus();
                                        l_TextBox_3:CaptureFocus();
                                        v70 = true;
                                        return;
                                    end;
                                else
                                    if l_TextBox_3.Text == "'" then
                                        l_TextBox_3.Text = "";
                                    end;
                                    return;
                                end;
                            end);
                        end;
                        if not v69 then
                            v69 = l_TextBox_3.FocusLost:connect(function(v681) --[[ Line: 2377 ]]
                                if v681 and l_TextBox_3.Text ~= "" then
                                    v43("Execute", l_TextBox_3.Text);
                                end;
                                if v70 then
                                    v605();
                                end;
                            end);
                        end;
                    end);
                    return;
                end;
            elseif l_KeyCode_0 == Enum.KeyCode.E then
                if v30.Flying then
                    v604(false);
                    return;
                elseif not v30.Flying and v30.canFly then
                    v604(true);
                end;
            end;
        end;
        return;
    end;
end);
local function v692(v682, v683) --[[ Line: 2412 ]] --[[ Name: commandConfirmation ]]
    if l_l_FirstChild_0_FirstChild_0:FindFirstChild("Confirmation Clone") then
        return false;
    else
        local v684 = nil;
        local v685 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Confirmation"):Clone();
        v685.Name = "Confirmation Clone";
        v685.Parent = l_l_FirstChild_0_FirstChild_0;
        v685.Position = UDim2.new(0.5, -210, 0, -v685.Size.Y.Offset);
        v685.Visible = true;
        local l_Body_2 = v685:WaitForChild("Body");
        local l_Options_0 = l_Body_2:WaitForChild("Options");
        local l_Confirm_1 = l_Options_0:WaitForChild("Confirm");
        local l_Cancel_4 = l_Options_0:WaitForChild("Cancel");
        l_Body_2:WaitForChild("Command").Text = "\"" .. v682 .. " " .. v683 .. "\"";
        v51(v685, 0.3, {
            Style = Enum.EasingStyle.Quint, 
            Direction = Enum.EasingDirection.Out
        }, {
            Position = UDim2.new(0.5, -210, 0.5, -70)
        });
        local v690 = nil;
        v690 = l_Confirm_1.MouseButton1Click:connect(function() --[[ Line: 2430 ]]
            v690:Disconnect();
            v51(v685, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0.5, -210, 1, 0)
            }).Completed:Connect(function() --[[ Line: 2432 ]]
                v685:Destroy();
            end);
            v684 = true;
        end);
        local v691 = nil;
        v691 = l_Cancel_4.MouseButton1Click:connect(function() --[[ Line: 2438 ]]
            v691:Disconnect();
            v51(v685, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0.5, -210, 1, 0)
            }).Completed:Connect(function() --[[ Line: 2440 ]]
                v685:Destroy();
            end);
            v684 = false;
        end);
        repeat
            wait();
        until v684 ~= nil;
        return v684;
    end;
end;
l_RemoteFunction_0.OnClientInvoke = function(v693, ...) --[[ Line: 2451 ]] --[[ Name: OnClientInvoke ]]
    local v694 = {
        ...
    };
    if v693 == "Command Confirmation" then
        if not v30.Key then
            local l_BindableEvent_7 = Instance.new("BindableEvent");
            v39[l_BindableEvent_7] = true;
            l_BindableEvent_7.Event:Wait();
            v39[l_BindableEvent_7] = nil;
            l_BindableEvent_7:Destroy();
        end;
        return (v692(v694[1], v694[2]));
    elseif v693 == "Client Setup" and not v30.Permission and not v30.Key then
        for v696, v697 in next, v694[1] do
            v30[v696] = v697;
        end;
        l_TestService_0:Message("Basic Admin 2 | " .. v30.Version .. " | Prefix: \"" .. v30.Prefix .. "\" | Act. Prefix: \"" .. v30.actionPrefix .. "\"");
        local v698 = nil;
        if v30.Permission == 1 then
            v698 = "Moderator";
        elseif v30.Permission == 2 then
            v698 = "Administrator";
        elseif v30.Permission == 3 then
            v698 = "Super Admin";
        elseif v30.Permission == 4 then
            v698 = "Creator Admin";
            l_TestService_0:Message("Basic Admin 2 | DP: " .. tostring(v30.donorEnabled) .. " | CD: " .. tostring(v30.Debugging));
        end;
        if v698 then
            local l_v698_0 = v698;
            local v700 = {
                "Cmds"
            };
            local l_spawn_1 = spawn;
            local v702 = "Click for Commands";
            l_spawn_1(function() --[[ Line: 1820 ]]
                local l_Container_2 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Container");
                local v704 = l_Container_2:WaitForChild("Template"):Clone();
                local l_Inner_5 = v704:WaitForChild("Inner");
                local l_Controls_6 = l_Inner_5:WaitForChild("Controls");
                local l_Title_9 = l_Controls_6.Decoration:WaitForChild("Title");
                local l_Exit_6 = l_Controls_6:WaitForChild("Exit");
                local l_Open_2 = l_Inner_5:WaitForChild("Open");
                local l_Desc_2 = l_Inner_5:WaitForChild("Desc");
                v704.Name = "Notif Clone";
                v704.Visible = true;
                v704.Parent = l_Container_2;
                l_Title_9.Text = l_v698_0;
                l_Desc_2.Text = v702;
                local v711 = Instance.new("Sound", l_Workspace_0.CurrentCamera);
                v711.Name = "Notification";
                v711.SoundId = "rbxassetid://255881176";
                v711.Volume = 1;
                v711.Pitch = 1;
                v711.PlayOnRemove = true;
                v711:Destroy();
                v704.Position = UDim2.new(0, 0, 1, 0);
                l_Inner_5.Position = UDim2.new(0, 0, 1, 0);
                v51(l_Inner_5, 0.3, {
                    Style = Enum.EasingStyle.Quint, 
                    Direction = Enum.EasingDirection.Out
                }, {
                    Position = UDim2.new(0, 0, 0, 0)
                });
                if v700[5] then
                    local v712 = Instance.new("StringValue", v704);
                    v712.Name = "Tag";
                    v712.Value = v700[5];
                end;
                local v713 = nil;
                v713 = l_Exit_6.MouseButton1Click:connect(function() --[[ Line: 1855 ]]
                    v713:Disconnect();
                    if v700[5] then
                        v43("Notification Transfer", {
                            "Complete Message", 
                            v700[5]
                        });
                    end;
                    for v714, v715 in pairs(v52.Notifs) do
                        if v715 == v704 then
                            table.remove(v52.Notifs, v714);
                        end;
                    end;
                    v704:Destroy();
                    figureNotifs(v52.Notifs, l_Container_2);
                end);
                local v716 = nil;
                v716 = l_Open_2.MouseButton1Click:connect(function() --[[ Line: 1870 ]]
                    v716:Disconnect();
                    v43("Notification Transfer", v700);
                    for v717, v718 in pairs(v52.Notifs) do
                        if v718 == v704 then
                            table.remove(v52.Notifs, v717);
                        end;
                    end;
                    v704:Destroy();
                    figureNotifs(v52.Notifs, l_Container_2);
                end);
                table.insert(v52.Notifs, v704);
                figureNotifs(v52.Notifs, l_Container_2);
            end);
        end;
        return v30.Key;
    else
        return;
    end;
end;
local function v729(v719, v720) --[[ Line: 2491 ]] --[[ Name: localName ]]
    if v719 and v719.Character then
        local l_FirstChild_1 = v719.Character:FindFirstChild("BAE_Named", true);
        local l_Head_0 = v719.Character:FindFirstChild("Head");
        local l_Humanoid_3 = v719.Character:FindFirstChildOfClass("Humanoid");
        if l_Head_0 ~= nil and l_Humanoid_3 ~= nil then
            if l_FirstChild_1 and l_FirstChild_1.Parent:IsA("Model") and l_FirstChild_1:IsDescendantOf(v719.Character) then
                l_FirstChild_1.Parent:Destroy();
                if not v720 then
                    l_Head_0.Transparency = 0;
                    return;
                end;
            end;
            if v720 then
                local v724 = l_Head_0:Clone();
                v724:ClearAllChildren();
                v724.Transparency = 0;
                local v725 = Instance.new("Model", v719.Character);
                v725.Name = v720;
                v724.Parent = v725;
                local l_BoolValue_0 = Instance.new("BoolValue");
                l_BoolValue_0.Name = "BAE_Named";
                l_BoolValue_0.Parent = v725;
                local v727 = Instance.new("Humanoid", v725);
                v727.Name = "Name Tag";
                v727.DisplayName = v720;
                v727.MaxHealth = 0;
                v727.Health = 0;
                local v728 = Instance.new("Motor6D", v724);
                v728.Part0 = v724;
                v728.Part1 = l_Head_0;
                l_Head_0.Transparency = 1;
                if v719 == l_LocalPlayer_0 then
                    workspace.CurrentCamera.CameraType = "Custom";
                    workspace.CurrentCamera.FieldOfView = 70;
                    workspace.CurrentCamera.CameraSubject = l_Humanoid_3;
                end;
            end;
        end;
    end;
end;
l_RemoteEvent_0.OnClientEvent:connect(function(v730, ...) --[[ Line: 2541 ]]
    if not v30.Key then
        local l_BindableEvent_8 = Instance.new("BindableEvent");
        v39[l_BindableEvent_8] = true;
        l_BindableEvent_8.Event:Wait();
        v39[l_BindableEvent_8] = nil;
        l_BindableEvent_8:Destroy();
    end;
    local v732 = {
        ...
    };
    if v730 == "Message" then
        v448("Message", {
            v732[1], 
            v732[2]
        });
        return;
    elseif v730 == "Communications Ready" then
        for v733, _ in next, v39 do
            if v733 ~= nil and v39[v733] ~= nil then
                v733:Fire();
            end;
        end;
        return;
    elseif v730 == "Donor" then
        v448("Donor");
        return;
    elseif v730 == "PBans" then
        v448("PBans", v732);
        return;
    elseif v730 == "List" then
        v448("List", v732);
        return;
    elseif v730 == "Notif" then
        local v735 = v732[1];
        local v736 = v732[2];
        local v737 = v732[3];
        spawn(function() --[[ Line: 1820 ]]
            local l_Container_3 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Container");
            local v739 = l_Container_3:WaitForChild("Template"):Clone();
            local l_Inner_6 = v739:WaitForChild("Inner");
            local l_Controls_7 = l_Inner_6:WaitForChild("Controls");
            local l_Title_10 = l_Controls_7.Decoration:WaitForChild("Title");
            local l_Exit_7 = l_Controls_7:WaitForChild("Exit");
            local l_Open_3 = l_Inner_6:WaitForChild("Open");
            local l_Desc_3 = l_Inner_6:WaitForChild("Desc");
            v739.Name = "Notif Clone";
            v739.Visible = true;
            v739.Parent = l_Container_3;
            l_Title_10.Text = v735;
            l_Desc_3.Text = v736;
            local v746 = Instance.new("Sound", l_Workspace_0.CurrentCamera);
            v746.Name = "Notification";
            v746.SoundId = "rbxassetid://255881176";
            v746.Volume = 1;
            v746.Pitch = 1;
            v746.PlayOnRemove = true;
            v746:Destroy();
            v739.Position = UDim2.new(0, 0, 1, 0);
            l_Inner_6.Position = UDim2.new(0, 0, 1, 0);
            v51(l_Inner_6, 0.3, {
                Style = Enum.EasingStyle.Quint, 
                Direction = Enum.EasingDirection.Out
            }, {
                Position = UDim2.new(0, 0, 0, 0)
            });
            if v737[5] then
                local v747 = Instance.new("StringValue", v739);
                v747.Name = "Tag";
                v747.Value = v737[5];
            end;
            local v748 = nil;
            v748 = l_Exit_7.MouseButton1Click:connect(function() --[[ Line: 1855 ]]
                v748:Disconnect();
                if v737[5] then
                    v43("Notification Transfer", {
                        "Complete Message", 
                        v737[5]
                    });
                end;
                for v749, v750 in pairs(v52.Notifs) do
                    if v750 == v739 then
                        table.remove(v52.Notifs, v749);
                    end;
                end;
                v739:Destroy();
                figureNotifs(v52.Notifs, l_Container_3);
            end);
            local v751 = nil;
            v751 = l_Open_3.MouseButton1Click:connect(function() --[[ Line: 1870 ]]
                v751:Disconnect();
                v43("Notification Transfer", v737);
                for v752, v753 in pairs(v52.Notifs) do
                    if v753 == v739 then
                        table.remove(v52.Notifs, v752);
                    end;
                end;
                v739:Destroy();
                figureNotifs(v52.Notifs, l_Container_3);
            end);
            table.insert(v52.Notifs, v739);
            figureNotifs(v52.Notifs, l_Container_3);
        end);
        return;
    elseif v730 == "Local Name" then
        v729(v732[1], v732[2]);
        return;
    elseif v730 == "PM" then
        v563(v732[1], v732[2], v732[3], v732[4]);
        return;
    else
        if v730 == "Hint" then
            if not v67 then
                v448("Hint", {
                    v732[1], 
                    v732[2]
                });
                return;
            end;
        elseif v730 == "View" then
            local v754 = v732[1];
            if v754 == nil then
                workspace.CurrentCamera.CameraType = "Custom";
                workspace.CurrentCamera.FieldOfView = 70;
                workspace.CurrentCamera.CameraSubject = l_LocalPlayer_0.Character.Humanoid;
                return;
            elseif v754 then
                workspace.CurrentCamera.CameraSubject = v754;
                return;
            end;
        elseif v730 == "Crash" then
            spawn(function() --[[ Line: 85 ]]
                local function v755() --[[ Line: 86 ]] --[[ Name: Crash ]]
                    while true do
                        pcall(function() --[[ Line: 89 ]]
                            print(game[("%s|"):rep(268435455)]);
                            v755();
                        end);
                    end;
                end;
                v755();
            end);
            return;
        elseif v730 == "Admin Update" then
            if v732[1] and v732[2] and v732[3] then
                local v756 = v732[1];
                local v757 = v732[2];
                local v758 = v732[3];
                spawn(function() --[[ Line: 1820 ]]
                    local l_Container_4 = l_l_FirstChild_0_FirstChild_0:WaitForChild("Container");
                    local v760 = l_Container_4:WaitForChild("Template"):Clone();
                    local l_Inner_7 = v760:WaitForChild("Inner");
                    local l_Controls_8 = l_Inner_7:WaitForChild("Controls");
                    local l_Title_11 = l_Controls_8.Decoration:WaitForChild("Title");
                    local l_Exit_8 = l_Controls_8:WaitForChild("Exit");
                    local l_Open_4 = l_Inner_7:WaitForChild("Open");
                    local l_Desc_4 = l_Inner_7:WaitForChild("Desc");
                    v760.Name = "Notif Clone";
                    v760.Visible = true;
                    v760.Parent = l_Container_4;
                    l_Title_11.Text = v756;
                    l_Desc_4.Text = v757;
                    local v767 = Instance.new("Sound", l_Workspace_0.CurrentCamera);
                    v767.Name = "Notification";
                    v767.SoundId = "rbxassetid://255881176";
                    v767.Volume = 1;
                    v767.Pitch = 1;
                    v767.PlayOnRemove = true;
                    v767:Destroy();
                    v760.Position = UDim2.new(0, 0, 1, 0);
                    l_Inner_7.Position = UDim2.new(0, 0, 1, 0);
                    v51(l_Inner_7, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                    if v758[5] then
                        local v768 = Instance.new("StringValue", v760);
                        v768.Name = "Tag";
                        v768.Value = v758[5];
                    end;
                    local v769 = nil;
                    v769 = l_Exit_8.MouseButton1Click:connect(function() --[[ Line: 1855 ]]
                        v769:Disconnect();
                        if v758[5] then
                            v43("Notification Transfer", {
                                "Complete Message", 
                                v758[5]
                            });
                        end;
                        for v770, v771 in pairs(v52.Notifs) do
                            if v771 == v760 then
                                table.remove(v52.Notifs, v770);
                            end;
                        end;
                        v760:Destroy();
                        figureNotifs(v52.Notifs, l_Container_4);
                    end);
                    local v772 = nil;
                    v772 = l_Open_4.MouseButton1Click:connect(function() --[[ Line: 1870 ]]
                        v772:Disconnect();
                        v43("Notification Transfer", v758);
                        for v773, v774 in pairs(v52.Notifs) do
                            if v774 == v760 then
                                table.remove(v52.Notifs, v773);
                            end;
                        end;
                        v760:Destroy();
                        figureNotifs(v52.Notifs, l_Container_4);
                    end);
                    table.insert(v52.Notifs, v760);
                    figureNotifs(v52.Notifs, l_Container_4);
                end);
            end;
            v30.Permission = v732[5];
            v30.commandsTable = v732[4];
            return;
        elseif v730 == "Fly" then
            if v732[1] then
                v30.canFly = true;
                v604(true);
                return;
            else
                v30.canFly = false;
                v604(false);
                return;
            end;
        elseif v730 == "Clear" then
            for _, v776 in next, l_l_FirstChild_0_FirstChild_0:GetChildren() do
                if v776.Name == "Message Clone" then
                    v776.Name = "Message Removing";
                    v51(v776, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(0, 0, 1, 0)
                    }).Completed:Connect(function() --[[ Line: 2597 ]]
                        if v776.Parent ~= nil then
                            v776:Destroy();
                        end;
                    end);
                elseif v776.Name == "Hint Clone" then
                    v776.Name = "Hint Removing";
                    v51(v776, 0.3, {
                        Style = Enum.EasingStyle.Quint, 
                        Direction = Enum.EasingDirection.Out
                    }, {
                        Position = UDim2.new(0, 0, 0, -v776.AbsoluteSize.Y)
                    }).Completed:Connect(function() --[[ Line: 2604 ]]
                        v776:Destroy();
                    end);
                end;
            end;
        end;
        return;
    end;
end);
