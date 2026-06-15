-- ═══════════════════════════════════════════════════════════
--   K1NG TECH
--   Owner: ThanhDuy  ·  Redesign: Ron
-- ═══════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local LocalPlayer  = Players.LocalPlayer

-- ╔══════════════════════════════════════════════════════════╗
-- ║  SCREEN GUI                                              ║
-- ╚══════════════════════════════════════════════════════════╝
local Gui = Instance.new("ScreenGui")
Gui.Name           = "K1ngTech_YinYang"
Gui.Parent         = game.CoreGui
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.ResetOnSpawn   = false
Gui.IgnoreGuiInset = true

local SFX = Instance.new("Sound")
SFX.SoundId = "rbxassetid://112441699631199"
SFX.Volume  = 0.35
SFX.Parent  = SoundService

-- ╔══════════════════════════════════════════════════════════╗
-- ║  TWEEN PRESETS                                           ║
-- ╚══════════════════════════════════════════════════════════╝
local TW_FAST   = TweenInfo.new(0.15, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
local TW_MED    = TweenInfo.new(0.30, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TW_SPRING = TweenInfo.new(0.50, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
local TW_PULSE  = TweenInfo.new(1.60, Enum.EasingStyle.Sine,  Enum.EasingDirection.InOut, -1, true)

-- ── Color Palette  (Pure Yin-Yang: black / white / greys) ──
local C_BLACK  = Color3.fromRGB(  0,   0,   0)
local C_VOID   = Color3.fromRGB(  7,   7,   7)
local C_DARK   = Color3.fromRGB( 13,  13,  13)
local C_PANEL  = Color3.fromRGB( 18,  18,  18)
local C_GREY   = Color3.fromRGB( 80,  80,  80)
local C_LGREY  = Color3.fromRGB(150, 150, 150)
local C_SILVER = Color3.fromRGB(200, 200, 200)
local C_WHITE  = Color3.fromRGB(255, 255, 255)

-- ╔══════════════════════════════════════════════════════════╗
-- ║  OPEN BUTTON  — floating orb                          ║
-- ╚══════════════════════════════════════════════════════════╝
local OpenBtn = Instance.new("ImageButton")
OpenBtn.Name             = "OpenBtn"
OpenBtn.Parent           = Gui
OpenBtn.BackgroundColor3 = C_VOID
OpenBtn.Position         = UDim2.new(0.02, 0, 0.45, 0)
OpenBtn.Size             = UDim2.new(0, 50, 0, 50)
OpenBtn.Image            = "rbxassetid://122226551941929"
OpenBtn.ImageColor3      = C_WHITE
OpenBtn.Active           = true
OpenBtn.Draggable        = true
OpenBtn.ZIndex           = 10
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

local OBStroke = Instance.new("UIStroke", OpenBtn)
OBStroke.Color     = C_WHITE
OBStroke.Thickness = 1.5

-- Breathing halo (Gojo's Infinity aura)
local OBHalo = Instance.new("ImageLabel", OpenBtn)
OBHalo.BackgroundTransparency = 1
OBHalo.AnchorPoint            = Vector2.new(0.5, 0.5)
OBHalo.Position               = UDim2.new(0.5, 0, 0.5, 0)
OBHalo.Size                   = UDim2.new(1.9, 0, 1.9, 0)
OBHalo.Image                  = "rbxassetid://5028857084"
OBHalo.ImageColor3            = C_WHITE
OBHalo.ImageTransparency      = 0.80
OBHalo.ZIndex                 = 9
TweenService:Create(OBHalo, TW_PULSE, {ImageTransparency = 0.96}):Play()

-- ╔══════════════════════════════════════════════════════════╗
-- ║  MAIN FRAME                                              ║
-- ╚══════════════════════════════════════════════════════════╝
local MF = Instance.new("Frame")
MF.Name             = "MainFrame"
MF.Parent           = Gui
MF.BackgroundColor3 = C_VOID
MF.Position         = UDim2.new(0.5, -160, 0.5, -140)
MF.Size             = UDim2.new(0, 320, 0, 280)
MF.Active           = true
MF.Draggable        = true
MF.ClipsDescendants = true
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 16)

-- White border that breathes like Infinity
local MFStroke = Instance.new("UIStroke", MF)
MFStroke.Color       = C_WHITE
MFStroke.Thickness   = 1
MFStroke.Transparency = 0
TweenService:Create(MFStroke, TW_PULSE, {Transparency = 0.5}):Play()

-- Deep void background gradient
local MFBG = Instance.new("UIGradient", MF)
MFBG.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(16, 16, 16)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB( 5,  5,  5)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(10, 10, 10))
})
MFBG.Rotation = 150

