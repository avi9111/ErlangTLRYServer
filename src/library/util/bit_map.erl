%%%-------------------------------------------------------------------
%%% @author LWL
%%% @doc
%%% bitmap  可用于判断各种功能是否完成 <<FlagN:1,...,Flag1:1>> = BitMap
%% 如果使用整数，数值很大，超64位，建议转成binary或者字符串保存落地
%%% @end
%%% Created : 23. 五月 2018 19:55
%%%-------------------------------------------------------------------
-module(bit_map).

%% API
-export([
    set/2,
    size/1,
    test/0,
    unset/2,
    expand/3,
    is_set/2
]).


%% Apis ----------------------------------------
unset([BitPos | T], Bits) ->
    unset(T, unset(BitPos, Bits));
unset([], Bits) ->
    Bits;
unset(BitPos, BitInt) when is_integer(BitPos), BitPos > 0, is_integer(BitInt), BitInt >= 0 -> %% integer api
    BitSize = ?MODULE:size(BitInt),
    NewBitSize = max(BitPos, BitSize), %% Maybe expand BitInt bits
    Max = trunc(math:pow(2, NewBitSize)) - 1,
    Mask = (bnot (1 bsl (BitPos - 1))) band Max,
    BitInt band Mask;
unset(BitPos, Bits) when is_integer(BitPos), BitPos > 0, is_bitstring(Bits) -> %% bits api
    BitSize = bit_size(Bits),
    NewBitSize = max(BitPos, BitSize), %% Maybe expand bits
    Max = trunc(math:pow(2, NewBitSize)) - 1,
    Mask = (bnot (1 bsl (BitPos - 1))) band Max,
    <<B:BitSize>> = Bits,
    <<(B band Mask):NewBitSize/bits>>.

set([BitPos | T], Bits) ->
    set(T, set(BitPos, Bits));
set([], Bits) ->
    Bits;
set(BitPos, BitInt) when is_integer(BitPos), BitPos > 0, is_integer(BitInt), BitInt >= 0 ->
    BitInt bor (1 bsl (BitPos - 1));
set(BitPos, Bits) when is_integer(BitPos), BitPos > 0, is_bitstring(Bits) ->
    BitSize = bit_size(Bits),
    NewBitSize = max(BitPos, BitSize), %% Maybe expand bits
    <<B:BitSize>> = Bits,
    <<(B bor (1 bsl (BitPos - 1))):NewBitSize/bits>>.

is_set([BitPos | T], Bits) ->
    is_set(BitPos, Bits) andalso is_set(T, Bits);
is_set([], _Bits) when is_list([]) ->
    true;
is_set(BitPos, BitInt) when is_integer(BitPos), BitPos > 0, is_integer(BitInt), BitInt >= 0 ->
    (BitInt bsr (BitPos - 1)) band 1 =:= 1;
is_set(BitPos, Bits) when is_integer(BitPos), BitPos > 0, is_bitstring(Bits) ->
    BitSize = bit_size(Bits),
    if
        BitSize >= BitPos ->
            <<BitInt:BitSize>> = Bits,
            (BitInt bsr (BitPos - 1)) band 1 =:= 1;
        true -> false
    end.

%% 扩展位数
expand(Old, BitSize, NewBitSize) when NewBitSize > BitSize ->
    if
        is_integer(Old) ->
            Old;
        is_bitstring(Old) ->
            ExpandSize = NewBitSize - BitSize,
            <<0:ExpandSize, Old:BitSize/bits>>
    end.

%% 计算位数
size(0) ->
    1;
size(1) ->
    1;
size(Int) when is_integer(Int), Int > 1 ->
    size(Int, 1);
size(Bits) when is_bitstring(Bits) ->
    bit_size(Bits).

size(0, Acc) ->
    Acc;
size(1, Acc) ->
    Acc;
size(Int, Acc) ->
    size(Int div 2, Acc + 1).

test() ->
    BitMap = <<1:1, 0:3, 1:1, 0:5, 1:1, 1:1, 0:4>>,
    BitSize = bit_size(BitMap),
    <<BitInt:BitSize>> = BitMap,

    true = is_set(16, BitInt),
    false = is_set(3, BitInt),

    R = [B =:= 1 || <<B:1>> <= BitMap],
    BitSize = length(R),
    R = [is_set(BitPos, BitInt) || BitPos <- lists:seq(BitSize, 1, -1)],

    PosBoolean = lists:nth(2, R),
    ModifyPos = BitSize - 2,

    BitInt2 = set(ModifyPos, BitInt),
    true = is_set(ModifyPos, BitInt2),

    BitInt3 = unset(ModifyPos, BitInt2),
    false = is_set(ModifyPos, BitInt3),

    BitInt4 =
        if
            PosBoolean -> set(ModifyPos, BitInt3);
            true -> unset(ModifyPos, BitInt3)
        end,
    R = [is_set(BitPos, BitInt4) || BitPos <- lists:seq(BitSize, 1, -1)],

    true.
