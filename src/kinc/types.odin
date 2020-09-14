package kinc;

import _c "core:c"

// -----------------------------------------------------------------------------
//
// window.h
//
// -----------------------------------------------------------------------------
Window_Mode :: enum _c.int {
	WINDOW,
	FULLSCREEN,
	EXCLUSIVE_FULLSCREEN,
}

WINDOW_FEATURE_RESIZABLE:   _c.int: 1;
WINDOW_FEATURE_MINIMIZABLE: _c.int: 2;
WINDOW_FEATURE_MAXIMIZABLE: _c.int: 4;
WINDOW_FEATURE_BORDERLESS:  _c.int: 8;
WINDOW_FEATURE_ON_TOP:      _c.int: 16;

Window_Options :: struct #packed {
	title: cstring,

	x: _c.int,
	y: _c.int,
	width: _c.int,
	height: _c.int,
	display_index: _c.int,

	visible: _c.bool,
	window_features: _c.int,
	mode: Window_Mode,
}

Framebuffer_Options :: struct #packed {
	frequency: _c.int,
	vertical_sync: _c.bool,
	color_bits: _c.int,
	depth_bits: _c.int,
	stencil_bits: _c.int,
	samples_per_pixel: _c.int,
}
// -----------------------------------------------------------------------------
//
// image.h
//
// -----------------------------------------------------------------------------
Image_Compression :: enum _c.uint {
	NONE,
	DXT5,
	ASTC,
	PVRTC
}
Image_Format :: enum _c.int {
	RGBA32,
	GREY8,
	RGB24,
	RGBA128,
	RGBA64,
	A32,
	BGRA32,
	A16
}

Image :: struct #packed {
	width: _c.int,
	height: _c.int,
	depth: _c.int,
	format: Image_Format,
	internal_format: _c.uint,
	compression: Image_Compression,
	data: rawptr,
	data_size: _c.int,
}

Image_Read_Callbacks :: struct #packed {
	read: proc "c" (user_data: rawptr, data: rawptr, size: _c.size_t) -> _c.int,
	seek: proc "c" (user_data: rawptr, pos: _c.int),
	pos: proc "c" (user_data: rawptr) -> _c.int,
	size: proc "c" (user_data: rawptr) -> _c.size_t,

}
// -----------------------------------------------------------------------------
//
// display.h
//
// -----------------------------------------------------------------------------

Display_Mode :: struct #packed {
	x: _c.int,
	y: _c.int,
	width: _c.int,
	height: _c.int,
	pixels_per_inch: _c.int,
	frequency: _c.int,
	bits_per_pixel: _c.int,
}
// -----------------------------------------------------------------------------
//
// color.h
//
// -----------------------------------------------------------------------------

BLACK :: 0xff000000;
WHITE :: 0xffffffff;
RED :: 0xffff0000;
BLUE :: 0xff0000ff;
GREEN :: 0xff00ff00;
YELLOW :: 0xffffff00;
CYAN :: 0xff00ffff;

// -----------------------------------------------------------------------------
//
// socket.h
//
// -----------------------------------------------------------------------------
Socket :: struct #packed {
	handle: _c.int,
}
// -----------------------------------------------------------------------------
//
// http.h
//
// -----------------------------------------------------------------------------
HTTP_GET :: 0;
HTTP_POST :: 1;
HTTP_PUT :: 2;
HTTP_DELETE :: 3;

Http_Callback :: proc "c" (error: _c.int, response: _c.int, body: string, callbackdata: rawptr);

// -----------------------------------------------------------------------------
//
// audio2.h
//
// -----------------------------------------------------------------------------
Audio2_Buffer_Format :: struct #packed {
	channels: _c.int,
	samples_per_second: _c.int,
	bits_per_sample: _c.int,
}

Audio2_Buffer :: struct #packed {
	format: Audio2_Buffer_Format,
	data: ^u8, // uint8_t
	data_size: _c.int,
	read_location: _c.int,
	write_location: _c.int,
}

Audio2_Callback :: proc "c" (buffer: ^Audio2_Buffer, samples: _c.int);
Audio2_Sample_Rate_Callback :: proc "c" ();
// -----------------------------------------------------------------------------
//
// vrinterface.h
//
// -----------------------------------------------------------------------------
Tracking_Origin :: enum _c.int {
	STAND,
	SIT,
}

Tracked_Device :: enum _c.int {
	HMD,
	CONTROLLER,
	VIVE_TRACKER,
}

Vr_Pose :: struct #packed {
	orientation: Quaternion,
	position: Vector3,

	eye: Matrix4x4,
	projection: Matrix4x4,

	left: _c.float,
	right: _c.float,
	bottom: _c.float,
	top: _c.float,
}

Vr_Pos_State :: struct #packed {
	vr_pos: Vr_Pose,
	angular_velocity: Vector3,
	linear_velocity: Vector3,
	angular_acceleration: Vector3,
	linearAcceleration: Vector3,

	tracked_device: Tracked_Device,

	is_visible: _c.bool,
	hmd_presenting: _c.bool,
	hmd_mounted: _c.bool,
	display_lost: _c.bool,
	should_quit: _c.bool,
	should_recenter: _c.bool,
}

