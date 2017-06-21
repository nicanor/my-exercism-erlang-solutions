-module(robot_simulator).
-export([test_version/0,
         create/0,
         place/3,
         direction/1,
         position/1,
         left/1,
         right/1,
         advance/1,
         control/2]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-behaviour(gen_server).

test_version() -> 1.

create() -> {ok, Robot} = gen_server:start_link(?MODULE, [], []), Robot.
place(Robot, Dir, Pos) -> gen_server:call(Robot, {place, Dir, Pos}).
direction(Robot)       -> gen_server:call(Robot, direction).
position(Robot)        -> gen_server:call(Robot, position).
left(Robot)            -> gen_server:call(Robot, left).
right(Robot)           -> gen_server:call(Robot, right).
advance(Robot)         -> gen_server:call(Robot, advance).

control(Robot, []) -> ok;
control(Robot, [$R|Xs]) ->   right(Robot), control(Robot, Xs);
control(Robot, [$L|Xs]) ->    left(Robot), control(Robot, Xs);
control(Robot, [$A|Xs]) -> advance(Robot), control(Robot, Xs);
control(_,_) -> unknown.

to(State) -> {reply, State, State}.

init(_) -> {ok, {undefined, {undefined, undefined}}}.

handle_call(direction, _, {Dir,Pos})   -> {reply, Dir, {Dir,Pos}};
handle_call(position,  _, {Dir,Pos})   -> {reply, Pos, {Dir,Pos}};
handle_call({place, Dir, Pos}, _, _)   -> to({  Dir,Pos});
handle_call(left,    _, {north, Pos})  -> to({ west,Pos});
handle_call(left,    _, { west, Pos})  -> to({south,Pos});
handle_call(left,    _, {south, Pos})  -> to({ east,Pos});
handle_call(left,    _, { east, Pos})  -> to({north,Pos});
handle_call(right,   _, {north, Pos})  -> to({ east,Pos});
handle_call(right,   _, { west, Pos})  -> to({north,Pos});
handle_call(right,   _, {south, Pos})  -> to({ west,Pos});
handle_call(right,   _, { east, Pos})  -> to({south,Pos});
handle_call(advance, _, {north,{X,Y}}) -> to({north,{X,Y+1}});
handle_call(advance, _, { west,{X,Y}}) -> to({ west,{X-1,Y}});
handle_call(advance, _, {south,{X,Y}}) -> to({south,{X,Y-1}});
handle_call(advance, _, { east,{X,Y}}) -> to({ east,{X+1,Y}}).

handle_cast(_,State)     -> {noreply, State}.
handle_info(_, State)    -> {noreply, State}.
terminate(normal, _)     -> ok.
code_change(_, State, _) -> {ok, State}.
