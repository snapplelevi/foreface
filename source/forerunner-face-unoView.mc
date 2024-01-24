import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class forerunner_face_unoView extends WatchUi.WatchFace {

    
    private var checker_background;       // Background bitmap
    private var background_dims;          // Attempt to get dimensions of background

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        checker_background = WatchUi.loadResource(Rez.Drawables.checkerboard);

        
        setLayout(Rez.Layouts.WatchFace(dc));
        // Debug statements not working for CTL+F5 build or with running with debug
        //System.println(dc.getWidth());
        //System.println(dc.getHeight());
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
  
        //dc.drawBitmap(0, 0, checker_background);
        // Get and show the current time
          
        dc.drawBitmap( 0, 0, checker_background );
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour.format("%02d"), clockTime.min.format("%02d")]);
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);

        //dc.drawBitmap(10, 10, checker_background);
        // Call the parent onUpdate function to redraw the layout       
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
