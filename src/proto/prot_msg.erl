%%-------------------------------------------------------
%% @File     : prot_msg
%% @Brief    : 发送接收协议封装
%% @Author   : hofer_lu
%% @Date     : 2016-3-24
%%-------------------------------------------------------
-module(prot_msg).

-include("common.hrl").

-export([
    decode_msg/2,
    encode_msg/2
]).

%% API -----------------------------
decode_msg(Cmd, Binary) ->
    Proter = prot_mod:get_proter(Cmd),
    case (catch Proter:decode(Cmd, Binary)) of
        {ok, _Record} = DecodeRet ->
            DecodeRet;
        {error, _} ->
            ?ERROR("Recv cannot decode msg !~nCmd: ~p, Binary: ~p", [Cmd, Binary]),
            {error, unexpected};
        {undef, _} ->
            ?ERROR("Recv not define prot msg !~nCmd: ~p, Binary: ~p", [Cmd, Binary]),
            {error, undefined};
        _ ->
            ?ERROR("Recv cannot decode msg !~nCmd: ~p, Binary: ~p", [Cmd, Binary]),
            {error, discard}
    end.


encode_msg(Cmd, SendDataRecord) ->
    Proter = prot_mod:get_proter(Cmd),
    {ok, BinData} = Proter:encode(Cmd, SendDataRecord),
    pack(Cmd, BinData).


%% PRIVATE------------------------------------------
pack(Cmd, BinData) ->
    OrigSize = byte_size(BinData),
    {ZipFlag, CBinData} = if
        OrigSize >= 1024 andalso OrigSize < 3221225472 ->
            ZippedBinData = prot_util:zip_bin(BinData),
            {1, ZippedBinData};
        true ->
            {0, BinData}
    end,

    %9 = 4 + 4 + 1
    PackSize = 9 + erlang:byte_size(CBinData),
    PackedBinData = <<PackSize:32, Cmd:32, ZipFlag:8, CBinData/binary>>,
    {ok, PackedBinData}.