-- ╔══════════════════════════════════════════════════════════╗
-- ║  HEADER                                                  ║
-- ╚══════════════════════════════════════════════════════════╝
local Header = Instance.new("Frame", MF)
Header.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
Header.Size             = UDim2.new(1, 0, 0, 60)
Header.BorderSizePixel  = 0
Header.ZIndex           = 3

-- Yang edge — 4 px white bar on right of header (Yin/Yang duality)
local YangBar = Instance.new("Frame", Header)
YangBar.BackgroundColor3 = C_WHITE
YangBar.AnchorPoint      = Vector2.new(1, 0)
YangBar.Position         = UDim2.new(1, 0, 0, 0)
YangBar.Size             = UDim2.new(0, 4, 1, 0)
YangBar.BorderSizePixel  = 0
YangBar.ZIndex           = 4

-- Header bottom razor line
local HDivider = Instance.new("Frame", Header)
HDivider.BackgroundColor3 = C_WHITE
HDivider.AnchorPoint      = Vector2.new(0, 1)
HDivider.Position         = UDim2.new(0, 0, 1, 0)
HDivider.Size             = UDim2.new(1, 0, 0, 1)
HDivider.BorderSizePixel  = 0
HDivider.ZIndex           = 4

-- logo mark
local LogoLbl = Instance.new("TextLabel", Header)
LogoLbl.BackgroundTransparency = 1
LogoLbl.Position    = UDim2.new(0, 12, 0.5, -14)
LogoLbl.Size        = UDim2.new(0, 28, 0, 28)
LogoLbl.Font        = Enum.Font.GothamBold
LogoLbl.Text        = "👑"
LogoLbl.TextColor3  = C_WHITE
LogoLbl.TextSize    = 26
LogoLbl.ZIndex      = 4

-- Title
local Title = Instance.new("TextLabel", Header)
Title.BackgroundTransparency = 1
Title.Position       = UDim2.new(0, 50, 0, 9)
Title.Size           = UDim2.new(0, 200, 0, 22)
Title.Font           = Enum.Font.GothamBold
Title.Text           = "K1NG  TECH"
Title.TextColor3     = C_WHITE
Title.TextSize       = 17
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex         = 4

-- Subtitle
local Sub = Instance.new("TextLabel", Header)
Sub.BackgroundTransparency = 1
Sub.Position       = UDim2.new(0, 50, 0, 33)
Sub.Size           = UDim2.new(0, 210, 0, 14)
Sub.Font           = Enum.Font.Gotham
Sub.Text           = "k1ng ☯"
Sub.TextColor3     = C_LGREY
Sub.TextSize       = 10
Sub.TextXAlignment = Enum.TextXAlignment.Left
Sub.ZIndex         = 4

-- Close ✕ button
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CloseBtn.AnchorPoint      = Vector2.new(1, 0.5)
CloseBtn.Position         = UDim2.new(1, -18, 0.5, 0)
CloseBtn.Size             = UDim2.new(0, 26, 0, 26)
CloseBtn.Text             = "X"
CloseBtn.TextColor3       = C_LGREY
CloseBtn.Font             = Enum.Font.GothamBold
CloseBtn.TextSize         = 12
CloseBtn.ZIndex           = 5
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
local CStroke = Instance.new("UIStroke", CloseBtn)
CStroke.Color     = C_GREY
CStroke.Thickness = 1

