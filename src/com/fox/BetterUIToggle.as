import com.GameInterface.DistributedValueBase;
import com.GameInterface.Input;
class com.fox.BetterUIToggle
{
	public static function main(swfRoot:MovieClip):Void
	{
		var s_app = new BetterUIToggle(swfRoot);
		swfRoot.onLoad = function(){s_app.Load()};
	}

	public function BetterUIToggle() {
		Input.RegisterHotkey(_global.Enums.InputCommand.e_InputCommand_Toggle_GUI, "com.fox.BetterUIToggle.CheckToggle", _global.Enums.Hotkey.eHotkeyDown);
	}
	
	public function Load()
	{
		ToggleOn();
	}
	
	static function CheckToggle(){
		if (_root._alpha != 100 || !DistributedValueBase.GetDValue("chat_group_windows"))
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
		_root._alpha = 100
		DistributedValueBase.SetDValue("chat_group_windows", true);
		DistributedValueBase.SetDValue("hud_map_window", true);
	}
	static function ToggleOff():Void 
	{
		_root._alpha = 0;
		if(DistributedValueBase.GetDValue("BetterUIToggle_HideChat")) DistributedValueBase.SetDValue("chat_group_windows", false);
		if(DistributedValueBase.GetDValue("BetterUIToggle_HideMap")) DistributedValueBase.SetDValue("hud_map_window", false);
	}
}