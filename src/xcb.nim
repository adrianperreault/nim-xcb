const
  XCB_NONE* = 0
  ## * XCB_COPY_FROM_PARENT can be used for many xcb_create_window parameters
  XCB_COPY_FROM_PARENT* = 0
  ## * XCB_CURRENT_TIME can be used in most requests that take an xcb_timestamp_t
  XCB_CURRENT_TIME* = 0
  ## * XCB_NO_SYMBOL fills in unused entries in xcb_keysym_t tables
  XCB_NO_SYMBOL* = 0
  XCB_KEY_RELEASE* = 3
  XCB_BUTTON_PRESS* = 4
  XCB_BUTTON_RELEASE* = 5
  XCB_MOTION_NOTIFY* = 6
  XCB_CONFIGURE_NOTIFY* = 22
  XCB_RESIZE_REQUEST* = 25

type
  uint32_t* = uint32
  uint16_t* = uint16
  uint8_t* = uint8
  int16_t* = int16
  xcb_keycode_t* = uint8
  xcb_timestamp_t* = uint32
  xcb_window_t* = uint32
  xcb_button_t* = uint8
  xcb_motion_notify_event_t* {.bycopy.} = object
    response_type*: uint8
    detail*: uint8
    sequence*: uint16
    time*: xcb_timestamp_t
    root*: xcb_window_t
    event*: xcb_window_t
    child*: xcb_window_t
    root_x*: int16_t
    root_y*: int16_t
    event_x*: int16_t
    event_y*: int16_t
    state*: uint16
    same_screen*: uint8
    pad0*: uint8
  xcb_button_index_t* = enum
    XCB_BUTTON_INDEX_ANY = 0,   ## *< Any of the following (or none):
    XCB_BUTTON_INDEX_1 = 1,     ## *< The left mouse button.
    XCB_BUTTON_INDEX_2 = 2,     ## *< The right mouse button.
    XCB_BUTTON_INDEX_3 = 3,     ## *< The middle mouse button.
    XCB_BUTTON_INDEX_4 = 4,     ## *< Scroll wheel. TODO: direction?
    XCB_BUTTON_INDEX_5 = 5
  xcb_notify_detail_t* = enum
    XCB_NOTIFY_DETAIL_ANCESTOR = 0, XCB_NOTIFY_DETAIL_VIRTUAL = 1,
    XCB_NOTIFY_DETAIL_INFERIOR = 2, XCB_NOTIFY_DETAIL_NONLINEAR = 3,
    XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4, XCB_NOTIFY_DETAIL_POINTER = 5,
    XCB_NOTIFY_DETAIL_POINTER_ROOT = 6, XCB_NOTIFY_DETAIL_NONE = 7

  xcb_notify_mode_t* = enum
    XCB_NOTIFY_MODE_NORMAL = 0, XCB_NOTIFY_MODE_GRAB = 1, XCB_NOTIFY_MODE_UNGRAB = 2,
    XCB_NOTIFY_MODE_WHILE_GRABBED = 3
  xcb_configure_notify_event_t* {.bycopy.} = object
    response_type*: uint8
    pad0*: uint8
    sequence*: uint16
    event*: xcb_window_t
    window*: xcb_window_t
    above_sibling*: xcb_window_t
    x*: int16_t
    y*: int16_t
    width*: uint16
    height*: uint16
    border_width*: uint16
    override_redirect*: uint8
    pad1*: uint8
  xcb_setup_t* {.bycopy.} = object
    status*: uint8
    pad0*: uint8
    protocol_major_version*: uint16
    protocol_minor_version*: uint16
    length*: uint16
    release_number*: uint32
    resource_id_base*: uint32
    resource_id_mask*: uint32
    motion_buffer_size*: uint32
    vendor_len*: uint16
    maximum_request_length*: uint16
    roots_len*: uint8
    pixmap_formats_len*: uint8
    image_byte_order*: uint8
    bitmap_format_bit_order*: uint8
    bitmap_format_scanline_unit*: uint8
    bitmap_format_scanline_pad*: uint8
    min_keycode*: xcb_keycode_t
    max_keycode*: xcb_keycode_t
    pad1*: array[4, uint8]
  xcb_void_cookie_t* = object
    sequence*: cuint           ## *< Sequence number
  xcb_connection_t* = object

  xcb_colormap_t* = uint32
  xcb_atom_t* = uint32_t

  xcb_generic_event_t* {.bycopy.} = object
    response_type*: uint8_t    ## *<  of the response
    pad0*: uint8_t             ## *< Padding
    sequence*: uint16_t        ## *< Sequence number
    pad*: array[7, uint32_t]    ## *< Padding
    full_sequence*: uint32_t   ## *< full sequence
    
  xcb_generic_iterator_t* {.bycopy.} = object
    data*: pointer             ## *< Data of the current iterator
    rem*: cint                 ## *< remaining elements
    index*: cint               ## *< index of the current iterator

  xcb_change_property_request_t* {.bycopy.} = object
    major_opcode*: uint8_t
    mode*: uint8_t
    length*: uint16_t
    window*: xcb_window_t
    property*: xcb_atom_t
    `type`*: xcb_atom_t
    format*: uint8_t
    pad0*: array[3, uint8_t]
    data_len*: uint32_t

  xcb_intern_atom_reply_t* {.bycopy.} = object
    response_type*: uint8_t
    pad0*: uint8_t
    sequence*: uint16_t
    length*: uint32_t
    atom*: xcb_atom_t
  xcb_intern_atom_cookie_t* {.bycopy.} = object
    sequence*: cuint
  xcb_screen_t* {.bycopy.} = object
    root*: xcb_window_t
    default_colormap*: xcb_colormap_t
    white_pixel*: uint32_t
    black_pixel*: uint32_t
    current_input_masks*: uint32_t
    width_in_pixels*: uint16_t
    height_in_pixels*: uint16_t
    width_in_millimeters*: uint16_t
    height_in_millimeters*: uint16_t
    min_installed_maps*: uint16_t
    max_installed_maps*: uint16_t
    root_visual*: xcb_visualid_t
    backing_stores*: uint8_t
    save_unders*: uint8_t
    root_depth*: uint8_t
    allowed_depths_len*: uint8_t
  xcb_visualid_t* = uint32
  xcb_screen_iterator_t* {.bycopy.} = object
    data*: ptr xcb_screen_t
    rem*: cint
    index*: cint

  xcb_generic_error_t* {.bycopy.} = object
    response_type*: uint8_t    ## *<  of the response
    error_code*: uint8_t       ## *< Error code
    sequence*: uint16_t        ## *< Sequence number
    resource_id*: uint32_t     ## * < Resource ID for requests with side effects only
    minor_code*: uint16_t      ## * < Minor opcode of the failed request
    major_code*: uint8_t       ## * < Major opcode of the failed request
    pad0*: uint8_t
    pad*: array[5, uint32_t]    ## *< Padding
    full_sequence*: uint32_t   ## *< full sequence
  xcb_button_press_event_t* {.bycopy.} = object
    response_type*: uint8
    detail*: xcb_button_t
    sequence*: uint16
    time*: xcb_timestamp_t
    root*: xcb_window_t
    event*: xcb_window_t
    child*: xcb_window_t
    root_x*: int16_t
    root_y*: int16_t
    event_x*: int16_t
    event_y*: int16_t
    state*: uint16
    same_screen*: uint8
    pad0*: uint8
  xcb_key_press_event_t* {.bycopy.} = object
    response_type*: uint8
    detail*: xcb_keycode_t
    sequence*: uint16
    time*: xcb_timestamp_t
    root*: xcb_window_t
    event*: xcb_window_t
    child*: xcb_window_t
    root_x*: int16_t
    root_y*: int16_t
    event_x*: int16_t
    event_y*: int16_t
    state*: uint16
    same_screen*: uint8
    pad0*: uint8

  xcb_key_release_event_t* = xcb_key_press_event_t
  xcb_button_mask_t* = enum
    XCB_BUTTON_MASK_1 = 256, XCB_BUTTON_MASK_2 = 512, XCB_BUTTON_MASK_3 = 1024,
    XCB_BUTTON_MASK_4 = 2048, XCB_BUTTON_MASK_5 = 4096, XCB_BUTTON_MASK_ANY = 32768
  xcb_window_class_t* {.pure, size: sizeof(cint).}  = enum
    XCB_WINDOW_CLASS_COPY_FROM_PARENT = 0,
    XCB_WINDOW_CLASS_INPUT_OUTPUT = 1,
    XCB_WINDOW_CLASS_INPUT_ONLY = 2
  xcb_prop_mode_t* {.pure, size: sizeof(cint).}  = enum
    XCB_PROP_MODE_REPLACE = 0,  ## *< Discard the previous property value and store the new data.
    XCB_PROP_MODE_PREPEND = 1, ## *< Insert the new data before the beginning of existing data. The `format` must
                            ## match existing property value. If the property is undefined, it is treated as
                            ## defined with the correct  and format with zero-length data.
    XCB_PROP_MODE_APPEND = 2
  xcb_cw_t* {.pure, size: sizeof(cint).} = enum
    XCB_CW_BACK_PIXMAP = 1, ## *< Overrides the default background-pixmap. The background pixmap and window must
                        ## have the same root and same depth. Any size pixmap can be used, although some
                        ## sizes may be faster than others.
                        ##
                        ## If `XCB_BACK_PIXMAP_NONE` is specified, the window has no defined background.
                        ## The server may fill the contents with the previous screen contents or with
                        ## contents of its own choosing.
                        ##
                        ## If `XCB_BACK_PIXMAP_PARENT_RELATIVE` is specified, the parent's background is
                        ## used, but the window must have the same depth as the parent (or a Match error
                        ## results).   The parent's background is tracked, and the current version is
                        ## used each time the window background is required.
    XCB_CW_BACK_PIXEL = 2, ## *< Overrides `BackPixmap`. A pixmap of undefined size filled with the specified
                        ## background pixel is used for the background. Range-checking is not performed,
                        ## the background pixel is truncated to the appropriate number of bits.
    XCB_CW_BORDER_PIXMAP = 4, ## *< Overrides the default border-pixmap. The border pixmap and window must have the
                          ## same root and the same depth. Any size pixmap can be used, although some sizes
                          ## may be faster than others.
                          ##
                          ## The special value `XCB_COPY_FROM_PARENT` means the parent's border pixmap is
                          ## copied (subsequent changes to the parent's border attribute do not affect the
                          ## child), but the window must have the same depth as the parent.
    XCB_CW_BORDER_PIXEL = 8, ## *< Overrides `BorderPixmap`. A pixmap of undefined size filled with the specified
                          ## border pixel is used for the border. Range checking is not performed on the
                          ## border-pixel value, it is truncated to the appropriate number of bits.
    XCB_CW_BIT_GRAVITY = 16,    ## *< Defines which region of the window should be retained if the window is resized.
    XCB_CW_WIN_GRAVITY = 32, ## *< Defines how the window should be repositioned if the parent is resized (see
                          ## `ConfigureWindow`).
    XCB_CW_BACKING_STORE = 64, ## *< A backing-store of `WhenMapped` advises the server that maintaining contents of
                            ## obscured regions when the window is mapped would be beneficial. A backing-store
                            ## of `Always` advises the server that maintaining contents even when the window
                            ## is unmapped would be beneficial. In this case, the server may generate an
                            ## exposure event when the window is created. A value of `NotUseful` advises the
                            ## server that maintaining contents is unnecessary, although a server may still
                            ## choose to maintain contents while the window is mapped. Note that if the server
                            ## maintains contents, then the server should maintain complete contents not just
                            ## the region within the parent boundaries, even if the window is larger than its
                            ## parent. While the server maintains contents, exposure events will not normally
                            ## be generated, but the server may stop maintaining contents at any time.
    XCB_CW_BACKING_PLANES = 128, ## *< The backing-planes indicates (with bits set to 1) which bit planes of the
                              ## window hold dynamic data that must be preserved in backing-stores and during
                              ## save-unders.
    XCB_CW_BACKING_PIXEL = 256, ## *< The backing-pixel specifies what value to use in planes not covered by
                            ## backing-planes. The server is free to save only the specified bit planes in the
                            ## backing-store or save-under and regenerate the remaining planes with the
                            ## specified pixel value. Any bits beyond the specified depth of the window in
                            ## these values are simply ignored.
    XCB_CW_OVERRIDE_REDIRECT = 512, ## *< The override-redirect specifies whether map and configure requests on this
                                ## window should override a SubstructureRedirect on the parent, typically to
                                ## inform a window manager not to tamper with the window.
    XCB_CW_SAVE_UNDER = 1024, ## *< If 1, the server is advised that when this window is mapped, saving the
                          ## contents of windows it obscures would be beneficial.
    XCB_CW_EVENT_MASK = 2048, ## *< The event-mask defines which events the client is interested in for this window
                          ## (or for some event types, inferiors of the window).
    XCB_CW_DONT_PROPAGATE = 4096, ## *< The do-not-propagate-mask defines which events should not be propagated to
                              ## ancestor windows when no client has the event  selected in this window.
    XCB_CW_COLORMAP = 8192, ## *< The colormap specifies the colormap that best reflects the true colors of the window. Servers
                        ## capable of supporting multiple hardware colormaps may use this information, and window man-
                        ## agers may use it for InstallColormap requests. The colormap must have the same visual 
                        ## and root as the window (or a Match error results). If CopyFromParent is specified, the parent's
                        ## colormap is copied (subsequent changes to the parent's colormap attribute do not affect the child).
                        ## However, the window must have the same visual  as the parent (or a Match error results),
                        ## and the parent must not have a colormap of None (or a Match error results). For an explanation
                        ## of None, see FreeColormap request. The colormap is copied by sharing the colormap object
                        ## between the child and the parent, not by making a complete copy of the colormap contents.
    XCB_CW_CURSOR = 16384
  xcb_back_pixmap_t* {.pure, size: sizeof(cint).}= enum
    XCB_BACK_PIXMAP_NONE = 0, XCB_BACK_PIXMAP_PARENT_RELATIVE = 1
  xcb_gravity_t*{.pure, size: sizeof(cint).} = enum
    XCB_GRAVITY_BIT_FORGET = 0, XCB_GRAVITY_NORTH_WEST = 1, XCB_GRAVITY_NORTH = 2,
    XCB_GRAVITY_NORTH_EAST = 3, XCB_GRAVITY_WEST = 4, XCB_GRAVITY_CENTER = 5,
    XCB_GRAVITY_EAST = 6, XCB_GRAVITY_SOUTH_WEST = 7, XCB_GRAVITY_SOUTH = 8,
    XCB_GRAVITY_SOUTH_EAST = 9, XCB_GRAVITY_STATIC = 10
  xcb_event_mask_t*{.pure, size: sizeof(cint).} = enum
    XCB_EVENT_MASK_NO_EVENT = 0, XCB_EVENT_MASK_KEY_PRESS = 1,
    XCB_EVENT_MASK_KEY_RELEASE = 2, XCB_EVENT_MASK_BUTTON_PRESS = 4,
    XCB_EVENT_MASK_BUTTON_RELEASE = 8, XCB_EVENT_MASK_ENTER_WINDOW = 16,
    XCB_EVENT_MASK_LEAVE_WINDOW = 32, XCB_EVENT_MASK_POINTER_MOTION = 64,
    XCB_EVENT_MASK_POINTER_MOTION_HINT = 128, XCB_EVENT_MASK_BUTTON_1_MOTION = 256,
    XCB_EVENT_MASK_BUTTON_2_MOTION = 512, XCB_EVENT_MASK_BUTTON_3_MOTION = 1024,
    XCB_EVENT_MASK_BUTTON_4_MOTION = 2048, XCB_EVENT_MASK_BUTTON_5_MOTION = 4096,
    XCB_EVENT_MASK_BUTTON_MOTION = 8192, XCB_EVENT_MASK_KEYMAP_STATE = 16384,
    XCB_EVENT_MASK_EXPOSURE = 32768, XCB_EVENT_MASK_VISIBILITY_CHANGE = 65536,
    XCB_EVENT_MASK_STRUCTURE_NOTIFY = 131072,
    XCB_EVENT_MASK_RESIZE_REDIRECT = 262144,
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288,
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576,
    XCB_EVENT_MASK_FOCUS_CHANGE = 2097152,
    XCB_EVENT_MASK_PROPERTY_CHANGE = 4194304,
    XCB_EVENT_MASK_COLOR_MAP_CHANGE = 8388608,
    XCB_EVENT_MASK_OWNER_GRAB_BUTTON = 16777216
  xcb_backing_store_t*{.pure, size: sizeof(cint).} = enum
    XCB_BACKING_STORE_NOT_USEFUL = 0, XCB_BACKING_STORE_WHEN_MAPPED = 1,
    XCB_BACKING_STORE_ALWAYS = 2
  xcb_atom_enum_t* = enum
    XCB_ATOM_NONE = 0, XCB_ATOM_PRIMARY = 1, XCB_ATOM_SECONDARY = 2, XCB_ATOM_ARC = 3,
    XCB_ATOM_ATOM = 4, XCB_ATOM_BITMAP = 5, XCB_ATOM_CARDINAL = 6, XCB_ATOM_COLORMAP = 7,
    XCB_ATOM_CURSOR = 8, XCB_ATOM_CUT_BUFFER0 = 9, XCB_ATOM_CUT_BUFFER1 = 10,
    XCB_ATOM_CUT_BUFFER2 = 11, XCB_ATOM_CUT_BUFFER3 = 12, XCB_ATOM_CUT_BUFFER4 = 13,
    XCB_ATOM_CUT_BUFFER5 = 14, XCB_ATOM_CUT_BUFFER6 = 15, XCB_ATOM_CUT_BUFFER7 = 16,
    XCB_ATOM_DRAWABLE = 17, XCB_ATOM_FONT = 18, XCB_ATOM_INTEGER = 19,
    XCB_ATOM_PIXMAP = 20, XCB_ATOM_POINT = 21, XCB_ATOM_RECTANGLE = 22,
    XCB_ATOM_RESOURCE_MANAGER = 23, XCB_ATOM_RGB_COLOR_MAP = 24,
    XCB_ATOM_RGB_BEST_MAP = 25, XCB_ATOM_RGB_BLUE_MAP = 26,
    XCB_ATOM_RGB_DEFAULT_MAP = 27, XCB_ATOM_RGB_GRAY_MAP = 28,
    XCB_ATOM_RGB_GREEN_MAP = 29, XCB_ATOM_RGB_RED_MAP = 30, XCB_ATOM_STRING = 31,
    XCB_ATOM_VISUALID = 32, XCB_ATOM_WINDOW = 33, XCB_ATOM_WM_COMMAND = 34,
    XCB_ATOM_WM_HINTS = 35, XCB_ATOM_WM_CLIENT_MACHINE = 36,
    XCB_ATOM_WM_ICON_NAME = 37, XCB_ATOM_WM_ICON_SIZE = 38, XCB_ATOM_WM_NAME = 39,
    XCB_ATOM_WM_NORMAL_HINTS = 40, XCB_ATOM_WM_SIZE_HINTS = 41,
    XCB_ATOM_WM_ZOOM_HINTS = 42, XCB_ATOM_MIN_SPACE = 43, XCB_ATOM_NORM_SPACE = 44,
    XCB_ATOM_MAX_SPACE = 45, XCB_ATOM_END_SPACE = 46, XCB_ATOM_SUPERSCRIPT_X = 47,
    XCB_ATOM_SUPERSCRIPT_Y = 48, XCB_ATOM_SUBSCRIPT_X = 49, XCB_ATOM_SUBSCRIPT_Y = 50,
    XCB_ATOM_UNDERLINE_POSITION = 51, XCB_ATOM_UNDERLINE_THICKNESS = 52,
    XCB_ATOM_STRIKEOUT_ASCENT = 53, XCB_ATOM_STRIKEOUT_DESCENT = 54,
    XCB_ATOM_ITALIC_ANGLE = 55, XCB_ATOM_X_HEIGHT = 56, XCB_ATOM_QUAD_WIDTH = 57,
    XCB_ATOM_WEIGHT = 58, XCB_ATOM_POINT_SIZE = 59, XCB_ATOM_RESOLUTION = 60,
    XCB_ATOM_COPYRIGHT = 61, XCB_ATOM_NOTICE = 62, XCB_ATOM_FONT_NAME = 63,
    XCB_ATOM_FAMILY_NAME = 64, XCB_ATOM_FULL_NAME = 65, XCB_ATOM_CAP_HEIGHT = 66,
    XCB_ATOM_WM_CLASS = 67, XCB_ATOM_WM_TRANSIENT_FOR = 68