-- ╔══════════════════════════════════════════════════════════╗
-- ║  SECTION CARD HELPER                                     ║
-- ╚══════════════════════════════════════════════════════════╝
local function MakeCard(yPos, height)
    local card = Instance.new("Frame", MF)
    card.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    card.Position         = UDim2.new(0, 12, 0, yPos)
    card.Size             = UDim2.new(1, -24, 0, height)
    card.BorderSizePixel  = 0
    card.ZIndex           = 3
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", card)
    stroke.Color     = Color3.fromRGB(35, 35, 35)
    stroke.Thickness = 1
    return card, stroke
end

-- ╔══════════════════════════════════════════════════════════╗
-- ║  SECTION 1 — INFINITY ENABLE                            ║
-- ╚══════════════════════════════════════════════════════════╝
local S1, S1Stroke = MakeCard(72, 54)

local EnableLbl = Instance.new("TextLabel", S1)
EnableLbl.BackgroundTransparency = 1
EnableLbl.Position       = UDim2.new(0, 12, 0, 8)
EnableLbl.Size           = UDim2.new(0.55, 0, 0, 17)
EnableLbl.Font           = Enum.Font.GothamBold
EnableLbl.Text           = "Enable"
EnableLbl.TextColor3     = C_WHITE
EnableLbl.TextSize       = 13
EnableLbl.TextXAlignment = Enum.TextXAlignment.Left
EnableLbl.ZIndex         = 4

local StatusLbl = Instance.new("TextLabel", S1)
StatusLbl.BackgroundTransparency = 1
StatusLbl.Position       = UDim2.new(0, 12, 0, 30)
StatusLbl.Size           = UDim2.new(0.65, 0, 0, 14)
StatusLbl.Font           = Enum.Font.Gotham
StatusLbl.Text           = "☯︎  •  INACTIVE"
StatusLbl.TextColor3     = C_GREY
StatusLbl.TextSize       = 9
StatusLbl.TextXAlignment = Enum.TextXAlignment.Left
StatusLbl.ZIndex         = 4

-- Toggle pill
local ToggleBG = Instance.new("Frame", S1)
ToggleBG.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ToggleBG.AnchorPoint      = Vector2.new(1, 0.5)
ToggleBG.Position         = UDim2.new(1, -12, 0.5, 0)
ToggleBG.Size             = UDim2.new(0, 56, 0, 27)
ToggleBG.ZIndex           = 5
Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
local TBGStroke = Instance.new("UIStroke", ToggleBG)
TBGStroke.Color     = C_GREY
TBGStroke.Thickness = 1

-- Toggle knob (Yang dot = white; OFF = grey)
local ToggleCircle = Instance.new("Frame", ToggleBG)
ToggleCircle.BackgroundColor3 = C_GREY
ToggleCircle.AnchorPoint      = Vector2.new(0, 0.5)
ToggleCircle.Position         = UDim2.new(0, 3, 0.5, 0)
ToggleCircle.Size             = UDim2.new(0, 21, 0, 21)
ToggleCircle.ZIndex           = 6
Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

-- Yin dot inside knob (Yin within Yang = duality)
local YinDot = Instance.new("Frame", ToggleCircle)
YinDot.BackgroundColor3 = C_DARK
YinDot.AnchorPoint      = Vector2.new(0.5, 0.5)
YinDot.Position         = UDim2.new(0.5, 0, 0.5, 0)
YinDot.Size             = UDim2.new(0, 7, 0, 7)
YinDot.ZIndex           = 7
Instance.new("UICorner", YinDot).CornerRadius = UDim.new(1, 0)

local ClickBtn = Instance.new("TextButton", ToggleBG)
ClickBtn.BackgroundTransparency = 1
ClickBtn.Size   = UDim2.new(1, 0, 1, 0)
ClickBtn.Text   = ""
ClickBtn.ZIndex = 8

-- ╔══════════════════════════════════════════════════════════╗
-- ║  SECTION 2 — DASH SMOOTHNESS                            ║
-- ╚══════════════════════════════════════════════════════════╝
local S2, S2Stroke = MakeCard(138, 102)

