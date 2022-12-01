%%%-------------------------------------------------------------------
%%% @author Tom
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     师徒系统
%%% @end
%%% Created : 01. 三月 2019 9:44
%%%-------------------------------------------------------------------
-module(router_542).
-author("Tom").

-include("log.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("mentor.hrl").
-include("ret_code.hrl").
-include("proto/prot_105.hrl").
-include("proto/prot_542.hrl").

%% API
-export([
	do/3,
	send_mentor_info/3,
	send_mentor_info/4,
	send_confirm_cancel_msg/4,
	send_begin_mentor_confirm_ui/2,
	send_baseinfo_list_update/2,
	send_tudiinfo_list_update/2,
	send_del_baseinfo_update/2,
	send_del_tudiinfo_update/2,
	send_mentor_comment_ui/1,
	send_mentor_task_list_update/4,
	send_learn_task_list_update/4,
	send_taixue_task_list_update/4,
	send_mentor_refresh_new/4,
	send_mentor_comment_ret/3,
	send_senior_tudi_ui/2,
	send_begin_practice_ret/3,
	send_task_award_taken_ret/3
]).



do(54201, State, #cs_mentor_info{}) ->
	case lib_role_mentor:info(State) of
		ok -> ok;
		_ -> skip
	end;

do(54203, State, #cs_mentor_begin{}) ->
	case catch lib_role_mentor:mentor_begin(State) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54205, State, #cs_mentor_begin_confirm{choice = Choice}) ->
	case catch lib_role_mentor:begin_confirm(State, Choice) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54206, State, #cs_mentor_answer_quiz{type = Type, quiz_list = QuizList}) ->
	case catch lib_role_mentor:answer_quiz(State, Type, QuizList) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54207, State, #cs_mentor_register{registered = Reg}) ->
	case catch lib_role_mentor:register_mentor(State, Reg) of
		{ok, Registered} ->
			MsgRecord = #sc_mentor_register{registered = Registered},
			{ok, Bin} = prot_msg:encode_msg(54208, MsgRecord),
			lib_role_send:send_to_sid(State#role_state.sid, Bin);
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54209, State, #cs_mentor_find{}) ->
	case catch lib_role_mentor:find_mentor(State) of
		{ok, MentorList} ->
			MsgRecord = #sc_mentor_find{mentors = MentorList},
			{ok, Bin} = prot_msg:encode_msg(54210, MsgRecord),
			lib_role_send:send_to_sid(State#role_state.sid, Bin);
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54211, State, #cs_mentor_send_post{role_id = RoleID, enounce = Enounce}) ->
	case catch lib_role_mentor:send_post(State, RoleID, Enounce) of
		ok ->
			?ERROR_TOC(State#role_state.id, ?RC_MENTOR_SEND_POST_SUCC),
			ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54214, State, #cs_mentor_set_tasks{role_id = RoleID, task_id_list = TaskIdList}) ->
	case catch lib_role_mentor:set_tasks(State, RoleID, TaskIdList) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54219, State, #cs_mentor_comment{comment = Comment}) ->
	case catch lib_role_mentor:comment(State, Comment) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54221, State, #cs_mentor_finish_learning{role_id = TargetRoleID}) ->
	case catch lib_role_mentor:finish_learning(State, TargetRoleID) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54224, State, #cs_mentor_senior_tudi_confirm{choice = Choice}) ->
	case catch lib_role_mentor:senior_tudi_confirm(State, Choice) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54225, State, #cs_mentor_begin_practice{}) ->
	case catch lib_role_mentor:begin_practice(State) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err;
		{error, RetCode, Args} ->
			?ERROR_TOC(State#role_state.id, RetCode, Args),
			err
	end;

do(54227, State, #cs_mentor_kick_off_tudi{role_id = TargetRoleID, reason = Reason}) ->
	case catch lib_role_mentor:kick_off_tudi(State, TargetRoleID, Reason) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54230, State, #cs_mentor_say_goodbye{}) ->
	case catch lib_role_mentor:say_goodbye(State) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;

do(54231, State, #cs_mentor_take_task_award{role_id = TargetRoleID}) ->
	case catch lib_role_mentor:take_award(State, TargetRoleID) of
		ok -> ok;
		{error, RetCode} ->
			?ERROR_TOC(State#role_state.id, RetCode),
			err
	end;



do(Cmd, State, MsgRecord) ->
	router_default:do(Cmd, State, MsgRecord).


%% @doc  下发师徒信息
send_mentor_info(State, RoleMentor, MentorPerson) ->
	send_mentor_info(State, RoleMentor, MentorPerson, false).

send_mentor_info(State, RoleMentor, MentorPerson, OpenUI) when is_record(RoleMentor, role_mentor) ->
	#role_mentor{
		mentor_id = MentorID,
		mentor_quiz_list = MentorQuizList,
		tudi_quiz_list = TudiQuizList,
		registered = Registered
	} = RoleMentor,
	{Morality, MentorLv, TudiList} = case MentorPerson of
		                                 #mentor_person{morality = MoralityN, mentor_lv = MentorLvN, tudi_list = TudiListN} ->
			                                 {MoralityN, MentorLvN, TudiListN};
		                                 undefined -> {0, 0, []}
	                                 end,
	IsMentor = State#role_state.id =:= MentorID,
	{InfoList, TudiInfoList} = case MentorID of
		                           0 -> {[], []};
		                           _ ->
			                           Func = fun(#mentor_tudi{role_id = RID} = MentorTudi, {InfoAcc, TudiAcc}) ->
				                           if
					                           RID =/= 0 ->
						                           {BaseInfo, TudiInfo} = lib_role_mentor:convert_tudi_to_client_info(IsMentor, MentorTudi),
						                           if
							                           IsMentor -> {[BaseInfo | InfoAcc], [TudiInfo | TudiAcc]};
							                           RID =/= State#role_state.id -> {[BaseInfo | InfoAcc], TudiAcc};
							                           true -> {InfoAcc, [TudiInfo | TudiAcc]}
						                           end;
					                           true -> {InfoAcc, TudiAcc}
				                           end
			                                  end,
			                           lists:foldl(Func, {[], []}, TudiList)
	                           end,
	InfoListN = case IsMentor of
		            false when is_record(MentorPerson, mentor_person) ->
			            BaseInfo = lib_role_mentor:convert_mentor_to_client_info(MentorPerson),
			            [BaseInfo | InfoList];
		            _ -> InfoList
	            end,
	MentorInfo = #sc_mentor_info{
		mentor_id = MentorID,
		mentor_quiz_list = MentorQuizList,
		tudi_quiz_list = TudiQuizList,
		open_ui = ?iif(OpenUI, 1, 0),
		info_list = InfoListN,
		tudi_list = TudiInfoList,
		morality = Morality,
		mentor_lv = MentorLv,
		registered = Registered
	},
	{ok, Bin} = prot_msg:encode_msg(54202, MentorInfo),
	lib_role_send:send_to_sid(State#role_state.sid, Bin);
send_mentor_info(_, _, _, _) ->
	skip.

%% @doc 下发拜师请求确认框
send_begin_mentor_confirm_ui(TudiID, Name) ->
	MsgRecord = #sc_mentor_begin{
		mentor_name = Name
	},
	{ok, Bin} = prot_msg:encode_msg(54204, MsgRecord),
	lib_role_send:send_to_role(TudiID, Bin).

%% @doc 下发取消确认的消息
send_confirm_cancel_msg(Members, Type, RetCode, Args) ->
	Bin1 = case Type of
		       ?CONFIRM_TYPE_FINISH_MENTOR ->
			       {ok, Bin} = prot_msg:encode_msg(54223, #sc_mentor_senior_tudi_ui{}),
			       Bin;
		       _ -> <<>>
	       end,
	{ok, Bin2} = prot_msg:encode_msg(10502, #sc_general_ret_code_e{code = RetCode, args = Args}),
	BinN = <<Bin1/binary, Bin2/binary>>,
	lib_role_send:broadcast(Members, BinN).

%% @doc 下发基本信息列表变化
send_baseinfo_list_update(Members, BaseInfoList) ->
	{ok, Bin} = prot_msg:encode_msg(54212, #sc_mentor_base_info_list_update{info_list = BaseInfoList}),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发徒弟信息变化列表
send_tudiinfo_list_update(Members, TudiInfoList) ->
	{ok, Bin} = prot_msg:encode_msg(54213, #sc_mentor_tudi_info_list_update{tudi_list = TudiInfoList}),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发删除基本信息列表更新
send_del_baseinfo_update(Members, DelIdList) ->
	{ok, Bin} = prot_msg:encode_msg(54228, #sc_mentor_del_base_info_update{del_id_list = DelIdList}),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发删除徒弟信息列表更新
send_del_tudiinfo_update(Members, DelIdList) ->
	{ok, Bin} = prot_msg:encode_msg(54229, #sc_mentor_del_tudi_info_update{del_id_list = DelIdList}),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发徒弟师门任务列表更新
send_mentor_task_list_update(Members, TudiId, Replace, MentorTasks) ->
	MsgRecord = #sc_mentor_task_list_update{
		role_id = TudiId,
		replace = ?iif(Replace, 1, 0),
		mentor_tasks = MentorTasks
	},
	{ok, Bin} = prot_msg:encode_msg(54215, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发徒弟修学录任务列表更新
send_learn_task_list_update(Members, TudiId, Replace, LearnTasks) ->
	MsgRecord = #sc_mentor_learn_task_list_update{
		role_id = TudiId,
		replace = ?iif(Replace, 1, 0),
		learn_tasks = LearnTasks
	},
	{ok, Bin} = prot_msg:encode_msg(54216, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发徒弟太学册任务列表更新
send_taixue_task_list_update(Members, TudiId, Replace, TaixueTasks) ->
	MsgRecord = #sc_mentor_taixue_task_list_update{
		role_id = TudiId,
		replace = ?iif(Replace, 1, 0),
		taixue_tasks = TaixueTasks
	},
	{ok, Bin} = prot_msg:encode_msg(54217, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 弹出师父评价UI
send_mentor_comment_ui(State) ->
	{ok, Bin} = prot_msg:encode_msg(54218, #sc_mentor_comment_ui{}),
	lib_role_send:send_to_sid(State#role_state.sid, Bin).

%% @doc 下发师父信息刷新
send_mentor_refresh_new(Members, MentorID, Morality, MentorLv) ->
	MsgRecord = #sc_mentor_refresh_new{
		mentor_id = MentorID,
		morality = Morality,
		mentor_lv = MentorLv
	},
	{ok, Bin} = prot_msg:encode_msg(54222, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 返回对师父作出评价下发
send_mentor_comment_ret(Members, RoleID, Comment) ->
	MsgRecord = #sc_mentor_comment{
		role_id = RoleID,
		comment = Comment
	},
	{ok, Bin} = prot_msg:encode_msg(54220, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 弹出亲传弟子确认框
send_senior_tudi_ui(RoleID, Msg) ->
	MsgRecord = #sc_mentor_senior_tudi_ui{
		msg = Msg
	},
	{ok, Bin} = prot_msg:encode_msg(54223, MsgRecord),
	lib_role_send:send_to_role(RoleID, Bin).

%% @doc 下发成功进入亲传练功返回
send_begin_practice_ret(Members, RoleID, Number) ->
	MsgRecord = #sc_mentor_begin_practice{
		role_id = RoleID,
		practice_num = Number
	},
	{ok, Bin} = prot_msg:encode_msg(54226, MsgRecord),
	lib_role_send:broadcast(Members, Bin).

%% @doc 下发领取奖励返回
send_task_award_taken_ret(Members, RoleID, Taken) ->
	MsgRecord = #sc_mentor_take_task_award{
		role_id = RoleID,
		award_taken = Taken
	},
	{ok, Bin} = prot_msg:encode_msg(54232, MsgRecord),
	lib_role_send:broadcast(Members, Bin).