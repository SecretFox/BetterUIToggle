import com.GameInterface.DistributedValueBase;
import com.GameInterface.Input;
class com.fox.BetterUIToggle
{
	public static function main(swfRoot:MovieClip):Void
	{
		var s_app = new BetterUIToggle(swfRoot);
		swfRoot.onLoad = function(){s_app.Load()};
		swfRoot.onUnload = function(){s_app.Unload()};
	}

	public function BetterUIToggle() {
		Input.RegisterHotkey(_global.Enums.InputCommand.e_InputCommand_Toggle_GUI, "com.fox.BetterUIToggle.CheckToggle", _global.Enums.Hotkey.eHotkeyDown);
	}
	
	public function Load()
	{
		ToggleOn();
	}
	
	public function Unload()
	{
		ToggleOn();
	}
	
	static function CheckToggle(){
		if (!_root._visible || !DistributedValueBase.GetDValue("chat_group_windows"))
		{
			ToggleOn();
		}
		else
		{
			ToggleOff();
		}
	}
	
	static function ToggleOn():Void 
	{
		_root._visible = true;
		DistributedValueBase.SetDValue("chat_group_windows", true);
		DistributedValueBase.SetDValue("hud_map_window", true);
	}
	static function ToggleOff():Void 
	{
		_root._visible = false;
		DistributedValueBase.SetDValue("chat_group_windows", false);
		DistributedValueBase.SetDValue("hud_map_window", false);
	}
}