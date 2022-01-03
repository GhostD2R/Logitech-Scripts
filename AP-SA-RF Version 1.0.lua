--WZ/VG SA, AP, RF - New!

--This is a Logitech Script for WZ/VG that performs the following
--AutoPing, SteadyAim for Snipers, and RapidFire for SS and Burst Weapons


--Config:              Change keys/mousebuttons here
rapid_toggle=8         --Mousebutton 8
rapidfire = false      --Do Not Change
LC=1                   --Left Mouse Button
RC=2                   --Right Mouse Button (Some are 2, some are 3)
M4=4                   --Mouse Button 4 or XButton1
APMinSpeed=10          --AutoPing Min Speed
APMaxSpeed=70          --AutoPing Max Speed
MinDelay=10            --Min Delay before clicking/pressing
MaxDelay=70            --Max Delay before clicking/pressing
AP="L"                 --My AutoPing key in the game
SA="K"                 --My SteadyAim key in the game

-- DO NOT CHANGE ANYTHING BELOW THIS LINE --

function AutoPing()
  OutputLogMessage("Running AutoPing function \n")
  PressKey(AP)        
  Sleep(20)
  ReleaseKey(AP)
  Sleep(50)
  PressKey(AP)        
  Sleep(20)
  ReleaseKey(AP)
  OutputLogMessage("Pressed AP \n")
end

function SteadyAim()
  OutputLogMessage("Running SteadyAim function \n")
  PressKey(SA)
  Sleep(3500)
  ReleaseKey(SA)
  OutputLogMessage("Pressed SA \n")
end

function RapidFire()    
  OutputLogMessage("Running RapidFire function \n")
  AutoPing()
  repeat
    if IsMouseButtonPressed(3) then
      Sleep(30)
      PressKey("lctrl")
      OutputLogMessage("LCTRL down \n")
      Sleep(30)
      PressMouseButton(LC)
      OutputLogMessage("LMB down \n")
      Sleep(30)
      ReleaseMouseButton(LC)
      OutputLogMessage("LMB up \n")
      Sleep(30)
      ReleaseKey("lctrl")
      OutputLogMessage("LCTRL up \n")
    end
  until not IsMouseButtonPressed(3)  
end


--MAIN LOOP  
EnablePrimaryMouseButtonEvents(true);          

function OnEvent(event, arg)

  Sleep(20)
  
  if (event == "MOUSE_BUTTON_PRESSED" and arg == rapid_toggle) then
    rapidfire = not rapidfire
    if rapidfire==true then
      PressKey("numplus")
      Sleep(20)
      ReleaseKey("numplus")
      OutputLogMessage("Rapid = True \n")
    elseif rapidfire==false then
      PressKey("numminus")
      Sleep(20)
      ReleaseKey("numminus")
      OutputLogMessage("Rapid = False \n")
    end
  end

  if IsMouseButtonPressed(M4) then
    AutoPing()
    SteadyAim()
    Sleep(math.random(MinDelay,MaxDelay))    
  end
    
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 2) then                               
    OutputLogMessage("RC engaged \n")
    if rapidfire==true then
      RapidFire()
    elseif rapidfire==false then
      repeat
        if IsMouseButtonPressed(1)  then
          AutoPing()
          Sleep(1500)
        end
      until not IsMouseButtonPressed(3)
      end    
    end
end