const 
  XCB_ATOM_ANY = XCB_ATOM_NONE

proc xcb_generate_id*(c: ptr xcb_connection_t): uint32_t {.importc, cdecl.}
proc xcb_change_property*(c: ptr xcb_connection_t; mode: uint8_t;
                        window: xcb_window_t; property: xcb_atom_t;
                        `type`: xcb_atom_t; format: uint8_t; data_len: uint32_t;
                        data: pointer): xcb_void_cookie_t  {.importc, cdecl.}
proc xcb_change_property_data*(R: ptr xcb_change_property_request_t): pointer  {.importc, cdecl.}
proc xcb_change_property_data_length*(R: ptr xcb_change_property_request_t): cint  {.importc, cdecl.}
proc xcb_change_property_data_end*(R: ptr xcb_change_property_request_t): xcb_generic_iterator_t  {.importc, cdecl.}

proc xcb_create_window*(c: ptr xcb_connection_t; depth: uint8_t; wid: xcb_window_t;
                      parent: xcb_window_t; x: int16_t; y: int16_t; width: uint16_t;
                      height: uint16_t; border_width: uint16_t; class: uint16_t;
                      visual: xcb_visualid_t; value_mask: uint32_t;
                      value_list: pointer): xcb_void_cookie_t  {.importc, cdecl.}