local DelayLbl = Instance.new("TextLabel", S2)
DelayLbl.BackgroundTransparency = 1
DelayLbl.Position       = UDim2.new(0, 12, 0, 9)
DelayLbl.Size           = UDim2.new(0.62, 0, 0, 16)
DelayLbl.Font           = Enum.Font.GothamBold
DelayLbl.Text           = "DASH SMOOTHNESS"
DelayLbl.TextColor3     = C_WHITE
DelayLbl.TextSize       = 12
DelayLbl.TextXAlignment = Enum.TextXAlignment.Left
DelayLbl.ZIndex         = 4

-- Value readout
local ValLbl = Instance.new("TextLabel", S2)
ValLbl.BackgroundTransparency = 1
ValLbl.AnchorPoint    = Vector2.new(1, 0)
ValLbl.Position       = UDim2.new(1, -12, 0, 7)
ValLbl.Size           = UDim2.new(0, 56, 0, 20)
ValLbl.Font           = Enum.Font.GothamBold
ValLbl.Text           = "0.22s"
ValLbl.TextColor3     = C_WHITE
ValLbl.TextSize       = 14
ValLbl.TextXAlignment = Enum.TextXAlignment.Right
ValLbl.ZIndex         = 4

-- Slider track
local SliderBG = Instance.new("Frame", S2)
SliderBG.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
SliderBG.Position         = UDim2.new(0, 12, 0, 36)
SliderBG.Size             = UDim2.new(1, -24, 0, 5)
SliderBG.BorderSizePixel  = 0
SliderBG.ZIndex           = 4
Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1, 0)
local SBStroke = Instance.new("UIStroke", SliderBG)
SBStroke.Color     = Color3.fromRGB(40, 40, 40)
SBStroke.Thickness = 0.8

local INIT_PCT = (5 - 1) / (10 - 1)

-- Fill — grey → white gradient (Yin rising into Yang)
local SliderFill = Instance.new("Frame", SliderBG)
SliderFill.BackgroundColor3 = C_WHITE
SliderFill.Size             = UDim2.new(INIT_PCT, 0, 1, 0)
SliderFill.BorderSizePixel  = 0
SliderFill.ZIndex           = 5
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)
local SFG = Instance.new("UIGradient", SliderFill)
SFG.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90,  90,  90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})

-- Knob (Yang circle with Yin black dot inside)
local Knob = Instance.new("Frame", SliderBG)
Knob.BackgroundColor3 = C_WHITE
Knob.AnchorPoint      = Vector2.new(0.5, 0.5)
Knob.Position         = UDim2.new(INIT_PCT, 0, 0.5, 0)
Knob.Size             = UDim2.new(0, 16, 0, 16)
Knob.ZIndex           = 6
Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)
local KnobStroke = Instance.new("UIStroke", Knob)
KnobStroke.Color     = C_BLACK
KnobStroke.Thickness = 2

local KnobDot = Instance.new("Frame", Knob)
KnobDot.BackgroundColor3 = C_BLACK
KnobDot.AnchorPoint      = Vector2.new(0.5, 0.5)
KnobDot.Position         = UDim2.new(0.5, 0, 0.5, 0)
KnobDot.Size             = UDim2.new(0, 5, 0, 5)
KnobDot.ZIndex           = 7
Instance.new("UICorner", KnobDot).CornerRadius = UDim.new(1, 0)

-- Range labels
local RangeLow = Instance.new("TextLabel", S2)
RangeLow.BackgroundTransparency = 1
RangeLow.Position    = UDim2.new(0, 12, 0, 44)
RangeLow.Size        = UDim2.new(0, 36, 0, 12)
RangeLow.Font        = Enum.Font.Gotham
RangeLow.Text        = "0.10s"
RangeLow.TextColor3  = C_GREY
RangeLow.TextSize    = 9
RangeLow.TextXAlignment = Enum.TextXAlignment.Left
RangeLow.ZIndex      = 4

