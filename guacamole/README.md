<!-- TOC -->
* [Guacamole](#guacamole)
* [Clipboard](#clipboard)
  * [Copying from Local to Remote](#copying-from-local-to-remote)
  * [Copying from Remote to Local](#copying-from-remote-to-local)
* [RDP/VNC](#rdpvnc)
<!-- TOC -->

---

# Guacamole

The following image was used:
https://hub.docker.com/r/flcontainers/guacamole

Username: `guacadmin`
Password: `guacadmin`

# Clipboard

References:
- https://thekitchenpursuits.com/how-do-i-open-the-clipboard-in-guacamole/
- https://guacamole.apache.org/doc/gug/using-guacamole.html#using-the-clipboard

## Copying from Local to Remote

1. Copy the text from your local application using your operating system’s standard copy command (e.g., Ctrl+C or Cmd+C).
2. Open the Guacamole menu (Ctrl+Shift+Alt).
3. Select the Clipboard option.
4. Paste the copied text into the Guacamole clipboard text area (Ctrl+V or Cmd+V).
5. In the remote session, use the remote system’s paste command (e.g., Ctrl+V or Cmd+V) to paste the text from the Guacamole clipboard into the desired application.

## Copying from Remote to Local

1. Copy the text from the application within the remote session using the remote system’s standard copy command (e.g., Ctrl+C or Cmd+C).
2. Open the Guacamole menu (Ctrl+Shift+Alt).
3. Select the Clipboard option.
4. Paste the copied text into the Guacamole clipboard text area (Ctrl+V or Cmd+V).
5. On your local machine, copy the text from the Guacamole clipboard text area using your operating system’s standard copy command (e.g., Ctrl+C or Cmd+C).
6. Paste the text into your local application (Ctrl+V or Cmd+V).

# RDP/VNC

Resources:
- https://credibledev.com/xrdp-and-vnc-which-is-the-better-remote-desktop/
- https://www.adamlabay.net/2022/04/15/xrdp-on-manjaro-the-easy-way-when-it-works/
- https://discuss.kde.org/t/remote-desktop-using-the-rdp-protocol-for-plasma-wayland/3616/79?page=4

> [!WARNING]
> 
> As of now, remote desktop solutions (other than VNC)
> are not compatible with KDE Plasma and Wayland:
> https://youtu.be/DNJbpzUngLg?si=tB3eX8Xf1fo5zl1Y
> I myself have seen these weird flickering issues when 
> just using Teamviewer - so even that is not really working.

__Project "RDP on Manjaro (KDE Plasma on Wayland)" for 
Guacamole ditched.__

---

Manjaro with Plasma (Wayland)

```
sudo pacman -Sy krdp
```

Configure using `System Settings`

---

```shell
krdpserver -u user -p test
```

```
org.kde.krdp: Listening for connections on QHostAddress(QHostAddress::Any) 3389
org.kde.krdp: Initializing Freedesktop Portal Session
org.kde.krdp: Session setup completed, start processing...
[11:43:19:071] [13253:13271] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
[11:43:19:071] [13253:13271] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
[11:43:19:071] [13253:13271] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
org.kde.krdp: Started Freedesktop Portal session
kpipewire_vaapi_logging: VAAPI: Failed to initialize display
libva error: /usr/lib/dri/i965_drv_video.so init failed
kpipewire_vaapi_logging: VAAPI: Failed to initialize display
kpipewire_vaapi_logging: DRM device not found
[11:43:27:180] [13253:13271] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
[11:43:27:190] [13253:13271] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] - Accepted client: SM-X110
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] - Accepted channels:
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] -  rdpdr
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] -  rdpsnd
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] -  cliprdr
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.connection] -  drdynvc
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
[11:43:27:194] [13253:13271] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
org.kde.krdp: New client connected:  Android platform Unspecified version
org.kde.krdp: Video stream initialized
kpipewire_record_logging: Hardware encoding is not supported on this device.
org.kde.krdp: Received caps:
org.kde.krdp:   RDPGFX_CAPVERSION_8 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_81 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_10 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_102 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_103 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_104 AVC: false YUV420: true
org.kde.krdp:   UNKNOWN_VERSION AVC: false YUV420: false
org.kde.krdp: Client does not support H.264 in YUV420 mode!
[11:43:27:282] [13253:13296] [INFO][com.freerdp.core] - ERRINFO_GRAPHICS_SUBSYSTEM_FAILED (0x0000112F):The server-side graphics subsystem is in an error state and unable to continue graphics encoding.
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.core] - rdp_set_error_info:freerdp_set_last_error_ex ERRINFO_GRAPHICS_SUBSYSTEM_FAILED [0x0001112F]
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.channels.rdpgfx.server] - context->CapsAdvertise failed with error 20
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_recv_caps_advertise_pdu failed with error 20!
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.channels.rdpgfx.server] - Error while parsing GFX cmdId: RDPGFX_CMDID_CAPSADVERTISE (0x0012)
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_receive_pdu failed with error 20!
[11:43:27:282] [13253:13296] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_handle_messages failed with error 20
[libx264 @ 0x7fb178838740] -qscale is ignored, -crf is recommended.
[libx264 @ 0x7fb178838740] MB rate (19040000) > level limit (16711680)
[11:43:27:286] [13253:13271] [ERROR][com.freerdp.core.transport] - BIO_read returned a system error 0: Success
org.kde.krdp: Unable to check file descriptor
org.kde.krdp: Closing session
[libx264 @ 0x7fb178838740] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
[libx264 @ 0x7fb178838740] profile Constrained Baseline, level 6.2, 4:2:0, 8-bit
org.kde.krdp: Closing Freedesktop Portal Session
```

---

```shell
systemctl --user cat plasma-krdp_server.service
```

```
# /usr/lib/systemd/user/app-org.kde.krdpserver.service
# SPDX-License-Identifier: LGPL-2.1-only OR LGPL-3.0-only OR Licen>
# SPDX-FileCopyrightText: 2024 Akseli Lahtinen <akselmo@akselmo.de>
[Unit]
Description=KRDP Server
After=plasma-xdg-desktop-portal-kde.service
After=plasma-core.target

[Service]
Type=exec
ExecStart=/usr/bin/krdpserver
Restart=on-abnormal

[Install]
WantedBy=plasma-workspace.target
Alias=plasma-krdp_server.service
```

---

```shell
/usr/bin/krdpserver --help
```

```
Usage: /usr/bin/krdpserver [options]
An RDP server that exposes the current desktop session over the RDP protocol.
Note that a valid TLS certificate and key is needed. If not provided, a temporary certificate will be generated.

Options:
  -h, --help                           Displays help on commandline options.
  --help-all                           Displays help, including generic Qt
                                       options.
  -u, --username <username>            The username to use for login
  -p, --password <password>            The password to use for login. Requires
                                       username to be passed as well.
  --address <address>                  The address to listen on for
                                       connections. Defaults to 0.0.0.0
  --port <port>                        The port to use for connections.
                                       Defaults to 3389.
  --certificate <certificate>          The TLS certificate file to use.
  --certificate-key <certificate-key>  The TLS certificate key to use.
  --monitor <monitor>                  The index of the monitor to use when
                                       streaming.
  --virtual-monitor <data>             Creates a new virtual output to connect
                                       to (WIDTHxHEIGHT@SCALE, e.g.
                                       1920x1080@1). Incompatible with
                                       --monitor.
  --quality <quality>                  Encoding quality of the stream, from 0
                                       (lowest) to 100 (highest)
  --plasma                             Use Plasma protocols instead of XDP
QThreadStorage: entry 8 destroyed before end of thread 0x563c4f5ee490
QThreadStorage: entry 3 destroyed before end of thread 0x563c4f5ee490
QThreadStorage: entry 2 destroyed before end of thread 0x563c4f5ee490
```

---

```shell
krdpserver -u user -p test --plasma
```

```                                                                                       ✔ 
org.kde.krdp: Listening for connections on QHostAddress(QHostAddress::Any) 3389
qt.core.qobject.connect: QObject::connect(ScreencastingStream, KRdp::PlasmaScreencastV1Session): invalid nullptr parameter
qt.core.qobject.connect: QObject::connect(ScreencastingStream, KRdp::PlasmaScreencastV1Session): invalid nullptr parameter
org.kde.krdp: Session setup completed, start processing...
[11:40:02:059] [12844:12863] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
[11:40:02:059] [12844:12863] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
[11:40:02:059] [12844:12863] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
[11:40:12:818] [12844:12863] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
[11:40:12:825] [12844:12863] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] - Accepted client: SM-X110
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] - Accepted channels:
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] -  rdpdr
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] -  rdpsnd
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] -  cliprdr
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.connection] -  drdynvc
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
[11:40:12:829] [12844:12863] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
org.kde.krdp: New client connected:  Android platform Unspecified version
org.kde.krdp: Video stream initialized
kpipewire_vaapi_logging: VAAPI: Failed to initialize display
libva error: /usr/lib/dri/i965_drv_video.so init failed
kpipewire_vaapi_logging: VAAPI: Failed to initialize display
kpipewire_vaapi_logging: DRM device not found
org.kde.krdp: Received caps:
org.kde.krdp:   RDPGFX_CAPVERSION_8 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_81 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_10 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_102 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_103 AVC: false YUV420: false
org.kde.krdp:   RDPGFX_CAPVERSION_104 AVC: false YUV420: true
org.kde.krdp:   UNKNOWN_VERSION AVC: false YUV420: false
org.kde.krdp: Client does not support H.264 in YUV420 mode!
[11:40:12:913] [12844:12883] [INFO][com.freerdp.core] - ERRINFO_GRAPHICS_SUBSYSTEM_FAILED (0x0000112F):The server-side graphics subsystem is in an error state and unable to continue graphics encoding.
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.core] - rdp_set_error_info:freerdp_set_last_error_ex ERRINFO_GRAPHICS_SUBSYSTEM_FAILED [0x0001112F]
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.channels.rdpgfx.server] - context->CapsAdvertise failed with error 20
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_recv_caps_advertise_pdu failed with error 20!
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.channels.rdpgfx.server] - Error while parsing GFX cmdId: RDPGFX_CMDID_CAPSADVERTISE (0x0012)
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_receive_pdu failed with error 20!
[11:40:12:913] [12844:12883] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_handle_messages failed with error 20
[11:40:12:918] [12844:12863] [ERROR][com.freerdp.core.transport] - BIO_read returned a system error 0: Success
org.kde.krdp: Unable to check file descriptor
org.kde.krdp: Closing session
org.kde.krdp: Closing Plasma Remote Session
```

---

Solution?
- https://bbs.archlinux.org/viewtopic.php?pid=2202580#p2202580

```shell
sudo nvidia-xconfig
```

```
[sudo] password for michael: 

Using X configuration file: "/etc/X11/xorg.conf".

WARNING: Unable to find CorePointer in X configuration; attempting to add new CorePointer section.


WARNING: The CorePointer device was not specified explicitly in the layout; using the first mouse device.


WARNING: Unable to find CoreKeyboard in X configuration; attempting to add new CoreKeyboard section.


WARNING: The CoreKeyboard device was not specified explicitly in the layout; using the first keyboard device.

Backed up file '/etc/X11/xorg.conf' as '/etc/X11/xorg.conf.nvidia-xconfig-original'
Backed up file '/etc/X11/xorg.conf' as '/etc/X11/xorg.conf.backup'
New X configuration file written to '/etc/X11/xorg.conf'
```

---

```shell
cat /etc/X11/xorg.conf.nvidia-xconfig-original  
```

```
# Automatically generated by EnvyControl

Section "ServerLayout"
    Identifier "layout"
    Screen 0 "nvidia"
    Inactive "intel"
EndSection

Section "Device"
    Identifier "nvidia"
    Driver "nvidia"
    BusID "PCI:1:0:0"
EndSection

Section "Screen"
    Identifier "nvidia"
    Device "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "Device"
    Identifier "intel"
    Driver "modesetting"
EndSection

Section "Screen"
    Identifier "intel"
    Device "intel"
EndSection
```

---

```shell
cat /etc/X11/xorg.conf.backup
```

```
# Automatically generated by EnvyControl

Section "ServerLayout"
    Identifier "layout"
    Screen 0 "nvidia"
    Inactive "intel"
EndSection

Section "Device"
    Identifier "nvidia"
    Driver "nvidia"
    BusID "PCI:1:0:0"
EndSection

Section "Screen"
    Identifier "nvidia"
    Device "nvidia"
    Option "AllowEmptyInitialConfiguration"
EndSection

Section "Device"
    Identifier "intel"
    Driver "modesetting"
EndSection

Section "Screen"
    Identifier "intel"
    Device "intel"
EndSection
```

---

```shell
cat /etc/X11/xorg.conf
```

```
# nvidia-xconfig: X configuration file generated by nvidia-xconfig
# nvidia-xconfig:  version 580.82.09

# Automatically generated by EnvyControl

Section "ServerLayout"
    Identifier     "layout"
    Screen      0  "nvidia" 0 0
    Inactive       "intel"
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "nvidia"
    Driver         "nvidia"
    BusID          "PCI:1:0:0"
EndSection

Section "Device"
    Identifier     "intel"
    Driver         "modesetting"
EndSection

Section "Screen"
    Identifier     "nvidia"
    Device         "nvidia"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "AllowEmptyInitialConfiguration"
    SubSection     "Display"
        Depth       24
        Modes      "nvidia-auto-select"
    EndSubSection
EndSection

Section "Screen"
    Identifier     "intel"
    Device         "intel"
    Monitor        "Monitor0"
EndSection
```

---

```shell
sudo nano /etc/environment
```

Add

```
# https://bbs.archlinux.org/viewtopic.php?pid=2202580#p2202580
QT_QPA_PLATFORM=wayland
VDPAU_DRIVER=nvidia
LIBVA_DRIVER_NAME=nvidia
__NV_PRIME_RENDER_OFFLOAD=1
__GLX_VENDOR_LIBRARY_NAME=nvidia
```

---

```shell
sudo systemctl reboot
```

---

```shell
kinfo
```

``` 
Operating System: Manjaro Linux 
KDE Plasma Version: 6.3.6
KDE Frameworks Version: 6.18.0
Qt Version: 6.9.2
Kernel Version: 6.16.8-1-MANJARO (64-bit)
Graphics Platform: Wayland
Processors: 8 × 11th Gen Intel® Core™ i5-11320H @ 3.20GHz
Memory: 62.6 GiB of RAM
Graphics Processor 1: NVIDIA GeForce GTX 1650/PCIe/SSE2
Graphics Processor 2: NVIDIA GeForce GTX 1650/PCIe/SSE2
```

---

Tests with `xfreedp`

```shell
sudo pacman -S freerdp
```

```shell
xfreerdp --help 
```

```
FreeRDP - A Free Remote Desktop Protocol Implementation
See www.freerdp.com for more information

Usage: xfreerdp [file] [options] [/v:<server>[:port]]

Syntax:
    /flag (enables flag)
    /option:<value> (specifies option with value)
    +toggle -toggle (enables or disables toggle, where '/' is a synonym of '+')

    /a:<addin>[,<options>]            Addin
    /action-script:<file-name>        Action script
    /admin                            Admin (or console) session
    +aero                             Enable desktop composition
    /app:<path> or ||<alias>          Remote application program
    /app-cmd:<parameters>             Remote application command-line parameters
    /app-file:<file-name>             File to open with remote application
    /app-guid:<app-guid>              Remote application GUID
    /app-icon:<icon-path>             Remote application icon for user interface
    /app-name:<app-name>              Remote application name for user interface
    /app-workdir:<workspace path>     Remote application workspace path
    /assistance:<password>            Remote assistance password
    /auto-request-control             Automatically request remote assistance
                                      input control
    +async-channels                   Enable Asynchronous channels
                                      (experimental)
    +async-input                      Enable Asynchronous input
    +async-update                     Enable Asynchronous update
    /audio-mode:<mode>                Audio output mode
    +auth-only                        Enable Authenticate only
    -authentication                   Disable Authentication (experimental)
    +auto-reconnect                   Enable Automatic reconnection
    /auto-reconnect-max-retries:<retries>
                                      Automatic reconnection maximum retries, 0
                                      for unlimited [0,1000]
    +bitmap-cache                     Enable bitmap cache
    /bpp:<depth>                      Session bpp (color depth)
    /buildconfig                      Print the build configuration
    /cert:[deny,ignore,name:<name>,tofu,fingerprint:<hash>:<hash as hex>
          [,fingerprint:<hash>:<another hash>]]
                                      Certificate accept options. Use with care!
                                      * deny         ... Automatically abort
                                      connection if the certificate does not
                                      match, no user interaction.           *
                                      ignore       ... Ignore the certificate
                                      checks altogether (overrules all other
                                      options)                           * name 
                                             ... Use the alternate <name>
                                      instead of the certificate subject to
                                      match locally stored certificates * tofu  
                                            ... Accept certificate
                                      unconditionally on first connect and deny
                                      on subsequent connections if the
                                      certificate does not match * fingerprints
                                      ... A list of certificate hashes that are
                                      accepted unconditionally for a connection
    /cert-deny                        [deprecated, use /cert:deny] Automatically
                                      abort connection for any certificate that
                                      can not be validated.
    /cert-ignore                      [deprecated, use /cert:ignore] Ignore
                                      certificate
    /cert-name:<name>                 [deprecated, use /cert:name:<name>]
                                      Certificate name
    /cert-tofu                        [deprecated, use /cert:tofu] Automatically
                                      accept certificate on first connect
    /client-build-number:<number>     Client Build Number sent to server
                                      (influences smartcard behaviour, see
                                      [MS-RDPESC])
    /client-hostname:<name>           Client Hostname to send to server
    -clipboard[:[use-selection:<atom>]]
                                      Disable Redirect clipboard.                       
                                      * use-selection:<atom>  ... (X11) Specify
                                      which X selection to access. Default is
                                      CLIPBOARD. PRIMARY is the X-style
                                      middle-click selection.
    /codec-cache:[rfx|nsc|jpeg]       Bitmap codec cache
    -compression                      Disable compression
    /compression-level:<level>        Compression level (0,1,2)
    +credentials-delegation           Enable credentials delegation
    /d:<domain>                       Domain
    -decorations                      Disable Window decorations
    /disp                             Display control
    /drive:<name>,<path>              Redirect directory <path> as named share
                                      <name>. Hotplug support is enabled with
                                      /drive:hotplug,*. This argument provides
                                      the same function as "Drives that I plug
                                      in later" option in MSTSC.
    +drives                           Enable Redirect all mount points as shares
    /dvc:<channel>[,<options>]        Dynamic virtual channel
    /dynamic-resolution               Send resolution updates when the window is
                                      resized
    /echo                             Echo channel
    -encryption                       Disable Encryption (experimental)
    /encryption-methods:[40,][56,][128,][FIPS]
                                      RDP standard security encryption methods
    /f                                Fullscreen mode (<Ctrl>+<Alt>+<Enter>
                                      toggles fullscreen)
    -fast-path                        Disable fast-path input/output
    +fipsmode                         Enable FIPS mode
    /floatbar[:sticky:[on|off],default:[visible|hidden],show:
               [always|fullscreen||window]]
                                      floatbar is disabled by default (when
                                      enabled defaults to sticky in fullscreen
                                      mode)
    -fonts                            Disable smooth fonts (ClearType)
    /frame-ack:<number>               Number of frame acknowledgement
    /from-stdin[:force]               Read credentials from stdin. With <force>
                                      the prompt is done before connection,
                                      otherwise on server request.
    /g:<gateway>[:<port>]             Gateway Hostname
    /gateway-usage-method:[direct|detect]
                                      Gateway usage method
    /gd:<domain>                      Gateway domain
    /gdi:sw|hw                        GDI rendering
    /geometry                         Geometry tracking channel
    +gestures                         Enable Consume multitouch input locally
    /gfx[:[[RFX|AVC420|AVC444],mask:<value>]]
                                      RDP8 graphics pipeline
    /gfx-h264[:[[AVC420|AVC444],mask:<value>] 
               [DEPRECATED] use /gfx:avc420 instead]
                                      RDP8.1 graphics pipeline using H264 codec
    +gfx-progressive                  Enable RDP8 graphics pipeline using progressive
                                      codec
    +gfx-small-cache                  Enable RDP8 graphics pipeline using small cache
                                      mode
    +gfx-thin-client                  Enable RDP8 graphics pipeline using thin client
                                      mode
    +glyph-cache                      Enable Glyph cache (experimental)
    /gp:<password>                    Gateway password
    -grab-keyboard                    Disable Grab keyboard
    -grab-mouse                       Disable Grab mouse
    /gt:[rpc|http[,no-websockets]|auto[,no-websockets]]
                                      Gateway transport type
    /gu:[[<domain>\]<user>|<user>[@<domain>]]
                                      Gateway username
    /gat:<access token>               Gateway Access Token
    /h:<height>                       Height
    -heartbeat                        Disable Support heartbeat PDUs
    /help                             Print help
    +home-drive                       Enable Redirect user home as share
    /ipv6                             Prefer IPv6 AAA record over IPv4 A record
    /jpeg                             JPEG codec support
    /jpeg-quality:<percentage>        JPEG quality
    /kbd:0x<id> or <name>             Keyboard layout
    /kbd-lang:0x<id>                  Keyboard active language identifier
    /kbd-fn-key:<value>               Function key value
    /kbd-list                         List keyboard layouts
    /kbd-lang-list                    List keyboard languages
    /kbd-remap:List of <key>=<value>,... pairs to remap scancodes
                                      Keyboard scancode remapping
    /kbd-subtype:<id>                 Keyboard subtype
    /kbd-type:<id>                    Keyboard type
    /load-balance-info:<info-string>  Load balance info
    /log-filters:<tag>:<level>[,<tag>:<level>[,...]]
                                      Set logger filters, see wLog(7) for
                                      details
    /log-level:[OFF|FATAL|ERROR|WARN|INFO|DEBUG|TRACE]
                                      Set the default log level, see wLog(7) for
                                      details
    /max-fast-path-size:<size>        Specify maximum fast-path update size
    /max-loop-time:<time>             Specify maximum time in milliseconds spend
                                      treating packets
    +menu-anims                       Enable menu animations
    /microphone[:[sys:<sys>,][dev:<dev>,][format:<format>,][rate:<rate>,]
                 [channel:<channel>]] Audio input (microphone)
    /monitor-list                     List detected monitors
    /monitors:<id>[,<id>[,...]]       Select monitors to use
    -mouse-motion                     Disable Send mouse motion
    /multimon[:force]                 Use multiple monitors
    +multitouch                       Enable Redirect multitouch input
    +multitransport                   Enable Support multitransport protocol
    -nego                             Disable protocol security negotiation
    /network:[modem|broadband|broadband-low|broadband-high|wan|lan|auto]
                                      Network connection type
    /nsc                              NSCodec support
    +offscreen-cache                  Enable offscreen bitmap cache
    /orientation:[0|90|180|270]       Orientation of display in degrees
    +old-license                      Enable Use the old license workflow (no CAL and
                                      hwId set to 0)
    /p:<password>                     Password
    /parallel[:<name>[,<path>]]       Redirect parallel device
    /parent-window:<window-id>        Parent window id
    +password-is-pin                  Enable Use smart card authentication with
                                      password as smart card PIN
    /pcb:<blob>                       Preconnection Blob
    /pcid:<id>                        Preconnection Id
    /pheight:<height>                 Physical height of display (in
                                      millimeters)
    /play-rfx:<pcap-file>             Replay rfx pcap file
    /port:<number>                    Server port
    -suppress-output                  Disable suppress output when minimized
    +print-reconnect-cookie           Enable Print base64 reconnect cookie after
                                      connecting
    /printer[:<name>[,<driver>]]      Redirect printer device
    /proxy:[<proto>://][<user>:<password>@]<host>:<port>
                                      Proxy settings: override env. var (see
                                      also environment variable below). Protocol
                                      "socks5" should be given explicitly where
                                      "http" is default.
    /pth:<password-hash>              Pass the hash (restricted admin mode)
    /pwidth:<width>                   Physical width of display (in millimeters)
    /rdp2tcp:<executable path[:arg...]>
                                      TCP redirection
    /reconnect-cookie:<base64-cookie> Pass base64 reconnect cookie to the
                                      connection
    /redirect-prefer:<FQDN|IP|NETBIOS>,[...]
                                      Override the preferred redirection order
    /relax-order-checks               Do not check if a RDP order was announced
                                      during capability exchange, only use when
                                      connecting to a buggy server
    /restricted-admin                 Restricted admin mode
    /rfx                              RemoteFX
    /rfx-mode:[image|video]           RemoteFX mode
    /scale:[100|140|180]              Scaling factor of the display
    /scale-desktop:<percentage>       Scaling factor for desktop applications
                                      (value between 100 and 500)
    /scale-device:100|140|180         Scaling factor for app store applications
    /sec:[rdp|tls|nla|ext]            Force specific protocol security
    +sec-ext                          Enable NLA extended protocol security
    -sec-nla                          Disable NLA protocol security
    -sec-rdp                          Disable RDP protocol security
    -sec-tls                          Disable TLS protocol security
    /serial[:<name>[,<path>[,<driver>[,permissive]]]]
                                      Redirect serial device
    /shell:<shell>                    Alternate shell
    /shell-dir:<dir>                  Shell working directory
    /size:<width>x<height> or <percent>%[wh]
                                      Screen size
    /smart-sizing[:<width>x<height>]  Scale remote desktop to window size
    /smartcard[:<str>[,<str>...]]     Redirect the smartcard devices containing
                                      any of the <str> in their names.
    /smartcard-logon                  Activates Smartcard Logon authentication.
                                      (EXPERIMENTAL: NLA not supported)
    /sound[:[sys:<sys>,][dev:<dev>,][format:<format>,][rate:<rate>,]
            [channel:<channel>,][latency:<latency>,][quality:<quality>]]
                                      Audio output (sound)
    /span                             Span screen over multiple monitors
    /spn-class:<service-class>        SPN authentication service class
    /ssh-agent                        SSH Agent forwarding channel
    /t:<title>                        Window title
    -themes                           Disable themes
    /timeout:<time in ms>             Advanced setting for high latency links:
                                      Adjust connection timeout, use if you
                                      encounter timeout failures with your
                                      connection
    /tls-ciphers:[netmon|ma|ciphers]  Allowed TLS ciphers
    /tls-seclevel:<level>             TLS security level - defaults to 1
    +enforce-tlsv1_2                  Enable Force use of TLS1.2 for connection. Some
                                      servers have a buggy TLS version
                                      negotiation and might fail without this
    -toggle-fullscreen                Disable Alt+Ctrl+Enter to toggle
                                      fullscreen
    /tune:<setting:value>,<setting:value>
                                      [experimental] directly manipulate freerdp
                                      settings, use with extreme caution!
    /tune-list                        Print options allowed for /tune
    /u:[[<domain>\]<user>|<user>[@<domain>]]
                                      Username
    +unmap-buttons                    Enable Let server see real physical pointer
                                      button
    /usb:[dbg,][id:<vid>:<pid>#...,][addr:<bus>:<addr>#...,][auto]
                                      Redirect USB device
    /v:<server>[:port]                Server hostname
    /vc:<channel>[,<options>]         Static virtual channel
    /version                          Print version
    /video                            Video optimized remoting channel
    /vmconnect[:<vmid>]               Hyper-V console (use port 2179, disable
                                      negotiation)
    /w:<width>                        Width
    -wallpaper                        Disable wallpaper
    +window-drag                      Enable full window drag
    /window-position:<xpos>x<ypos>    window position
    /wm-class:<class-name>            Set the WM_CLASS hint for the window
                                      instance
    /workarea                         Use available work area

Examples:
    xfreerdp connection.rdp /p:Pwd123! /f
    xfreerdp /u:CONTOSO\JohnDoe /p:Pwd123! /v:rdp.contoso.com
    xfreerdp /u:JohnDoe /p:Pwd123! /w:1366 /h:768 /v:192.168.1.100:4489
    xfreerdp /u:JohnDoe /p:Pwd123! /vmconnect:C824F53E-95D2-46C6-9A18-23A5BB403532 /v:192.168.1.100

Clipboard Redirection: +clipboard

Drive Redirection: /drive:home,/home/user
Smartcard Redirection: /smartcard:<device>
Serial Port Redirection: /serial:<name>,<device>,[SerCx2|SerCx|Serial],[permissive]
Serial Port Redirection: /serial:COM1,/dev/ttyS0
Parallel Port Redirection: /parallel:<name>,<device>
Printer Redirection: /printer:<device>,<driver>
TCP redirection: /rdp2tcp:/usr/bin/rdp2tcp

Audio Output Redirection: /sound:sys:oss,dev:1,format:1
Audio Output Redirection: /sound:sys:alsa
Audio Input Redirection: /microphone:sys:oss,dev:1,format:1
Audio Input Redirection: /microphone:sys:alsa

Multimedia Redirection: /video
USB Device Redirection: /usb:id:054c:0268#4669:6e6b,addr:04:0c

For Gateways, the https_proxy environment variable is respected:
    export https_proxy=http://proxy.contoso.com:3128/
    xfreerdp /g:rdp.contoso.com ...

More documentation is coming, in the meantime consult source files
```

---

```shell
xfreerdp /v:lenovo.openstudiolandscapes.lan /u:user /p:test
xfreerdp /v:lenovo.openstudiolandscapes.lan /u:user /p:test /cert:ignore
```

- [x] Works
- Optimus GPU Sitcher in `Hybrid` mode

```
Nov 15 13:11:14 lenovo krdpserver[8819]: org.kde.krdp: Listening for connections on QHostAddress(QHostAddress::Any) 3389
Nov 15 13:11:20 lenovo krdpserver[8819]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:11:20 lenovo krdpserver[8819]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:11:20 lenovo krdpserver[8819]: [13:11:20:947] [8819:8852] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:11:20 lenovo krdpserver[8819]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:11:20 lenovo krdpserver[8819]: kpipewire_vaapi_logging: VAAPI: Failed to initialize display
Nov 15 13:11:20 lenovo krdpserver[8819]: kpipewire_vaapi_logging: VAAPI: Failed to initialize display
Nov 15 13:11:20 lenovo krdpserver[8819]: kpipewire_vaapi_logging: DRM device not found
Nov 15 13:11:21 lenovo krdpserver[8819]: [13:11:21:047] [8819:8852] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp: New client connected:  UNIX platform Native X Server
Nov 15 13:11:22 lenovo krdpserver[8819]: QObject: Cannot create children for a parent that is in a different thread.
                                         (Parent is QApplication(0x7ffc0cd7f7d0), parent's thread is QThread(0x558ad066a2c0), current thread is QThread(0x7f0a2407e020)
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp: Video stream initialized
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp: Received caps:
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_8 AVC: false YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_81 AVC: true YUV420: true
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_10 AVC: true YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_101 AVC: true YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_102 AVC: true YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_103 AVC: true YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_104 AVC: true YUV420: true
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_105 AVC: true YUV420: true
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_106 AVC: true YUV420: true
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   UNKNOWN_VERSION AVC: false YUV420: false
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_107 AVC: true YUV420: true
Nov 15 13:11:22 lenovo krdpserver[8819]: org.kde.krdp: Selected caps: RDPGFX_CAPVERSION_107
Nov 15 13:11:22 lenovo krdpserver[8819]: kpipewire_record_logging: Hardware encoding is not supported on this device.
Nov 15 13:11:22 lenovo krdpserver[8819]: [libx264 @ 0x7f0a188390c0] -qscale is ignored, -crf is recommended.
Nov 15 13:11:22 lenovo krdpserver[8819]: [libx264 @ 0x7f0a188390c0] MB rate (19040000) > level limit (16711680)
Nov 15 13:11:22 lenovo krdpserver[8819]: [libx264 @ 0x7f0a188390c0] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
Nov 15 13:11:22 lenovo krdpserver[8819]: [libx264 @ 0x7f0a188390c0] profile Constrained Baseline, level 6.2, 4:2:0, 8-bit
Nov 15 13:11:22 lenovo krdpserver[8819]: kpipewire_dmabuf_logging: eglChooseConfig returned this many configs: 1
```

---

```shell
journalctl -f /usr/bin/krdpserver
```

```
Nov 15 13:02:07 lenovo krdpserver[7846]: org.kde.krdp: Listening for connections on QHostAddress(QHostAddress::Any) 3389

Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:032] [7846:8060] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [ERROR][com.winpr.sspi.NTLM] - Message Integrity Check (MIC) verification failed!
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [WARN][com.winpr.sspi] - CompleteAuthToken status SEC_E_MESSAGE_ALTERED [0x8009030F]
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [WARN][com.freerdp.core.nla] - CompleteAuthToken status SEC_E_MESSAGE_ALTERED [0x8009030F]
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [ERROR][com.freerdp.core.transport] - client authentication failure
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [ERROR][com.freerdp.core.peer] - peer_recv_callback: CONNECTION_STATE_INITIAL - rdp_server_accept_nego() fail
Nov 15 13:04:40 lenovo krdpserver[7846]: [13:04:40:131] [7846:8060] [ERROR][com.freerdp.core.transport] - transport_check_fds: transport->ReceiveCallback() - -1
Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Unable to check file descriptor
Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Closing session
Nov 15 13:04:40 lenovo krdpserver[7846]: org.kde.krdp: Closing Freedesktop Portal Session
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:251] [7846:8074] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [ERROR][com.winpr.sspi.NTLM] - Message Integrity Check (MIC) verification failed!
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [WARN][com.winpr.sspi] - CompleteAuthToken status SEC_E_MESSAGE_ALTERED [0x8009030F]
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [WARN][com.freerdp.core.nla] - CompleteAuthToken status SEC_E_MESSAGE_ALTERED [0x8009030F]
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [ERROR][com.freerdp.core.transport] - client authentication failure
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [ERROR][com.freerdp.core.peer] - peer_recv_callback: CONNECTION_STATE_INITIAL - rdp_server_accept_nego() fail
Nov 15 13:04:49 lenovo krdpserver[7846]: [13:04:49:353] [7846:8074] [ERROR][com.freerdp.core.transport] - transport_check_fds: transport->ReceiveCallback() - -1
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Unable to check file descriptor
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Closing session
Nov 15 13:04:49 lenovo krdpserver[7846]: org.kde.krdp: Closing Freedesktop Portal Session
Nov 15 13:05:04 lenovo krdpserver[7846]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:05:04 lenovo krdpserver[7846]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:05:04 lenovo krdpserver[7846]: [13:05:04:943] [7846:8089] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:05:05 lenovo krdpserver[7846]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:05:05:043] [7846:8089] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:48:691] [7846:7891] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:48:691] [7846:7891] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:48:691] [7846:7891] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:57:939] [7846:7910] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:57:939] [7846:7910] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:02:57:939] [7846:7910] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:443] [7846:7949] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:443] [7846:7949] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:443] [7846:7949] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] - Accepted client: aFreeRDP-85d930
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] - Accepted channels:
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] -  rdpdr
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] -  rdpsnd
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] -  cliprdr
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.connection] -  drdynvc
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:32:674] [7846:7949] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:38:184] [7846:7982] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:38:184] [7846:7982] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:38:184] [7846:7982] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:47:393] [7846:7994] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:47:393] [7846:7994] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:03:47:393] [7846:7994] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:372] [7846:8018] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:372] [7846:8018] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:372] [7846:8018] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] - Accepted client: aFreeRDP-85d930
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] - Accepted channels:
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] -  rdpdr
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] -  rdpsnd
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] -  cliprdr
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.connection] -  drdynvc
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:07:592] [7846:8018] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:40:021] [7846:8060] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:40:021] [7846:8060] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:40:021] [7846:8060] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:49:228] [7846:8074] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:49:228] [7846:8074] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:04:49:228] [7846:8074] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:05:04:920] [7846:8089] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:05:04:920] [7846:8089] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:05 lenovo krdpserver[7846]: [13:05:04:920] [7846:8089] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:05:06 lenovo krdpserver[7846]: org.kde.krdp: New client connected:  Unspecified platform Unspecified version
Nov 15 13:05:06 lenovo krdpserver[7846]: [13:05:05:145] [7846:8089] [INFO][co[13:05:06:859] [7846:8089] [ERROR][com.freerdp.core.peer] - peer_recv_callback: CONNECTION_STATE_ACTIVE - peer_recv_pdu() fail
Nov 15 13:05:06 lenovo krdpserver[7846]: [13:05:06:859] [7846:8089] [ERROR][com.freerdp.core.transport] - transport_check_fds: transport->ReceiveCallback() - -1
Nov 15 13:05:06 lenovo krdpserver[7846]: org.kde.krdp: Unable to check file descriptor
Nov 15 13:05:06 lenovo krdpserver[7846]: org.kde.krdp: Closing session
Nov 15 13:05:06 lenovo krdpserver[7846]: org.kde.krdp: Closing Freedesktop Portal Session
```

---

Guacamole

```
Nov 15 13:15:30 lenovo krdpserver[8819]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:15:30 lenovo krdpserver[8819]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:15:30 lenovo krdpserver[8819]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:15:37 lenovo krdpserver[8819]: [13:15:37:932] [8819:9288] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:15:38 lenovo krdpserver[8819]: [13:15:38:033] [8819:9288] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:15:39 lenovo krdpserver[8819]: org.kde.krdp: New client connected:  Unspecified platform Unspecified version
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Video stream initialized
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Received caps:
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_8 AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_81 AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [ERROR][com.freerdp.core] - rdp_set_error_info:freerdp_set_last_error_ex ERRINFO_GRAPHICS_SUBSYSTEM_FAILED [0x0001112F]
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [ERROR][com.freerdp.channels.rdpgfx.server] - context->CapsAdvertise failed with error 20
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_recv_caps_advertise_pdu failed with error 20!
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [ERROR][com.freerdp.channels.rdpgfx.server] - Error while parsing GFX cmdId: RDPGFX_CMDID_CAPSADVERTISE (0x0012)
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_10 AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_receive_pdu failed with error 20!
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:242] [8819:9316] [ERROR][com.freerdp.channels.rdpgfx.server] - rdpgfx_server_handle_messages failed with error 20
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_101 AVC: true YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_102 AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_103 AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_104 AVC: false YUV420: true
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_105 AVC: false YUV420: true
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_106 AVC: false YUV420: true
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   UNKNOWN_VERSION AVC: false YUV420: false
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_107 AVC: false YUV420: true
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Client does not support H.264 in YUV420 mode!
Nov 15 13:15:40 lenovo krdpserver[8819]: kpipewire_record_logging: Hardware encoding is not supported on this device.
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] -qscale is ignored, -crf is recommended.
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] MB rate (19040000) > level limit (16711680)
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] profile Constrained Baseline, level 6.2, 4:2:0, 8-bit
Nov 15 13:15:40 lenovo krdpserver[8819]: kpipewire_dmabuf_logging: eglChooseConfig returned this many configs: 1
Nov 15 13:15:40 lenovo krdpserver[8819]: [13:15:40:344] [8819:9288] [ERROR][com.freerdp.core.transport] - BIO_read returned a system error 0: Success
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Unable to check file descriptor
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Closing session
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] frame I:1     Avg QP:20.00  size:285743
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] mb I  I16..4: 100.0%  0.0%  0.0%
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] coded y,uvDC,uvAC intra: 16.1% 14.0% 12.9%
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] i16 v,h,dc,p: 76% 12% 11%  1%
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] i8c dc,h,v,p: 80% 13%  6%  1%
Nov 15 13:15:40 lenovo krdpserver[8819]: [libx264 @ 0x7f09e883ddc0] kb/s:2285944.00
Nov 15 13:15:40 lenovo krdpserver[8819]: org.kde.krdp: Closing Freedesktop Portal Session
```

---

`xfreerdp`

```
Nov 15 13:16:55 lenovo krdpserver[8819]: org.kde.krdp: Initializing Freedesktop Portal Session
Nov 15 13:16:55 lenovo krdpserver[8819]: org.kde.krdp: Session setup completed, start processing...
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:20:937] [8819:8852] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:20:937] [8819:8852] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:20:937] [8819:8852] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] - Accepted client: lenovo
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] - Accepted channels:
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] -  rdpdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] -  rdpsnd
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] -  cliprdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.connection] -  drdynvc
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:11:21:147] [8819:8852] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:16:700] [8819:9123] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:16:700] [8819:9123] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:16:700] [8819:9123] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:472] [8819:9123] [INFO][com.freerdp.core.connection] - Accepted client: Guacamole RDP
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.connection] - Accepted channels:
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.connection] -  cliprdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.connection] -  rdpdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.connection] -  rdpsnd
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.connection] -  drdynvc
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:37:473] [8819:9123] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:39:578] [8819:9186] [INFO][com.freerdp.core] - ERRINFO_GRAPHICS_SUBSYSTEM_FAILED (0x0000112F):The server-side graphics subsystem is in an error state and unable to continue graphics encoding.
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:54:859] [8819:9237] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:54:859] [8819:9237] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:14:54:859] [8819:9237] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:30:301] [8819:9288] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:30:301] [8819:9288] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:30:301] [8819:9288] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] - Accepted client: Guacamole RDP
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] - Accepted channels:
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] -  cliprdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] -  rdpdr
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] -  rdpsnd
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.connection] -  drdynvc
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.gcc] - Active rdp encryption level: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:38:134] [8819:9288] [INFO][com.freerdp.core.gcc] - Selected rdp encryption method: NONE
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:40:241] [8819:9316] [INFO][com.freerdp.core] - ERRINFO_GRAPHICS_SUBSYSTEM_FAILED (0x0000112F):The server-side graphics subsystem is in an error state and unable to continue graphics encoding.
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:55:687] [8819:9372] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:55:687] [8819:9372] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:15:55:687] [8819:9372] [INFO][com.freerdp.core.connection] - Negotiated Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:16:55:968] [8819:9480] [INFO][com.freerdp.core.connection] - Client Security: NLA:1 TLS:1 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:16:55:968] [8819:9480] [INFO][com.freerdp.core.connection] - Server Security: NLA:1 TLS:0 RDP:0
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:1[13:16:55:976] [8819:9480] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_CONTINUE_NEEDED [0x00090312]
Nov 15 13:16:56 lenovo krdpserver[8819]: [13:16:56:077] [8819:9480] [WARN][com.winpr.negotiate] - AcceptSecurityContext status SEC_I_COMPLETE_NEEDED [0x00090313]
Nov 15 13:16:56 lenovo krdpserver[8819]: org.kde.krdp: Started Freedesktop Portal session
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp: New client connected:  UNIX platform Native X Server
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp: Video stream initialized
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp: Received caps:
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_8 AVC: false YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_81 AVC: true YUV420: true
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_10 AVC: true YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_101 AVC: true YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_102 AVC: true YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_103 AVC: true YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_104 AVC: true YUV420: true
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_105 AVC: true YUV420: true
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_106 AVC: true YUV420: true
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   UNKNOWN_VERSION AVC: false YUV420: false
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp:   RDPGFX_CAPVERSION_107 AVC: true YUV420: true
Nov 15 13:16:57 lenovo krdpserver[8819]: org.kde.krdp: Selected caps: RDPGFX_CAPVERSION_107
Nov 15 13:16:57 lenovo krdpserver[8819]: kpipewire_record_logging: Hardware encoding is not supported on this device.
Nov 15 13:16:57 lenovo krdpserver[8819]: [libx264 @ 0x7f0a1901ce40] -qscale is ignored, -crf is recommended.
Nov 15 13:16:57 lenovo krdpserver[8819]: [libx264 @ 0x7f0a1901ce40] MB rate (19040000) > level limit (16711680)
Nov 15 13:16:57 lenovo krdpserver[8819]: [libx264 @ 0x7f0a1901ce40] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2 AVX512
Nov 15 13:16:57 lenovo krdpserver[8819]: [libx264 @ 0x7f0a1901ce40] profile Constrained Baseline, level 6.2, 4:2:0, 8-bit
Nov 15 13:16:57 lenovo krdpserver[8819]: kpipewire_dmabuf_logging: eglChooseConfig returned this many configs: 1
```