require "engine/configurator"

class HardwareConfigurator < Configurator
  def priority() 0 end

  protected

  def install_razer
    if ask("Do you have any razer device?")
      brew_install pkg: "synapse", cask: true
      custom msg: "Perform login and update the application to the latest version",
             open: "/Library/Application Support/Razer/RzUpdater",
             manual: true
    end
  end

  def configure_keyboard
    default msg:   "Enable keyboard repeating.",
            name:  "ApplePressAndHoldEnabled",
            value: false
    default msg:    "Turn off keyboard illumination when computer is not used for 5 minutes.",
            domain: "com.apple.BezelServices",
            name:   "kDimTime",
            value:  300
    default msg:   "Enable full keyboard access for all controls (enable Tab in modal dialogs, menu windows, et  )",
            name:  "AppleKeyboardUIMode",
            value: 3
    default msg:   "Initial keyboard repeat speed",
            name:  "InitialKeyRepeat",
            value: 3
    default msg:   "Keyboard repeat speed",
            name:  "KeyRepeat",
            value: 3
  end

  def configure_mouse
    default msg:   "Set mouse speed.",
            name:  "com.apple.mouse.scaling",
            value: 2.5
  end

  def configure_internal_trackpad
    default msg:   "Set trackpad speed.",
            name:  "com.apple.trackpad.scaling",
            value: 1
  end

  def configure_external_trackpad
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "Clicking",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "DragLock",
            value:  0
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "Dragging",
            value:  0
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadCornerSecondaryClick",
            value:  0
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadFiveFingerPinchGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadFourFingerHorizSwipeGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadFourFingerPinchGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadFourFingerVertSwipeGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadHandResting",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadHorizScroll",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadMomentumScroll",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadPinch",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadRightClick",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadRotate",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadScroll",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadThreeFingerDrag",
            value:  0
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadThreeFingerHorizSwipeGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadThreeFingerTapGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadThreeFingerVertSwipeGesture",
            value:  2
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadTwoFingerDoubleTapGesture",
            value:  1
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "TrackpadTwoFingerFromRightEdgeSwipeGesture",
            value:  3
    default domain: "com.apple.driver.AppleBluetoothMultitouch.trackpad",
            name:   "USBMouseStopsTrackpad",
            value:  0
  end
end