local RangeHigh = Instance.new("TextLabel", S2)
RangeHigh.BackgroundTransparency = 1
RangeHigh.AnchorPoint    = Vector2.new(1, 0)
RangeHigh.Position       = UDim2.new(1, -12, 0, 44)
RangeHigh.Size           = UDim2.new(0, 36, 0, 12)
RangeHigh.Font           = Enum.Font.Gotham
RangeHigh.Text           = "0.50s"
RangeHigh.TextColor3     = C_GREY
RangeHigh.TextSize       = 9
RangeHigh.TextXAlignment = Enum.TextXAlignment.Right
RangeHigh.ZIndex         = 4

-- − and + buttons
local MinusBtn = Instance.new("TextButton", S2)
MinusBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
MinusBtn.Position         = UDim2.new(0, 12, 0, 64)
MinusBtn.Size             = UDim2.new(0, 50, 0, 26)
MinusBtn.Text             = "−"
MinusBtn.TextColor3       = C_WHITE
MinusBtn.Font             = Enum.Font.GothamBold
MinusBtn.TextSize         = 20
MinusBtn.ZIndex           = 4
Instance.new("UICorner", MinusBtn).CornerRadius = UDim.new(0, 7)
local MinusStroke = Instance.new("UIStroke", MinusBtn)
MinusStroke.Color     = C_GREY
MinusStroke.Thickness = 1

local PlusBtn = Instance.new("TextButton", S2)
PlusBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
PlusBtn.AnchorPoint      = Vector2.new(1, 0)
PlusBtn.Position         = UDim2.new(1, -12, 0, 64)
PlusBtn.Size             = UDim2.new(0, 50, 0, 26)
PlusBtn.Text             = "+"
PlusBtn.TextColor3       = C_WHITE
PlusBtn.Font             = Enum.Font.GothamBold
PlusBtn.TextSize         = 20
PlusBtn.ZIndex           = 4
Instance.new("UICorner", PlusBtn).CornerRadius = UDim.new(0, 7)
local PlusStroke = Instance.new("UIStroke", PlusBtn)
PlusStroke.Color     = C_GREY
PlusStroke.Thickness = 1

-- ╔══════════════════════════════════════════════════════════╗
-- ║  FOOTER                                                  ║
-- ╚══════════════════════════════════════════════════════════╝
local Footer = Instance.new("Frame", MF)
Footer.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
Footer.AnchorPoint      = Vector2.new(0, 1)
Footer.Position         = UDim2.new(0, 0, 1, 0)
Footer.Size             = UDim2.new(1, 0, 0, 28)
Footer.BorderSizePixel  = 0
Footer.ZIndex           = 3

local FTopLine = Instance.new("Frame", Footer)
FTopLine.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
FTopLine.Size             = UDim2.new(1, 0, 0, 1)
FTopLine.BorderSizePixel  = 0
FTopLine.ZIndex           = 4

local AuthorLbl = Instance.new("TextLabel", Footer)
AuthorLbl.BackgroundTransparency = 1
AuthorLbl.Position       = UDim2.new(0, 12, 0.5, -7)
AuthorLbl.Size           = UDim2.new(0.82, 0, 0, 14)
AuthorLbl.Font           = Enum.Font.Gotham
AuthorLbl.Text           = "Creator☯︎: Ron"
AuthorLbl.TextColor3     = C_GREY
AuthorLbl.TextSize       = 9
AuthorLbl.TextXAlignment = Enum.TextXAlignment.Left
AuthorLbl.ZIndex         = 4

-- Yin-Yang glyph badge
local YYIcon = Instance.new("TextLabel", Footer)
YYIcon.BackgroundTransparency = 1
YYIcon.AnchorPoint    = Vector2.new(1, 0.5)
YYIcon.Position       = UDim2.new(1, -12, 0.5, -7)
YYIcon.Size           = UDim2.new(0, 20, 0, 14)
YYIcon.Font           = Enum.Font.GothamBold
YYIcon.Text           = "☯"
YYIcon.TextColor3     = C_WHITE
YYIcon.TextSize       = 15
YYIcon.ZIndex         = 4