Vr_Sensor_State :: struct #packed {
	pose: Vr_Pos_State,
}
// -----------------------------------------------------------------------------
//
// vector.h
//
// -----------------------------------------------------------------------------
Vector2 :: struct #packed {
	x: _c.float,
	y: _c.float,
}
Vector3 :: struct #packed {
	x: _c.float,
	y: _c.float,
	z: _c.float,
}
Vector4 :: struct #packed {
	x: _c.float,
	y: _c.float,
	z: _c.float,
	w: _c.float,
}
// -----------------------------------------------------------------------------
//
// matrix.h
//
// -----------------------------------------------------------------------------
Matrix3x3 :: struct #packed {
	m: [9] _c.float,
}

Matrix4x4 :: struct #packed {
	m: [16] _c.float,
}
// -----------------------------------------------------------------------------
//
// quaternion.h
//
// -----------------------------------------------------------------------------
Quaternion :: struct #packed {
	x: _c.float,
	y: _c.float,
	z: _c.float,
	w: _c.float,
}
// -----------------------------------------------------------------------------
//
// random.h
//
// -----------------------------------------------------------------------------
	//nothing
// -----------------------------------------------------------------------------
//
// math/core.h
//
// -----------------------------------------------------------------------------
KINC_PI :: 3.141592654;
KINC_TAU :: 6.283185307;
// -----------------------------------------------------------------------------
//
// filewriter.h
//
// -----------------------------------------------------------------------------
File_Writer :: struct #packed {
	file: rawptr,
	filename: cstring,
	mounted: _c.bool,
}
// -----------------------------------------------------------------------------
//
// filereader.h
//
// -----------------------------------------------------------------------------
// there is a lot of crossplatform code (switch, sony, android)
// i didn't port it :)
FILE_TYPE_ASSET :: 0;
FILE_TYPE_SAVE :: 1;
File_Reader :: struct #packed {
	file: rawptr,
	size: _c.int,
	type: _c.int,
	mode: _c.int,
	mounted: _c.bool,
}
// -----------------------------------------------------------------------------
//
// keyboard.h
//
// -----------------------------------------------------------------------------
KEY_UNKNOWN            :: 0;
KEY_BACK               :: 1;// Android
KEY_CANCEL             :: 3;
KEY_HELP               :: 6;
KEY_BACKSPACE          :: 8;
KEY_TAB                :: 9;
KEY_CLEAR              :: 12;
KEY_RETURN             :: 13;
KEY_SHIFT              :: 16;
KEY_CONTROL            :: 17;
KEY_ALT                :: 18;
KEY_PAUSE              :: 19;
KEY_CAPS_LOCK          :: 20;
KEY_KANA               :: 21;
KEY_HANGUL             :: 21;
KEY_EISU               :: 22;
KEY_JUNJA              :: 23;
KEY_FINAL              :: 24;
KEY_HANJA              :: 25;
KEY_KANJI              :: 25;
KEY_ESCAPE             :: 27;
KEY_CONVERT            :: 28;
KEY_NON_CONVERT        :: 29;
KEY_ACCEPT             :: 30;
KEY_MODE_CHANGE        :: 31;
KEY_SPACE              :: 32;
KEY_PAGE_UP            :: 33;
KEY_PAGE_DOWN          :: 34;
KEY_END                :: 35;
KEY_HOME               :: 36;
KEY_LEFT               :: 37;
KEY_UP                 :: 38;
KEY_RIGHT              :: 39;
KEY_DOWN               :: 40;
KEY_SELECT             :: 41;
KEY_PRINT              :: 42;
KEY_EXECUTE            :: 43;
KEY_PRINT_SCREEN       :: 44;
KEY_INSERT             :: 45;
KEY_DELETE             :: 46;
KEY_0                  :: 48;
KEY_1                  :: 49;
KEY_2                  :: 50;
KEY_3                  :: 51;
KEY_4                  :: 52;
KEY_5                  :: 53;
KEY_6                  :: 54;
KEY_7                  :: 55;
KEY_8                  :: 56;
KEY_9                  :: 57;
KEY_COLON              :: 58;
KEY_SEMICOLON          :: 59;
KEY_LESS_THAN          :: 60;
KEY_EQUALS             :: 61;
KEY_GREATER_THAN       :: 62;
KEY_QUESTIONMARK       :: 63;
KEY_AT                 :: 64;
KEY_A                  :: 65;
KEY_B                  :: 66;
KEY_C                  :: 67;
KEY_D                  :: 68;
KEY_E                  :: 69;
KEY_F                  :: 70;
KEY_G                  :: 71;
KEY_H                  :: 72;
KEY_I                  :: 73;
KEY_J                  :: 74;
KEY_K                  :: 75;
KEY_L                  :: 76;
KEY_M                  :: 77;
KEY_N                  :: 78;
KEY_O                  :: 79;
KEY_P                  :: 80;
KEY_Q                  :: 81;
KEY_R                  :: 82;
KEY_S                  :: 83;
KEY_T                  :: 84;
KEY_U                  :: 85;
KEY_V                  :: 86;
KEY_W                  :: 87;
KEY_X                  :: 88;
KEY_Y                  :: 89;
KEY_Z                  :: 90;
KEY_WIN                :: 91;
KEY_CONTEXT_MENU       :: 93;
KEY_SLEEP              :: 95;
KEY_NUMPAD_0           :: 96;
KEY_NUMPAD_1           :: 97;
KEY_NUMPAD_2           :: 98;
KEY_NUMPAD_3           :: 99;
KEY_NUMPAD_4           :: 100;
KEY_NUMPAD_5           :: 101;
KEY_NUMPAD_6           :: 102;
KEY_NUMPAD_7           :: 103;
KEY_NUMPAD_8           :: 104;
KEY_NUMPAD_9           :: 105;
KEY_MULTIPLY           :: 106;
KEY_ADD                :: 107;
KEY_SEPARATOR          :: 108;
KEY_SUBTRACT           :: 109;
KEY_DECIMAL            :: 110;
KEY_DIVIDE             :: 111;
KEY_F1                 :: 112;
KEY_F2                 :: 113;
KEY_F3                 :: 114;
KEY_F4                 :: 115;
KEY_F5                 :: 116;
KEY_F6                 :: 117;
KEY_F7                 :: 118;
KEY_F8                 :: 119;
KEY_F9                 :: 120;
KEY_F10                :: 121;
KEY_F11                :: 122;
KEY_F12                :: 123;
KEY_F13                :: 124;
KEY_F14                :: 125;
KEY_F15                :: 126;
KEY_F16                :: 127;
KEY_F17                :: 128;
KEY_F18                :: 129;
KEY_F19                :: 130;
KEY_F20                :: 131;
KEY_F21                :: 132;
KEY_F22                :: 133;
KEY_F23                :: 134;
KEY_F24                :: 135;
KEY_NUM_LOCK           :: 144;
KEY_SCROLL_LOCK        :: 145;
KEY_WIN_OEM_FJ_JISHO   :: 146;
KEY_WIN_OEM_FJ_MASSHOU :: 147;
KEY_WIN_OEM_FJ_TOUROKU :: 148;
KEY_WIN_OEM_FJ_LOYA    :: 149;
KEY_WIN_OEM_FJ_ROYA    :: 150;
KEY_CIRCUMFLEX         :: 160;
KEY_EXCLAMATION        :: 161;
KEY_DOUBLE_QUOTE       :: 162;
KEY_HASH               :: 163;
KEY_DOLLAR             :: 164;
KEY_PERCENT            :: 165;
KEY_AMPERSAND          :: 166;
KEY_UNDERSCORE         :: 167;
KEY_OPEN_PAREN         :: 168;
KEY_CLOSE_PAREN        :: 169;
KEY_ASTERISK           :: 170;
KEY_PLUS               :: 171;
KEY_PIPE               :: 172;
KEY_HYPHEN_MINUS       :: 173;
KEY_OPEN_CURLY_BRACKET :: 174;
KEY_CLOSE_CURLY_BRACKET:: 175;
KEY_TILDE              :: 176;
KEY_VOLUME_MUTE        :: 181;
KEY_VOLUME_DOWN        :: 182;
KEY_VOLUME_UP          :: 183;
KEY_COMMA              :: 188;
KEY_PERIOD             :: 190;
KEY_SLASH              :: 191;
KEY_BACK_QUOTE         :: 192;
KEY_OPEN_BRACKET       :: 219;
KEY_BACK_SLASH         :: 220;
KEY_CLOSE_BRACKET      :: 221;
KEY_QUOTE              :: 222;
KEY_META               :: 224;
KEY_ALT_GR             :: 225;
KEY_WIN_ICO_HELP       :: 227;
KEY_WIN_ICO_00         :: 228;
KEY_WIN_ICO_CLEAR      :: 230;
KEY_WIN_OEM_RESET      :: 233;
KEY_WIN_OEM_JUMP       :: 234;
KEY_WIN_OEM_PA1        :: 235;
KEY_WIN_OEM_PA2        :: 236;
KEY_WIN_OEM_PA3        :: 237;
KEY_WIN_OEM_WSCTRL     :: 238;
KEY_WIN_OEM_CUSEL      :: 239;
KEY_WIN_OEM_ATTN       :: 240;
KEY_WIN_OEM_FINISH     :: 241;
KEY_WIN_OEM_COPY       :: 242;
KEY_WIN_OEM_AUTO       :: 243;
KEY_WIN_OEM_ENLW       :: 244;
KEY_WIN_OEM_BACK_TAB   :: 245;
KEY_ATTN               :: 246;
KEY_CRSEL              :: 247;
KEY_EXSEL              :: 248;
KEY_EREOF              :: 249;
KEY_PLAY               :: 250;
KEY_ZOOM               :: 251;
KEY_PA1                :: 253;
KEY_WIN_OEM_CLEAR      :: 254;

Key_Down_Callback :: proc(key: _c.int);
Key_Up_Callback :: proc(key: _c.int);
Key_Press_Callback :: proc(character: _c.uint);
