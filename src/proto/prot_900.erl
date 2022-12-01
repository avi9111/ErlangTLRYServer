-module(prot_900).

-export([
    encode/2,
    decode/2
]).

-include("proto/prot_900.hrl").


%% ---------------------------------------------------------------------------------------

decode(90000, BinData) ->
    {RBin0, Accname} = prot_util:unpack(BinData, string),
    {RBin1, ServerId} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Timestamp} = prot_util:unpack(RBin1, {32, unsigned}),
    {RBin3, Ticket} = prot_util:unpack(RBin2, string),
    {_RBin4, Device} = prot_util:unpack(RBin3, string),

    UnpackRecordData = #role_login_check_req{
        accname = Accname,
        server_id = ServerId,
        timestamp = Timestamp,
        ticket = Ticket,
        device = Device
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90001, BinData) ->
    {RBin0, Res} = prot_util:unpack(BinData, {8, signed}),
    {RBin1, CurLogin} = prot_util:unpack(RBin0, {64, unsigned}),
    {_RBin2, Timestamp} = prot_util:unpack(RBin1, {32, unsigned}),

    UnpackRecordData = #role_login_check_resp{
        res = Res,
        cur_login = CurLogin,
        timestamp = Timestamp
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90002, _BinData) ->

    UnpackRecordData = #get_role_list_req{
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90003, BinData) ->
    {_RBin0, RoleList} = prot_util:unpack(BinData, [{u,role_login_info}]),

    UnpackRecordData = #get_role_list_resp{
        role_list = RoleList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90004, BinData) ->
    {_RBin0, NameList} = prot_util:unpack(BinData, [{string, {8, unsigned}}]),

    UnpackRecordData = #role_name_check_req{
        name_list = NameList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90005, BinData) ->
    {_RBin0, NameList} = prot_util:unpack(BinData, [{string, {8, unsigned}, {64, unsigned}}]),

    UnpackRecordData = #role_name_check_resp{
        name_list = NameList
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90006, BinData) ->
    {RBin0, Name} = prot_util:unpack(BinData, string),
    {RBin1, Gender} = prot_util:unpack(RBin0, {8, unsigned}),
    {RBin2, Career} = prot_util:unpack(RBin1, {8, unsigned}),
    {RBin3, Icon} = prot_util:unpack(RBin2, {16, unsigned}),
    {RBin4, Hair} = prot_util:unpack(RBin3, {32, unsigned}),
    {RBin5, Source} = prot_util:unpack(RBin4, string),
    {RBin6, Device} = prot_util:unpack(RBin5, string),
    {_RBin7, ServerId} = prot_util:unpack(RBin6, {32, unsigned}),

    UnpackRecordData = #role_create_req{
        name = Name,
        gender = Gender,
        career = Career,
        icon = Icon,
        hair = Hair,
        source = Source,
        device = Device,
        server_id = ServerId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90007, BinData) ->
    {RBin0, Result} = prot_util:unpack(BinData, {8, unsigned}),
    {RBin1, RoleId} = prot_util:unpack(RBin0, {64, unsigned}),
    {RBin2, RoleName} = prot_util:unpack(RBin1, string),
    {RBin3, Career} = prot_util:unpack(RBin2, {8, unsigned}),
    {RBin4, Gender} = prot_util:unpack(RBin3, {8, unsigned}),
    {RBin5, Icon} = prot_util:unpack(RBin4, {16, unsigned}),
    {RBin6, Hair} = prot_util:unpack(RBin5, {32, unsigned}),
    {_RBin7, RegTime} = prot_util:unpack(RBin6, {32, unsigned}),

    UnpackRecordData = #role_create_resp{
        result = Result,
        role_id = RoleId,
        role_name = RoleName,
        career = Career,
        gender = Gender,
        icon = Icon,
        hair = Hair,
        reg_time = RegTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90008, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Timestamp} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Ticket} = prot_util:unpack(RBin1, string),
    {_RBin3, Device} = prot_util:unpack(RBin2, string),

    UnpackRecordData = #select_role_login{
        role_id = RoleId,
        timestamp = Timestamp,
        ticket = Ticket,
        device = Device
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90009, BinData) ->
    {_RBin0, ClientTime} = prot_util:unpack(BinData, {32, unsigned}),

    UnpackRecordData = #heart_beat_req{
        client_time = ClientTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90010, BinData) ->
    {RBin0, ClientTime} = prot_util:unpack(BinData, {32, unsigned}),
    {_RBin1, ServerTime} = prot_util:unpack(RBin0, {64, unsigned}),

    UnpackRecordData = #heart_beat_resp{
        client_time = ClientTime,
        server_time = ServerTime
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90011, BinData) ->
    {_RBin0, Result} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #select_role_login_resp{
        result = Result
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90012, BinData) ->
    {_RBin0, Relogin} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #role_relogin_req{
        relogin = Relogin
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90013, BinData) ->
    {RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),
    {RBin1, Timestamp} = prot_util:unpack(RBin0, {32, unsigned}),
    {RBin2, Ticket} = prot_util:unpack(RBin1, string),
    {RBin3, Device} = prot_util:unpack(RBin2, string),
    {_RBin4, Type} = prot_util:unpack(RBin3, {8, unsigned}),

    UnpackRecordData = #oper_role_req{
        role_id = RoleId,
        timestamp = Timestamp,
        ticket = Ticket,
        device = Device,
        type = Type
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90014, BinData) ->
    {_RBin0, Result} = prot_util:unpack(BinData, {8, unsigned}),

    UnpackRecordData = #oper_role_resp{
        result = Result
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(90015, BinData) ->
    {_RBin0, RoleId} = prot_util:unpack(BinData, {64, unsigned}),

    UnpackRecordData = #oper_delete_role{
        role_id = RoleId
    },

    {ok, UnpackRecordData};