-- ╔══════════════════════════════════════════════════════════╗
-- ║  TOAST NOTIFICATION (slides in from top)                 ║
-- ╚══════════════════════════════════════════════════════════╝
local Toast = Instance.new("Frame", Gui)
Toast.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Toast.AnchorPoint      = Vector2.new(0.5, 0)
Toast.Position         = UDim2.new(0.5, 0, -0.10, 0)  -- hidden above screen
Toast.Size             = UDim2.new(0, 252, 0, 36)
Toast.ZIndex           = 20
Toast.ClipsDescendants = true
Instance.new("UICorner", Toast).CornerRadius = UDim.new(0, 10)
local ToastStroke = Instance.new("UIStroke", Toast)
ToastStroke.Color     = C_WHITE
ToastStroke.Thickness = 1

-- Yin accent strip on left of toast
local ToastAccent = Instance.new("Frame", Toast)
ToastAccent.BackgroundColor3 = C_WHITE
ToastAccent.Size             = UDim2.new(0, 3, 1, 0)
ToastAccent.BorderSizePixel  = 0
ToastAccent.ZIndex           = 21

local ToastLbl = Instance.new("TextLabel", Toast)
ToastLbl.BackgroundTransparency = 1
ToastLbl.Position    = UDim2.new(0, 12, 0, 0)
ToastLbl.Size        = UDim2.new(1, -12, 1, 0)
ToastLbl.Font        = Enum.Font.GothamBold
ToastLbl.Text        = "Tech Enabled"
ToastLbl.TextColor3  = C_WHITE
ToastLbl.TextSize    = 12
ToastLbl.ZIndex      = 21