proc xcb_intern_atom*(c: ptr xcb_connection_t; only_if_exists: uint8_t; name_len: uint16_t; name: cstring): xcb_intern_atom_cookie_t  {.importc, cdecl.}
proc xcb_intern_atom_reply*(c: ptr xcb_connection_t; cookie: xcb_intern_atom_cookie_t; e: ptr ptr xcb_generic_error_t): ptr xcb_intern_atom_reply_t  {.importc, cdecl.}
proc xcb_map_window*(c: ptr xcb_connection_t; window: xcb_window_t): xcb_void_cookie_t  {.importc, cdecl.}
proc xcb_connect*(displayname: cstring; screenp: ptr cint): ptr xcb_connection_t {.importc, cdecl.}
proc xcb_get_setup*(c: ptr xcb_connection_t): ptr xcb_setup_t {.importc, cdecl.}
proc xcb_setup_roots_iterator*(R: ptr xcb_setup_t): xcb_screen_iterator_t {.importc, cdecl.}
proc xcb_screen_next*(i: ptr xcb_screen_iterator_t){.importc, cdecl.}
proc xcb_flush*(c: ptr xcb_connection_t): cint {.importc, cdecl.}
proc xcb_poll_for_event*(c: ptr xcb_connection_t): ptr xcb_generic_event_t {.importc, cdecl.}

converter xcb_window_class_tToInt*(x: xcb_window_class_t): int = x.int
converter xcb_cw_tToInt*(x:xcb_cw_t):int = x.int
converter xcb_event_mask_tToInt*(x:xcb_event_mask_t):uint32 = x.uint32