%% ---------------------------------------------------------------------------------------

decode(_Cmd, _Bin) ->
    {error, []}.



%% ---------------------------------------------------------------------------------------

encode(90000, PackRecordData) ->
    Accname = prot_util:pack(PackRecordData#role_login_check_req.accname, string),
    ServerId = prot_util:pack(PackRecordData#role_login_check_req.server_id, {32, unsigned}),
    Timestamp = prot_util:pack(PackRecordData#role_login_check_req.timestamp, {32, unsigned}),
    Ticket = prot_util:pack(PackRecordData#role_login_check_req.ticket, string),
    Device = prot_util:pack(PackRecordData#role_login_check_req.device, string),

    BinData = <<
        Accname/binary,
        ServerId/binary,
        Timestamp/binary,
        Ticket/binary,
        Device/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90001, PackRecordData) ->
    Res = prot_util:pack(PackRecordData#role_login_check_resp.res, {8, signed}),
    CurLogin = prot_util:pack(PackRecordData#role_login_check_resp.cur_login, {64, unsigned}),
    Timestamp = prot_util:pack(PackRecordData#role_login_check_resp.timestamp, {32, unsigned}),

    BinData = <<
        Res/binary,
        CurLogin/binary,
        Timestamp/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90002, _PackRecordData) ->

    BinData = <<
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90003, PackRecordData) ->
    RoleList = prot_util:pack(PackRecordData#get_role_list_resp.role_list, [{u,role_login_info}]),

    BinData = <<
        RoleList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90004, PackRecordData) ->
    NameList = prot_util:pack(PackRecordData#role_name_check_req.name_list, [{string, {8, unsigned}}]),

    BinData = <<
        NameList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90005, PackRecordData) ->
    NameList = prot_util:pack(PackRecordData#role_name_check_resp.name_list, [{string, {8, unsigned}, {64, unsigned}}]),

    BinData = <<
        NameList/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90006, PackRecordData) ->
    Name = prot_util:pack(PackRecordData#role_create_req.name, string),
    Gender = prot_util:pack(PackRecordData#role_create_req.gender, {8, unsigned}),
    Career = prot_util:pack(PackRecordData#role_create_req.career, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#role_create_req.icon, {16, unsigned}),
    Hair = prot_util:pack(PackRecordData#role_create_req.hair, {32, unsigned}),
    Source = prot_util:pack(PackRecordData#role_create_req.source, string),
    Device = prot_util:pack(PackRecordData#role_create_req.device, string),
    ServerId = prot_util:pack(PackRecordData#role_create_req.server_id, {32, unsigned}),

    BinData = <<
        Name/binary,
        Gender/binary,
        Career/binary,
        Icon/binary,
        Hair/binary,
        Source/binary,
        Device/binary,
        ServerId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90007, PackRecordData) ->
    Result = prot_util:pack(PackRecordData#role_create_resp.result, {8, unsigned}),
    RoleId = prot_util:pack(PackRecordData#role_create_resp.role_id, {64, unsigned}),
    RoleName = prot_util:pack(PackRecordData#role_create_resp.role_name, string),
    Career = prot_util:pack(PackRecordData#role_create_resp.career, {8, unsigned}),
    Gender = prot_util:pack(PackRecordData#role_create_resp.gender, {8, unsigned}),
    Icon = prot_util:pack(PackRecordData#role_create_resp.icon, {16, unsigned}),
    Hair = prot_util:pack(PackRecordData#role_create_resp.hair, {32, unsigned}),
    RegTime = prot_util:pack(PackRecordData#role_create_resp.reg_time, {32, unsigned}),

    BinData = <<
        Result/binary,
        RoleId/binary,
        RoleName/binary,
        Career/binary,
        Gender/binary,
        Icon/binary,
        Hair/binary,
        RegTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90008, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#select_role_login.role_id, {64, unsigned}),
    Timestamp = prot_util:pack(PackRecordData#select_role_login.timestamp, {32, unsigned}),
    Ticket = prot_util:pack(PackRecordData#select_role_login.ticket, string),
    Device = prot_util:pack(PackRecordData#select_role_login.device, string),

    BinData = <<
        RoleId/binary,
        Timestamp/binary,
        Ticket/binary,
        Device/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90009, PackRecordData) ->
    ClientTime = prot_util:pack(PackRecordData#heart_beat_req.client_time, {32, unsigned}),

    BinData = <<
        ClientTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90010, PackRecordData) ->
    ClientTime = prot_util:pack(PackRecordData#heart_beat_resp.client_time, {32, unsigned}),
    ServerTime = prot_util:pack(PackRecordData#heart_beat_resp.server_time, {64, unsigned}),

    BinData = <<
        ClientTime/binary,
        ServerTime/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90011, PackRecordData) ->
    Result = prot_util:pack(PackRecordData#select_role_login_resp.result, {8, unsigned}),

    BinData = <<
        Result/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90012, PackRecordData) ->
    Relogin = prot_util:pack(PackRecordData#role_relogin_req.relogin, {8, unsigned}),

    BinData = <<
        Relogin/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90013, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#oper_role_req.role_id, {64, unsigned}),
    Timestamp = prot_util:pack(PackRecordData#oper_role_req.timestamp, {32, unsigned}),
    Ticket = prot_util:pack(PackRecordData#oper_role_req.ticket, string),
    Device = prot_util:pack(PackRecordData#oper_role_req.device, string),
    Type = prot_util:pack(PackRecordData#oper_role_req.type, {8, unsigned}),

    BinData = <<
        RoleId/binary,
        Timestamp/binary,
        Ticket/binary,
        Device/binary,
        Type/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90014, PackRecordData) ->
    Result = prot_util:pack(PackRecordData#oper_role_resp.result, {8, unsigned}),

    BinData = <<
        Result/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(90015, PackRecordData) ->
    RoleId = prot_util:pack(PackRecordData#oper_delete_role.role_id, {64, unsigned}),

    BinData = <<
        RoleId/binary
    >>,

    {ok, BinData};


%% ---------------------------------------------------------------------------------------

encode(_Cmd, []) ->
    {error, <<>>}.

%% ---------------------------------------------------------------------------------------