local toastBusy = false
local function ShowToast(msg)
    if toastBusy then return end
    toastBusy   = true
    ToastLbl.Text = msg
    local IN  = TweenInfo.new(0.40, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
    local OUT = TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    TweenService:Create(Toast, IN, {Position = UDim2.new(0.5, 0, 0.04, 0)}):Play()
    task.delay(2.4, function()
        TweenService:Create(Toast, OUT, {Position = UDim2.new(0.5, 0, -0.10, 0)}):Play()
        task.delay(0.3, function() toastBusy = false end)
    end)
end

-- ╔══════════════════════════════════════════════════════════╗
-- ║  LOGIC & COOLDOWN CONFIG                                 ║
-- ╚══════════════════════════════════════════════════════════╝
local ANIM_ID      = "rbxassetid://10503381238"
local Enabled      = false
local Connection   = nil
local Smoothness   = 0.22
local SmoothVals   = {0.1, 0.12, 0.15, 0.18, 0.22, 0.25, 0.3, 0.35, 0.4, 0.5}
local SmoothIdx    = 5

-- [ NEW ] Adjustable Cooldown Settings
local CooldownTime = 3.0    -- Change this value to adjust the CD delay in seconds
local IsOnCooldown = false  -- Guard to prevent re-execution

local function RefreshSlider()
    local pct = (SmoothIdx - 1) / (#SmoothVals - 1)
    TweenService:Create(SliderFill, TW_MED, {Size     = UDim2.new(pct, 0, 1, 0)}):Play()
    TweenService:Create(Knob,       TW_MED, {Position = UDim2.new(pct, 0, 0.5, 0)}):Play()
    ValLbl.Text             = tostring(SmoothVals[SmoothIdx]) .. "s"
    -- Flash the value label
    ValLbl.TextTransparency = 0.65
    TweenService:Create(ValLbl,
        TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    ):Play()
end

local function DoFlick()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum  = char and char:FindFirstChild("Humanoid")
    if root and hum then
        root.CFrame    = root.CFrame * CFrame.Angles(0, math.pi, 0)
        hum.AutoRotate = false
        task.delay(0.5, function()
            if hum then hum.AutoRotate = true end
        end)
    end
end

local function DoJump()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.AssemblyLinearVelocity = Vector3.new(0, 55, 0)
    end
end

-- ── BILLBOARD COOLDOWN VISUALIZER ──
local function StartBillboardCooldown(char)
    local targetPart = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    if not targetPart then IsOnCooldown = false return end

    -- Billboard creation
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "YinYang_CD"
    
    -- FIXED: Changed from absolute offset (pixels) to dynamic scale (studs)
    Billboard.Size = UDim2.new(3.5, 0, 3.5, 0) 
    Billboard.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
    
    Billboard.AlwaysOnTop = true
    Billboard.Adornee = targetPart
    Billboard.Parent = targetPart

    -- Circular Backing
    local Circle = Instance.new("Frame", Billboard)
    Circle.Size = UDim2.new(1, 0, 1, 0)
    Circle.BackgroundColor3 = C_VOID
    Circle.BackgroundTransparency = 1
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(0, 16)

    -- Spinning Yin-Yang symbol
    local YYIcon = Instance.new("TextLabel", Circle)
    YYIcon.Size = UDim2.new(1, 0, 0.65, 0)
    YYIcon.Position = UDim2.new(0, 0, 0, 2)
    YYIcon.BackgroundTransparency = 1
    YYIcon.Font = Enum.Font.GothamBold
    YYIcon.Text = "☯"
    YYIcon.TextColor3 = C_WHITE
    YYIcon.TextScaled = true

    -- Time countdown readout
    local TimeLbl = Instance.new("TextLabel", Circle)
    TimeLbl.Size = UDim2.new(1, 0, 0.35, 0)
    TimeLbl.Position = UDim2.new(0, 0, 0.65, -4)
    TimeLbl.BackgroundTransparency = 1
    TimeLbl.Font = Enum.Font.GothamBold
    TimeLbl.Text = string.format("%.1fs", CooldownTime)
    TimeLbl.TextColor3 = C_SILVER
    TimeLbl.TextScaled = true -- FIXED: Scales text smoothly alongside camera distance

    -- Dedicated independent stroke for the 3D billboard frame
    local BillboardStroke = Instance.new("UIStroke", Circle)
    BillboardStroke.Thickness = 2
    BillboardStroke.Color = C_WHITE

    -- Spinning Animation
    local spinTween = TweenService:Create(YYIcon, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
    spinTween:Play()

    -- Process Countdown Frame-by-Frame safely
    task.spawn(function()
        local elapsed = 0
        while elapsed < CooldownTime do
            task.wait(0.05)
            if not Enabled or not char or not char.Parent then break end
            elapsed = elapsed + 0.05
            
            local remaining = math.max(0, CooldownTime - elapsed)
            TimeLbl.Text = string.format("%.1fs", remaining)
            
            -- FIXED: Targeted BillboardStroke instead of leaking into CStroke (the UI Close Button)
            BillboardStroke.Color = C_WHITE:Lerp(C_GREY, elapsed / CooldownTime)
        end
        
        spinTween:Cancel()
        Billboard:Destroy()
        IsOnCooldown = false
    end)
end

local function ConnectLogic()
    if Connection then Connection:Disconnect() end
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum  = char:WaitForChild("Humanoid")
    Connection = hum.AnimationPlayed:Connect(function(anim)
        if Enabled and not IsOnCooldown and anim.Animation.AnimationId == ANIM_ID then
            IsOnCooldown = true
            
            task.wait(0.50)
            DoJump()
            DoFlick()
            local dashData = {{Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress"}}
            if char:FindFirstChild("Communicate") then
                char.Communicate:FireServer(unpack(dashData))
            end
            task.wait(Smoothness)
            DoFlick()
            
            StartBillboardCooldown(char)
        end
    end)
end

-- ╔══════════════════════════════════════════════════════════╗
-- ║  EVENTS                                                  ║
-- ╚══════════════════════════════════════════════════════════╝

-- Open / close with spring animation
local function OpenGUI()
    MF.Visible  = true
    MF.Size     = UDim2.new(0, 320, 0,   0)
    MF.Position = UDim2.new(0.5, -160, 0.5, 0)
    TweenService:Create(MF, TW_SPRING, {
        Size     = UDim2.new(0, 320, 0, 280),
        Position = UDim2.new(0.5, -160, 0.5, -140)
    }):Play()
