%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dynasty_war_score
%% @Brief  : 宋辽战争积分奖励
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dynasty_war_score).

-export([
    get/1,
    get_ids/0
]).

get(Score) when Score >= 0 andalso Score =< 0 ->
    260000;
get(Score) when Score >= 1 andalso Score =< 1 ->
    260001;
get(Score) when Score >= 2 andalso Score =< 2 ->
    260002;
get(Score) when Score >= 3 andalso Score =< 3 ->
    260003;
get(Score) when Score >= 4 andalso Score =< 4 ->
    260004;
get(Score) when Score >= 5 andalso Score =< 5 ->
    260005;
get(Score) when Score >= 6 andalso Score =< 6 ->
    260006;
get(Score) when Score >= 7 andalso Score =< 7 ->
    260007;
get(Score) when Score >= 8 andalso Score =< 8 ->
    260008;
get(Score) when Score >= 9 andalso Score =< 9 ->
    260009;
get(Score) when Score >= 10 andalso Score =< 10 ->
    260010;
get(Score) when Score >= 11 andalso Score =< 11 ->
    260011;
get(Score) when Score >= 12 andalso Score =< 12 ->
    260012;
get(Score) when Score >= 13 andalso Score =< 13 ->
    260013;
get(Score) when Score >= 14 andalso Score =< 14 ->
    260014;
get(Score) when Score >= 15 andalso Score =< 15 ->
    260015;
get(Score) when Score >= 16 andalso Score =< 16 ->
    260016;
get(Score) when Score >= 17 andalso Score =< 17 ->
    260017;
get(Score) when Score >= 18 andalso Score =< 18 ->
    260018;
get(Score) when Score >= 19 andalso Score =< 19 ->
    260019;
get(Score) when Score >= 20 andalso Score =< 20 ->
    260020;
get(Score) when Score >= 21 andalso Score =< 21 ->
    260021;
get(Score) when Score >= 22 andalso Score =< 22 ->
    260022;
get(Score) when Score >= 23 andalso Score =< 23 ->
    260023;
get(Score) when Score >= 24 andalso Score =< 24 ->
    260024;
get(Score) when Score >= 25 andalso Score =< 25 ->
    260025;
get(Score) when Score >= 26 andalso Score =< 26 ->
    260026;
get(Score) when Score >= 27 andalso Score =< 27 ->
    260027;
get(Score) when Score >= 28 andalso Score =< 28 ->
    260028;
get(Score) when Score >= 29 andalso Score =< 29 ->
    260029;
get(Score) when Score >= 30 andalso Score =< 30 ->
    260030;
get(Score) when Score >= 31 andalso Score =< 31 ->
    260031;
get(Score) when Score >= 32 andalso Score =< 32 ->
    260032;
get(Score) when Score >= 33 andalso Score =< 33 ->
    260033;
get(Score) when Score >= 34 andalso Score =< 34 ->
    260034;
get(Score) when Score >= 35 andalso Score =< 35 ->
    260035;
get(Score) when Score >= 36 andalso Score =< 36 ->
    260036;
get(Score) when Score >= 37 andalso Score =< 37 ->
    260037;
get(Score) when Score >= 38 andalso Score =< 38 ->
    260038;
get(Score) when Score >= 39 andalso Score =< 39 ->
    260039;
get(Score) when Score >= 40 andalso Score =< 40 ->
    260040;
get(Score) when Score >= 41 andalso Score =< 41 ->
    260041;
get(Score) when Score >= 42 andalso Score =< 42 ->
    260042;
get(Score) when Score >= 43 andalso Score =< 43 ->
    260043;
get(Score) when Score >= 44 andalso Score =< 44 ->
    260044;
get(Score) when Score >= 45 andalso Score =< 45 ->
    260045;
get(Score) when Score >= 46 andalso Score =< 46 ->
    260046;
get(Score) when Score >= 47 andalso Score =< 47 ->
    260047;
get(Score) when Score >= 48 andalso Score =< 48 ->
    260048;
get(Score) when Score >= 49 andalso Score =< 49 ->
    260049;
get(Score) when Score >= 50 andalso Score =< 50 ->
    260050;
get(Score) when Score >= 51 andalso Score =< 51 ->
    260051;
get(Score) when Score >= 52 andalso Score =< 52 ->
    260052;
get(Score) when Score >= 53 andalso Score =< 53 ->
    260053;
get(Score) when Score >= 54 andalso Score =< 54 ->
    260054;
get(Score) when Score >= 55 andalso Score =< 55 ->
    260055;
get(Score) when Score >= 56 andalso Score =< 56 ->
    260056;
get(Score) when Score >= 57 andalso Score =< 57 ->
    260057;
get(Score) when Score >= 58 andalso Score =< 58 ->
    260058;
get(Score) when Score >= 59 andalso Score =< 59 ->
    260059;
get(Score) when Score >= 60 andalso Score =< 60 ->
    260060;
get(Score) when Score >= 61 andalso Score =< 61 ->
    260061;
get(Score) when Score >= 62 andalso Score =< 62 ->
    260062;
get(Score) when Score >= 63 andalso Score =< 63 ->
    260063;
get(Score) when Score >= 64 andalso Score =< 64 ->
    260064;
get(Score) when Score >= 65 andalso Score =< 65 ->
    260065;
get(Score) when Score >= 66 andalso Score =< 66 ->
    260066;
get(Score) when Score >= 67 andalso Score =< 67 ->
    260067;
get(Score) when Score >= 68 andalso Score =< 68 ->
    260068;
get(Score) when Score >= 69 andalso Score =< 69 ->
    260069;
get(Score) when Score >= 70 andalso Score =< 70 ->
    260070;
get(Score) when Score >= 71 andalso Score =< 71 ->
    260071;
get(Score) when Score >= 72 andalso Score =< 72 ->
    260072;
get(Score) when Score >= 73 andalso Score =< 73 ->
    260073;
get(Score) when Score >= 74 andalso Score =< 74 ->
    260074;
get(Score) when Score >= 75 andalso Score =< 75 ->
    260075;
get(Score) when Score >= 76 andalso Score =< 76 ->
    260076;
get(Score) when Score >= 77 andalso Score =< 77 ->
    260077;
get(Score) when Score >= 78 andalso Score =< 78 ->
    260078;
get(Score) when Score >= 79 andalso Score =< 79 ->
    260079;
get(Score) when Score >= 80 andalso Score =< 80 ->
    260080;
get(Score) when Score >= 81 andalso Score =< 81 ->
    260081;
get(Score) when Score >= 82 andalso Score =< 82 ->
    260082;
get(Score) when Score >= 83 andalso Score =< 83 ->
    260083;
get(Score) when Score >= 84 andalso Score =< 84 ->
    260084;
get(Score) when Score >= 85 andalso Score =< 85 ->
    260085;
get(Score) when Score >= 86 andalso Score =< 86 ->
    260086;
get(Score) when Score >= 87 andalso Score =< 87 ->
    260087;
get(Score) when Score >= 88 andalso Score =< 88 ->
    260088;
get(Score) when Score >= 89 andalso Score =< 89 ->
    260089;
get(Score) when Score >= 90 andalso Score =< 90 ->
    260090;
get(Score) when Score >= 91 andalso Score =< 91 ->
    260091;
get(Score) when Score >= 92 andalso Score =< 92 ->
    260092;
get(Score) when Score >= 93 andalso Score =< 93 ->
    260093;
get(Score) when Score >= 94 andalso Score =< 94 ->
    260094;
get(Score) when Score >= 95 andalso Score =< 95 ->
    260095;
get(Score) when Score >= 96 andalso Score =< 96 ->
    260096;
get(Score) when Score >= 97 andalso Score =< 97 ->
    260097;
get(Score) when Score >= 98 andalso Score =< 98 ->
    260098;
get(Score) when Score >= 99 andalso Score =< 99 ->
    260099;
get(Score) when Score >= 100 andalso Score =< 100 ->
    260100;
get(Score) when Score >= 101 andalso Score =< 101 ->
    260101;
get(Score) when Score >= 102 andalso Score =< 102 ->
    260102;
get(Score) when Score >= 103 andalso Score =< 103 ->
    260103;
get(Score) when Score >= 104 andalso Score =< 104 ->
    260104;
get(Score) when Score >= 105 andalso Score =< 105 ->
    260105;
get(Score) when Score >= 106 andalso Score =< 106 ->
    260106;
get(Score) when Score >= 107 andalso Score =< 107 ->
    260107;
get(Score) when Score >= 108 andalso Score =< 108 ->
    260108;
get(Score) when Score >= 109 andalso Score =< 109 ->
    260109;
get(Score) when Score >= 110 andalso Score =< 110 ->
    260110;
get(Score) when Score >= 111 andalso Score =< 111 ->
    260111;
get(Score) when Score >= 112 andalso Score =< 112 ->
    260112;
get(Score) when Score >= 113 andalso Score =< 113 ->
    260113;
get(Score) when Score >= 114 andalso Score =< 114 ->
    260114;
get(Score) when Score >= 115 andalso Score =< 115 ->
    260115;
get(Score) when Score >= 116 andalso Score =< 116 ->
    260116;
get(Score) when Score >= 117 andalso Score =< 117 ->
    260117;
get(Score) when Score >= 118 andalso Score =< 118 ->
    260118;
get(Score) when Score >= 119 andalso Score =< 119 ->
    260119;
get(Score) when Score >= 120 andalso Score =< 120 ->
    260120;
get(Score) when Score >= 121 andalso Score =< 121 ->
    260121;
get(Score) when Score >= 122 andalso Score =< 122 ->
    260122;
get(Score) when Score >= 123 andalso Score =< 123 ->
    260123;
get(Score) when Score >= 124 andalso Score =< 124 ->
    260124;
get(Score) when Score >= 125 andalso Score =< 125 ->
    260125;
get(Score) when Score >= 126 andalso Score =< 126 ->
    260126;
get(Score) when Score >= 127 andalso Score =< 127 ->
    260127;
get(Score) when Score >= 128 andalso Score =< 128 ->
    260128;
get(Score) when Score >= 129 andalso Score =< 129 ->
    260129;
get(Score) when Score >= 130 andalso Score =< 130 ->
    260130;
get(Score) when Score >= 131 andalso Score =< 131 ->
    260131;
get(Score) when Score >= 132 andalso Score =< 132 ->
    260132;
get(Score) when Score >= 133 andalso Score =< 133 ->
    260133;
get(Score) when Score >= 134 andalso Score =< 134 ->
    260134;
get(Score) when Score >= 135 andalso Score =< 135 ->
    260135;
get(Score) when Score >= 136 andalso Score =< 136 ->
    260136;
get(Score) when Score >= 137 andalso Score =< 137 ->
    260137;
get(Score) when Score >= 138 andalso Score =< 138 ->
    260138;
get(Score) when Score >= 139 andalso Score =< 139 ->
    260139;
get(Score) when Score >= 140 andalso Score =< 140 ->
    260140;
get(Score) when Score >= 141 andalso Score =< 141 ->
    260141;
get(Score) when Score >= 142 andalso Score =< 142 ->
    260142;
get(Score) when Score >= 143 andalso Score =< 143 ->
    260143;
get(Score) when Score >= 144 andalso Score =< 144 ->
    260144;
get(Score) when Score >= 145 andalso Score =< 145 ->
    260145;
get(Score) when Score >= 146 andalso Score =< 146 ->
    260146;
get(Score) when Score >= 147 andalso Score =< 147 ->
    260147;
get(Score) when Score >= 148 andalso Score =< 148 ->
    260148;
get(Score) when Score >= 149 andalso Score =< 149 ->
    260149;
get(Score) when Score >= 150 andalso Score =< 150 ->
    260150;
get(Score) when Score >= 151 andalso Score =< 151 ->
    260151;
get(Score) when Score >= 152 andalso Score =< 152 ->
    260152;
get(Score) when Score >= 153 andalso Score =< 153 ->
    260153;
get(Score) when Score >= 154 andalso Score =< 154 ->
    260154;
get(Score) when Score >= 155 andalso Score =< 155 ->
    260155;
get(Score) when Score >= 156 andalso Score =< 156 ->
    260156;
get(Score) when Score >= 157 andalso Score =< 157 ->
    260157;
get(Score) when Score >= 158 andalso Score =< 158 ->
    260158;
get(Score) when Score >= 159 andalso Score =< 159 ->
    260159;
get(Score) when Score >= 160 andalso Score =< 160 ->
    260160;
get(Score) when Score >= 161 andalso Score =< 161 ->
    260161;
get(Score) when Score >= 162 andalso Score =< 162 ->
    260162;
get(Score) when Score >= 163 andalso Score =< 163 ->
    260163;
get(Score) when Score >= 164 andalso Score =< 164 ->
    260164;
get(Score) when Score >= 165 andalso Score =< 165 ->
    260165;
get(Score) when Score >= 166 andalso Score =< 166 ->
    260166;
get(Score) when Score >= 167 andalso Score =< 167 ->
    260167;
get(Score) when Score >= 168 andalso Score =< 168 ->
    260168;
get(Score) when Score >= 169 andalso Score =< 169 ->
    260169;
get(Score) when Score >= 170 andalso Score =< 170 ->
    260170;
get(Score) when Score >= 171 andalso Score =< 171 ->
    260171;
get(Score) when Score >= 172 andalso Score =< 172 ->
    260172;
get(Score) when Score >= 173 andalso Score =< 173 ->
    260173;
get(Score) when Score >= 174 andalso Score =< 174 ->
    260174;
get(Score) when Score >= 175 andalso Score =< 175 ->
    260175;
get(Score) when Score >= 176 andalso Score =< 176 ->
    260176;
get(Score) when Score >= 177 andalso Score =< 177 ->
    260177;
get(Score) when Score >= 178 andalso Score =< 178 ->
    260178;
get(Score) when Score >= 179 andalso Score =< 179 ->
    260179;
get(Score) when Score >= 180 andalso Score =< 180 ->
    260180;
get(Score) when Score >= 181 andalso Score =< 181 ->
    260181;
get(Score) when Score >= 182 andalso Score =< 182 ->
    260182;
get(Score) when Score >= 183 andalso Score =< 183 ->
    260183;
get(Score) when Score >= 184 andalso Score =< 184 ->
    260184;
get(Score) when Score >= 185 andalso Score =< 185 ->
    260185;
get(Score) when Score >= 186 andalso Score =< 186 ->
    260186;
get(Score) when Score >= 187 andalso Score =< 187 ->
    260187;
get(Score) when Score >= 188 andalso Score =< 188 ->
    260188;
get(Score) when Score >= 189 andalso Score =< 189 ->
    260189;
get(Score) when Score >= 190 andalso Score =< 190 ->
    260190;
get(Score) when Score >= 191 andalso Score =< 191 ->
    260191;
get(Score) when Score >= 192 andalso Score =< 192 ->
    260192;
get(Score) when Score >= 193 andalso Score =< 193 ->
    260193;
get(Score) when Score >= 194 andalso Score =< 194 ->
    260194;
get(Score) when Score >= 195 andalso Score =< 195 ->
    260195;
get(Score) when Score >= 196 andalso Score =< 196 ->
    260196;
get(Score) when Score >= 197 andalso Score =< 197 ->
    260197;
get(Score) when Score >= 198 andalso Score =< 198 ->
    260198;
get(Score) when Score >= 199 andalso Score =< 199 ->
    260199;
get(Score) when Score >= 200 andalso Score =< 200 ->
    260200;
get(Score) when Score >= 201 andalso Score =< 201 ->
    260201;
get(Score) when Score >= 202 andalso Score =< 202 ->
    260202;
get(Score) when Score >= 203 andalso Score =< 203 ->
    260203;
get(Score) when Score >= 204 andalso Score =< 204 ->
    260204;
get(Score) when Score >= 205 andalso Score =< 205 ->
    260205;
get(Score) when Score >= 206 andalso Score =< 206 ->
    260206;
get(Score) when Score >= 207 andalso Score =< 207 ->
    260207;
get(Score) when Score >= 208 andalso Score =< 208 ->
    260208;
get(Score) when Score >= 209 andalso Score =< 209 ->
    260209;
get(Score) when Score >= 210 andalso Score =< 210 ->
    260210;
get(Score) when Score >= 211 andalso Score =< 211 ->
    260211;
get(Score) when Score >= 212 andalso Score =< 212 ->
    260212;
get(Score) when Score >= 213 andalso Score =< 213 ->
    260213;
get(Score) when Score >= 214 andalso Score =< 214 ->
    260214;
get(Score) when Score >= 215 andalso Score =< 215 ->
    260215;
get(Score) when Score >= 216 andalso Score =< 216 ->
    260216;
get(Score) when Score >= 217 andalso Score =< 217 ->
    260217;
get(Score) when Score >= 218 andalso Score =< 218 ->
    260218;
get(Score) when Score >= 219 andalso Score =< 219 ->
    260219;
get(Score) when Score >= 220 andalso Score =< 220 ->
    260220;
get(Score) when Score >= 221 andalso Score =< 221 ->
    260221;
get(Score) when Score >= 222 andalso Score =< 222 ->
    260222;
get(Score) when Score >= 223 andalso Score =< 223 ->
    260223;
get(Score) when Score >= 224 andalso Score =< 224 ->
    260224;
get(Score) when Score >= 225 andalso Score =< 225 ->
    260225;
get(Score) when Score >= 226 andalso Score =< 226 ->
    260226;
get(Score) when Score >= 227 andalso Score =< 227 ->
    260227;
get(Score) when Score >= 228 andalso Score =< 228 ->
    260228;
get(Score) when Score >= 229 andalso Score =< 229 ->
    260229;
get(Score) when Score >= 230 andalso Score =< 230 ->
    260230;
get(Score) when Score >= 231 andalso Score =< 231 ->
    260231;
get(Score) when Score >= 232 andalso Score =< 232 ->
    260232;
get(Score) when Score >= 233 andalso Score =< 233 ->
    260233;
get(Score) when Score >= 234 andalso Score =< 234 ->
    260234;
get(Score) when Score >= 235 andalso Score =< 235 ->
    260235;
get(Score) when Score >= 236 andalso Score =< 236 ->
    260236;
get(Score) when Score >= 237 andalso Score =< 237 ->
    260237;
get(Score) when Score >= 238 andalso Score =< 238 ->
    260238;
get(Score) when Score >= 239 andalso Score =< 239 ->
    260239;
get(Score) when Score >= 240 andalso Score =< 240 ->
    260240;
get(Score) when Score >= 241 andalso Score =< 241 ->
    260241;
get(Score) when Score >= 242 andalso Score =< 242 ->
    260242;
get(Score) when Score >= 243 andalso Score =< 243 ->
    260243;
get(Score) when Score >= 244 andalso Score =< 244 ->
    260244;
get(Score) when Score >= 245 andalso Score =< 245 ->
    260245;
get(Score) when Score >= 246 andalso Score =< 246 ->
    260246;
get(Score) when Score >= 247 andalso Score =< 247 ->
    260247;
get(Score) when Score >= 248 andalso Score =< 248 ->
    260248;
get(Score) when Score >= 249 andalso Score =< 249 ->
    260249;
get(Score) when Score >= 250 andalso Score =< 250 ->
    260250;
get(Score) when Score >= 251 andalso Score =< 251 ->
    260251;
get(Score) when Score >= 252 andalso Score =< 252 ->
    260252;
get(Score) when Score >= 253 andalso Score =< 253 ->
    260253;
get(Score) when Score >= 254 andalso Score =< 254 ->
    260254;
get(Score) when Score >= 255 andalso Score =< 255 ->
    260255;
get(Score) when Score >= 256 andalso Score =< 256 ->
    260256;
get(Score) when Score >= 257 andalso Score =< 257 ->
    260257;
get(Score) when Score >= 258 andalso Score =< 258 ->
    260258;
get(Score) when Score >= 259 andalso Score =< 259 ->
    260259;
get(Score) when Score >= 260 andalso Score =< 260 ->
    260260;
get(Score) when Score >= 261 andalso Score =< 261 ->
    260261;
get(Score) when Score >= 262 andalso Score =< 262 ->
    260262;
get(Score) when Score >= 263 andalso Score =< 263 ->
    260263;
get(Score) when Score >= 264 andalso Score =< 264 ->
    260264;
get(Score) when Score >= 265 andalso Score =< 265 ->
    260265;
get(Score) when Score >= 266 andalso Score =< 266 ->
    260266;
get(Score) when Score >= 267 andalso Score =< 267 ->
    260267;
get(Score) when Score >= 268 andalso Score =< 268 ->
    260268;
get(Score) when Score >= 269 andalso Score =< 269 ->
    260269;
get(Score) when Score >= 270 andalso Score =< 270 ->
    260270;
get(Score) when Score >= 271 andalso Score =< 271 ->
    260271;
get(Score) when Score >= 272 andalso Score =< 272 ->
    260272;
get(Score) when Score >= 273 andalso Score =< 273 ->
    260273;
get(Score) when Score >= 274 andalso Score =< 274 ->
    260274;
get(Score) when Score >= 275 andalso Score =< 275 ->
    260275;
get(Score) when Score >= 276 andalso Score =< 276 ->
    260276;
get(Score) when Score >= 277 andalso Score =< 277 ->
    260277;
get(Score) when Score >= 278 andalso Score =< 278 ->
    260278;
get(Score) when Score >= 279 andalso Score =< 279 ->
    260279;
get(Score) when Score >= 280 andalso Score =< 280 ->
    260280;
get(Score) when Score >= 281 andalso Score =< 281 ->
    260281;
get(Score) when Score >= 282 andalso Score =< 282 ->
    260282;
get(Score) when Score >= 283 andalso Score =< 283 ->
    260283;
get(Score) when Score >= 284 andalso Score =< 284 ->
    260284;
get(Score) when Score >= 285 andalso Score =< 285 ->
    260285;
get(Score) when Score >= 286 andalso Score =< 286 ->
    260286;
get(Score) when Score >= 287 andalso Score =< 287 ->
    260287;
get(Score) when Score >= 288 andalso Score =< 288 ->
    260288;
get(Score) when Score >= 289 andalso Score =< 289 ->
    260289;
get(Score) when Score >= 290 andalso Score =< 290 ->
    260290;
get(Score) when Score >= 291 andalso Score =< 291 ->
    260291;
get(Score) when Score >= 292 andalso Score =< 292 ->
    260292;
get(Score) when Score >= 293 andalso Score =< 293 ->
    260293;
get(Score) when Score >= 294 andalso Score =< 294 ->
    260294;
get(Score) when Score >= 295 andalso Score =< 295 ->
    260295;
get(Score) when Score >= 296 andalso Score =< 296 ->
    260296;
get(Score) when Score >= 297 andalso Score =< 297 ->
    260297;
get(Score) when Score >= 298 andalso Score =< 298 ->
    260298;
get(Score) when Score >= 299 andalso Score =< 299 ->
    260299;
get(Score) when Score >= 300 andalso Score =< 300 ->
    260300;
get(Score) when Score >= 301 andalso Score =< 301 ->
    260301;
get(Score) when Score >= 302 andalso Score =< 302 ->
    260302;
get(Score) when Score >= 303 andalso Score =< 303 ->
    260303;
get(Score) when Score >= 304 andalso Score =< 304 ->
    260304;
get(Score) when Score >= 305 andalso Score =< 305 ->
    260305;
get(Score) when Score >= 306 andalso Score =< 306 ->
    260306;
get(Score) when Score >= 307 andalso Score =< 307 ->
    260307;
get(Score) when Score >= 308 andalso Score =< 308 ->
    260308;
get(Score) when Score >= 309 andalso Score =< 309 ->
    260309;
get(Score) when Score >= 310 andalso Score =< 310 ->
    260310;
get(Score) when Score >= 311 andalso Score =< 311 ->
    260311;
get(Score) when Score >= 312 andalso Score =< 312 ->
    260312;
get(Score) when Score >= 313 andalso Score =< 313 ->
    260313;
get(Score) when Score >= 314 andalso Score =< 314 ->
    260314;
get(Score) when Score >= 315 andalso Score =< 315 ->
    260315;
get(Score) when Score >= 316 andalso Score =< 316 ->
    260316;
get(Score) when Score >= 317 andalso Score =< 317 ->
    260317;
get(Score) when Score >= 318 andalso Score =< 318 ->
    260318;
get(Score) when Score >= 319 andalso Score =< 319 ->
    260319;
get(Score) when Score >= 320 andalso Score =< 320 ->
    260320;
get(Score) when Score >= 321 andalso Score =< 321 ->
    260321;
get(Score) when Score >= 322 andalso Score =< 322 ->
    260322;
get(Score) when Score >= 323 andalso Score =< 323 ->
    260323;
get(Score) when Score >= 324 andalso Score =< 324 ->
    260324;
get(Score) when Score >= 325 andalso Score =< 325 ->
    260325;
get(Score) when Score >= 326 andalso Score =< 326 ->
    260326;
get(Score) when Score >= 327 andalso Score =< 327 ->
    260327;
get(Score) when Score >= 328 andalso Score =< 328 ->
    260328;
get(Score) when Score >= 329 andalso Score =< 329 ->
    260329;
get(Score) when Score >= 330 andalso Score =< 330 ->
    260330;
get(Score) when Score >= 331 andalso Score =< 331 ->
    260331;
get(Score) when Score >= 332 andalso Score =< 332 ->
    260332;
get(Score) when Score >= 333 andalso Score =< 333 ->
    260333;
get(Score) when Score >= 334 andalso Score =< 334 ->
    260334;
get(Score) when Score >= 335 andalso Score =< 335 ->
    260335;
get(Score) when Score >= 336 andalso Score =< 336 ->
    260336;
get(Score) when Score >= 337 andalso Score =< 337 ->
    260337;
get(Score) when Score >= 338 andalso Score =< 338 ->
    260338;
get(Score) when Score >= 339 andalso Score =< 339 ->
    260339;
get(Score) when Score >= 340 andalso Score =< 340 ->
    260340;
get(Score) when Score >= 341 andalso Score =< 341 ->
    260341;
get(Score) when Score >= 342 andalso Score =< 342 ->
    260342;
get(Score) when Score >= 343 andalso Score =< 343 ->
    260343;
get(Score) when Score >= 344 andalso Score =< 344 ->
    260344;
get(Score) when Score >= 345 andalso Score =< 345 ->
    260345;
get(Score) when Score >= 346 andalso Score =< 346 ->
    260346;
get(Score) when Score >= 347 andalso Score =< 347 ->
    260347;
get(Score) when Score >= 348 andalso Score =< 348 ->
    260348;
get(Score) when Score >= 349 andalso Score =< 349 ->
    260349;
get(Score) when Score >= 350 andalso Score =< 350 ->
    260350;
get(Score) when Score >= 351 andalso Score =< 351 ->
    260351;
get(Score) when Score >= 352 andalso Score =< 352 ->
    260352;
get(Score) when Score >= 353 andalso Score =< 353 ->
    260353;
get(Score) when Score >= 354 andalso Score =< 354 ->
    260354;
get(Score) when Score >= 355 andalso Score =< 355 ->
    260355;
get(Score) when Score >= 356 andalso Score =< 356 ->
    260356;
get(Score) when Score >= 357 andalso Score =< 357 ->
    260357;
get(Score) when Score >= 358 andalso Score =< 358 ->
    260358;
get(Score) when Score >= 359 andalso Score =< 359 ->
    260359;
get(Score) when Score >= 360 andalso Score =< 360 ->
    260360;
get(Score) when Score >= 361 andalso Score =< 361 ->
    260361;
get(Score) when Score >= 362 andalso Score =< 362 ->
    260362;
get(Score) when Score >= 363 andalso Score =< 363 ->
    260363;
get(Score) when Score >= 364 andalso Score =< 364 ->
    260364;
get(Score) when Score >= 365 andalso Score =< 365 ->
    260365;
get(Score) when Score >= 366 andalso Score =< 366 ->
    260366;
get(Score) when Score >= 367 andalso Score =< 367 ->
    260367;
get(Score) when Score >= 368 andalso Score =< 368 ->
    260368;
get(Score) when Score >= 369 andalso Score =< 369 ->
    260369;
get(Score) when Score >= 370 andalso Score =< 370 ->
    260370;
get(Score) when Score >= 371 andalso Score =< 371 ->
    260371;
get(Score) when Score >= 372 andalso Score =< 372 ->
    260372;
get(Score) when Score >= 373 andalso Score =< 373 ->
    260373;
get(Score) when Score >= 374 andalso Score =< 374 ->
    260374;
get(Score) when Score >= 375 andalso Score =< 375 ->
    260375;
get(Score) when Score >= 376 andalso Score =< 376 ->
    260376;
get(Score) when Score >= 377 andalso Score =< 377 ->
    260377;
get(Score) when Score >= 378 andalso Score =< 378 ->
    260378;
get(Score) when Score >= 379 andalso Score =< 379 ->
    260379;
get(Score) when Score >= 380 andalso Score =< 380 ->
    260380;
get(Score) when Score >= 381 andalso Score =< 381 ->
    260381;
get(Score) when Score >= 382 andalso Score =< 382 ->
    260382;
get(Score) when Score >= 383 andalso Score =< 383 ->
    260383;
get(Score) when Score >= 384 andalso Score =< 384 ->
    260384;
get(Score) when Score >= 385 andalso Score =< 385 ->
    260385;
get(Score) when Score >= 386 andalso Score =< 386 ->
    260386;
get(Score) when Score >= 387 andalso Score =< 387 ->
    260387;
get(Score) when Score >= 388 andalso Score =< 388 ->
    260388;
get(Score) when Score >= 389 andalso Score =< 389 ->
    260389;
get(Score) when Score >= 390 andalso Score =< 390 ->
    260390;
get(Score) when Score >= 391 andalso Score =< 391 ->
    260391;
get(Score) when Score >= 392 andalso Score =< 392 ->
    260392;
get(Score) when Score >= 393 andalso Score =< 393 ->
    260393;
get(Score) when Score >= 394 andalso Score =< 394 ->
    260394;
get(Score) when Score >= 395 andalso Score =< 395 ->
    260395;
get(Score) when Score >= 396 andalso Score =< 396 ->
    260396;
get(Score) when Score >= 397 andalso Score =< 397 ->
    260397;
get(Score) when Score >= 398 andalso Score =< 398 ->
    260398;
get(Score) when Score >= 399 andalso Score =< 399 ->
    260399;
get(Score) when Score >= 400 andalso Score =< 400 ->
    260400;
get(Score) when Score >= 401 andalso Score =< 401 ->
    260401;
get(Score) when Score >= 402 andalso Score =< 402 ->
    260402;
get(Score) when Score >= 403 andalso Score =< 403 ->
    260403;
get(Score) when Score >= 404 andalso Score =< 404 ->
    260404;
get(Score) when Score >= 405 andalso Score =< 405 ->
    260405;
get(Score) when Score >= 406 andalso Score =< 406 ->
    260406;
get(Score) when Score >= 407 andalso Score =< 407 ->
    260407;
get(Score) when Score >= 408 andalso Score =< 408 ->
    260408;
get(Score) when Score >= 409 andalso Score =< 409 ->
    260409;
get(Score) when Score >= 410 andalso Score =< 410 ->
    260410;
get(Score) when Score >= 411 andalso Score =< 411 ->
    260411;
get(Score) when Score >= 412 andalso Score =< 412 ->
    260412;
get(Score) when Score >= 413 andalso Score =< 413 ->
    260413;
get(Score) when Score >= 414 andalso Score =< 414 ->
    260414;
get(Score) when Score >= 415 andalso Score =< 415 ->
    260415;
get(Score) when Score >= 416 andalso Score =< 416 ->
    260416;
get(Score) when Score >= 417 andalso Score =< 417 ->
    260417;
get(Score) when Score >= 418 andalso Score =< 418 ->
    260418;
get(Score) when Score >= 419 andalso Score =< 419 ->
    260419;
get(Score) when Score >= 420 andalso Score =< 420 ->
    260420;
get(Score) when Score >= 421 andalso Score =< 421 ->
    260421;
get(Score) when Score >= 422 andalso Score =< 422 ->
    260422;
get(Score) when Score >= 423 andalso Score =< 423 ->
    260423;
get(Score) when Score >= 424 andalso Score =< 424 ->
    260424;
get(Score) when Score >= 425 andalso Score =< 425 ->
    260425;
get(Score) when Score >= 426 andalso Score =< 426 ->
    260426;
get(Score) when Score >= 427 andalso Score =< 427 ->
    260427;
get(Score) when Score >= 428 andalso Score =< 428 ->
    260428;
get(Score) when Score >= 429 andalso Score =< 429 ->
    260429;
get(Score) when Score >= 430 andalso Score =< 430 ->
    260430;
get(Score) when Score >= 431 andalso Score =< 431 ->
    260431;
get(Score) when Score >= 432 andalso Score =< 432 ->
    260432;
get(Score) when Score >= 433 andalso Score =< 433 ->
    260433;
get(Score) when Score >= 434 andalso Score =< 434 ->
    260434;
get(Score) when Score >= 435 andalso Score =< 435 ->
    260435;
get(Score) when Score >= 436 andalso Score =< 436 ->
    260436;
get(Score) when Score >= 437 andalso Score =< 437 ->
    260437;
get(Score) when Score >= 438 andalso Score =< 438 ->
    260438;
get(Score) when Score >= 439 andalso Score =< 439 ->
    260439;
get(Score) when Score >= 440 andalso Score =< 440 ->
    260440;
get(Score) when Score >= 441 andalso Score =< 441 ->
    260441;
get(Score) when Score >= 442 andalso Score =< 442 ->
    260442;
get(Score) when Score >= 443 andalso Score =< 443 ->
    260443;
get(Score) when Score >= 444 andalso Score =< 444 ->
    260444;
get(Score) when Score >= 445 andalso Score =< 445 ->
    260445;
get(Score) when Score >= 446 andalso Score =< 446 ->
    260446;
get(Score) when Score >= 447 andalso Score =< 447 ->
    260447;
get(Score) when Score >= 448 andalso Score =< 448 ->
    260448;
get(Score) when Score >= 449 andalso Score =< 449 ->
    260449;
get(Score) when Score >= 450 andalso Score =< 450 ->
    260450;
get(Score) when Score >= 451 andalso Score =< 451 ->
    260451;
get(Score) when Score >= 452 andalso Score =< 452 ->
    260452;
get(Score) when Score >= 453 andalso Score =< 453 ->
    260453;
get(Score) when Score >= 454 andalso Score =< 454 ->
    260454;
get(Score) when Score >= 455 andalso Score =< 455 ->
    260455;
get(Score) when Score >= 456 andalso Score =< 456 ->
    260456;
get(Score) when Score >= 457 andalso Score =< 457 ->
    260457;
get(Score) when Score >= 458 andalso Score =< 458 ->
    260458;
get(Score) when Score >= 459 andalso Score =< 459 ->
    260459;
get(Score) when Score >= 460 andalso Score =< 460 ->
    260460;
get(Score) when Score >= 461 andalso Score =< 461 ->
    260461;
get(Score) when Score >= 462 andalso Score =< 462 ->
    260462;
get(Score) when Score >= 463 andalso Score =< 463 ->
    260463;
get(Score) when Score >= 464 andalso Score =< 464 ->
    260464;
get(Score) when Score >= 465 andalso Score =< 465 ->
    260465;
get(Score) when Score >= 466 andalso Score =< 466 ->
    260466;
get(Score) when Score >= 467 andalso Score =< 467 ->
    260467;
get(Score) when Score >= 468 andalso Score =< 468 ->
    260468;
get(Score) when Score >= 469 andalso Score =< 469 ->
    260469;
get(Score) when Score >= 470 andalso Score =< 470 ->
    260470;
get(Score) when Score >= 471 andalso Score =< 471 ->
    260471;
get(Score) when Score >= 472 andalso Score =< 472 ->
    260472;
get(Score) when Score >= 473 andalso Score =< 473 ->
    260473;
get(Score) when Score >= 474 andalso Score =< 474 ->
    260474;
get(Score) when Score >= 475 andalso Score =< 475 ->
    260475;
get(Score) when Score >= 476 andalso Score =< 476 ->
    260476;
get(Score) when Score >= 477 andalso Score =< 477 ->
    260477;
get(Score) when Score >= 478 andalso Score =< 478 ->
    260478;
get(Score) when Score >= 479 andalso Score =< 479 ->
    260479;
get(Score) when Score >= 480 andalso Score =< 480 ->
    260480;
get(Score) when Score >= 481 andalso Score =< 481 ->
    260481;
get(Score) when Score >= 482 andalso Score =< 482 ->
    260482;
get(Score) when Score >= 483 andalso Score =< 483 ->
    260483;
get(Score) when Score >= 484 andalso Score =< 484 ->
    260484;
get(Score) when Score >= 485 andalso Score =< 485 ->
    260485;
get(Score) when Score >= 486 andalso Score =< 486 ->
    260486;
get(Score) when Score >= 487 andalso Score =< 487 ->
    260487;
get(Score) when Score >= 488 andalso Score =< 488 ->
    260488;
get(Score) when Score >= 489 andalso Score =< 489 ->
    260489;
get(Score) when Score >= 490 andalso Score =< 490 ->
    260490;
get(Score) when Score >= 491 andalso Score =< 491 ->
    260491;
get(Score) when Score >= 492 andalso Score =< 492 ->
    260492;
get(Score) when Score >= 493 andalso Score =< 493 ->
    260493;
get(Score) when Score >= 494 andalso Score =< 494 ->
    260494;
get(Score) when Score >= 495 andalso Score =< 495 ->
    260495;
get(Score) when Score >= 496 andalso Score =< 496 ->
    260496;
get(Score) when Score >= 497 andalso Score =< 497 ->
    260497;
get(Score) when Score >= 498 andalso Score =< 498 ->
    260498;
get(Score) when Score >= 499 andalso Score =< 499 ->
    260499;
get(Score) when Score >= 500 andalso Score =< 500 ->
    260500;
get(Score) when Score >= 501 andalso Score =< 501 ->
    260501;
get(Score) when Score >= 502 andalso Score =< 502 ->
    260502;
get(Score) when Score >= 503 andalso Score =< 503 ->
    260503;
get(Score) when Score >= 504 andalso Score =< 504 ->
    260504;
get(Score) when Score >= 505 andalso Score =< 505 ->
    260505;
get(Score) when Score >= 506 andalso Score =< 506 ->
    260506;
get(Score) when Score >= 507 andalso Score =< 507 ->
    260507;
get(Score) when Score >= 508 andalso Score =< 508 ->
    260508;
get(Score) when Score >= 509 andalso Score =< 509 ->
    260509;
get(Score) when Score >= 510 andalso Score =< 510 ->
    260510;
get(Score) when Score >= 511 andalso Score =< 511 ->
    260511;
get(Score) when Score >= 512 andalso Score =< 512 ->
    260512;
get(Score) when Score >= 513 andalso Score =< 513 ->
    260513;
get(Score) when Score >= 514 andalso Score =< 514 ->
    260514;
get(Score) when Score >= 515 andalso Score =< 515 ->
    260515;
get(Score) when Score >= 516 andalso Score =< 516 ->
    260516;
get(Score) when Score >= 517 andalso Score =< 517 ->
    260517;
get(Score) when Score >= 518 andalso Score =< 518 ->
    260518;
get(Score) when Score >= 519 andalso Score =< 519 ->
    260519;
get(Score) when Score >= 520 andalso Score =< 520 ->
    260520;
get(Score) when Score >= 521 andalso Score =< 521 ->
    260521;
get(Score) when Score >= 522 andalso Score =< 522 ->
    260522;
get(Score) when Score >= 523 andalso Score =< 523 ->
    260523;
get(Score) when Score >= 524 andalso Score =< 524 ->
    260524;
get(Score) when Score >= 525 andalso Score =< 525 ->
    260525;
get(Score) when Score >= 526 andalso Score =< 526 ->
    260526;
get(Score) when Score >= 527 andalso Score =< 527 ->
    260527;
get(Score) when Score >= 528 andalso Score =< 528 ->
    260528;
get(Score) when Score >= 529 andalso Score =< 529 ->
    260529;
get(Score) when Score >= 530 andalso Score =< 530 ->
    260530;
get(Score) when Score >= 531 andalso Score =< 531 ->
    260531;
get(Score) when Score >= 532 andalso Score =< 532 ->
    260532;
get(Score) when Score >= 533 andalso Score =< 533 ->
    260533;
get(Score) when Score >= 534 andalso Score =< 534 ->
    260534;
get(Score) when Score >= 535 andalso Score =< 535 ->
    260535;
get(Score) when Score >= 536 andalso Score =< 536 ->
    260536;
get(Score) when Score >= 537 andalso Score =< 537 ->
    260537;
get(Score) when Score >= 538 andalso Score =< 538 ->
    260538;
get(Score) when Score >= 539 andalso Score =< 539 ->
    260539;
get(Score) when Score >= 540 andalso Score =< 540 ->
    260540;
get(Score) when Score >= 541 andalso Score =< 541 ->
    260541;
get(Score) when Score >= 542 andalso Score =< 542 ->
    260542;
get(Score) when Score >= 543 andalso Score =< 543 ->
    260543;
get(Score) when Score >= 544 andalso Score =< 544 ->
    260544;
get(Score) when Score >= 545 andalso Score =< 545 ->
    260545;
get(Score) when Score >= 546 andalso Score =< 546 ->
    260546;
get(Score) when Score >= 547 andalso Score =< 547 ->
    260547;
get(Score) when Score >= 548 andalso Score =< 548 ->
    260548;
get(Score) when Score >= 549 andalso Score =< 549 ->
    260549;
get(Score) when Score >= 550 andalso Score =< 550 ->
    260550;
get(Score) when Score >= 551 andalso Score =< 551 ->
    260551;
get(Score) when Score >= 552 andalso Score =< 552 ->
    260552;
get(Score) when Score >= 553 andalso Score =< 553 ->
    260553;
get(Score) when Score >= 554 andalso Score =< 554 ->
    260554;
get(Score) when Score >= 555 andalso Score =< 555 ->
    260555;
get(Score) when Score >= 556 andalso Score =< 556 ->
    260556;
get(Score) when Score >= 557 andalso Score =< 557 ->
    260557;
get(Score) when Score >= 558 andalso Score =< 558 ->
    260558;
get(Score) when Score >= 559 andalso Score =< 559 ->
    260559;
get(Score) when Score >= 560 andalso Score =< 560 ->
    260560;
get(Score) when Score >= 561 andalso Score =< 561 ->
    260561;
get(Score) when Score >= 562 andalso Score =< 562 ->
    260562;
get(Score) when Score >= 563 andalso Score =< 563 ->
    260563;
get(Score) when Score >= 564 andalso Score =< 564 ->
    260564;
get(Score) when Score >= 565 andalso Score =< 565 ->
    260565;
get(Score) when Score >= 566 andalso Score =< 566 ->
    260566;
get(Score) when Score >= 567 andalso Score =< 567 ->
    260567;
get(Score) when Score >= 568 andalso Score =< 568 ->
    260568;
get(Score) when Score >= 569 andalso Score =< 569 ->
    260569;
get(Score) when Score >= 570 andalso Score =< 570 ->
    260570;
get(Score) when Score >= 571 andalso Score =< 571 ->
    260571;
get(Score) when Score >= 572 andalso Score =< 572 ->
    260572;
get(Score) when Score >= 573 andalso Score =< 573 ->
    260573;
get(Score) when Score >= 574 andalso Score =< 574 ->
    260574;
get(Score) when Score >= 575 andalso Score =< 575 ->
    260575;
get(Score) when Score >= 576 andalso Score =< 576 ->
    260576;
get(Score) when Score >= 577 andalso Score =< 577 ->
    260577;
get(Score) when Score >= 578 andalso Score =< 578 ->
    260578;
get(Score) when Score >= 579 andalso Score =< 579 ->
    260579;
get(Score) when Score >= 580 andalso Score =< 580 ->
    260580;
get(Score) when Score >= 581 andalso Score =< 581 ->
    260581;
get(Score) when Score >= 582 andalso Score =< 582 ->
    260582;
get(Score) when Score >= 583 andalso Score =< 583 ->
    260583;
get(Score) when Score >= 584 andalso Score =< 584 ->
    260584;
get(Score) when Score >= 585 andalso Score =< 585 ->
    260585;
get(Score) when Score >= 586 andalso Score =< 586 ->
    260586;
get(Score) when Score >= 587 andalso Score =< 587 ->
    260587;
get(Score) when Score >= 588 andalso Score =< 588 ->
    260588;
get(Score) when Score >= 589 andalso Score =< 589 ->
    260589;
get(Score) when Score >= 590 andalso Score =< 590 ->
    260590;
get(Score) when Score >= 591 andalso Score =< 591 ->
    260591;
get(Score) when Score >= 592 andalso Score =< 592 ->
    260592;
get(Score) when Score >= 593 andalso Score =< 593 ->
    260593;
get(Score) when Score >= 594 andalso Score =< 594 ->
    260594;
get(Score) when Score >= 595 andalso Score =< 595 ->
    260595;
get(Score) when Score >= 596 andalso Score =< 596 ->
    260596;
get(Score) when Score >= 597 andalso Score =< 597 ->
    260597;
get(Score) when Score >= 598 andalso Score =< 598 ->
    260598;
get(Score) when Score >= 599 andalso Score =< 599 ->
    260599;
get(Score) when Score >= 600 andalso Score =< 600 ->
    260600;
get(Score) when Score >= 601 andalso Score =< 601 ->
    260601;
get(Score) when Score >= 602 andalso Score =< 602 ->
    260602;
get(Score) when Score >= 603 andalso Score =< 603 ->
    260603;
get(Score) when Score >= 604 andalso Score =< 604 ->
    260604;
get(Score) when Score >= 605 andalso Score =< 605 ->
    260605;
get(Score) when Score >= 606 andalso Score =< 606 ->
    260606;
get(Score) when Score >= 607 andalso Score =< 607 ->
    260607;
get(Score) when Score >= 608 andalso Score =< 608 ->
    260608;
get(Score) when Score >= 609 andalso Score =< 609 ->
    260609;
get(Score) when Score >= 610 andalso Score =< 610 ->
    260610;
get(Score) when Score >= 611 andalso Score =< 611 ->
    260611;
get(Score) when Score >= 612 andalso Score =< 612 ->
    260612;
get(Score) when Score >= 613 andalso Score =< 613 ->
    260613;
get(Score) when Score >= 614 andalso Score =< 614 ->
    260614;
get(Score) when Score >= 615 andalso Score =< 615 ->
    260615;
get(Score) when Score >= 616 andalso Score =< 616 ->
    260616;
get(Score) when Score >= 617 andalso Score =< 617 ->
    260617;
get(Score) when Score >= 618 andalso Score =< 618 ->
    260618;
get(Score) when Score >= 619 andalso Score =< 619 ->
    260619;
get(Score) when Score >= 620 andalso Score =< 620 ->
    260620;
get(Score) when Score >= 621 andalso Score =< 621 ->
    260621;
get(Score) when Score >= 622 andalso Score =< 622 ->
    260622;
get(Score) when Score >= 623 andalso Score =< 623 ->
    260623;
get(Score) when Score >= 624 andalso Score =< 624 ->
    260624;
get(Score) when Score >= 625 andalso Score =< 625 ->
    260625;
get(Score) when Score >= 626 andalso Score =< 626 ->
    260626;
get(Score) when Score >= 627 andalso Score =< 627 ->
    260627;
get(Score) when Score >= 628 andalso Score =< 628 ->
    260628;
get(Score) when Score >= 629 andalso Score =< 629 ->
    260629;
get(Score) when Score >= 630 andalso Score =< 630 ->
    260630;
get(Score) when Score >= 631 andalso Score =< 631 ->
    260631;
get(Score) when Score >= 632 andalso Score =< 632 ->
    260632;
get(Score) when Score >= 633 andalso Score =< 633 ->
    260633;
get(Score) when Score >= 634 andalso Score =< 634 ->
    260634;
get(Score) when Score >= 635 andalso Score =< 635 ->
    260635;
get(Score) when Score >= 636 andalso Score =< 636 ->
    260636;
get(Score) when Score >= 637 andalso Score =< 637 ->
    260637;
get(Score) when Score >= 638 andalso Score =< 638 ->
    260638;
get(Score) when Score >= 639 andalso Score =< 639 ->
    260639;
get(Score) when Score >= 640 andalso Score =< 640 ->
    260640;
get(Score) when Score >= 641 andalso Score =< 641 ->
    260641;
get(Score) when Score >= 642 andalso Score =< 642 ->
    260642;
get(Score) when Score >= 643 andalso Score =< 643 ->
    260643;
get(Score) when Score >= 644 andalso Score =< 644 ->
    260644;
get(Score) when Score >= 645 andalso Score =< 645 ->
    260645;
get(Score) when Score >= 646 andalso Score =< 646 ->
    260646;
get(Score) when Score >= 647 andalso Score =< 647 ->
    260647;
get(Score) when Score >= 648 andalso Score =< 648 ->
    260648;
get(Score) when Score >= 649 andalso Score =< 649 ->
    260649;
get(Score) when Score >= 650 andalso Score =< 650 ->
    260650;
get(Score) when Score >= 651 andalso Score =< 651 ->
    260651;
get(Score) when Score >= 652 andalso Score =< 652 ->
    260652;
get(Score) when Score >= 653 andalso Score =< 653 ->
    260653;
get(Score) when Score >= 654 andalso Score =< 654 ->
    260654;
get(Score) when Score >= 655 andalso Score =< 655 ->
    260655;
get(Score) when Score >= 656 andalso Score =< 656 ->
    260656;
get(Score) when Score >= 657 andalso Score =< 657 ->
    260657;
get(Score) when Score >= 658 andalso Score =< 658 ->
    260658;
get(Score) when Score >= 659 andalso Score =< 659 ->
    260659;
get(Score) when Score >= 660 andalso Score =< 660 ->
    260660;
get(Score) when Score >= 661 andalso Score =< 661 ->
    260661;
get(Score) when Score >= 662 andalso Score =< 662 ->
    260662;
get(Score) when Score >= 663 andalso Score =< 663 ->
    260663;
get(Score) when Score >= 664 andalso Score =< 664 ->
    260664;
get(Score) when Score >= 665 andalso Score =< 665 ->
    260665;
get(Score) when Score >= 666 andalso Score =< 666 ->
    260666;
get(Score) when Score >= 667 andalso Score =< 667 ->
    260667;
get(Score) when Score >= 668 andalso Score =< 668 ->
    260668;
get(Score) when Score >= 669 andalso Score =< 669 ->
    260669;
get(Score) when Score >= 670 andalso Score =< 670 ->
    260670;
get(Score) when Score >= 671 andalso Score =< 671 ->
    260671;
get(Score) when Score >= 672 andalso Score =< 672 ->
    260672;
get(Score) when Score >= 673 andalso Score =< 673 ->
    260673;
get(Score) when Score >= 674 andalso Score =< 674 ->
    260674;
get(Score) when Score >= 675 andalso Score =< 675 ->
    260675;
get(Score) when Score >= 676 andalso Score =< 676 ->
    260676;
get(Score) when Score >= 677 andalso Score =< 677 ->
    260677;
get(Score) when Score >= 678 andalso Score =< 678 ->
    260678;
get(Score) when Score >= 679 andalso Score =< 679 ->
    260679;
get(Score) when Score >= 680 andalso Score =< 680 ->
    260680;
get(Score) when Score >= 681 andalso Score =< 681 ->
    260681;
get(Score) when Score >= 682 andalso Score =< 682 ->
    260682;
get(Score) when Score >= 683 andalso Score =< 683 ->
    260683;
get(Score) when Score >= 684 andalso Score =< 684 ->
    260684;
get(Score) when Score >= 685 andalso Score =< 685 ->
    260685;
get(Score) when Score >= 686 andalso Score =< 686 ->
    260686;
get(Score) when Score >= 687 andalso Score =< 687 ->
    260687;
get(Score) when Score >= 688 andalso Score =< 688 ->
    260688;
get(Score) when Score >= 689 andalso Score =< 689 ->
    260689;
get(Score) when Score >= 690 andalso Score =< 690 ->
    260690;
get(Score) when Score >= 691 andalso Score =< 691 ->
    260691;
get(Score) when Score >= 692 andalso Score =< 692 ->
    260692;
get(Score) when Score >= 693 andalso Score =< 693 ->
    260693;
get(Score) when Score >= 694 andalso Score =< 694 ->
    260694;
get(Score) when Score >= 695 andalso Score =< 695 ->
    260695;
get(Score) when Score >= 696 andalso Score =< 696 ->
    260696;
get(Score) when Score >= 697 andalso Score =< 697 ->
    260697;
get(Score) when Score >= 698 andalso Score =< 698 ->
    260698;
get(Score) when Score >= 699 andalso Score =< 699 ->
    260699;
get(Score) when Score >= 700 andalso Score =< 700 ->
    260700;
get(Score) when Score >= 701 andalso Score =< 701 ->
    260701;
get(Score) when Score >= 702 andalso Score =< 702 ->
    260702;
get(Score) when Score >= 703 andalso Score =< 703 ->
    260703;
get(Score) when Score >= 704 andalso Score =< 704 ->
    260704;
get(Score) when Score >= 705 andalso Score =< 705 ->
    260705;
get(Score) when Score >= 706 andalso Score =< 706 ->
    260706;
get(Score) when Score >= 707 andalso Score =< 707 ->
    260707;
get(Score) when Score >= 708 andalso Score =< 708 ->
    260708;
get(Score) when Score >= 709 andalso Score =< 709 ->
    260709;
get(Score) when Score >= 710 andalso Score =< 710 ->
    260710;
get(Score) when Score >= 711 andalso Score =< 711 ->
    260711;
get(Score) when Score >= 712 andalso Score =< 712 ->
    260712;
get(Score) when Score >= 713 andalso Score =< 713 ->
    260713;
get(Score) when Score >= 714 andalso Score =< 714 ->
    260714;
get(Score) when Score >= 715 andalso Score =< 715 ->
    260715;
get(Score) when Score >= 716 andalso Score =< 716 ->
    260716;
get(Score) when Score >= 717 andalso Score =< 717 ->
    260717;
get(Score) when Score >= 718 andalso Score =< 718 ->
    260718;
get(Score) when Score >= 719 andalso Score =< 719 ->
    260719;
get(Score) when Score >= 720 andalso Score =< 720 ->
    260720;
get(Score) when Score >= 721 andalso Score =< 721 ->
    260721;
get(Score) when Score >= 722 andalso Score =< 722 ->
    260722;
get(Score) when Score >= 723 andalso Score =< 723 ->
    260723;
get(Score) when Score >= 724 andalso Score =< 724 ->
    260724;
get(Score) when Score >= 725 andalso Score =< 725 ->
    260725;
get(Score) when Score >= 726 andalso Score =< 726 ->
    260726;
get(Score) when Score >= 727 andalso Score =< 727 ->
    260727;
get(Score) when Score >= 728 andalso Score =< 728 ->
    260728;
get(Score) when Score >= 729 andalso Score =< 729 ->
    260729;
get(Score) when Score >= 730 andalso Score =< 730 ->
    260730;
get(Score) when Score >= 731 andalso Score =< 731 ->
    260731;
get(Score) when Score >= 732 andalso Score =< 732 ->
    260732;
get(Score) when Score >= 733 andalso Score =< 733 ->
    260733;
get(Score) when Score >= 734 andalso Score =< 734 ->
    260734;
get(Score) when Score >= 735 andalso Score =< 735 ->
    260735;
get(Score) when Score >= 736 andalso Score =< 736 ->
    260736;
get(Score) when Score >= 737 andalso Score =< 737 ->
    260737;
get(Score) when Score >= 738 andalso Score =< 738 ->
    260738;
get(Score) when Score >= 739 andalso Score =< 739 ->
    260739;
get(Score) when Score >= 740 andalso Score =< 740 ->
    260740;
get(Score) when Score >= 741 andalso Score =< 741 ->
    260741;
get(Score) when Score >= 742 andalso Score =< 742 ->
    260742;
get(Score) when Score >= 743 andalso Score =< 743 ->
    260743;
get(Score) when Score >= 744 andalso Score =< 744 ->
    260744;
get(Score) when Score >= 745 andalso Score =< 745 ->
    260745;
get(Score) when Score >= 746 andalso Score =< 746 ->
    260746;
get(Score) when Score >= 747 andalso Score =< 747 ->
    260747;
get(Score) when Score >= 748 andalso Score =< 748 ->
    260748;
get(Score) when Score >= 749 andalso Score =< 749 ->
    260749;
get(Score) when Score >= 750 andalso Score =< 750 ->
    260750;
get(Score) when Score >= 751 andalso Score =< 751 ->
    260751;
get(Score) when Score >= 752 andalso Score =< 752 ->
    260752;
get(Score) when Score >= 753 andalso Score =< 753 ->
    260753;
get(Score) when Score >= 754 andalso Score =< 754 ->
    260754;
get(Score) when Score >= 755 andalso Score =< 755 ->
    260755;
get(Score) when Score >= 756 andalso Score =< 756 ->
    260756;
get(Score) when Score >= 757 andalso Score =< 757 ->
    260757;
get(Score) when Score >= 758 andalso Score =< 758 ->
    260758;
get(Score) when Score >= 759 andalso Score =< 759 ->
    260759;
get(Score) when Score >= 760 andalso Score =< 760 ->
    260760;
get(Score) when Score >= 761 andalso Score =< 761 ->
    260761;
get(Score) when Score >= 762 andalso Score =< 762 ->
    260762;
get(Score) when Score >= 763 andalso Score =< 763 ->
    260763;
get(Score) when Score >= 764 andalso Score =< 764 ->
    260764;
get(Score) when Score >= 765 andalso Score =< 765 ->
    260765;
get(Score) when Score >= 766 andalso Score =< 766 ->
    260766;
get(Score) when Score >= 767 andalso Score =< 767 ->
    260767;
get(Score) when Score >= 768 andalso Score =< 768 ->
    260768;
get(Score) when Score >= 769 andalso Score =< 769 ->
    260769;
get(Score) when Score >= 770 andalso Score =< 770 ->
    260770;
get(Score) when Score >= 771 andalso Score =< 771 ->
    260771;
get(Score) when Score >= 772 andalso Score =< 772 ->
    260772;
get(Score) when Score >= 773 andalso Score =< 773 ->
    260773;
get(Score) when Score >= 774 andalso Score =< 774 ->
    260774;
get(Score) when Score >= 775 andalso Score =< 775 ->
    260775;
get(Score) when Score >= 776 andalso Score =< 776 ->
    260776;
get(Score) when Score >= 777 andalso Score =< 777 ->
    260777;
get(Score) when Score >= 778 andalso Score =< 778 ->
    260778;
get(Score) when Score >= 779 andalso Score =< 779 ->
    260779;
get(Score) when Score >= 780 andalso Score =< 780 ->
    260780;
get(Score) when Score >= 781 andalso Score =< 781 ->
    260781;
get(Score) when Score >= 782 andalso Score =< 782 ->
    260782;
get(Score) when Score >= 783 andalso Score =< 783 ->
    260783;
get(Score) when Score >= 784 andalso Score =< 784 ->
    260784;
get(Score) when Score >= 785 andalso Score =< 785 ->
    260785;
get(Score) when Score >= 786 andalso Score =< 786 ->
    260786;
get(Score) when Score >= 787 andalso Score =< 787 ->
    260787;
get(Score) when Score >= 788 andalso Score =< 788 ->
    260788;
get(Score) when Score >= 789 andalso Score =< 789 ->
    260789;
get(Score) when Score >= 790 andalso Score =< 790 ->
    260790;
get(Score) when Score >= 791 andalso Score =< 791 ->
    260791;
get(Score) when Score >= 792 andalso Score =< 792 ->
    260792;
get(Score) when Score >= 793 andalso Score =< 793 ->
    260793;
get(Score) when Score >= 794 andalso Score =< 794 ->
    260794;
get(Score) when Score >= 795 andalso Score =< 795 ->
    260795;
get(Score) when Score >= 796 andalso Score =< 796 ->
    260796;
get(Score) when Score >= 797 andalso Score =< 797 ->
    260797;
get(Score) when Score >= 798 andalso Score =< 798 ->
    260798;
get(Score) when Score >= 799 andalso Score =< 799 ->
    260799;
get(Score) when Score >= 800 andalso Score =< 800 ->
    260800;
get(Score) when Score >= 801 andalso Score =< 801 ->
    260801;
get(Score) when Score >= 802 andalso Score =< 802 ->
    260802;
get(Score) when Score >= 803 andalso Score =< 803 ->
    260803;
get(Score) when Score >= 804 andalso Score =< 804 ->
    260804;
get(Score) when Score >= 805 andalso Score =< 805 ->
    260805;
get(Score) when Score >= 806 andalso Score =< 806 ->
    260806;
get(Score) when Score >= 807 andalso Score =< 807 ->
    260807;
get(Score) when Score >= 808 andalso Score =< 808 ->
    260808;
get(Score) when Score >= 809 andalso Score =< 809 ->
    260809;
get(Score) when Score >= 810 andalso Score =< 810 ->
    260810;
get(Score) when Score >= 811 andalso Score =< 811 ->
    260811;
get(Score) when Score >= 812 andalso Score =< 812 ->
    260812;
get(Score) when Score >= 813 andalso Score =< 813 ->
    260813;
get(Score) when Score >= 814 andalso Score =< 814 ->
    260814;
get(Score) when Score >= 815 andalso Score =< 815 ->
    260815;
get(Score) when Score >= 816 andalso Score =< 816 ->
    260816;
get(Score) when Score >= 817 andalso Score =< 817 ->
    260817;
get(Score) when Score >= 818 andalso Score =< 818 ->
    260818;
get(Score) when Score >= 819 andalso Score =< 819 ->
    260819;
get(Score) when Score >= 820 andalso Score =< 820 ->
    260820;
get(Score) when Score >= 821 andalso Score =< 821 ->
    260821;
get(Score) when Score >= 822 andalso Score =< 822 ->
    260822;
get(Score) when Score >= 823 andalso Score =< 823 ->
    260823;
get(Score) when Score >= 824 andalso Score =< 824 ->
    260824;
get(Score) when Score >= 825 andalso Score =< 825 ->
    260825;
get(Score) when Score >= 826 andalso Score =< 826 ->
    260826;
get(Score) when Score >= 827 andalso Score =< 827 ->
    260827;
get(Score) when Score >= 828 andalso Score =< 828 ->
    260828;
get(Score) when Score >= 829 andalso Score =< 829 ->
    260829;
get(Score) when Score >= 830 andalso Score =< 830 ->
    260830;
get(Score) when Score >= 831 andalso Score =< 831 ->
    260831;
get(Score) when Score >= 832 andalso Score =< 832 ->
    260832;
get(Score) when Score >= 833 andalso Score =< 833 ->
    260833;
get(Score) when Score >= 834 andalso Score =< 834 ->
    260834;
get(Score) when Score >= 835 andalso Score =< 835 ->
    260835;
get(Score) when Score >= 836 andalso Score =< 836 ->
    260836;
get(Score) when Score >= 837 andalso Score =< 837 ->
    260837;
get(Score) when Score >= 838 andalso Score =< 838 ->
    260838;
get(Score) when Score >= 839 andalso Score =< 839 ->
    260839;
get(Score) when Score >= 840 andalso Score =< 840 ->
    260840;
get(Score) when Score >= 841 andalso Score =< 841 ->
    260841;
get(Score) when Score >= 842 andalso Score =< 842 ->
    260842;
get(Score) when Score >= 843 andalso Score =< 843 ->
    260843;
get(Score) when Score >= 844 andalso Score =< 844 ->
    260844;
get(Score) when Score >= 845 andalso Score =< 845 ->
    260845;
get(Score) when Score >= 846 andalso Score =< 846 ->
    260846;
get(Score) when Score >= 847 andalso Score =< 847 ->
    260847;
get(Score) when Score >= 848 andalso Score =< 848 ->
    260848;
get(Score) when Score >= 849 andalso Score =< 849 ->
    260849;
get(Score) when Score >= 850 andalso Score =< 850 ->
    260850;
get(Score) when Score >= 851 andalso Score =< 851 ->
    260851;
get(Score) when Score >= 852 andalso Score =< 852 ->
    260852;
get(Score) when Score >= 853 andalso Score =< 853 ->
    260853;
get(Score) when Score >= 854 andalso Score =< 854 ->
    260854;
get(Score) when Score >= 855 andalso Score =< 855 ->
    260855;
get(Score) when Score >= 856 andalso Score =< 856 ->
    260856;
get(Score) when Score >= 857 andalso Score =< 857 ->
    260857;
get(Score) when Score >= 858 andalso Score =< 858 ->
    260858;
get(Score) when Score >= 859 andalso Score =< 859 ->
    260859;
get(Score) when Score >= 860 andalso Score =< 860 ->
    260860;
get(Score) when Score >= 861 andalso Score =< 861 ->
    260861;
get(Score) when Score >= 862 andalso Score =< 862 ->
    260862;
get(Score) when Score >= 863 andalso Score =< 863 ->
    260863;
get(Score) when Score >= 864 andalso Score =< 864 ->
    260864;
get(Score) when Score >= 865 andalso Score =< 865 ->
    260865;
get(Score) when Score >= 866 andalso Score =< 866 ->
    260866;
get(Score) when Score >= 867 andalso Score =< 867 ->
    260867;
get(Score) when Score >= 868 andalso Score =< 868 ->
    260868;
get(Score) when Score >= 869 andalso Score =< 869 ->
    260869;
get(Score) when Score >= 870 andalso Score =< 870 ->
    260870;
get(Score) when Score >= 871 andalso Score =< 871 ->
    260871;
get(Score) when Score >= 872 andalso Score =< 872 ->
    260872;
get(Score) when Score >= 873 andalso Score =< 873 ->
    260873;
get(Score) when Score >= 874 andalso Score =< 874 ->
    260874;
get(Score) when Score >= 875 andalso Score =< 875 ->
    260875;
get(Score) when Score >= 876 andalso Score =< 876 ->
    260876;
get(Score) when Score >= 877 andalso Score =< 877 ->
    260877;
get(Score) when Score >= 878 andalso Score =< 878 ->
    260878;
get(Score) when Score >= 879 andalso Score =< 879 ->
    260879;
get(Score) when Score >= 880 andalso Score =< 880 ->
    260880;
get(Score) when Score >= 881 andalso Score =< 881 ->
    260881;
get(Score) when Score >= 882 andalso Score =< 882 ->
    260882;
get(Score) when Score >= 883 andalso Score =< 883 ->
    260883;
get(Score) when Score >= 884 andalso Score =< 884 ->
    260884;
get(Score) when Score >= 885 andalso Score =< 885 ->
    260885;
get(Score) when Score >= 886 andalso Score =< 886 ->
    260886;
get(Score) when Score >= 887 andalso Score =< 887 ->
    260887;
get(Score) when Score >= 888 andalso Score =< 888 ->
    260888;
get(Score) when Score >= 889 andalso Score =< 889 ->
    260889;
get(Score) when Score >= 890 andalso Score =< 890 ->
    260890;
get(Score) when Score >= 891 andalso Score =< 891 ->
    260891;
get(Score) when Score >= 892 andalso Score =< 892 ->
    260892;
get(Score) when Score >= 893 andalso Score =< 893 ->
    260893;
get(Score) when Score >= 894 andalso Score =< 894 ->
    260894;
get(Score) when Score >= 895 andalso Score =< 895 ->
    260895;
get(Score) when Score >= 896 andalso Score =< 896 ->
    260896;
get(Score) when Score >= 897 andalso Score =< 897 ->
    260897;
get(Score) when Score >= 898 andalso Score =< 898 ->
    260898;
get(Score) when Score >= 899 andalso Score =< 899 ->
    260899;
get(Score) when Score >= 900 andalso Score =< 900 ->
    260900;
get(Score) when Score >= 901 andalso Score =< 901 ->
    260901;
get(Score) when Score >= 902 andalso Score =< 902 ->
    260902;
get(Score) when Score >= 903 andalso Score =< 903 ->
    260903;
get(Score) when Score >= 904 andalso Score =< 904 ->
    260904;
get(Score) when Score >= 905 andalso Score =< 905 ->
    260905;
get(Score) when Score >= 906 andalso Score =< 906 ->
    260906;
get(Score) when Score >= 907 andalso Score =< 907 ->
    260907;
get(Score) when Score >= 908 andalso Score =< 908 ->
    260908;
get(Score) when Score >= 909 andalso Score =< 909 ->
    260909;
get(Score) when Score >= 910 andalso Score =< 910 ->
    260910;
get(Score) when Score >= 911 andalso Score =< 911 ->
    260911;
get(Score) when Score >= 912 andalso Score =< 912 ->
    260912;
get(Score) when Score >= 913 andalso Score =< 913 ->
    260913;
get(Score) when Score >= 914 andalso Score =< 914 ->
    260914;
get(Score) when Score >= 915 andalso Score =< 915 ->
    260915;
get(Score) when Score >= 916 andalso Score =< 916 ->
    260916;
get(Score) when Score >= 917 andalso Score =< 917 ->
    260917;
get(Score) when Score >= 918 andalso Score =< 918 ->
    260918;
get(Score) when Score >= 919 andalso Score =< 919 ->
    260919;
get(Score) when Score >= 920 andalso Score =< 920 ->
    260920;
get(Score) when Score >= 921 andalso Score =< 921 ->
    260921;
get(Score) when Score >= 922 andalso Score =< 922 ->
    260922;
get(Score) when Score >= 923 andalso Score =< 923 ->
    260923;
get(Score) when Score >= 924 andalso Score =< 924 ->
    260924;
get(Score) when Score >= 925 andalso Score =< 925 ->
    260925;
get(Score) when Score >= 926 andalso Score =< 926 ->
    260926;
get(Score) when Score >= 927 andalso Score =< 927 ->
    260927;
get(Score) when Score >= 928 andalso Score =< 928 ->
    260928;
get(Score) when Score >= 929 andalso Score =< 929 ->
    260929;
get(Score) when Score >= 930 andalso Score =< 930 ->
    260930;
get(Score) when Score >= 931 andalso Score =< 931 ->
    260931;
get(Score) when Score >= 932 andalso Score =< 932 ->
    260932;
get(Score) when Score >= 933 andalso Score =< 933 ->
    260933;
get(Score) when Score >= 934 andalso Score =< 934 ->
    260934;
get(Score) when Score >= 935 andalso Score =< 935 ->
    260935;
get(Score) when Score >= 936 andalso Score =< 936 ->
    260936;
get(Score) when Score >= 937 andalso Score =< 937 ->
    260937;
get(Score) when Score >= 938 andalso Score =< 938 ->
    260938;
get(Score) when Score >= 939 andalso Score =< 939 ->
    260939;
get(Score) when Score >= 940 andalso Score =< 940 ->
    260940;
get(Score) when Score >= 941 andalso Score =< 941 ->
    260941;
get(Score) when Score >= 942 andalso Score =< 942 ->
    260942;
get(Score) when Score >= 943 andalso Score =< 943 ->
    260943;
get(Score) when Score >= 944 andalso Score =< 944 ->
    260944;
get(Score) when Score >= 945 andalso Score =< 945 ->
    260945;
get(Score) when Score >= 946 andalso Score =< 946 ->
    260946;
get(Score) when Score >= 947 andalso Score =< 947 ->
    260947;
get(Score) when Score >= 948 andalso Score =< 948 ->
    260948;
get(Score) when Score >= 949 andalso Score =< 949 ->
    260949;
get(Score) when Score >= 950 andalso Score =< 950 ->
    260950;
get(Score) when Score >= 951 andalso Score =< 951 ->
    260951;
get(Score) when Score >= 952 andalso Score =< 952 ->
    260952;
get(Score) when Score >= 953 andalso Score =< 953 ->
    260953;
get(Score) when Score >= 954 andalso Score =< 954 ->
    260954;
get(Score) when Score >= 955 andalso Score =< 955 ->
    260955;
get(Score) when Score >= 956 andalso Score =< 956 ->
    260956;
get(Score) when Score >= 957 andalso Score =< 957 ->
    260957;
get(Score) when Score >= 958 andalso Score =< 958 ->
    260958;
get(Score) when Score >= 959 andalso Score =< 959 ->
    260959;
get(Score) when Score >= 960 andalso Score =< 960 ->
    260960;
get(Score) when Score >= 961 andalso Score =< 961 ->
    260961;
get(Score) when Score >= 962 andalso Score =< 962 ->
    260962;
get(Score) when Score >= 963 andalso Score =< 963 ->
    260963;
get(Score) when Score >= 964 andalso Score =< 964 ->
    260964;
get(Score) when Score >= 965 andalso Score =< 965 ->
    260965;
get(Score) when Score >= 966 andalso Score =< 966 ->
    260966;
get(Score) when Score >= 967 andalso Score =< 967 ->
    260967;
get(Score) when Score >= 968 andalso Score =< 968 ->
    260968;
get(Score) when Score >= 969 andalso Score =< 969 ->
    260969;
get(Score) when Score >= 970 andalso Score =< 970 ->
    260970;
get(Score) when Score >= 971 andalso Score =< 971 ->
    260971;
get(Score) when Score >= 972 andalso Score =< 972 ->
    260972;
get(Score) when Score >= 973 andalso Score =< 973 ->
    260973;
get(Score) when Score >= 974 andalso Score =< 974 ->
    260974;
get(Score) when Score >= 975 andalso Score =< 975 ->
    260975;
get(Score) when Score >= 976 andalso Score =< 976 ->
    260976;
get(Score) when Score >= 977 andalso Score =< 977 ->
    260977;
get(Score) when Score >= 978 andalso Score =< 978 ->
    260978;
get(Score) when Score >= 979 andalso Score =< 979 ->
    260979;
get(Score) when Score >= 980 andalso Score =< 980 ->
    260980;
get(Score) when Score >= 981 andalso Score =< 981 ->
    260981;
get(Score) when Score >= 982 andalso Score =< 982 ->
    260982;
get(Score) when Score >= 983 andalso Score =< 983 ->
    260983;
get(Score) when Score >= 984 andalso Score =< 984 ->
    260984;
get(Score) when Score >= 985 andalso Score =< 985 ->
    260985;
get(Score) when Score >= 986 andalso Score =< 986 ->
    260986;
get(Score) when Score >= 987 andalso Score =< 987 ->
    260987;
get(Score) when Score >= 988 andalso Score =< 988 ->
    260988;
get(Score) when Score >= 989 andalso Score =< 989 ->
    260989;
get(Score) when Score >= 990 andalso Score =< 990 ->
    260990;
get(Score) when Score >= 991 andalso Score =< 991 ->
    260991;
get(Score) when Score >= 992 andalso Score =< 992 ->
    260992;
get(Score) when Score >= 993 andalso Score =< 993 ->
    260993;
get(Score) when Score >= 994 andalso Score =< 994 ->
    260994;
get(Score) when Score >= 995 andalso Score =< 995 ->
    260995;
get(Score) when Score >= 996 andalso Score =< 996 ->
    260996;
get(Score) when Score >= 997 andalso Score =< 997 ->
    260997;
get(Score) when Score >= 998 andalso Score =< 998 ->
    260998;
get(Score) when Score >= 999 andalso Score =< 999 ->
    260999;
get(Score) when Score >= 1000 andalso Score =< 1000 ->
    261000;
get(Score) when Score >= 1001 andalso Score =< 1001 ->
    261001;
get(Score) when Score >= 1002 andalso Score =< 1002 ->
    261002;
get(Score) when Score >= 1003 andalso Score =< 1003 ->
    261003;
get(Score) when Score >= 1004 andalso Score =< 1004 ->
    261004;
get(Score) when Score >= 1005 andalso Score =< 1005 ->
    261005;
get(Score) when Score >= 1006 andalso Score =< 1006 ->
    261006;
get(Score) when Score >= 1007 andalso Score =< 1007 ->
    261007;
get(Score) when Score >= 1008 andalso Score =< 1008 ->
    261008;
get(Score) when Score >= 1009 andalso Score =< 1009 ->
    261009;
get(Score) when Score >= 1010 andalso Score =< 1010 ->
    261010;
get(Score) when Score >= 1011 andalso Score =< 1011 ->
    261011;
get(Score) when Score >= 1012 andalso Score =< 1012 ->
    261012;
get(Score) when Score >= 1013 andalso Score =< 1013 ->
    261013;
get(Score) when Score >= 1014 andalso Score =< 1014 ->
    261014;
get(Score) when Score >= 1015 andalso Score =< 1015 ->
    261015;
get(Score) when Score >= 1016 andalso Score =< 1016 ->
    261016;
get(Score) when Score >= 1017 andalso Score =< 1017 ->
    261017;
get(Score) when Score >= 1018 andalso Score =< 1018 ->
    261018;
get(Score) when Score >= 1019 andalso Score =< 1019 ->
    261019;
get(Score) when Score >= 1020 andalso Score =< 1020 ->
    261020;
get(Score) when Score >= 1021 andalso Score =< 1021 ->
    261021;
get(Score) when Score >= 1022 andalso Score =< 1022 ->
    261022;
get(Score) when Score >= 1023 andalso Score =< 1023 ->
    261023;
get(Score) when Score >= 1024 andalso Score =< 1024 ->
    261024;
get(Score) when Score >= 1025 andalso Score =< 1025 ->
    261025;
get(Score) when Score >= 1026 andalso Score =< 1026 ->
    261026;
get(Score) when Score >= 1027 andalso Score =< 1027 ->
    261027;
get(Score) when Score >= 1028 andalso Score =< 1028 ->
    261028;
get(Score) when Score >= 1029 andalso Score =< 1029 ->
    261029;
get(Score) when Score >= 1030 andalso Score =< 1030 ->
    261030;
get(Score) when Score >= 1031 andalso Score =< 1031 ->
    261031;
get(Score) when Score >= 1032 andalso Score =< 1032 ->
    261032;
get(Score) when Score >= 1033 andalso Score =< 1033 ->
    261033;
get(Score) when Score >= 1034 andalso Score =< 1034 ->
    261034;
get(Score) when Score >= 1035 andalso Score =< 1035 ->
    261035;
get(Score) when Score >= 1036 andalso Score =< 1036 ->
    261036;
get(Score) when Score >= 1037 andalso Score =< 1037 ->
    261037;
get(Score) when Score >= 1038 andalso Score =< 1038 ->
    261038;
get(Score) when Score >= 1039 andalso Score =< 1039 ->
    261039;
get(Score) when Score >= 1040 andalso Score =< 1040 ->
    261040;
get(Score) when Score >= 1041 andalso Score =< 1041 ->
    261041;
get(Score) when Score >= 1042 andalso Score =< 1042 ->
    261042;
get(Score) when Score >= 1043 andalso Score =< 1043 ->
    261043;
get(Score) when Score >= 1044 andalso Score =< 1044 ->
    261044;
get(Score) when Score >= 1045 andalso Score =< 1045 ->
    261045;
get(Score) when Score >= 1046 andalso Score =< 1046 ->
    261046;
get(Score) when Score >= 1047 andalso Score =< 1047 ->
    261047;
get(Score) when Score >= 1048 andalso Score =< 1048 ->
    261048;
get(Score) when Score >= 1049 andalso Score =< 1049 ->
    261049;
get(Score) when Score >= 1050 andalso Score =< 1050 ->
    261050;
get(Score) when Score >= 1051 andalso Score =< 1051 ->
    261051;
get(Score) when Score >= 1052 andalso Score =< 1052 ->
    261052;
get(Score) when Score >= 1053 andalso Score =< 1053 ->
    261053;
get(Score) when Score >= 1054 andalso Score =< 1054 ->
    261054;
get(Score) when Score >= 1055 andalso Score =< 1055 ->
    261055;
get(Score) when Score >= 1056 andalso Score =< 1056 ->
    261056;
get(Score) when Score >= 1057 andalso Score =< 1057 ->
    261057;
get(Score) when Score >= 1058 andalso Score =< 1058 ->
    261058;
get(Score) when Score >= 1059 andalso Score =< 1059 ->
    261059;
get(Score) when Score >= 1060 andalso Score =< 1060 ->
    261060;
get(Score) when Score >= 1061 andalso Score =< 1061 ->
    261061;
get(Score) when Score >= 1062 andalso Score =< 1062 ->
    261062;
get(Score) when Score >= 1063 andalso Score =< 1063 ->
    261063;
get(Score) when Score >= 1064 andalso Score =< 1064 ->
    261064;
get(Score) when Score >= 1065 andalso Score =< 1065 ->
    261065;
get(Score) when Score >= 1066 andalso Score =< 1066 ->
    261066;
get(Score) when Score >= 1067 andalso Score =< 1067 ->
    261067;
get(Score) when Score >= 1068 andalso Score =< 1068 ->
    261068;
get(Score) when Score >= 1069 andalso Score =< 1069 ->
    261069;
get(Score) when Score >= 1070 andalso Score =< 1070 ->
    261070;
get(Score) when Score >= 1071 andalso Score =< 1071 ->
    261071;
get(Score) when Score >= 1072 andalso Score =< 1072 ->
    261072;
get(Score) when Score >= 1073 andalso Score =< 1073 ->
    261073;
get(Score) when Score >= 1074 andalso Score =< 1074 ->
    261074;
get(Score) when Score >= 1075 andalso Score =< 1075 ->
    261075;
get(Score) when Score >= 1076 andalso Score =< 1076 ->
    261076;
get(Score) when Score >= 1077 andalso Score =< 1077 ->
    261077;
get(Score) when Score >= 1078 andalso Score =< 1078 ->
    261078;
get(Score) when Score >= 1079 andalso Score =< 1079 ->
    261079;
get(Score) when Score >= 1080 andalso Score =< 1080 ->
    261080;
get(Score) when Score >= 1081 andalso Score =< 1081 ->
    261081;
get(Score) when Score >= 1082 andalso Score =< 1082 ->
    261082;
get(Score) when Score >= 1083 andalso Score =< 1083 ->
    261083;
get(Score) when Score >= 1084 andalso Score =< 1084 ->
    261084;
get(Score) when Score >= 1085 andalso Score =< 1085 ->
    261085;
get(Score) when Score >= 1086 andalso Score =< 1086 ->
    261086;
get(Score) when Score >= 1087 andalso Score =< 1087 ->
    261087;
get(Score) when Score >= 1088 andalso Score =< 1088 ->
    261088;
get(Score) when Score >= 1089 andalso Score =< 1089 ->
    261089;
get(Score) when Score >= 1090 andalso Score =< 1090 ->
    261090;
get(Score) when Score >= 1091 andalso Score =< 1091 ->
    261091;
get(Score) when Score >= 1092 andalso Score =< 1092 ->
    261092;
get(Score) when Score >= 1093 andalso Score =< 1093 ->
    261093;
get(Score) when Score >= 1094 andalso Score =< 1094 ->
    261094;
get(Score) when Score >= 1095 andalso Score =< 1095 ->
    261095;
get(Score) when Score >= 1096 andalso Score =< 1096 ->
    261096;
get(Score) when Score >= 1097 andalso Score =< 1097 ->
    261097;
get(Score) when Score >= 1098 andalso Score =< 1098 ->
    261098;
get(Score) when Score >= 1099 andalso Score =< 1099 ->
    261099;
get(Score) when Score >= 1100 andalso Score =< 1100 ->
    261100;
get(Score) when Score >= 1101 andalso Score =< 1101 ->
    261101;
get(Score) when Score >= 1102 andalso Score =< 1102 ->
    261102;
get(Score) when Score >= 1103 andalso Score =< 1103 ->
    261103;
get(Score) when Score >= 1104 andalso Score =< 1104 ->
    261104;
get(Score) when Score >= 1105 andalso Score =< 1105 ->
    261105;
get(Score) when Score >= 1106 andalso Score =< 1106 ->
    261106;
get(Score) when Score >= 1107 andalso Score =< 1107 ->
    261107;
get(Score) when Score >= 1108 andalso Score =< 1108 ->
    261108;
get(Score) when Score >= 1109 andalso Score =< 1109 ->
    261109;
get(Score) when Score >= 1110 andalso Score =< 1110 ->
    261110;
get(Score) when Score >= 1111 andalso Score =< 1111 ->
    261111;
get(Score) when Score >= 1112 andalso Score =< 1112 ->
    261112;
get(Score) when Score >= 1113 andalso Score =< 1113 ->
    261113;
get(Score) when Score >= 1114 andalso Score =< 1114 ->
    261114;
get(Score) when Score >= 1115 andalso Score =< 1115 ->
    261115;
get(Score) when Score >= 1116 andalso Score =< 1116 ->
    261116;
get(Score) when Score >= 1117 andalso Score =< 1117 ->
    261117;
get(Score) when Score >= 1118 andalso Score =< 1118 ->
    261118;
get(Score) when Score >= 1119 andalso Score =< 1119 ->
    261119;
get(Score) when Score >= 1120 andalso Score =< 1120 ->
    261120;
get(Score) when Score >= 1121 andalso Score =< 1121 ->
    261121;
get(Score) when Score >= 1122 andalso Score =< 1122 ->
    261122;
get(Score) when Score >= 1123 andalso Score =< 1123 ->
    261123;
get(Score) when Score >= 1124 andalso Score =< 1124 ->
    261124;
get(Score) when Score >= 1125 andalso Score =< 1125 ->
    261125;
get(Score) when Score >= 1126 andalso Score =< 1126 ->
    261126;
get(Score) when Score >= 1127 andalso Score =< 1127 ->
    261127;
get(Score) when Score >= 1128 andalso Score =< 1128 ->
    261128;
get(Score) when Score >= 1129 andalso Score =< 1129 ->
    261129;
get(Score) when Score >= 1130 andalso Score =< 1130 ->
    261130;
get(Score) when Score >= 1131 andalso Score =< 1131 ->
    261131;
get(Score) when Score >= 1132 andalso Score =< 1132 ->
    261132;
get(Score) when Score >= 1133 andalso Score =< 1133 ->
    261133;
get(Score) when Score >= 1134 andalso Score =< 1134 ->
    261134;
get(Score) when Score >= 1135 andalso Score =< 1135 ->
    261135;
get(Score) when Score >= 1136 andalso Score =< 1136 ->
    261136;
get(Score) when Score >= 1137 andalso Score =< 1137 ->
    261137;
get(Score) when Score >= 1138 andalso Score =< 1138 ->
    261138;
get(Score) when Score >= 1139 andalso Score =< 1139 ->
    261139;
get(Score) when Score >= 1140 andalso Score =< 1140 ->
    261140;
get(Score) when Score >= 1141 andalso Score =< 1141 ->
    261141;
get(Score) when Score >= 1142 andalso Score =< 1142 ->
    261142;
get(Score) when Score >= 1143 andalso Score =< 1143 ->
    261143;
get(Score) when Score >= 1144 andalso Score =< 1144 ->
    261144;
get(Score) when Score >= 1145 andalso Score =< 1145 ->
    261145;
get(Score) when Score >= 1146 andalso Score =< 1146 ->
    261146;
get(Score) when Score >= 1147 andalso Score =< 1147 ->
    261147;
get(Score) when Score >= 1148 andalso Score =< 1148 ->
    261148;
get(Score) when Score >= 1149 andalso Score =< 1149 ->
    261149;
get(Score) when Score >= 1150 andalso Score =< 1150 ->
    261150;
get(Score) when Score >= 1151 andalso Score =< 1151 ->
    261151;
get(Score) when Score >= 1152 andalso Score =< 1152 ->
    261152;
get(Score) when Score >= 1153 andalso Score =< 1153 ->
    261153;
get(Score) when Score >= 1154 andalso Score =< 1154 ->
    261154;
get(Score) when Score >= 1155 andalso Score =< 1155 ->
    261155;
get(Score) when Score >= 1156 andalso Score =< 1156 ->
    261156;
get(Score) when Score >= 1157 andalso Score =< 1157 ->
    261157;
get(Score) when Score >= 1158 andalso Score =< 1158 ->
    261158;
get(Score) when Score >= 1159 andalso Score =< 1159 ->
    261159;
get(Score) when Score >= 1160 andalso Score =< 1160 ->
    261160;
get(Score) when Score >= 1161 andalso Score =< 1161 ->
    261161;
get(Score) when Score >= 1162 andalso Score =< 1162 ->
    261162;
get(Score) when Score >= 1163 andalso Score =< 1163 ->
    261163;
get(Score) when Score >= 1164 andalso Score =< 1164 ->
    261164;
get(Score) when Score >= 1165 andalso Score =< 1165 ->
    261165;
get(Score) when Score >= 1166 andalso Score =< 1166 ->
    261166;
get(Score) when Score >= 1167 andalso Score =< 1167 ->
    261167;
get(Score) when Score >= 1168 andalso Score =< 1168 ->
    261168;
get(Score) when Score >= 1169 andalso Score =< 1169 ->
    261169;
get(Score) when Score >= 1170 andalso Score =< 1170 ->
    261170;
get(Score) when Score >= 1171 andalso Score =< 1171 ->
    261171;
get(Score) when Score >= 1172 andalso Score =< 1172 ->
    261172;
get(Score) when Score >= 1173 andalso Score =< 1173 ->
    261173;
get(Score) when Score >= 1174 andalso Score =< 1174 ->
    261174;
get(Score) when Score >= 1175 andalso Score =< 1175 ->
    261175;
get(Score) when Score >= 1176 andalso Score =< 1176 ->
    261176;
get(Score) when Score >= 1177 andalso Score =< 1177 ->
    261177;
get(Score) when Score >= 1178 andalso Score =< 1178 ->
    261178;
get(Score) when Score >= 1179 andalso Score =< 1179 ->
    261179;
get(Score) when Score >= 1180 andalso Score =< 1180 ->
    261180;
get(Score) when Score >= 1181 andalso Score =< 1181 ->
    261181;
get(Score) when Score >= 1182 andalso Score =< 1182 ->
    261182;
get(Score) when Score >= 1183 andalso Score =< 1183 ->
    261183;
get(Score) when Score >= 1184 andalso Score =< 1184 ->
    261184;
get(Score) when Score >= 1185 andalso Score =< 1185 ->
    261185;
get(Score) when Score >= 1186 andalso Score =< 1186 ->
    261186;
get(Score) when Score >= 1187 andalso Score =< 1187 ->
    261187;
get(Score) when Score >= 1188 andalso Score =< 1188 ->
    261188;
get(Score) when Score >= 1189 andalso Score =< 1189 ->
    261189;
get(Score) when Score >= 1190 andalso Score =< 1190 ->
    261190;
get(Score) when Score >= 1191 andalso Score =< 1191 ->
    261191;
get(Score) when Score >= 1192 andalso Score =< 1192 ->
    261192;
get(Score) when Score >= 1193 andalso Score =< 1193 ->
    261193;
get(Score) when Score >= 1194 andalso Score =< 1194 ->
    261194;
get(Score) when Score >= 1195 andalso Score =< 1195 ->
    261195;
get(Score) when Score >= 1196 andalso Score =< 1196 ->
    261196;
get(Score) when Score >= 1197 andalso Score =< 1197 ->
    261197;
get(Score) when Score >= 1198 andalso Score =< 1198 ->
    261198;
get(Score) when Score >= 1199 andalso Score =< 1199 ->
    261199;
get(Score) when Score >= 1200 andalso Score =< 1200 ->
    261200;
get(Score) when Score >= 1201 andalso Score =< 1201 ->
    261201;
get(Score) when Score >= 1202 andalso Score =< 1202 ->
    261202;
get(Score) when Score >= 1203 andalso Score =< 1203 ->
    261203;
get(Score) when Score >= 1204 andalso Score =< 1204 ->
    261204;
get(Score) when Score >= 1205 andalso Score =< 1205 ->
    261205;
get(Score) when Score >= 1206 andalso Score =< 1206 ->
    261206;
get(Score) when Score >= 1207 andalso Score =< 1207 ->
    261207;
get(Score) when Score >= 1208 andalso Score =< 1208 ->
    261208;
get(Score) when Score >= 1209 andalso Score =< 1209 ->
    261209;
get(Score) when Score >= 1210 andalso Score =< 1210 ->
    261210;
get(Score) when Score >= 1211 andalso Score =< 1211 ->
    261211;
get(Score) when Score >= 1212 andalso Score =< 1212 ->
    261212;
get(Score) when Score >= 1213 andalso Score =< 1213 ->
    261213;
get(Score) when Score >= 1214 andalso Score =< 1214 ->
    261214;
get(Score) when Score >= 1215 andalso Score =< 1215 ->
    261215;
get(Score) when Score >= 1216 andalso Score =< 1216 ->
    261216;
get(Score) when Score >= 1217 andalso Score =< 1217 ->
    261217;
get(Score) when Score >= 1218 andalso Score =< 1218 ->
    261218;
get(Score) when Score >= 1219 andalso Score =< 1219 ->
    261219;
get(Score) when Score >= 1220 andalso Score =< 1220 ->
    261220;
get(Score) when Score >= 1221 andalso Score =< 1221 ->
    261221;
get(Score) when Score >= 1222 andalso Score =< 1222 ->
    261222;
get(Score) when Score >= 1223 andalso Score =< 1223 ->
    261223;
get(Score) when Score >= 1224 andalso Score =< 1224 ->
    261224;
get(Score) when Score >= 1225 andalso Score =< 1225 ->
    261225;
get(Score) when Score >= 1226 andalso Score =< 1226 ->
    261226;
get(Score) when Score >= 1227 andalso Score =< 1227 ->
    261227;
get(Score) when Score >= 1228 andalso Score =< 1228 ->
    261228;
get(Score) when Score >= 1229 andalso Score =< 1229 ->
    261229;
get(Score) when Score >= 1230 andalso Score =< 1230 ->
    261230;
get(Score) when Score >= 1231 andalso Score =< 1231 ->
    261231;
get(Score) when Score >= 1232 andalso Score =< 1232 ->
    261232;
get(Score) when Score >= 1233 andalso Score =< 1233 ->
    261233;
get(Score) when Score >= 1234 andalso Score =< 1234 ->
    261234;
get(Score) when Score >= 1235 andalso Score =< 1235 ->
    261235;
get(Score) when Score >= 1236 andalso Score =< 1236 ->
    261236;
get(Score) when Score >= 1237 andalso Score =< 1237 ->
    261237;
get(Score) when Score >= 1238 andalso Score =< 1238 ->
    261238;
get(Score) when Score >= 1239 andalso Score =< 1239 ->
    261239;
get(Score) when Score >= 1240 andalso Score =< 1240 ->
    261240;
get(Score) when Score >= 1241 andalso Score =< 1241 ->
    261241;
get(Score) when Score >= 1242 andalso Score =< 1242 ->
    261242;
get(Score) when Score >= 1243 andalso Score =< 1243 ->
    261243;
get(Score) when Score >= 1244 andalso Score =< 1244 ->
    261244;
get(Score) when Score >= 1245 andalso Score =< 1245 ->
    261245;
get(Score) when Score >= 1246 andalso Score =< 1246 ->
    261246;
get(Score) when Score >= 1247 andalso Score =< 1247 ->
    261247;
get(Score) when Score >= 1248 andalso Score =< 1248 ->
    261248;
get(Score) when Score >= 1249 andalso Score =< 1249 ->
    261249;
get(Score) when Score >= 1250 andalso Score =< 1250 ->
    261250;
get(Score) when Score >= 1251 andalso Score =< 1251 ->
    261251;
get(Score) when Score >= 1252 andalso Score =< 1252 ->
    261252;
get(Score) when Score >= 1253 andalso Score =< 1253 ->
    261253;
get(Score) when Score >= 1254 andalso Score =< 1254 ->
    261254;
get(Score) when Score >= 1255 andalso Score =< 1255 ->
    261255;
get(Score) when Score >= 1256 andalso Score =< 1256 ->
    261256;
get(Score) when Score >= 1257 andalso Score =< 1257 ->
    261257;
get(Score) when Score >= 1258 andalso Score =< 1258 ->
    261258;
get(Score) when Score >= 1259 andalso Score =< 1259 ->
    261259;
get(Score) when Score >= 1260 andalso Score =< 1260 ->
    261260;
get(Score) when Score >= 1261 andalso Score =< 1261 ->
    261261;
get(Score) when Score >= 1262 andalso Score =< 1262 ->
    261262;
get(Score) when Score >= 1263 andalso Score =< 1263 ->
    261263;
get(Score) when Score >= 1264 andalso Score =< 1264 ->
    261264;
get(Score) when Score >= 1265 andalso Score =< 1265 ->
    261265;
get(Score) when Score >= 1266 andalso Score =< 1266 ->
    261266;
get(Score) when Score >= 1267 andalso Score =< 1267 ->
    261267;
get(Score) when Score >= 1268 andalso Score =< 1268 ->
    261268;
get(Score) when Score >= 1269 andalso Score =< 1269 ->
    261269;
get(Score) when Score >= 1270 andalso Score =< 1270 ->
    261270;
get(Score) when Score >= 1271 andalso Score =< 1271 ->
    261271;
get(Score) when Score >= 1272 andalso Score =< 1272 ->
    261272;
get(Score) when Score >= 1273 andalso Score =< 1273 ->
    261273;
get(Score) when Score >= 1274 andalso Score =< 1274 ->
    261274;
get(Score) when Score >= 1275 andalso Score =< 1275 ->
    261275;
get(Score) when Score >= 1276 andalso Score =< 1276 ->
    261276;
get(Score) when Score >= 1277 andalso Score =< 1277 ->
    261277;
get(Score) when Score >= 1278 andalso Score =< 1278 ->
    261278;
get(Score) when Score >= 1279 andalso Score =< 1279 ->
    261279;
get(Score) when Score >= 1280 andalso Score =< 1280 ->
    261280;
get(Score) when Score >= 1281 andalso Score =< 1281 ->
    261281;
get(Score) when Score >= 1282 andalso Score =< 1282 ->
    261282;
get(Score) when Score >= 1283 andalso Score =< 1283 ->
    261283;
get(Score) when Score >= 1284 andalso Score =< 1284 ->
    261284;
get(Score) when Score >= 1285 andalso Score =< 1285 ->
    261285;
get(Score) when Score >= 1286 andalso Score =< 1286 ->
    261286;
get(Score) when Score >= 1287 andalso Score =< 1287 ->
    261287;
get(Score) when Score >= 1288 andalso Score =< 1288 ->
    261288;
get(Score) when Score >= 1289 andalso Score =< 1289 ->
    261289;
get(Score) when Score >= 1290 andalso Score =< 1290 ->
    261290;
get(Score) when Score >= 1291 andalso Score =< 1291 ->
    261291;
get(Score) when Score >= 1292 andalso Score =< 1292 ->
    261292;
get(Score) when Score >= 1293 andalso Score =< 1293 ->
    261293;
get(Score) when Score >= 1294 andalso Score =< 1294 ->
    261294;
get(Score) when Score >= 1295 andalso Score =< 1295 ->
    261295;
get(Score) when Score >= 1296 andalso Score =< 1296 ->
    261296;
get(Score) when Score >= 1297 andalso Score =< 1297 ->
    261297;
get(Score) when Score >= 1298 andalso Score =< 1298 ->
    261298;
get(Score) when Score >= 1299 andalso Score =< 1299 ->
    261299;
get(Score) when Score >= 1300 andalso Score =< 1300 ->
    261300;
get(Score) when Score >= 1301 andalso Score =< 1301 ->
    261301;
get(Score) when Score >= 1302 andalso Score =< 1302 ->
    261302;
get(Score) when Score >= 1303 andalso Score =< 1303 ->
    261303;
get(Score) when Score >= 1304 andalso Score =< 1304 ->
    261304;
get(Score) when Score >= 1305 andalso Score =< 1305 ->
    261305;
get(Score) when Score >= 1306 andalso Score =< 1306 ->
    261306;
get(Score) when Score >= 1307 andalso Score =< 1307 ->
    261307;
get(Score) when Score >= 1308 andalso Score =< 1308 ->
    261308;
get(Score) when Score >= 1309 andalso Score =< 1309 ->
    261309;
get(Score) when Score >= 1310 andalso Score =< 1310 ->
    261310;
get(Score) when Score >= 1311 andalso Score =< 1311 ->
    261311;
get(Score) when Score >= 1312 andalso Score =< 1312 ->
    261312;
get(Score) when Score >= 1313 andalso Score =< 1313 ->
    261313;
get(Score) when Score >= 1314 andalso Score =< 1314 ->
    261314;
get(Score) when Score >= 1315 andalso Score =< 1315 ->
    261315;
get(Score) when Score >= 1316 andalso Score =< 1316 ->
    261316;
get(Score) when Score >= 1317 andalso Score =< 1317 ->
    261317;
get(Score) when Score >= 1318 andalso Score =< 1318 ->
    261318;
get(Score) when Score >= 1319 andalso Score =< 1319 ->
    261319;
get(Score) when Score >= 1320 andalso Score =< 1320 ->
    261320;
get(Score) when Score >= 1321 andalso Score =< 1321 ->
    261321;
get(Score) when Score >= 1322 andalso Score =< 1322 ->
    261322;
get(Score) when Score >= 1323 andalso Score =< 1323 ->
    261323;
get(Score) when Score >= 1324 andalso Score =< 1324 ->
    261324;
get(Score) when Score >= 1325 andalso Score =< 1325 ->
    261325;
get(Score) when Score >= 1326 andalso Score =< 1326 ->
    261326;
get(Score) when Score >= 1327 andalso Score =< 1327 ->
    261327;
get(Score) when Score >= 1328 andalso Score =< 1328 ->
    261328;
get(Score) when Score >= 1329 andalso Score =< 1329 ->
    261329;
get(Score) when Score >= 1330 andalso Score =< 1330 ->
    261330;
get(Score) when Score >= 1331 andalso Score =< 1331 ->
    261331;
get(Score) when Score >= 1332 andalso Score =< 1332 ->
    261332;
get(Score) when Score >= 1333 andalso Score =< 1333 ->
    261333;
get(Score) when Score >= 1334 andalso Score =< 1334 ->
    261334;
get(Score) when Score >= 1335 andalso Score =< 1335 ->
    261335;
get(Score) when Score >= 1336 andalso Score =< 1336 ->
    261336;
get(Score) when Score >= 1337 andalso Score =< 1337 ->
    261337;
get(Score) when Score >= 1338 andalso Score =< 1338 ->
    261338;
get(Score) when Score >= 1339 andalso Score =< 1339 ->
    261339;
get(Score) when Score >= 1340 andalso Score =< 1340 ->
    261340;
get(Score) when Score >= 1341 andalso Score =< 1341 ->
    261341;
get(Score) when Score >= 1342 andalso Score =< 1342 ->
    261342;
get(Score) when Score >= 1343 andalso Score =< 1343 ->
    261343;
get(Score) when Score >= 1344 andalso Score =< 1344 ->
    261344;
get(Score) when Score >= 1345 andalso Score =< 1345 ->
    261345;
get(Score) when Score >= 1346 andalso Score =< 1346 ->
    261346;
get(Score) when Score >= 1347 andalso Score =< 1347 ->
    261347;
get(Score) when Score >= 1348 andalso Score =< 1348 ->
    261348;
get(Score) when Score >= 1349 andalso Score =< 1349 ->
    261349;
get(Score) when Score >= 1350 andalso Score =< 1350 ->
    261350;
get(Score) when Score >= 1351 andalso Score =< 1351 ->
    261351;
get(Score) when Score >= 1352 andalso Score =< 1352 ->
    261352;
get(Score) when Score >= 1353 andalso Score =< 1353 ->
    261353;
get(Score) when Score >= 1354 andalso Score =< 1354 ->
    261354;
get(Score) when Score >= 1355 andalso Score =< 1355 ->
    261355;
get(Score) when Score >= 1356 andalso Score =< 1356 ->
    261356;
get(Score) when Score >= 1357 andalso Score =< 1357 ->
    261357;
get(Score) when Score >= 1358 andalso Score =< 1358 ->
    261358;
get(Score) when Score >= 1359 andalso Score =< 1359 ->
    261359;
get(Score) when Score >= 1360 andalso Score =< 1360 ->
    261360;
get(Score) when Score >= 1361 andalso Score =< 1361 ->
    261361;
get(Score) when Score >= 1362 andalso Score =< 1362 ->
    261362;
get(Score) when Score >= 1363 andalso Score =< 1363 ->
    261363;
get(Score) when Score >= 1364 andalso Score =< 1364 ->
    261364;
get(Score) when Score >= 1365 andalso Score =< 1365 ->
    261365;
get(Score) when Score >= 1366 andalso Score =< 1366 ->
    261366;
get(Score) when Score >= 1367 andalso Score =< 1367 ->
    261367;
get(Score) when Score >= 1368 andalso Score =< 1368 ->
    261368;
get(Score) when Score >= 1369 andalso Score =< 1369 ->
    261369;
get(Score) when Score >= 1370 andalso Score =< 1370 ->
    261370;
get(Score) when Score >= 1371 andalso Score =< 1371 ->
    261371;
get(Score) when Score >= 1372 andalso Score =< 1372 ->
    261372;
get(Score) when Score >= 1373 andalso Score =< 1373 ->
    261373;
get(Score) when Score >= 1374 andalso Score =< 1374 ->
    261374;
get(Score) when Score >= 1375 andalso Score =< 1375 ->
    261375;
get(Score) when Score >= 1376 andalso Score =< 1376 ->
    261376;
get(Score) when Score >= 1377 andalso Score =< 1377 ->
    261377;
get(Score) when Score >= 1378 andalso Score =< 1378 ->
    261378;
get(Score) when Score >= 1379 andalso Score =< 1379 ->
    261379;
get(Score) when Score >= 1380 andalso Score =< 1380 ->
    261380;
get(Score) when Score >= 1381 andalso Score =< 1381 ->
    261381;
get(Score) when Score >= 1382 andalso Score =< 1382 ->
    261382;
get(Score) when Score >= 1383 andalso Score =< 1383 ->
    261383;
get(Score) when Score >= 1384 andalso Score =< 1384 ->
    261384;
get(Score) when Score >= 1385 andalso Score =< 1385 ->
    261385;
get(Score) when Score >= 1386 andalso Score =< 1386 ->
    261386;
get(Score) when Score >= 1387 andalso Score =< 1387 ->
    261387;
get(Score) when Score >= 1388 andalso Score =< 1388 ->
    261388;
get(Score) when Score >= 1389 andalso Score =< 1389 ->
    261389;
get(Score) when Score >= 1390 andalso Score =< 1390 ->
    261390;
get(Score) when Score >= 1391 andalso Score =< 1391 ->
    261391;
get(Score) when Score >= 1392 andalso Score =< 1392 ->
    261392;
get(Score) when Score >= 1393 andalso Score =< 1393 ->
    261393;
get(Score) when Score >= 1394 andalso Score =< 1394 ->
    261394;
get(Score) when Score >= 1395 andalso Score =< 1395 ->
    261395;
get(Score) when Score >= 1396 andalso Score =< 1396 ->
    261396;
get(Score) when Score >= 1397 andalso Score =< 1397 ->
    261397;
get(Score) when Score >= 1398 andalso Score =< 1398 ->
    261398;
get(Score) when Score >= 1399 andalso Score =< 1399 ->
    261399;
get(Score) when Score >= 1400 andalso Score =< 1400 ->
    261400;
get(Score) when Score >= 1401 andalso Score =< 1401 ->
    261401;
get(Score) when Score >= 1402 andalso Score =< 1402 ->
    261402;
get(Score) when Score >= 1403 andalso Score =< 1403 ->
    261403;
get(Score) when Score >= 1404 andalso Score =< 1404 ->
    261404;
get(Score) when Score >= 1405 andalso Score =< 1405 ->
    261405;
get(Score) when Score >= 1406 andalso Score =< 1406 ->
    261406;
get(Score) when Score >= 1407 andalso Score =< 1407 ->
    261407;
get(Score) when Score >= 1408 andalso Score =< 1408 ->
    261408;
get(Score) when Score >= 1409 andalso Score =< 1409 ->
    261409;
get(Score) when Score >= 1410 andalso Score =< 1410 ->
    261410;
get(Score) when Score >= 1411 andalso Score =< 1411 ->
    261411;
get(Score) when Score >= 1412 andalso Score =< 1412 ->
    261412;
get(Score) when Score >= 1413 andalso Score =< 1413 ->
    261413;
get(Score) when Score >= 1414 andalso Score =< 1414 ->
    261414;
get(Score) when Score >= 1415 andalso Score =< 1415 ->
    261415;
get(Score) when Score >= 1416 andalso Score =< 1416 ->
    261416;
get(Score) when Score >= 1417 andalso Score =< 1417 ->
    261417;
get(Score) when Score >= 1418 andalso Score =< 1418 ->
    261418;
get(Score) when Score >= 1419 andalso Score =< 1419 ->
    261419;
get(Score) when Score >= 1420 andalso Score =< 1420 ->
    261420;
get(Score) when Score >= 1421 andalso Score =< 1421 ->
    261421;
get(Score) when Score >= 1422 andalso Score =< 1422 ->
    261422;
get(Score) when Score >= 1423 andalso Score =< 1423 ->
    261423;
get(Score) when Score >= 1424 andalso Score =< 1424 ->
    261424;
get(Score) when Score >= 1425 andalso Score =< 1425 ->
    261425;
get(Score) when Score >= 1426 andalso Score =< 1426 ->
    261426;
get(Score) when Score >= 1427 andalso Score =< 1427 ->
    261427;
get(Score) when Score >= 1428 andalso Score =< 1428 ->
    261428;
get(Score) when Score >= 1429 andalso Score =< 1429 ->
    261429;
get(Score) when Score >= 1430 andalso Score =< 1430 ->
    261430;
get(Score) when Score >= 1431 andalso Score =< 1431 ->
    261431;
get(Score) when Score >= 1432 andalso Score =< 1432 ->
    261432;
get(Score) when Score >= 1433 andalso Score =< 1433 ->
    261433;
get(Score) when Score >= 1434 andalso Score =< 1434 ->
    261434;
get(Score) when Score >= 1435 andalso Score =< 1435 ->
    261435;
get(Score) when Score >= 1436 andalso Score =< 1436 ->
    261436;
get(Score) when Score >= 1437 andalso Score =< 1437 ->
    261437;
get(Score) when Score >= 1438 andalso Score =< 1438 ->
    261438;
get(Score) when Score >= 1439 andalso Score =< 1439 ->
    261439;
get(Score) when Score >= 1440 andalso Score =< 1440 ->
    261440;
get(Score) when Score >= 1441 andalso Score =< 1441 ->
    261441;
get(Score) when Score >= 1442 andalso Score =< 1442 ->
    261442;
get(Score) when Score >= 1443 andalso Score =< 1443 ->
    261443;
get(Score) when Score >= 1444 andalso Score =< 1444 ->
    261444;
get(Score) when Score >= 1445 andalso Score =< 1445 ->
    261445;
get(Score) when Score >= 1446 andalso Score =< 1446 ->
    261446;
get(Score) when Score >= 1447 andalso Score =< 1447 ->
    261447;
get(Score) when Score >= 1448 andalso Score =< 1448 ->
    261448;
get(Score) when Score >= 1449 andalso Score =< 1449 ->
    261449;
get(Score) when Score >= 1450 andalso Score =< 1450 ->
    261450;
get(Score) when Score >= 1451 andalso Score =< 1451 ->
    261451;
get(Score) when Score >= 1452 andalso Score =< 1452 ->
    261452;
get(Score) when Score >= 1453 andalso Score =< 1453 ->
    261453;
get(Score) when Score >= 1454 andalso Score =< 1454 ->
    261454;
get(Score) when Score >= 1455 andalso Score =< 1455 ->
    261455;
get(Score) when Score >= 1456 andalso Score =< 1456 ->
    261456;
get(Score) when Score >= 1457 andalso Score =< 1457 ->
    261457;
get(Score) when Score >= 1458 andalso Score =< 1458 ->
    261458;
get(Score) when Score >= 1459 andalso Score =< 1459 ->
    261459;
get(Score) when Score >= 1460 andalso Score =< 1460 ->
    261460;
get(Score) when Score >= 1461 andalso Score =< 1461 ->
    261461;
get(Score) when Score >= 1462 andalso Score =< 1462 ->
    261462;
get(Score) when Score >= 1463 andalso Score =< 1463 ->
    261463;
get(Score) when Score >= 1464 andalso Score =< 1464 ->
    261464;
get(Score) when Score >= 1465 andalso Score =< 1465 ->
    261465;
get(Score) when Score >= 1466 andalso Score =< 1466 ->
    261466;
get(Score) when Score >= 1467 andalso Score =< 1467 ->
    261467;
get(Score) when Score >= 1468 andalso Score =< 1468 ->
    261468;
get(Score) when Score >= 1469 andalso Score =< 1469 ->
    261469;
get(Score) when Score >= 1470 andalso Score =< 1470 ->
    261470;
get(Score) when Score >= 1471 andalso Score =< 1471 ->
    261471;
get(Score) when Score >= 1472 andalso Score =< 1472 ->
    261472;
get(Score) when Score >= 1473 andalso Score =< 1473 ->
    261473;
get(Score) when Score >= 1474 andalso Score =< 1474 ->
    261474;
get(Score) when Score >= 1475 andalso Score =< 1475 ->
    261475;
get(Score) when Score >= 1476 andalso Score =< 1476 ->
    261476;
get(Score) when Score >= 1477 andalso Score =< 1477 ->
    261477;
get(Score) when Score >= 1478 andalso Score =< 1478 ->
    261478;
get(Score) when Score >= 1479 andalso Score =< 1479 ->
    261479;
get(Score) when Score >= 1480 andalso Score =< 1480 ->
    261480;
get(Score) when Score >= 1481 andalso Score =< 1481 ->
    261481;
get(Score) when Score >= 1482 andalso Score =< 1482 ->
    261482;
get(Score) when Score >= 1483 andalso Score =< 1483 ->
    261483;
get(Score) when Score >= 1484 andalso Score =< 1484 ->
    261484;
get(Score) when Score >= 1485 andalso Score =< 1485 ->
    261485;
get(Score) when Score >= 1486 andalso Score =< 1486 ->
    261486;
get(Score) when Score >= 1487 andalso Score =< 1487 ->
    261487;
get(Score) when Score >= 1488 andalso Score =< 1488 ->
    261488;
get(Score) when Score >= 1489 andalso Score =< 1489 ->
    261489;
get(Score) when Score >= 1490 andalso Score =< 1490 ->
    261490;
get(Score) when Score >= 1491 andalso Score =< 1491 ->
    261491;
get(Score) when Score >= 1492 andalso Score =< 1492 ->
    261492;
get(Score) when Score >= 1493 andalso Score =< 1493 ->
    261493;
get(Score) when Score >= 1494 andalso Score =< 1494 ->
    261494;
get(Score) when Score >= 1495 andalso Score =< 1495 ->
    261495;
get(Score) when Score >= 1496 andalso Score =< 1496 ->
    261496;
get(Score) when Score >= 1497 andalso Score =< 1497 ->
    261497;
get(Score) when Score >= 1498 andalso Score =< 1498 ->
    261498;
get(Score) when Score >= 1499 andalso Score =< 1499 ->
    261499;
get(Score) when Score >= 1500 andalso Score =< 1500 ->
    261500;
get(Score) when Score >= 1501 andalso Score =< 1501 ->
    261501;
get(Score) when Score >= 1502 andalso Score =< 1502 ->
    261502;
get(Score) when Score >= 1503 andalso Score =< 1503 ->
    261503;
get(Score) when Score >= 1504 andalso Score =< 1504 ->
    261504;
get(Score) when Score >= 1505 andalso Score =< 1505 ->
    261505;
get(Score) when Score >= 1506 andalso Score =< 1506 ->
    261506;
get(Score) when Score >= 1507 andalso Score =< 1507 ->
    261507;
get(Score) when Score >= 1508 andalso Score =< 1508 ->
    261508;
get(Score) when Score >= 1509 andalso Score =< 1509 ->
    261509;
get(Score) when Score >= 1510 andalso Score =< 1510 ->
    261510;
get(Score) when Score >= 1511 andalso Score =< 1511 ->
    261511;
get(Score) when Score >= 1512 andalso Score =< 1512 ->
    261512;
get(Score) when Score >= 1513 andalso Score =< 1513 ->
    261513;
get(Score) when Score >= 1514 andalso Score =< 1514 ->
    261514;
get(Score) when Score >= 1515 andalso Score =< 1515 ->
    261515;
get(Score) when Score >= 1516 andalso Score =< 1516 ->
    261516;
get(Score) when Score >= 1517 andalso Score =< 1517 ->
    261517;
get(Score) when Score >= 1518 andalso Score =< 1518 ->
    261518;
get(Score) when Score >= 1519 andalso Score =< 1519 ->
    261519;
get(Score) when Score >= 1520 andalso Score =< 1520 ->
    261520;
get(Score) when Score >= 1521 andalso Score =< 1521 ->
    261521;
get(Score) when Score >= 1522 andalso Score =< 1522 ->
    261522;
get(Score) when Score >= 1523 andalso Score =< 1523 ->
    261523;
get(Score) when Score >= 1524 andalso Score =< 1524 ->
    261524;
get(Score) when Score >= 1525 andalso Score =< 1525 ->
    261525;
get(Score) when Score >= 1526 andalso Score =< 1526 ->
    261526;
get(Score) when Score >= 1527 andalso Score =< 1527 ->
    261527;
get(Score) when Score >= 1528 andalso Score =< 1528 ->
    261528;
get(Score) when Score >= 1529 andalso Score =< 1529 ->
    261529;
get(Score) when Score >= 1530 andalso Score =< 1530 ->
    261530;
get(Score) when Score >= 1531 andalso Score =< 1531 ->
    261531;
get(Score) when Score >= 1532 andalso Score =< 1532 ->
    261532;
get(Score) when Score >= 1533 andalso Score =< 1533 ->
    261533;
get(Score) when Score >= 1534 andalso Score =< 1534 ->
    261534;
get(Score) when Score >= 1535 andalso Score =< 1535 ->
    261535;
get(Score) when Score >= 1536 andalso Score =< 1536 ->
    261536;
get(Score) when Score >= 1537 andalso Score =< 1537 ->
    261537;
get(Score) when Score >= 1538 andalso Score =< 1538 ->
    261538;
get(Score) when Score >= 1539 andalso Score =< 1539 ->
    261539;
get(Score) when Score >= 1540 andalso Score =< 1540 ->
    261540;
get(Score) when Score >= 1541 andalso Score =< 1541 ->
    261541;
get(Score) when Score >= 1542 andalso Score =< 1542 ->
    261542;
get(Score) when Score >= 1543 andalso Score =< 1543 ->
    261543;
get(Score) when Score >= 1544 andalso Score =< 1544 ->
    261544;
get(Score) when Score >= 1545 andalso Score =< 1545 ->
    261545;
get(Score) when Score >= 1546 andalso Score =< 1546 ->
    261546;
get(Score) when Score >= 1547 andalso Score =< 1547 ->
    261547;
get(Score) when Score >= 1548 andalso Score =< 1548 ->
    261548;
get(Score) when Score >= 1549 andalso Score =< 1549 ->
    261549;
get(Score) when Score >= 1550 andalso Score =< 1550 ->
    261550;
get(Score) when Score >= 1551 andalso Score =< 1551 ->
    261551;
get(Score) when Score >= 1552 andalso Score =< 1552 ->
    261552;
get(Score) when Score >= 1553 andalso Score =< 1553 ->
    261553;
get(Score) when Score >= 1554 andalso Score =< 1554 ->
    261554;
get(Score) when Score >= 1555 andalso Score =< 1555 ->
    261555;
get(Score) when Score >= 1556 andalso Score =< 1556 ->
    261556;
get(Score) when Score >= 1557 andalso Score =< 1557 ->
    261557;
get(Score) when Score >= 1558 andalso Score =< 1558 ->
    261558;
get(Score) when Score >= 1559 andalso Score =< 1559 ->
    261559;
get(Score) when Score >= 1560 andalso Score =< 1560 ->
    261560;
get(Score) when Score >= 1561 andalso Score =< 1561 ->
    261561;
get(Score) when Score >= 1562 andalso Score =< 1562 ->
    261562;
get(Score) when Score >= 1563 andalso Score =< 1563 ->
    261563;
get(Score) when Score >= 1564 andalso Score =< 1564 ->
    261564;
get(Score) when Score >= 1565 andalso Score =< 1565 ->
    261565;
get(Score) when Score >= 1566 andalso Score =< 1566 ->
    261566;
get(Score) when Score >= 1567 andalso Score =< 1567 ->
    261567;
get(Score) when Score >= 1568 andalso Score =< 1568 ->
    261568;
get(Score) when Score >= 1569 andalso Score =< 1569 ->
    261569;
get(Score) when Score >= 1570 andalso Score =< 1570 ->
    261570;
get(Score) when Score >= 1571 andalso Score =< 1571 ->
    261571;
get(Score) when Score >= 1572 andalso Score =< 1572 ->
    261572;
get(Score) when Score >= 1573 andalso Score =< 1573 ->
    261573;
get(Score) when Score >= 1574 andalso Score =< 1574 ->
    261574;
get(Score) when Score >= 1575 andalso Score =< 1575 ->
    261575;
get(Score) when Score >= 1576 andalso Score =< 1576 ->
    261576;
get(Score) when Score >= 1577 andalso Score =< 1577 ->
    261577;
get(Score) when Score >= 1578 andalso Score =< 1578 ->
    261578;
get(Score) when Score >= 1579 andalso Score =< 1579 ->
    261579;
get(Score) when Score >= 1580 andalso Score =< 1580 ->
    261580;
get(Score) when Score >= 1581 andalso Score =< 1581 ->
    261581;
get(Score) when Score >= 1582 andalso Score =< 1582 ->
    261582;
get(Score) when Score >= 1583 andalso Score =< 1583 ->
    261583;
get(Score) when Score >= 1584 andalso Score =< 1584 ->
    261584;
get(Score) when Score >= 1585 andalso Score =< 1585 ->
    261585;
get(Score) when Score >= 1586 andalso Score =< 1586 ->
    261586;
get(Score) when Score >= 1587 andalso Score =< 1587 ->
    261587;
get(Score) when Score >= 1588 andalso Score =< 1588 ->
    261588;
get(Score) when Score >= 1589 andalso Score =< 1589 ->
    261589;
get(Score) when Score >= 1590 andalso Score =< 1590 ->
    261590;
get(Score) when Score >= 1591 andalso Score =< 1591 ->
    261591;
get(Score) when Score >= 1592 andalso Score =< 1592 ->
    261592;
get(Score) when Score >= 1593 andalso Score =< 1593 ->
    261593;
get(Score) when Score >= 1594 andalso Score =< 1594 ->
    261594;
get(Score) when Score >= 1595 andalso Score =< 1595 ->
    261595;
get(Score) when Score >= 1596 andalso Score =< 1596 ->
    261596;
get(Score) when Score >= 1597 andalso Score =< 1597 ->
    261597;
get(Score) when Score >= 1598 andalso Score =< 1598 ->
    261598;
get(Score) when Score >= 1599 andalso Score =< 1599 ->
    261599;
get(Score) when Score >= 1600 andalso Score =< 1600 ->
    261600;
get(Score) when Score >= 1601 andalso Score =< 1601 ->
    261601;
get(Score) when Score >= 1602 andalso Score =< 1602 ->
    261602;
get(Score) when Score >= 1603 andalso Score =< 1603 ->
    261603;
get(Score) when Score >= 1604 andalso Score =< 1604 ->
    261604;
get(Score) when Score >= 1605 andalso Score =< 1605 ->
    261605;
get(Score) when Score >= 1606 andalso Score =< 1606 ->
    261606;
get(Score) when Score >= 1607 andalso Score =< 1607 ->
    261607;
get(Score) when Score >= 1608 andalso Score =< 1608 ->
    261608;
get(Score) when Score >= 1609 andalso Score =< 1609 ->
    261609;
get(Score) when Score >= 1610 andalso Score =< 1610 ->
    261610;
get(Score) when Score >= 1611 andalso Score =< 1611 ->
    261611;
get(Score) when Score >= 1612 andalso Score =< 1612 ->
    261612;
get(Score) when Score >= 1613 andalso Score =< 1613 ->
    261613;
get(Score) when Score >= 1614 andalso Score =< 1614 ->
    261614;
get(Score) when Score >= 1615 andalso Score =< 1615 ->
    261615;
get(Score) when Score >= 1616 andalso Score =< 1616 ->
    261616;
get(Score) when Score >= 1617 andalso Score =< 1617 ->
    261617;
get(Score) when Score >= 1618 andalso Score =< 1618 ->
    261618;
get(Score) when Score >= 1619 andalso Score =< 1619 ->
    261619;
get(Score) when Score >= 1620 andalso Score =< 1620 ->
    261620;
get(Score) when Score >= 1621 andalso Score =< 1621 ->
    261621;
get(Score) when Score >= 1622 andalso Score =< 1622 ->
    261622;
get(Score) when Score >= 1623 andalso Score =< 1623 ->
    261623;
get(Score) when Score >= 1624 andalso Score =< 1624 ->
    261624;
get(Score) when Score >= 1625 andalso Score =< 1625 ->
    261625;
get(Score) when Score >= 1626 andalso Score =< 1626 ->
    261626;
get(Score) when Score >= 1627 andalso Score =< 1627 ->
    261627;
get(Score) when Score >= 1628 andalso Score =< 1628 ->
    261628;
get(Score) when Score >= 1629 andalso Score =< 1629 ->
    261629;
get(Score) when Score >= 1630 andalso Score =< 1630 ->
    261630;
get(Score) when Score >= 1631 andalso Score =< 1631 ->
    261631;
get(Score) when Score >= 1632 andalso Score =< 1632 ->
    261632;
get(Score) when Score >= 1633 andalso Score =< 1633 ->
    261633;
get(Score) when Score >= 1634 andalso Score =< 1634 ->
    261634;
get(Score) when Score >= 1635 andalso Score =< 1635 ->
    261635;
get(Score) when Score >= 1636 andalso Score =< 1636 ->
    261636;
get(Score) when Score >= 1637 andalso Score =< 1637 ->
    261637;
get(Score) when Score >= 1638 andalso Score =< 1638 ->
    261638;
get(Score) when Score >= 1639 andalso Score =< 1639 ->
    261639;
get(Score) when Score >= 1640 andalso Score =< 1640 ->
    261640;
get(Score) when Score >= 1641 andalso Score =< 1641 ->
    261641;
get(Score) when Score >= 1642 andalso Score =< 1642 ->
    261642;
get(Score) when Score >= 1643 andalso Score =< 1643 ->
    261643;
get(Score) when Score >= 1644 andalso Score =< 1644 ->
    261644;
get(Score) when Score >= 1645 andalso Score =< 1645 ->
    261645;
get(Score) when Score >= 1646 andalso Score =< 1646 ->
    261646;
get(Score) when Score >= 1647 andalso Score =< 1647 ->
    261647;
get(Score) when Score >= 1648 andalso Score =< 1648 ->
    261648;
get(Score) when Score >= 1649 andalso Score =< 1649 ->
    261649;
get(Score) when Score >= 1650 andalso Score =< 1650 ->
    261650;
get(Score) when Score >= 1651 andalso Score =< 1651 ->
    261651;
get(Score) when Score >= 1652 andalso Score =< 1652 ->
    261652;
get(Score) when Score >= 1653 andalso Score =< 1653 ->
    261653;
get(Score) when Score >= 1654 andalso Score =< 1654 ->
    261654;
get(Score) when Score >= 1655 andalso Score =< 1655 ->
    261655;
get(Score) when Score >= 1656 andalso Score =< 1656 ->
    261656;
get(Score) when Score >= 1657 andalso Score =< 1657 ->
    261657;
get(Score) when Score >= 1658 andalso Score =< 1658 ->
    261658;
get(Score) when Score >= 1659 andalso Score =< 1659 ->
    261659;
get(Score) when Score >= 1660 andalso Score =< 1660 ->
    261660;
get(Score) when Score >= 1661 andalso Score =< 1661 ->
    261661;
get(Score) when Score >= 1662 andalso Score =< 1662 ->
    261662;
get(Score) when Score >= 1663 andalso Score =< 1663 ->
    261663;
get(Score) when Score >= 1664 andalso Score =< 1664 ->
    261664;
get(Score) when Score >= 1665 andalso Score =< 1665 ->
    261665;
get(Score) when Score >= 1666 andalso Score =< 1666 ->
    261666;
get(Score) when Score >= 1667 andalso Score =< 1667 ->
    261667;
get(Score) when Score >= 1668 andalso Score =< 1668 ->
    261668;
get(Score) when Score >= 1669 andalso Score =< 1669 ->
    261669;
get(Score) when Score >= 1670 andalso Score =< 1670 ->
    261670;
get(Score) when Score >= 1671 andalso Score =< 1671 ->
    261671;
get(Score) when Score >= 1672 andalso Score =< 1672 ->
    261672;
get(Score) when Score >= 1673 andalso Score =< 1673 ->
    261673;
get(Score) when Score >= 1674 andalso Score =< 1674 ->
    261674;
get(Score) when Score >= 1675 andalso Score =< 1675 ->
    261675;
get(Score) when Score >= 1676 andalso Score =< 1676 ->
    261676;
get(Score) when Score >= 1677 andalso Score =< 1677 ->
    261677;
get(Score) when Score >= 1678 andalso Score =< 1678 ->
    261678;
get(Score) when Score >= 1679 andalso Score =< 1679 ->
    261679;
get(Score) when Score >= 1680 andalso Score =< 1680 ->
    261680;
get(Score) when Score >= 1681 andalso Score =< 1681 ->
    261681;
get(Score) when Score >= 1682 andalso Score =< 1682 ->
    261682;
get(Score) when Score >= 1683 andalso Score =< 1683 ->
    261683;
get(Score) when Score >= 1684 andalso Score =< 1684 ->
    261684;
get(Score) when Score >= 1685 andalso Score =< 1685 ->
    261685;
get(Score) when Score >= 1686 andalso Score =< 1686 ->
    261686;
get(Score) when Score >= 1687 andalso Score =< 1687 ->
    261687;
get(Score) when Score >= 1688 andalso Score =< 1688 ->
    261688;
get(Score) when Score >= 1689 andalso Score =< 1689 ->
    261689;
get(Score) when Score >= 1690 andalso Score =< 1690 ->
    261690;
get(Score) when Score >= 1691 andalso Score =< 1691 ->
    261691;
get(Score) when Score >= 1692 andalso Score =< 1692 ->
    261692;
get(Score) when Score >= 1693 andalso Score =< 1693 ->
    261693;
get(Score) when Score >= 1694 andalso Score =< 1694 ->
    261694;
get(Score) when Score >= 1695 andalso Score =< 1695 ->
    261695;
get(Score) when Score >= 1696 andalso Score =< 1696 ->
    261696;
get(Score) when Score >= 1697 andalso Score =< 1697 ->
    261697;
get(Score) when Score >= 1698 andalso Score =< 1698 ->
    261698;
get(Score) when Score >= 1699 andalso Score =< 1699 ->
    261699;
get(Score) when Score >= 1700 andalso Score =< 1700 ->
    261700;
get(Score) when Score >= 1701 andalso Score =< 1701 ->
    261701;
get(Score) when Score >= 1702 andalso Score =< 1702 ->
    261702;
get(Score) when Score >= 1703 andalso Score =< 1703 ->
    261703;
get(Score) when Score >= 1704 andalso Score =< 1704 ->
    261704;
get(Score) when Score >= 1705 andalso Score =< 1705 ->
    261705;
get(Score) when Score >= 1706 andalso Score =< 1706 ->
    261706;
get(Score) when Score >= 1707 andalso Score =< 1707 ->
    261707;
get(Score) when Score >= 1708 andalso Score =< 1708 ->
    261708;
get(Score) when Score >= 1709 andalso Score =< 1709 ->
    261709;
get(Score) when Score >= 1710 andalso Score =< 1710 ->
    261710;
get(Score) when Score >= 1711 andalso Score =< 1711 ->
    261711;
get(Score) when Score >= 1712 andalso Score =< 1712 ->
    261712;
get(Score) when Score >= 1713 andalso Score =< 1713 ->
    261713;
get(Score) when Score >= 1714 andalso Score =< 1714 ->
    261714;
get(Score) when Score >= 1715 andalso Score =< 1715 ->
    261715;
get(Score) when Score >= 1716 andalso Score =< 1716 ->
    261716;
get(Score) when Score >= 1717 andalso Score =< 1717 ->
    261717;
get(Score) when Score >= 1718 andalso Score =< 1718 ->
    261718;
get(Score) when Score >= 1719 andalso Score =< 1719 ->
    261719;
get(Score) when Score >= 1720 andalso Score =< 1720 ->
    261720;
get(Score) when Score >= 1721 andalso Score =< 1721 ->
    261721;
get(Score) when Score >= 1722 andalso Score =< 1722 ->
    261722;
get(Score) when Score >= 1723 andalso Score =< 1723 ->
    261723;
get(Score) when Score >= 1724 andalso Score =< 1724 ->
    261724;
get(Score) when Score >= 1725 andalso Score =< 1725 ->
    261725;
get(Score) when Score >= 1726 andalso Score =< 1726 ->
    261726;
get(Score) when Score >= 1727 andalso Score =< 1727 ->
    261727;
get(Score) when Score >= 1728 andalso Score =< 1728 ->
    261728;
get(Score) when Score >= 1729 andalso Score =< 1729 ->
    261729;
get(Score) when Score >= 1730 andalso Score =< 1730 ->
    261730;
get(Score) when Score >= 1731 andalso Score =< 1731 ->
    261731;
get(Score) when Score >= 1732 andalso Score =< 1732 ->
    261732;
get(Score) when Score >= 1733 andalso Score =< 1733 ->
    261733;
get(Score) when Score >= 1734 andalso Score =< 1734 ->
    261734;
get(Score) when Score >= 1735 andalso Score =< 1735 ->
    261735;
get(Score) when Score >= 1736 andalso Score =< 1736 ->
    261736;
get(Score) when Score >= 1737 andalso Score =< 1737 ->
    261737;
get(Score) when Score >= 1738 andalso Score =< 1738 ->
    261738;
get(Score) when Score >= 1739 andalso Score =< 1739 ->
    261739;
get(Score) when Score >= 1740 andalso Score =< 1740 ->
    261740;
get(Score) when Score >= 1741 andalso Score =< 1741 ->
    261741;
get(Score) when Score >= 1742 andalso Score =< 1742 ->
    261742;
get(Score) when Score >= 1743 andalso Score =< 1743 ->
    261743;
get(Score) when Score >= 1744 andalso Score =< 1744 ->
    261744;
get(Score) when Score >= 1745 andalso Score =< 1745 ->
    261745;
get(Score) when Score >= 1746 andalso Score =< 1746 ->
    261746;
get(Score) when Score >= 1747 andalso Score =< 1747 ->
    261747;
get(Score) when Score >= 1748 andalso Score =< 1748 ->
    261748;
get(Score) when Score >= 1749 andalso Score =< 1749 ->
    261749;
get(Score) when Score >= 1750 andalso Score =< 1750 ->
    261750;
get(Score) when Score >= 1751 andalso Score =< 1751 ->
    261751;
get(Score) when Score >= 1752 andalso Score =< 1752 ->
    261752;
get(Score) when Score >= 1753 andalso Score =< 1753 ->
    261753;
get(Score) when Score >= 1754 andalso Score =< 1754 ->
    261754;
get(Score) when Score >= 1755 andalso Score =< 1755 ->
    261755;
get(Score) when Score >= 1756 andalso Score =< 1756 ->
    261756;
get(Score) when Score >= 1757 andalso Score =< 1757 ->
    261757;
get(Score) when Score >= 1758 andalso Score =< 1758 ->
    261758;
get(Score) when Score >= 1759 andalso Score =< 1759 ->
    261759;
get(Score) when Score >= 1760 andalso Score =< 1760 ->
    261760;
get(Score) when Score >= 1761 andalso Score =< 1761 ->
    261761;
get(Score) when Score >= 1762 andalso Score =< 1762 ->
    261762;
get(Score) when Score >= 1763 andalso Score =< 1763 ->
    261763;
get(Score) when Score >= 1764 andalso Score =< 1764 ->
    261764;
get(Score) when Score >= 1765 andalso Score =< 1765 ->
    261765;
get(Score) when Score >= 1766 andalso Score =< 1766 ->
    261766;
get(Score) when Score >= 1767 andalso Score =< 1767 ->
    261767;
get(Score) when Score >= 1768 andalso Score =< 1768 ->
    261768;
get(Score) when Score >= 1769 andalso Score =< 1769 ->
    261769;
get(Score) when Score >= 1770 andalso Score =< 1770 ->
    261770;
get(Score) when Score >= 1771 andalso Score =< 1771 ->
    261771;
get(Score) when Score >= 1772 andalso Score =< 1772 ->
    261772;
get(Score) when Score >= 1773 andalso Score =< 1773 ->
    261773;
get(Score) when Score >= 1774 andalso Score =< 1774 ->
    261774;
get(Score) when Score >= 1775 andalso Score =< 1775 ->
    261775;
get(Score) when Score >= 1776 andalso Score =< 1776 ->
    261776;
get(Score) when Score >= 1777 andalso Score =< 1777 ->
    261777;
get(Score) when Score >= 1778 andalso Score =< 1778 ->
    261778;
get(Score) when Score >= 1779 andalso Score =< 1779 ->
    261779;
get(Score) when Score >= 1780 andalso Score =< 1780 ->
    261780;
get(Score) when Score >= 1781 andalso Score =< 1781 ->
    261781;
get(Score) when Score >= 1782 andalso Score =< 1782 ->
    261782;
get(Score) when Score >= 1783 andalso Score =< 1783 ->
    261783;
get(Score) when Score >= 1784 andalso Score =< 1784 ->
    261784;
get(Score) when Score >= 1785 andalso Score =< 1785 ->
    261785;
get(Score) when Score >= 1786 andalso Score =< 1786 ->
    261786;
get(Score) when Score >= 1787 andalso Score =< 1787 ->
    261787;
get(Score) when Score >= 1788 andalso Score =< 1788 ->
    261788;
get(Score) when Score >= 1789 andalso Score =< 1789 ->
    261789;
get(Score) when Score >= 1790 andalso Score =< 1790 ->
    261790;
get(Score) when Score >= 1791 andalso Score =< 1791 ->
    261791;
get(Score) when Score >= 1792 andalso Score =< 1792 ->
    261792;
get(Score) when Score >= 1793 andalso Score =< 1793 ->
    261793;
get(Score) when Score >= 1794 andalso Score =< 1794 ->
    261794;
get(Score) when Score >= 1795 andalso Score =< 1795 ->
    261795;
get(Score) when Score >= 1796 andalso Score =< 1796 ->
    261796;
get(Score) when Score >= 1797 andalso Score =< 1797 ->
    261797;
get(Score) when Score >= 1798 andalso Score =< 1798 ->
    261798;
get(Score) when Score >= 1799 andalso Score =< 1799 ->
    261799;
get(Score) when Score >= 1800 andalso Score =< 1800 ->
    261800;
get(Score) when Score >= 1801 andalso Score =< 1801 ->
    261801;
get(Score) when Score >= 1802 andalso Score =< 1802 ->
    261802;
get(Score) when Score >= 1803 andalso Score =< 1803 ->
    261803;
get(Score) when Score >= 1804 andalso Score =< 1804 ->
    261804;
get(Score) when Score >= 1805 andalso Score =< 1805 ->
    261805;
get(Score) when Score >= 1806 andalso Score =< 1806 ->
    261806;
get(Score) when Score >= 1807 andalso Score =< 1807 ->
    261807;
get(Score) when Score >= 1808 andalso Score =< 1808 ->
    261808;
get(Score) when Score >= 1809 andalso Score =< 1809 ->
    261809;
get(Score) when Score >= 1810 andalso Score =< 1810 ->
    261810;
get(Score) when Score >= 1811 andalso Score =< 1811 ->
    261811;
get(Score) when Score >= 1812 andalso Score =< 1812 ->
    261812;
get(Score) when Score >= 1813 andalso Score =< 1813 ->
    261813;
get(Score) when Score >= 1814 andalso Score =< 1814 ->
    261814;
get(Score) when Score >= 1815 andalso Score =< 1815 ->
    261815;
get(Score) when Score >= 1816 andalso Score =< 1816 ->
    261816;
get(Score) when Score >= 1817 andalso Score =< 1817 ->
    261817;
get(Score) when Score >= 1818 andalso Score =< 1818 ->
    261818;
get(Score) when Score >= 1819 andalso Score =< 1819 ->
    261819;
get(Score) when Score >= 1820 andalso Score =< 1820 ->
    261820;
get(Score) when Score >= 1821 andalso Score =< 1821 ->
    261821;
get(Score) when Score >= 1822 andalso Score =< 1822 ->
    261822;
get(Score) when Score >= 1823 andalso Score =< 1823 ->
    261823;
get(Score) when Score >= 1824 andalso Score =< 1824 ->
    261824;
get(Score) when Score >= 1825 andalso Score =< 1825 ->
    261825;
get(Score) when Score >= 1826 andalso Score =< 1826 ->
    261826;
get(Score) when Score >= 1827 andalso Score =< 1827 ->
    261827;
get(Score) when Score >= 1828 andalso Score =< 1828 ->
    261828;
get(Score) when Score >= 1829 andalso Score =< 1829 ->
    261829;
get(Score) when Score >= 1830 andalso Score =< 1830 ->
    261830;
get(Score) when Score >= 1831 andalso Score =< 1831 ->
    261831;
get(Score) when Score >= 1832 andalso Score =< 1832 ->
    261832;
get(Score) when Score >= 1833 andalso Score =< 1833 ->
    261833;
get(Score) when Score >= 1834 andalso Score =< 1834 ->
    261834;
get(Score) when Score >= 1835 andalso Score =< 1835 ->
    261835;
get(Score) when Score >= 1836 andalso Score =< 1836 ->
    261836;
get(Score) when Score >= 1837 andalso Score =< 1837 ->
    261837;
get(Score) when Score >= 1838 andalso Score =< 1838 ->
    261838;
get(Score) when Score >= 1839 andalso Score =< 1839 ->
    261839;
get(Score) when Score >= 1840 andalso Score =< 1840 ->
    261840;
get(Score) when Score >= 1841 andalso Score =< 1841 ->
    261841;
get(Score) when Score >= 1842 andalso Score =< 1842 ->
    261842;
get(Score) when Score >= 1843 andalso Score =< 1843 ->
    261843;
get(Score) when Score >= 1844 andalso Score =< 1844 ->
    261844;
get(Score) when Score >= 1845 andalso Score =< 1845 ->
    261845;
get(Score) when Score >= 1846 andalso Score =< 1846 ->
    261846;
get(Score) when Score >= 1847 andalso Score =< 1847 ->
    261847;
get(Score) when Score >= 1848 andalso Score =< 1848 ->
    261848;
get(Score) when Score >= 1849 andalso Score =< 1849 ->
    261849;
get(Score) when Score >= 1850 andalso Score =< 1850 ->
    261850;
get(Score) when Score >= 1851 andalso Score =< 1851 ->
    261851;
get(Score) when Score >= 1852 andalso Score =< 1852 ->
    261852;
get(Score) when Score >= 1853 andalso Score =< 1853 ->
    261853;
get(Score) when Score >= 1854 andalso Score =< 1854 ->
    261854;
get(Score) when Score >= 1855 andalso Score =< 1855 ->
    261855;
get(Score) when Score >= 1856 andalso Score =< 1856 ->
    261856;
get(Score) when Score >= 1857 andalso Score =< 1857 ->
    261857;
get(Score) when Score >= 1858 andalso Score =< 1858 ->
    261858;
get(Score) when Score >= 1859 andalso Score =< 1859 ->
    261859;
get(Score) when Score >= 1860 andalso Score =< 1860 ->
    261860;
get(Score) when Score >= 1861 andalso Score =< 1861 ->
    261861;
get(Score) when Score >= 1862 andalso Score =< 1862 ->
    261862;
get(Score) when Score >= 1863 andalso Score =< 1863 ->
    261863;
get(Score) when Score >= 1864 andalso Score =< 1864 ->
    261864;
get(Score) when Score >= 1865 andalso Score =< 1865 ->
    261865;
get(Score) when Score >= 1866 andalso Score =< 1866 ->
    261866;
get(Score) when Score >= 1867 andalso Score =< 1867 ->
    261867;
get(Score) when Score >= 1868 andalso Score =< 1868 ->
    261868;
get(Score) when Score >= 1869 andalso Score =< 1869 ->
    261869;
get(Score) when Score >= 1870 andalso Score =< 1870 ->
    261870;
get(Score) when Score >= 1871 andalso Score =< 1871 ->
    261871;
get(Score) when Score >= 1872 andalso Score =< 1872 ->
    261872;
get(Score) when Score >= 1873 andalso Score =< 1873 ->
    261873;
get(Score) when Score >= 1874 andalso Score =< 1874 ->
    261874;
get(Score) when Score >= 1875 andalso Score =< 1875 ->
    261875;
get(Score) when Score >= 1876 andalso Score =< 1876 ->
    261876;
get(Score) when Score >= 1877 andalso Score =< 1877 ->
    261877;
get(Score) when Score >= 1878 andalso Score =< 1878 ->
    261878;
get(Score) when Score >= 1879 andalso Score =< 1879 ->
    261879;
get(Score) when Score >= 1880 andalso Score =< 1880 ->
    261880;
get(Score) when Score >= 1881 andalso Score =< 1881 ->
    261881;
get(Score) when Score >= 1882 andalso Score =< 1882 ->
    261882;
get(Score) when Score >= 1883 andalso Score =< 1883 ->
    261883;
get(Score) when Score >= 1884 andalso Score =< 1884 ->
    261884;
get(Score) when Score >= 1885 andalso Score =< 1885 ->
    261885;
get(Score) when Score >= 1886 andalso Score =< 1886 ->
    261886;
get(Score) when Score >= 1887 andalso Score =< 1887 ->
    261887;
get(Score) when Score >= 1888 andalso Score =< 1888 ->
    261888;
get(Score) when Score >= 1889 andalso Score =< 1889 ->
    261889;
get(Score) when Score >= 1890 andalso Score =< 1890 ->
    261890;
get(Score) when Score >= 1891 andalso Score =< 1891 ->
    261891;
get(Score) when Score >= 1892 andalso Score =< 1892 ->
    261892;
get(Score) when Score >= 1893 andalso Score =< 1893 ->
    261893;
get(Score) when Score >= 1894 andalso Score =< 1894 ->
    261894;
get(Score) when Score >= 1895 andalso Score =< 1895 ->
    261895;
get(Score) when Score >= 1896 andalso Score =< 1896 ->
    261896;
get(Score) when Score >= 1897 andalso Score =< 1897 ->
    261897;
get(Score) when Score >= 1898 andalso Score =< 1898 ->
    261898;
get(Score) when Score >= 1899 andalso Score =< 1899 ->
    261899;
get(Score) when Score >= 1900 andalso Score =< 1900 ->
    261900;
get(Score) when Score >= 1901 andalso Score =< 1901 ->
    261901;
get(Score) when Score >= 1902 andalso Score =< 1902 ->
    261902;
get(Score) when Score >= 1903 andalso Score =< 1903 ->
    261903;
get(Score) when Score >= 1904 andalso Score =< 1904 ->
    261904;
get(Score) when Score >= 1905 andalso Score =< 1905 ->
    261905;
get(Score) when Score >= 1906 andalso Score =< 1906 ->
    261906;
get(Score) when Score >= 1907 andalso Score =< 1907 ->
    261907;
get(Score) when Score >= 1908 andalso Score =< 1908 ->
    261908;
get(Score) when Score >= 1909 andalso Score =< 1909 ->
    261909;
get(Score) when Score >= 1910 andalso Score =< 1910 ->
    261910;
get(Score) when Score >= 1911 andalso Score =< 1911 ->
    261911;
get(Score) when Score >= 1912 andalso Score =< 1912 ->
    261912;
get(Score) when Score >= 1913 andalso Score =< 1913 ->
    261913;
get(Score) when Score >= 1914 andalso Score =< 1914 ->
    261914;
get(Score) when Score >= 1915 andalso Score =< 1915 ->
    261915;
get(Score) when Score >= 1916 andalso Score =< 1916 ->
    261916;
get(Score) when Score >= 1917 andalso Score =< 1917 ->
    261917;
get(Score) when Score >= 1918 andalso Score =< 1918 ->
    261918;
get(Score) when Score >= 1919 andalso Score =< 1919 ->
    261919;
get(Score) when Score >= 1920 andalso Score =< 1920 ->
    261920;
get(Score) when Score >= 1921 andalso Score =< 1921 ->
    261921;
get(Score) when Score >= 1922 andalso Score =< 1922 ->
    261922;
get(Score) when Score >= 1923 andalso Score =< 1923 ->
    261923;
get(Score) when Score >= 1924 andalso Score =< 1924 ->
    261924;
get(Score) when Score >= 1925 andalso Score =< 1925 ->
    261925;
get(Score) when Score >= 1926 andalso Score =< 1926 ->
    261926;
get(Score) when Score >= 1927 andalso Score =< 1927 ->
    261927;
get(Score) when Score >= 1928 andalso Score =< 1928 ->
    261928;
get(Score) when Score >= 1929 andalso Score =< 1929 ->
    261929;
get(Score) when Score >= 1930 andalso Score =< 1930 ->
    261930;
get(Score) when Score >= 1931 andalso Score =< 1931 ->
    261931;
get(Score) when Score >= 1932 andalso Score =< 1932 ->
    261932;
get(Score) when Score >= 1933 andalso Score =< 1933 ->
    261933;
get(Score) when Score >= 1934 andalso Score =< 1934 ->
    261934;
get(Score) when Score >= 1935 andalso Score =< 1935 ->
    261935;
get(Score) when Score >= 1936 andalso Score =< 1936 ->
    261936;
get(Score) when Score >= 1937 andalso Score =< 1937 ->
    261937;
get(Score) when Score >= 1938 andalso Score =< 1938 ->
    261938;
get(Score) when Score >= 1939 andalso Score =< 1939 ->
    261939;
get(Score) when Score >= 1940 andalso Score =< 1940 ->
    261940;
get(Score) when Score >= 1941 andalso Score =< 1941 ->
    261941;
get(Score) when Score >= 1942 andalso Score =< 1942 ->
    261942;
get(Score) when Score >= 1943 andalso Score =< 1943 ->
    261943;
get(Score) when Score >= 1944 andalso Score =< 1944 ->
    261944;
get(Score) when Score >= 1945 andalso Score =< 1945 ->
    261945;
get(Score) when Score >= 1946 andalso Score =< 1946 ->
    261946;
get(Score) when Score >= 1947 andalso Score =< 1947 ->
    261947;
get(Score) when Score >= 1948 andalso Score =< 1948 ->
    261948;
get(Score) when Score >= 1949 andalso Score =< 1949 ->
    261949;
get(Score) when Score >= 1950 andalso Score =< 1950 ->
    261950;
get(Score) when Score >= 1951 andalso Score =< 1951 ->
    261951;
get(Score) when Score >= 1952 andalso Score =< 1952 ->
    261952;
get(Score) when Score >= 1953 andalso Score =< 1953 ->
    261953;
get(Score) when Score >= 1954 andalso Score =< 1954 ->
    261954;
get(Score) when Score >= 1955 andalso Score =< 1955 ->
    261955;
get(Score) when Score >= 1956 andalso Score =< 1956 ->
    261956;
get(Score) when Score >= 1957 andalso Score =< 1957 ->
    261957;
get(Score) when Score >= 1958 andalso Score =< 1958 ->
    261958;
get(Score) when Score >= 1959 andalso Score =< 1959 ->
    261959;
get(Score) when Score >= 1960 andalso Score =< 1960 ->
    261960;
get(Score) when Score >= 1961 andalso Score =< 1961 ->
    261961;
get(Score) when Score >= 1962 andalso Score =< 1962 ->
    261962;
get(Score) when Score >= 1963 andalso Score =< 1963 ->
    261963;
get(Score) when Score >= 1964 andalso Score =< 1964 ->
    261964;
get(Score) when Score >= 1965 andalso Score =< 1965 ->
    261965;
get(Score) when Score >= 1966 andalso Score =< 1966 ->
    261966;
get(Score) when Score >= 1967 andalso Score =< 1967 ->
    261967;
get(Score) when Score >= 1968 andalso Score =< 1968 ->
    261968;
get(Score) when Score >= 1969 andalso Score =< 1969 ->
    261969;
get(Score) when Score >= 1970 andalso Score =< 1970 ->
    261970;
get(Score) when Score >= 1971 andalso Score =< 1971 ->
    261971;
get(Score) when Score >= 1972 andalso Score =< 1972 ->
    261972;
get(Score) when Score >= 1973 andalso Score =< 1973 ->
    261973;
get(Score) when Score >= 1974 andalso Score =< 1974 ->
    261974;
get(Score) when Score >= 1975 andalso Score =< 1975 ->
    261975;
get(Score) when Score >= 1976 andalso Score =< 1976 ->
    261976;
get(Score) when Score >= 1977 andalso Score =< 1977 ->
    261977;
get(Score) when Score >= 1978 andalso Score =< 1978 ->
    261978;
get(Score) when Score >= 1979 andalso Score =< 1979 ->
    261979;
get(Score) when Score >= 1980 andalso Score =< 1980 ->
    261980;
get(Score) when Score >= 1981 andalso Score =< 1981 ->
    261981;
get(Score) when Score >= 1982 andalso Score =< 1982 ->
    261982;
get(Score) when Score >= 1983 andalso Score =< 1983 ->
    261983;
get(Score) when Score >= 1984 andalso Score =< 1984 ->
    261984;
get(Score) when Score >= 1985 andalso Score =< 1985 ->
    261985;
get(Score) when Score >= 1986 andalso Score =< 1986 ->
    261986;
get(Score) when Score >= 1987 andalso Score =< 1987 ->
    261987;
get(Score) when Score >= 1988 andalso Score =< 1988 ->
    261988;
get(Score) when Score >= 1989 andalso Score =< 1989 ->
    261989;
get(Score) when Score >= 1990 andalso Score =< 1990 ->
    261990;
get(Score) when Score >= 1991 andalso Score =< 1991 ->
    261991;
get(Score) when Score >= 1992 andalso Score =< 1992 ->
    261992;
get(Score) when Score >= 1993 andalso Score =< 1993 ->
    261993;
get(Score) when Score >= 1994 andalso Score =< 1994 ->
    261994;
get(Score) when Score >= 1995 andalso Score =< 1995 ->
    261995;
get(Score) when Score >= 1996 andalso Score =< 1996 ->
    261996;
get(Score) when Score >= 1997 andalso Score =< 1997 ->
    261997;
get(Score) when Score >= 1998 andalso Score =< 1998 ->
    261998;
get(Score) when Score >= 1999 andalso Score =< 1999 ->
    261999;
get(Score) when Score >= 2000 andalso Score =< 2000 ->
    262000;
get(Score) when Score >= 2001 andalso Score =< 2001 ->
    262001;
get(Score) when Score >= 2002 andalso Score =< 2002 ->
    262002;
get(Score) when Score >= 2003 andalso Score =< 2003 ->
    262003;
get(Score) when Score >= 2004 andalso Score =< 2004 ->
    262004;
get(Score) when Score >= 2005 andalso Score =< 2005 ->
    262005;
get(Score) when Score >= 2006 andalso Score =< 2006 ->
    262006;
get(Score) when Score >= 2007 andalso Score =< 2007 ->
    262007;
get(Score) when Score >= 2008 andalso Score =< 2008 ->
    262008;
get(Score) when Score >= 2009 andalso Score =< 2009 ->
    262009;
get(Score) when Score >= 2010 andalso Score =< 2010 ->
    262010;
get(Score) when Score >= 2011 andalso Score =< 2011 ->
    262011;
get(Score) when Score >= 2012 andalso Score =< 2012 ->
    262012;
get(Score) when Score >= 2013 andalso Score =< 2013 ->
    262013;
get(Score) when Score >= 2014 andalso Score =< 2014 ->
    262014;
get(Score) when Score >= 2015 andalso Score =< 2015 ->
    262015;
get(Score) when Score >= 2016 andalso Score =< 2016 ->
    262016;
get(Score) when Score >= 2017 andalso Score =< 2017 ->
    262017;
get(Score) when Score >= 2018 andalso Score =< 2018 ->
    262018;
get(Score) when Score >= 2019 andalso Score =< 2019 ->
    262019;
get(Score) when Score >= 2020 andalso Score =< 2020 ->
    262020;
get(Score) when Score >= 2021 andalso Score =< 2021 ->
    262021;
get(Score) when Score >= 2022 andalso Score =< 2022 ->
    262022;
get(Score) when Score >= 2023 andalso Score =< 2023 ->
    262023;
get(Score) when Score >= 2024 andalso Score =< 2024 ->
    262024;
get(Score) when Score >= 2025 andalso Score =< 2025 ->
    262025;
get(Score) when Score >= 2026 andalso Score =< 2026 ->
    262026;
get(Score) when Score >= 2027 andalso Score =< 2027 ->
    262027;
get(Score) when Score >= 2028 andalso Score =< 2028 ->
    262028;
get(Score) when Score >= 2029 andalso Score =< 2029 ->
    262029;
get(Score) when Score >= 2030 andalso Score =< 2030 ->
    262030;
get(Score) when Score >= 2031 andalso Score =< 2031 ->
    262031;
get(Score) when Score >= 2032 andalso Score =< 2032 ->
    262032;
get(Score) when Score >= 2033 andalso Score =< 2033 ->
    262033;
get(Score) when Score >= 2034 andalso Score =< 2034 ->
    262034;
get(Score) when Score >= 2035 andalso Score =< 2035 ->
    262035;
get(Score) when Score >= 2036 andalso Score =< 2036 ->
    262036;
get(Score) when Score >= 2037 andalso Score =< 2037 ->
    262037;
get(Score) when Score >= 2038 andalso Score =< 2038 ->
    262038;
get(Score) when Score >= 2039 andalso Score =< 2039 ->
    262039;
get(Score) when Score >= 2040 andalso Score =< 2040 ->
    262040;
get(Score) when Score >= 2041 andalso Score =< 2041 ->
    262041;
get(Score) when Score >= 2042 andalso Score =< 2042 ->
    262042;
get(Score) when Score >= 2043 andalso Score =< 2043 ->
    262043;
get(Score) when Score >= 2044 andalso Score =< 2044 ->
    262044;
get(Score) when Score >= 2045 andalso Score =< 2045 ->
    262045;
get(Score) when Score >= 2046 andalso Score =< 2046 ->
    262046;
get(Score) when Score >= 2047 andalso Score =< 2047 ->
    262047;
get(Score) when Score >= 2048 andalso Score =< 2048 ->
    262048;
get(Score) when Score >= 2049 andalso Score =< 2049 ->
    262049;
get(Score) when Score >= 2050 andalso Score =< 2050 ->
    262050;
get(Score) when Score >= 2051 andalso Score =< 2051 ->
    262051;
get(Score) when Score >= 2052 andalso Score =< 2052 ->
    262052;
get(Score) when Score >= 2053 andalso Score =< 2053 ->
    262053;
get(Score) when Score >= 2054 andalso Score =< 2054 ->
    262054;
get(Score) when Score >= 2055 andalso Score =< 2055 ->
    262055;
get(Score) when Score >= 2056 andalso Score =< 2056 ->
    262056;
get(Score) when Score >= 2057 andalso Score =< 2057 ->
    262057;
get(Score) when Score >= 2058 andalso Score =< 2058 ->
    262058;
get(Score) when Score >= 2059 andalso Score =< 2059 ->
    262059;
get(Score) when Score >= 2060 andalso Score =< 2060 ->
    262060;
get(Score) when Score >= 2061 andalso Score =< 2061 ->
    262061;
get(Score) when Score >= 2062 andalso Score =< 2062 ->
    262062;
get(Score) when Score >= 2063 andalso Score =< 2063 ->
    262063;
get(Score) when Score >= 2064 andalso Score =< 2064 ->
    262064;
get(Score) when Score >= 2065 andalso Score =< 2065 ->
    262065;
get(Score) when Score >= 2066 andalso Score =< 2066 ->
    262066;
get(Score) when Score >= 2067 andalso Score =< 2067 ->
    262067;
get(Score) when Score >= 2068 andalso Score =< 2068 ->
    262068;
get(Score) when Score >= 2069 andalso Score =< 2069 ->
    262069;
get(Score) when Score >= 2070 andalso Score =< 2070 ->
    262070;
get(Score) when Score >= 2071 andalso Score =< 2071 ->
    262071;
get(Score) when Score >= 2072 andalso Score =< 2072 ->
    262072;
get(Score) when Score >= 2073 andalso Score =< 2073 ->
    262073;
get(Score) when Score >= 2074 andalso Score =< 2074 ->
    262074;
get(Score) when Score >= 2075 andalso Score =< 2075 ->
    262075;
get(Score) when Score >= 2076 andalso Score =< 2076 ->
    262076;
get(Score) when Score >= 2077 andalso Score =< 2077 ->
    262077;
get(Score) when Score >= 2078 andalso Score =< 2078 ->
    262078;
get(Score) when Score >= 2079 andalso Score =< 2079 ->
    262079;
get(Score) when Score >= 2080 andalso Score =< 2080 ->
    262080;
get(Score) when Score >= 2081 andalso Score =< 2081 ->
    262081;
get(Score) when Score >= 2082 andalso Score =< 2082 ->
    262082;
get(Score) when Score >= 2083 andalso Score =< 2083 ->
    262083;
get(Score) when Score >= 2084 andalso Score =< 2084 ->
    262084;
get(Score) when Score >= 2085 andalso Score =< 2085 ->
    262085;
get(Score) when Score >= 2086 andalso Score =< 2086 ->
    262086;
get(Score) when Score >= 2087 andalso Score =< 2087 ->
    262087;
get(Score) when Score >= 2088 andalso Score =< 2088 ->
    262088;
get(Score) when Score >= 2089 andalso Score =< 2089 ->
    262089;
get(Score) when Score >= 2090 andalso Score =< 2090 ->
    262090;
get(Score) when Score >= 2091 andalso Score =< 2091 ->
    262091;
get(Score) when Score >= 2092 andalso Score =< 2092 ->
    262092;
get(Score) when Score >= 2093 andalso Score =< 2093 ->
    262093;
get(Score) when Score >= 2094 andalso Score =< 2094 ->
    262094;
get(Score) when Score >= 2095 andalso Score =< 2095 ->
    262095;
get(Score) when Score >= 2096 andalso Score =< 2096 ->
    262096;
get(Score) when Score >= 2097 andalso Score =< 2097 ->
    262097;
get(Score) when Score >= 2098 andalso Score =< 2098 ->
    262098;
get(Score) when Score >= 2099 andalso Score =< 2099 ->
    262099;
get(Score) when Score >= 2100 andalso Score =< 2100 ->
    262100;
get(Score) when Score >= 2101 andalso Score =< 2101 ->
    262101;
get(Score) when Score >= 2102 andalso Score =< 2102 ->
    262102;
get(Score) when Score >= 2103 andalso Score =< 2103 ->
    262103;
get(Score) when Score >= 2104 andalso Score =< 2104 ->
    262104;
get(Score) when Score >= 2105 andalso Score =< 2105 ->
    262105;
get(Score) when Score >= 2106 andalso Score =< 2106 ->
    262106;
get(Score) when Score >= 2107 andalso Score =< 2107 ->
    262107;
get(Score) when Score >= 2108 andalso Score =< 2108 ->
    262108;
get(Score) when Score >= 2109 andalso Score =< 2109 ->
    262109;
get(Score) when Score >= 2110 andalso Score =< 2110 ->
    262110;
get(Score) when Score >= 2111 andalso Score =< 2111 ->
    262111;
get(Score) when Score >= 2112 andalso Score =< 2112 ->
    262112;
get(Score) when Score >= 2113 andalso Score =< 2113 ->
    262113;
get(Score) when Score >= 2114 andalso Score =< 2114 ->
    262114;
get(Score) when Score >= 2115 andalso Score =< 2115 ->
    262115;
get(Score) when Score >= 2116 andalso Score =< 2116 ->
    262116;
get(Score) when Score >= 2117 andalso Score =< 2117 ->
    262117;
get(Score) when Score >= 2118 andalso Score =< 2118 ->
    262118;
get(Score) when Score >= 2119 andalso Score =< 2119 ->
    262119;
get(Score) when Score >= 2120 andalso Score =< 2120 ->
    262120;
get(Score) when Score >= 2121 andalso Score =< 2121 ->
    262121;
get(Score) when Score >= 2122 andalso Score =< 2122 ->
    262122;
get(Score) when Score >= 2123 andalso Score =< 2123 ->
    262123;
get(Score) when Score >= 2124 andalso Score =< 2124 ->
    262124;
get(Score) when Score >= 2125 andalso Score =< 2125 ->
    262125;
get(Score) when Score >= 2126 andalso Score =< 2126 ->
    262126;
get(Score) when Score >= 2127 andalso Score =< 2127 ->
    262127;
get(Score) when Score >= 2128 andalso Score =< 2128 ->
    262128;
get(Score) when Score >= 2129 andalso Score =< 2129 ->
    262129;
get(Score) when Score >= 2130 andalso Score =< 2130 ->
    262130;
get(Score) when Score >= 2131 andalso Score =< 2131 ->
    262131;
get(Score) when Score >= 2132 andalso Score =< 2132 ->
    262132;
get(Score) when Score >= 2133 andalso Score =< 2133 ->
    262133;
get(Score) when Score >= 2134 andalso Score =< 2134 ->
    262134;
get(Score) when Score >= 2135 andalso Score =< 2135 ->
    262135;
get(Score) when Score >= 2136 andalso Score =< 2136 ->
    262136;
get(Score) when Score >= 2137 andalso Score =< 2137 ->
    262137;
get(Score) when Score >= 2138 andalso Score =< 2138 ->
    262138;
get(Score) when Score >= 2139 andalso Score =< 2139 ->
    262139;
get(Score) when Score >= 2140 andalso Score =< 2140 ->
    262140;
get(Score) when Score >= 2141 andalso Score =< 2141 ->
    262141;
get(Score) when Score >= 2142 andalso Score =< 2142 ->
    262142;
get(Score) when Score >= 2143 andalso Score =< 2143 ->
    262143;
get(Score) when Score >= 2144 andalso Score =< 2144 ->
    262144;
get(Score) when Score >= 2145 andalso Score =< 2145 ->
    262145;
get(Score) when Score >= 2146 andalso Score =< 2146 ->
    262146;
get(Score) when Score >= 2147 andalso Score =< 2147 ->
    262147;
get(Score) when Score >= 2148 andalso Score =< 2148 ->
    262148;
get(Score) when Score >= 2149 andalso Score =< 2149 ->
    262149;
get(Score) when Score >= 2150 andalso Score =< 2150 ->
    262150;
get(Score) when Score >= 2151 andalso Score =< 2151 ->
    262151;
get(Score) when Score >= 2152 andalso Score =< 2152 ->
    262152;
get(Score) when Score >= 2153 andalso Score =< 2153 ->
    262153;
get(Score) when Score >= 2154 andalso Score =< 2154 ->
    262154;
get(Score) when Score >= 2155 andalso Score =< 2155 ->
    262155;
get(Score) when Score >= 2156 andalso Score =< 2156 ->
    262156;
get(Score) when Score >= 2157 andalso Score =< 2157 ->
    262157;
get(Score) when Score >= 2158 andalso Score =< 2158 ->
    262158;
get(Score) when Score >= 2159 andalso Score =< 2159 ->
    262159;
get(Score) when Score >= 2160 andalso Score =< 2160 ->
    262160;
get(Score) when Score >= 2161 andalso Score =< 2161 ->
    262161;
get(Score) when Score >= 2162 andalso Score =< 2162 ->
    262162;
get(Score) when Score >= 2163 andalso Score =< 2163 ->
    262163;
get(Score) when Score >= 2164 andalso Score =< 2164 ->
    262164;
get(Score) when Score >= 2165 andalso Score =< 2165 ->
    262165;
get(Score) when Score >= 2166 andalso Score =< 2166 ->
    262166;
get(Score) when Score >= 2167 andalso Score =< 2167 ->
    262167;
get(Score) when Score >= 2168 andalso Score =< 2168 ->
    262168;
get(Score) when Score >= 2169 andalso Score =< 2169 ->
    262169;
get(Score) when Score >= 2170 andalso Score =< 2170 ->
    262170;
get(Score) when Score >= 2171 andalso Score =< 2171 ->
    262171;
get(Score) when Score >= 2172 andalso Score =< 2172 ->
    262172;
get(Score) when Score >= 2173 andalso Score =< 2173 ->
    262173;
get(Score) when Score >= 2174 andalso Score =< 2174 ->
    262174;
get(Score) when Score >= 2175 andalso Score =< 2175 ->
    262175;
get(Score) when Score >= 2176 andalso Score =< 2176 ->
    262176;
get(Score) when Score >= 2177 andalso Score =< 2177 ->
    262177;
get(Score) when Score >= 2178 andalso Score =< 2178 ->
    262178;
get(Score) when Score >= 2179 andalso Score =< 2179 ->
    262179;
get(Score) when Score >= 2180 andalso Score =< 2180 ->
    262180;
get(Score) when Score >= 2181 andalso Score =< 2181 ->
    262181;
get(Score) when Score >= 2182 andalso Score =< 2182 ->
    262182;
get(Score) when Score >= 2183 andalso Score =< 2183 ->
    262183;
get(Score) when Score >= 2184 andalso Score =< 2184 ->
    262184;
get(Score) when Score >= 2185 andalso Score =< 2185 ->
    262185;
get(Score) when Score >= 2186 andalso Score =< 2186 ->
    262186;
get(Score) when Score >= 2187 andalso Score =< 2187 ->
    262187;
get(Score) when Score >= 2188 andalso Score =< 2188 ->
    262188;
get(Score) when Score >= 2189 andalso Score =< 2189 ->
    262189;
get(Score) when Score >= 2190 andalso Score =< 2190 ->
    262190;
get(Score) when Score >= 2191 andalso Score =< 2191 ->
    262191;
get(Score) when Score >= 2192 andalso Score =< 2192 ->
    262192;
get(Score) when Score >= 2193 andalso Score =< 2193 ->
    262193;
get(Score) when Score >= 2194 andalso Score =< 2194 ->
    262194;
get(Score) when Score >= 2195 andalso Score =< 2195 ->
    262195;
get(Score) when Score >= 2196 andalso Score =< 2196 ->
    262196;
get(Score) when Score >= 2197 andalso Score =< 2197 ->
    262197;
get(Score) when Score >= 2198 andalso Score =< 2198 ->
    262198;
get(Score) when Score >= 2199 andalso Score =< 2199 ->
    262199;
get(Score) when Score >= 2200 andalso Score =< 2200 ->
    262200;
get(Score) when Score >= 2201 andalso Score =< 2201 ->
    262201;
get(Score) when Score >= 2202 andalso Score =< 2202 ->
    262202;
get(Score) when Score >= 2203 andalso Score =< 2203 ->
    262203;
get(Score) when Score >= 2204 andalso Score =< 2204 ->
    262204;
get(Score) when Score >= 2205 andalso Score =< 2205 ->
    262205;
get(Score) when Score >= 2206 andalso Score =< 2206 ->
    262206;
get(Score) when Score >= 2207 andalso Score =< 2207 ->
    262207;
get(Score) when Score >= 2208 andalso Score =< 2208 ->
    262208;
get(Score) when Score >= 2209 andalso Score =< 2209 ->
    262209;
get(Score) when Score >= 2210 andalso Score =< 2210 ->
    262210;
get(Score) when Score >= 2211 andalso Score =< 2211 ->
    262211;
get(Score) when Score >= 2212 andalso Score =< 2212 ->
    262212;
get(Score) when Score >= 2213 andalso Score =< 2213 ->
    262213;
get(Score) when Score >= 2214 andalso Score =< 2214 ->
    262214;
get(Score) when Score >= 2215 andalso Score =< 2215 ->
    262215;
get(Score) when Score >= 2216 andalso Score =< 2216 ->
    262216;
get(Score) when Score >= 2217 andalso Score =< 2217 ->
    262217;
get(Score) when Score >= 2218 andalso Score =< 2218 ->
    262218;
get(Score) when Score >= 2219 andalso Score =< 2219 ->
    262219;
get(Score) when Score >= 2220 andalso Score =< 2220 ->
    262220;
get(Score) when Score >= 2221 andalso Score =< 2221 ->
    262221;
get(Score) when Score >= 2222 andalso Score =< 2222 ->
    262222;
get(Score) when Score >= 2223 andalso Score =< 2223 ->
    262223;
get(Score) when Score >= 2224 andalso Score =< 2224 ->
    262224;
get(Score) when Score >= 2225 andalso Score =< 2225 ->
    262225;
get(Score) when Score >= 2226 andalso Score =< 2226 ->
    262226;
get(Score) when Score >= 2227 andalso Score =< 2227 ->
    262227;
get(Score) when Score >= 2228 andalso Score =< 2228 ->
    262228;
get(Score) when Score >= 2229 andalso Score =< 2229 ->
    262229;
get(Score) when Score >= 2230 andalso Score =< 2230 ->
    262230;
get(Score) when Score >= 2231 andalso Score =< 2231 ->
    262231;
get(Score) when Score >= 2232 andalso Score =< 2232 ->
    262232;
get(Score) when Score >= 2233 andalso Score =< 2233 ->
    262233;
get(Score) when Score >= 2234 andalso Score =< 2234 ->
    262234;
get(Score) when Score >= 2235 andalso Score =< 2235 ->
    262235;
get(Score) when Score >= 2236 andalso Score =< 2236 ->
    262236;
get(Score) when Score >= 2237 andalso Score =< 2237 ->
    262237;
get(Score) when Score >= 2238 andalso Score =< 2238 ->
    262238;
get(Score) when Score >= 2239 andalso Score =< 2239 ->
    262239;
get(Score) when Score >= 2240 andalso Score =< 2240 ->
    262240;
get(Score) when Score >= 2241 andalso Score =< 2241 ->
    262241;
get(Score) when Score >= 2242 andalso Score =< 2242 ->
    262242;
get(Score) when Score >= 2243 andalso Score =< 2243 ->
    262243;
get(Score) when Score >= 2244 andalso Score =< 2244 ->
    262244;
get(Score) when Score >= 2245 andalso Score =< 2245 ->
    262245;
get(Score) when Score >= 2246 andalso Score =< 2246 ->
    262246;
get(Score) when Score >= 2247 andalso Score =< 2247 ->
    262247;
get(Score) when Score >= 2248 andalso Score =< 2248 ->
    262248;
get(Score) when Score >= 2249 andalso Score =< 2249 ->
    262249;
get(Score) when Score >= 2250 andalso Score =< 2250 ->
    262250;
get(Score) when Score >= 2251 andalso Score =< 2251 ->
    262251;
get(Score) when Score >= 2252 andalso Score =< 2252 ->
    262252;
get(Score) when Score >= 2253 andalso Score =< 2253 ->
    262253;
get(Score) when Score >= 2254 andalso Score =< 2254 ->
    262254;
get(Score) when Score >= 2255 andalso Score =< 2255 ->
    262255;
get(Score) when Score >= 2256 andalso Score =< 2256 ->
    262256;
get(Score) when Score >= 2257 andalso Score =< 2257 ->
    262257;
get(Score) when Score >= 2258 andalso Score =< 2258 ->
    262258;
get(Score) when Score >= 2259 andalso Score =< 2259 ->
    262259;
get(Score) when Score >= 2260 andalso Score =< 2260 ->
    262260;
get(Score) when Score >= 2261 andalso Score =< 2261 ->
    262261;
get(Score) when Score >= 2262 andalso Score =< 2262 ->
    262262;
get(Score) when Score >= 2263 andalso Score =< 2263 ->
    262263;
get(Score) when Score >= 2264 andalso Score =< 2264 ->
    262264;
get(Score) when Score >= 2265 andalso Score =< 2265 ->
    262265;
get(Score) when Score >= 2266 andalso Score =< 2266 ->
    262266;
get(Score) when Score >= 2267 andalso Score =< 2267 ->
    262267;
get(Score) when Score >= 2268 andalso Score =< 2268 ->
    262268;
get(Score) when Score >= 2269 andalso Score =< 2269 ->
    262269;
get(Score) when Score >= 2270 andalso Score =< 2270 ->
    262270;
get(Score) when Score >= 2271 andalso Score =< 2271 ->
    262271;
get(Score) when Score >= 2272 andalso Score =< 2272 ->
    262272;
get(Score) when Score >= 2273 andalso Score =< 2273 ->
    262273;
get(Score) when Score >= 2274 andalso Score =< 2274 ->
    262274;
get(Score) when Score >= 2275 andalso Score =< 2275 ->
    262275;
get(Score) when Score >= 2276 andalso Score =< 2276 ->
    262276;
get(Score) when Score >= 2277 andalso Score =< 2277 ->
    262277;
get(Score) when Score >= 2278 andalso Score =< 2278 ->
    262278;
get(Score) when Score >= 2279 andalso Score =< 2279 ->
    262279;
get(Score) when Score >= 2280 andalso Score =< 2280 ->
    262280;
get(Score) when Score >= 2281 andalso Score =< 2281 ->
    262281;
get(Score) when Score >= 2282 andalso Score =< 2282 ->
    262282;
get(Score) when Score >= 2283 andalso Score =< 2283 ->
    262283;
get(Score) when Score >= 2284 andalso Score =< 2284 ->
    262284;
get(Score) when Score >= 2285 andalso Score =< 2285 ->
    262285;
get(Score) when Score >= 2286 andalso Score =< 2286 ->
    262286;
get(Score) when Score >= 2287 andalso Score =< 2287 ->
    262287;
get(Score) when Score >= 2288 andalso Score =< 2288 ->
    262288;
get(Score) when Score >= 2289 andalso Score =< 2289 ->
    262289;
get(Score) when Score >= 2290 andalso Score =< 2290 ->
    262290;
get(Score) when Score >= 2291 andalso Score =< 2291 ->
    262291;
get(Score) when Score >= 2292 andalso Score =< 2292 ->
    262292;
get(Score) when Score >= 2293 andalso Score =< 2293 ->
    262293;
get(Score) when Score >= 2294 andalso Score =< 2294 ->
    262294;
get(Score) when Score >= 2295 andalso Score =< 2295 ->
    262295;
get(Score) when Score >= 2296 andalso Score =< 2296 ->
    262296;
get(Score) when Score >= 2297 andalso Score =< 2297 ->
    262297;
get(Score) when Score >= 2298 andalso Score =< 2298 ->
    262298;
get(Score) when Score >= 2299 andalso Score =< 2299 ->
    262299;
get(Score) when Score >= 2300 andalso Score =< 2300 ->
    262300;
get(Score) when Score >= 2301 andalso Score =< 2301 ->
    262301;
get(Score) when Score >= 2302 andalso Score =< 2302 ->
    262302;
get(Score) when Score >= 2303 andalso Score =< 2303 ->
    262303;
get(Score) when Score >= 2304 andalso Score =< 2304 ->
    262304;
get(Score) when Score >= 2305 andalso Score =< 2305 ->
    262305;
get(Score) when Score >= 2306 andalso Score =< 2306 ->
    262306;
get(Score) when Score >= 2307 andalso Score =< 2307 ->
    262307;
get(Score) when Score >= 2308 andalso Score =< 2308 ->
    262308;
get(Score) when Score >= 2309 andalso Score =< 2309 ->
    262309;
get(Score) when Score >= 2310 andalso Score =< 2310 ->
    262310;
get(Score) when Score >= 2311 andalso Score =< 2311 ->
    262311;
get(Score) when Score >= 2312 andalso Score =< 2312 ->
    262312;
get(Score) when Score >= 2313 andalso Score =< 2313 ->
    262313;
get(Score) when Score >= 2314 andalso Score =< 2314 ->
    262314;
get(Score) when Score >= 2315 andalso Score =< 2315 ->
    262315;
get(Score) when Score >= 2316 andalso Score =< 2316 ->
    262316;
get(Score) when Score >= 2317 andalso Score =< 2317 ->
    262317;
get(Score) when Score >= 2318 andalso Score =< 2318 ->
    262318;
get(Score) when Score >= 2319 andalso Score =< 2319 ->
    262319;
get(Score) when Score >= 2320 andalso Score =< 2320 ->
    262320;
get(Score) when Score >= 2321 andalso Score =< 2321 ->
    262321;
get(Score) when Score >= 2322 andalso Score =< 2322 ->
    262322;
get(Score) when Score >= 2323 andalso Score =< 2323 ->
    262323;
get(Score) when Score >= 2324 andalso Score =< 2324 ->
    262324;
get(Score) when Score >= 2325 andalso Score =< 2325 ->
    262325;
get(Score) when Score >= 2326 andalso Score =< 2326 ->
    262326;
get(Score) when Score >= 2327 andalso Score =< 2327 ->
    262327;
get(Score) when Score >= 2328 andalso Score =< 2328 ->
    262328;
get(Score) when Score >= 2329 andalso Score =< 2329 ->
    262329;
get(Score) when Score >= 2330 andalso Score =< 2330 ->
    262330;
get(Score) when Score >= 2331 andalso Score =< 2331 ->
    262331;
get(Score) when Score >= 2332 andalso Score =< 2332 ->
    262332;
get(Score) when Score >= 2333 andalso Score =< 2333 ->
    262333;
get(Score) when Score >= 2334 andalso Score =< 2334 ->
    262334;
get(Score) when Score >= 2335 andalso Score =< 2335 ->
    262335;
get(Score) when Score >= 2336 andalso Score =< 2336 ->
    262336;
get(Score) when Score >= 2337 andalso Score =< 2337 ->
    262337;
get(Score) when Score >= 2338 andalso Score =< 2338 ->
    262338;
get(Score) when Score >= 2339 andalso Score =< 2339 ->
    262339;
get(Score) when Score >= 2340 andalso Score =< 2340 ->
    262340;
get(Score) when Score >= 2341 andalso Score =< 2341 ->
    262341;
get(Score) when Score >= 2342 andalso Score =< 2342 ->
    262342;
get(Score) when Score >= 2343 andalso Score =< 2343 ->
    262343;
get(Score) when Score >= 2344 andalso Score =< 2344 ->
    262344;
get(Score) when Score >= 2345 andalso Score =< 2345 ->
    262345;
get(Score) when Score >= 2346 andalso Score =< 2346 ->
    262346;
get(Score) when Score >= 2347 andalso Score =< 2347 ->
    262347;
get(Score) when Score >= 2348 andalso Score =< 2348 ->
    262348;
get(Score) when Score >= 2349 andalso Score =< 2349 ->
    262349;
get(Score) when Score >= 2350 andalso Score =< 2350 ->
    262350;
get(Score) when Score >= 2351 andalso Score =< 2351 ->
    262351;
get(Score) when Score >= 2352 andalso Score =< 2352 ->
    262352;
get(Score) when Score >= 2353 andalso Score =< 2353 ->
    262353;
get(Score) when Score >= 2354 andalso Score =< 2354 ->
    262354;
get(Score) when Score >= 2355 andalso Score =< 2355 ->
    262355;
get(Score) when Score >= 2356 andalso Score =< 2356 ->
    262356;
get(Score) when Score >= 2357 andalso Score =< 2357 ->
    262357;
get(Score) when Score >= 2358 andalso Score =< 2358 ->
    262358;
get(Score) when Score >= 2359 andalso Score =< 2359 ->
    262359;
get(Score) when Score >= 2360 andalso Score =< 2360 ->
    262360;
get(Score) when Score >= 2361 andalso Score =< 2361 ->
    262361;
get(Score) when Score >= 2362 andalso Score =< 2362 ->
    262362;
get(Score) when Score >= 2363 andalso Score =< 2363 ->
    262363;
get(Score) when Score >= 2364 andalso Score =< 2364 ->
    262364;
get(Score) when Score >= 2365 andalso Score =< 2365 ->
    262365;
get(Score) when Score >= 2366 andalso Score =< 2366 ->
    262366;
get(Score) when Score >= 2367 andalso Score =< 2367 ->
    262367;
get(Score) when Score >= 2368 andalso Score =< 2368 ->
    262368;
get(Score) when Score >= 2369 andalso Score =< 2369 ->
    262369;
get(Score) when Score >= 2370 andalso Score =< 2370 ->
    262370;
get(Score) when Score >= 2371 andalso Score =< 2371 ->
    262371;
get(Score) when Score >= 2372 andalso Score =< 2372 ->
    262372;
get(Score) when Score >= 2373 andalso Score =< 2373 ->
    262373;
get(Score) when Score >= 2374 andalso Score =< 2374 ->
    262374;
get(Score) when Score >= 2375 andalso Score =< 2375 ->
    262375;
get(Score) when Score >= 2376 andalso Score =< 2376 ->
    262376;
get(Score) when Score >= 2377 andalso Score =< 2377 ->
    262377;
get(Score) when Score >= 2378 andalso Score =< 2378 ->
    262378;
get(Score) when Score >= 2379 andalso Score =< 2379 ->
    262379;
get(Score) when Score >= 2380 andalso Score =< 2380 ->
    262380;
get(Score) when Score >= 2381 andalso Score =< 2381 ->
    262381;
get(Score) when Score >= 2382 andalso Score =< 2382 ->
    262382;
get(Score) when Score >= 2383 andalso Score =< 2383 ->
    262383;
get(Score) when Score >= 2384 andalso Score =< 2384 ->
    262384;
get(Score) when Score >= 2385 andalso Score =< 2385 ->
    262385;
get(Score) when Score >= 2386 andalso Score =< 2386 ->
    262386;
get(Score) when Score >= 2387 andalso Score =< 2387 ->
    262387;
get(Score) when Score >= 2388 andalso Score =< 2388 ->
    262388;
get(Score) when Score >= 2389 andalso Score =< 2389 ->
    262389;
get(Score) when Score >= 2390 andalso Score =< 2390 ->
    262390;
get(Score) when Score >= 2391 andalso Score =< 2391 ->
    262391;
get(Score) when Score >= 2392 andalso Score =< 2392 ->
    262392;
get(Score) when Score >= 2393 andalso Score =< 2393 ->
    262393;
get(Score) when Score >= 2394 andalso Score =< 2394 ->
    262394;
get(Score) when Score >= 2395 andalso Score =< 2395 ->
    262395;
get(Score) when Score >= 2396 andalso Score =< 2396 ->
    262396;
get(Score) when Score >= 2397 andalso Score =< 2397 ->
    262397;
get(Score) when Score >= 2398 andalso Score =< 2398 ->
    262398;
get(Score) when Score >= 2399 andalso Score =< 2399 ->
    262399;
get(Score) when Score >= 2400 andalso Score =< 2400 ->
    262400;
get(Score) when Score >= 2401 andalso Score =< 2401 ->
    262401;
get(Score) when Score >= 2402 andalso Score =< 2402 ->
    262402;
get(Score) when Score >= 2403 andalso Score =< 2403 ->
    262403;
get(Score) when Score >= 2404 andalso Score =< 2404 ->
    262404;
get(Score) when Score >= 2405 andalso Score =< 2405 ->
    262405;
get(Score) when Score >= 2406 andalso Score =< 2406 ->
    262406;
get(Score) when Score >= 2407 andalso Score =< 2407 ->
    262407;
get(Score) when Score >= 2408 andalso Score =< 2408 ->
    262408;
get(Score) when Score >= 2409 andalso Score =< 2409 ->
    262409;
get(Score) when Score >= 2410 andalso Score =< 2410 ->
    262410;
get(Score) when Score >= 2411 andalso Score =< 2411 ->
    262411;
get(Score) when Score >= 2412 andalso Score =< 2412 ->
    262412;
get(Score) when Score >= 2413 andalso Score =< 2413 ->
    262413;
get(Score) when Score >= 2414 andalso Score =< 2414 ->
    262414;
get(Score) when Score >= 2415 andalso Score =< 2415 ->
    262415;
get(Score) when Score >= 2416 andalso Score =< 2416 ->
    262416;
get(Score) when Score >= 2417 andalso Score =< 2417 ->
    262417;
get(Score) when Score >= 2418 andalso Score =< 2418 ->
    262418;
get(Score) when Score >= 2419 andalso Score =< 2419 ->
    262419;
get(Score) when Score >= 2420 andalso Score =< 2420 ->
    262420;
get(Score) when Score >= 2421 andalso Score =< 2421 ->
    262421;
get(Score) when Score >= 2422 andalso Score =< 2422 ->
    262422;
get(Score) when Score >= 2423 andalso Score =< 2423 ->
    262423;
get(Score) when Score >= 2424 andalso Score =< 2424 ->
    262424;
get(Score) when Score >= 2425 andalso Score =< 2425 ->
    262425;
get(Score) when Score >= 2426 andalso Score =< 2426 ->
    262426;
get(Score) when Score >= 2427 andalso Score =< 2427 ->
    262427;
get(Score) when Score >= 2428 andalso Score =< 2428 ->
    262428;
get(Score) when Score >= 2429 andalso Score =< 2429 ->
    262429;
get(Score) when Score >= 2430 andalso Score =< 2430 ->
    262430;
get(Score) when Score >= 2431 andalso Score =< 2431 ->
    262431;
get(Score) when Score >= 2432 andalso Score =< 2432 ->
    262432;
get(Score) when Score >= 2433 andalso Score =< 2433 ->
    262433;
get(Score) when Score >= 2434 andalso Score =< 2434 ->
    262434;
get(Score) when Score >= 2435 andalso Score =< 2435 ->
    262435;
get(Score) when Score >= 2436 andalso Score =< 2436 ->
    262436;
get(Score) when Score >= 2437 andalso Score =< 2437 ->
    262437;
get(Score) when Score >= 2438 andalso Score =< 2438 ->
    262438;
get(Score) when Score >= 2439 andalso Score =< 2439 ->
    262439;
get(Score) when Score >= 2440 andalso Score =< 2440 ->
    262440;
get(Score) when Score >= 2441 andalso Score =< 2441 ->
    262441;
get(Score) when Score >= 2442 andalso Score =< 2442 ->
    262442;
get(Score) when Score >= 2443 andalso Score =< 2443 ->
    262443;
get(Score) when Score >= 2444 andalso Score =< 2444 ->
    262444;
get(Score) when Score >= 2445 andalso Score =< 2445 ->
    262445;
get(Score) when Score >= 2446 andalso Score =< 2446 ->
    262446;
get(Score) when Score >= 2447 andalso Score =< 2447 ->
    262447;
get(Score) when Score >= 2448 andalso Score =< 2448 ->
    262448;
get(Score) when Score >= 2449 andalso Score =< 2449 ->
    262449;
get(Score) when Score >= 2450 andalso Score =< 2450 ->
    262450;
get(Score) when Score >= 2451 andalso Score =< 2451 ->
    262451;
get(Score) when Score >= 2452 andalso Score =< 2452 ->
    262452;
get(Score) when Score >= 2453 andalso Score =< 2453 ->
    262453;
get(Score) when Score >= 2454 andalso Score =< 2454 ->
    262454;
get(Score) when Score >= 2455 andalso Score =< 2455 ->
    262455;
get(Score) when Score >= 2456 andalso Score =< 2456 ->
    262456;
get(Score) when Score >= 2457 andalso Score =< 2457 ->
    262457;
get(Score) when Score >= 2458 andalso Score =< 2458 ->
    262458;
get(Score) when Score >= 2459 andalso Score =< 2459 ->
    262459;
get(Score) when Score >= 2460 andalso Score =< 2460 ->
    262460;
get(Score) when Score >= 2461 andalso Score =< 2461 ->
    262461;
get(Score) when Score >= 2462 andalso Score =< 2462 ->
    262462;
get(Score) when Score >= 2463 andalso Score =< 2463 ->
    262463;
get(Score) when Score >= 2464 andalso Score =< 2464 ->
    262464;
get(Score) when Score >= 2465 andalso Score =< 2465 ->
    262465;
get(Score) when Score >= 2466 andalso Score =< 2466 ->
    262466;
get(Score) when Score >= 2467 andalso Score =< 2467 ->
    262467;
get(Score) when Score >= 2468 andalso Score =< 2468 ->
    262468;
get(Score) when Score >= 2469 andalso Score =< 2469 ->
    262469;
get(Score) when Score >= 2470 andalso Score =< 2470 ->
    262470;
get(Score) when Score >= 2471 andalso Score =< 2471 ->
    262471;
get(Score) when Score >= 2472 andalso Score =< 2472 ->
    262472;
get(Score) when Score >= 2473 andalso Score =< 2473 ->
    262473;
get(Score) when Score >= 2474 andalso Score =< 2474 ->
    262474;
get(Score) when Score >= 2475 andalso Score =< 2475 ->
    262475;
get(Score) when Score >= 2476 andalso Score =< 2476 ->
    262476;
get(Score) when Score >= 2477 andalso Score =< 2477 ->
    262477;
get(Score) when Score >= 2478 andalso Score =< 2478 ->
    262478;
get(Score) when Score >= 2479 andalso Score =< 2479 ->
    262479;
get(Score) when Score >= 2480 andalso Score =< 2480 ->
    262480;
get(Score) when Score >= 2481 andalso Score =< 2481 ->
    262481;
get(Score) when Score >= 2482 andalso Score =< 2482 ->
    262482;
get(Score) when Score >= 2483 andalso Score =< 2483 ->
    262483;
get(Score) when Score >= 2484 andalso Score =< 2484 ->
    262484;
get(Score) when Score >= 2485 andalso Score =< 2485 ->
    262485;
get(Score) when Score >= 2486 andalso Score =< 2486 ->
    262486;
get(Score) when Score >= 2487 andalso Score =< 2487 ->
    262487;
get(Score) when Score >= 2488 andalso Score =< 2488 ->
    262488;
get(Score) when Score >= 2489 andalso Score =< 2489 ->
    262489;
get(Score) when Score >= 2490 andalso Score =< 2490 ->
    262490;
get(Score) when Score >= 2491 andalso Score =< 2491 ->
    262491;
get(Score) when Score >= 2492 andalso Score =< 2492 ->
    262492;
get(Score) when Score >= 2493 andalso Score =< 2493 ->
    262493;
get(Score) when Score >= 2494 andalso Score =< 2494 ->
    262494;
get(Score) when Score >= 2495 andalso Score =< 2495 ->
    262495;
get(Score) when Score >= 2496 andalso Score =< 2496 ->
    262496;
get(Score) when Score >= 2497 andalso Score =< 2497 ->
    262497;
get(Score) when Score >= 2498 andalso Score =< 2498 ->
    262498;
get(Score) when Score >= 2499 andalso Score =< 2499 ->
    262499;
get(Score) when Score >= 2500 andalso Score =< 2500 ->
    262500;
get(Score) when Score >= 2501 andalso Score =< 2501 ->
    262501;
get(Score) when Score >= 2502 andalso Score =< 2502 ->
    262502;
get(Score) when Score >= 2503 andalso Score =< 2503 ->
    262503;
get(Score) when Score >= 2504 andalso Score =< 2504 ->
    262504;
get(Score) when Score >= 2505 andalso Score =< 2505 ->
    262505;
get(Score) when Score >= 2506 andalso Score =< 2506 ->
    262506;
get(Score) when Score >= 2507 andalso Score =< 2507 ->
    262507;
get(Score) when Score >= 2508 andalso Score =< 2508 ->
    262508;
get(Score) when Score >= 2509 andalso Score =< 2509 ->
    262509;
get(Score) when Score >= 2510 andalso Score =< 2510 ->
    262510;
get(Score) when Score >= 2511 andalso Score =< 2511 ->
    262511;
get(Score) when Score >= 2512 andalso Score =< 2512 ->
    262512;
get(Score) when Score >= 2513 andalso Score =< 2513 ->
    262513;
get(Score) when Score >= 2514 andalso Score =< 2514 ->
    262514;
get(Score) when Score >= 2515 andalso Score =< 2515 ->
    262515;
get(Score) when Score >= 2516 andalso Score =< 2516 ->
    262516;
get(Score) when Score >= 2517 andalso Score =< 2517 ->
    262517;
get(Score) when Score >= 2518 andalso Score =< 2518 ->
    262518;
get(Score) when Score >= 2519 andalso Score =< 2519 ->
    262519;
get(Score) when Score >= 2520 andalso Score =< 2520 ->
    262520;
get(Score) when Score >= 2521 andalso Score =< 2521 ->
    262521;
get(Score) when Score >= 2522 andalso Score =< 2522 ->
    262522;
get(Score) when Score >= 2523 andalso Score =< 2523 ->
    262523;
get(Score) when Score >= 2524 andalso Score =< 2524 ->
    262524;
get(Score) when Score >= 2525 andalso Score =< 2525 ->
    262525;
get(Score) when Score >= 2526 andalso Score =< 2526 ->
    262526;
get(Score) when Score >= 2527 andalso Score =< 2527 ->
    262527;
get(Score) when Score >= 2528 andalso Score =< 2528 ->
    262528;
get(Score) when Score >= 2529 andalso Score =< 2529 ->
    262529;
get(Score) when Score >= 2530 andalso Score =< 2530 ->
    262530;
get(Score) when Score >= 2531 andalso Score =< 2531 ->
    262531;
get(Score) when Score >= 2532 andalso Score =< 2532 ->
    262532;
get(Score) when Score >= 2533 andalso Score =< 2533 ->
    262533;
get(Score) when Score >= 2534 andalso Score =< 2534 ->
    262534;
get(Score) when Score >= 2535 andalso Score =< 2535 ->
    262535;
get(Score) when Score >= 2536 andalso Score =< 2536 ->
    262536;
get(Score) when Score >= 2537 andalso Score =< 2537 ->
    262537;
get(Score) when Score >= 2538 andalso Score =< 2538 ->
    262538;
get(Score) when Score >= 2539 andalso Score =< 2539 ->
    262539;
get(Score) when Score >= 2540 andalso Score =< 2540 ->
    262540;
get(Score) when Score >= 2541 andalso Score =< 2541 ->
    262541;
get(Score) when Score >= 2542 andalso Score =< 2542 ->
    262542;
get(Score) when Score >= 2543 andalso Score =< 2543 ->
    262543;
get(Score) when Score >= 2544 andalso Score =< 2544 ->
    262544;
get(Score) when Score >= 2545 andalso Score =< 2545 ->
    262545;
get(Score) when Score >= 2546 andalso Score =< 2546 ->
    262546;
get(Score) when Score >= 2547 andalso Score =< 2547 ->
    262547;
get(Score) when Score >= 2548 andalso Score =< 2548 ->
    262548;
get(Score) when Score >= 2549 andalso Score =< 2549 ->
    262549;
get(Score) when Score >= 2550 andalso Score =< 2550 ->
    262550;
get(Score) when Score >= 2551 andalso Score =< 2551 ->
    262551;
get(Score) when Score >= 2552 andalso Score =< 2552 ->
    262552;
get(Score) when Score >= 2553 andalso Score =< 2553 ->
    262553;
get(Score) when Score >= 2554 andalso Score =< 2554 ->
    262554;
get(Score) when Score >= 2555 andalso Score =< 2555 ->
    262555;
get(Score) when Score >= 2556 andalso Score =< 2556 ->
    262556;
get(Score) when Score >= 2557 andalso Score =< 2557 ->
    262557;
get(Score) when Score >= 2558 andalso Score =< 2558 ->
    262558;
get(Score) when Score >= 2559 andalso Score =< 2559 ->
    262559;
get(Score) when Score >= 2560 andalso Score =< 2560 ->
    262560;
get(Score) when Score >= 2561 andalso Score =< 2561 ->
    262561;
get(Score) when Score >= 2562 andalso Score =< 2562 ->
    262562;
get(Score) when Score >= 2563 andalso Score =< 2563 ->
    262563;
get(Score) when Score >= 2564 andalso Score =< 2564 ->
    262564;
get(Score) when Score >= 2565 andalso Score =< 2565 ->
    262565;
get(Score) when Score >= 2566 andalso Score =< 2566 ->
    262566;
get(Score) when Score >= 2567 andalso Score =< 2567 ->
    262567;
get(Score) when Score >= 2568 andalso Score =< 2568 ->
    262568;
get(Score) when Score >= 2569 andalso Score =< 2569 ->
    262569;
get(Score) when Score >= 2570 andalso Score =< 2570 ->
    262570;
get(Score) when Score >= 2571 andalso Score =< 2571 ->
    262571;
get(Score) when Score >= 2572 andalso Score =< 2572 ->
    262572;
get(Score) when Score >= 2573 andalso Score =< 2573 ->
    262573;
get(Score) when Score >= 2574 andalso Score =< 2574 ->
    262574;
get(Score) when Score >= 2575 andalso Score =< 2575 ->
    262575;
get(Score) when Score >= 2576 andalso Score =< 2576 ->
    262576;
get(Score) when Score >= 2577 andalso Score =< 2577 ->
    262577;
get(Score) when Score >= 2578 andalso Score =< 2578 ->
    262578;
get(Score) when Score >= 2579 andalso Score =< 2579 ->
    262579;
get(Score) when Score >= 2580 andalso Score =< 2580 ->
    262580;
get(Score) when Score >= 2581 andalso Score =< 2581 ->
    262581;
get(Score) when Score >= 2582 andalso Score =< 2582 ->
    262582;
get(Score) when Score >= 2583 andalso Score =< 2583 ->
    262583;
get(Score) when Score >= 2584 andalso Score =< 2584 ->
    262584;
get(Score) when Score >= 2585 andalso Score =< 2585 ->
    262585;
get(Score) when Score >= 2586 andalso Score =< 2586 ->
    262586;
get(Score) when Score >= 2587 andalso Score =< 2587 ->
    262587;
get(Score) when Score >= 2588 andalso Score =< 2588 ->
    262588;
get(Score) when Score >= 2589 andalso Score =< 2589 ->
    262589;
get(Score) when Score >= 2590 andalso Score =< 2590 ->
    262590;
get(Score) when Score >= 2591 andalso Score =< 2591 ->
    262591;
get(Score) when Score >= 2592 andalso Score =< 2592 ->
    262592;
get(Score) when Score >= 2593 andalso Score =< 2593 ->
    262593;
get(Score) when Score >= 2594 andalso Score =< 2594 ->
    262594;
get(Score) when Score >= 2595 andalso Score =< 2595 ->
    262595;
get(Score) when Score >= 2596 andalso Score =< 2596 ->
    262596;
get(Score) when Score >= 2597 andalso Score =< 2597 ->
    262597;
get(Score) when Score >= 2598 andalso Score =< 2598 ->
    262598;
get(Score) when Score >= 2599 andalso Score =< 2599 ->
    262599;
get(Score) when Score >= 2600 andalso Score =< 2600 ->
    262600;
get(Score) when Score >= 2601 andalso Score =< 2601 ->
    262601;
get(Score) when Score >= 2602 andalso Score =< 2602 ->
    262602;
get(Score) when Score >= 2603 andalso Score =< 2603 ->
    262603;
get(Score) when Score >= 2604 andalso Score =< 2604 ->
    262604;
get(Score) when Score >= 2605 andalso Score =< 2605 ->
    262605;
get(Score) when Score >= 2606 andalso Score =< 2606 ->
    262606;
get(Score) when Score >= 2607 andalso Score =< 2607 ->
    262607;
get(Score) when Score >= 2608 andalso Score =< 2608 ->
    262608;
get(Score) when Score >= 2609 andalso Score =< 2609 ->
    262609;
get(Score) when Score >= 2610 andalso Score =< 2610 ->
    262610;
get(Score) when Score >= 2611 andalso Score =< 2611 ->
    262611;
get(Score) when Score >= 2612 andalso Score =< 2612 ->
    262612;
get(Score) when Score >= 2613 andalso Score =< 2613 ->
    262613;
get(Score) when Score >= 2614 andalso Score =< 2614 ->
    262614;
get(Score) when Score >= 2615 andalso Score =< 2615 ->
    262615;
get(Score) when Score >= 2616 andalso Score =< 2616 ->
    262616;
get(Score) when Score >= 2617 andalso Score =< 2617 ->
    262617;
get(Score) when Score >= 2618 andalso Score =< 2618 ->
    262618;
get(Score) when Score >= 2619 andalso Score =< 2619 ->
    262619;
get(Score) when Score >= 2620 andalso Score =< 2620 ->
    262620;
get(Score) when Score >= 2621 andalso Score =< 2621 ->
    262621;
get(Score) when Score >= 2622 andalso Score =< 2622 ->
    262622;
get(Score) when Score >= 2623 andalso Score =< 2623 ->
    262623;
get(Score) when Score >= 2624 andalso Score =< 2624 ->
    262624;
get(Score) when Score >= 2625 andalso Score =< 2625 ->
    262625;
get(Score) when Score >= 2626 andalso Score =< 2626 ->
    262626;
get(Score) when Score >= 2627 andalso Score =< 2627 ->
    262627;
get(Score) when Score >= 2628 andalso Score =< 2628 ->
    262628;
get(Score) when Score >= 2629 andalso Score =< 2629 ->
    262629;
get(Score) when Score >= 2630 andalso Score =< 2630 ->
    262630;
get(Score) when Score >= 2631 andalso Score =< 2631 ->
    262631;
get(Score) when Score >= 2632 andalso Score =< 2632 ->
    262632;
get(Score) when Score >= 2633 andalso Score =< 2633 ->
    262633;
get(Score) when Score >= 2634 andalso Score =< 2634 ->
    262634;
get(Score) when Score >= 2635 andalso Score =< 2635 ->
    262635;
get(Score) when Score >= 2636 andalso Score =< 2636 ->
    262636;
get(Score) when Score >= 2637 andalso Score =< 2637 ->
    262637;
get(Score) when Score >= 2638 andalso Score =< 2638 ->
    262638;
get(Score) when Score >= 2639 andalso Score =< 2639 ->
    262639;
get(Score) when Score >= 2640 andalso Score =< 2640 ->
    262640;
get(Score) when Score >= 2641 andalso Score =< 2641 ->
    262641;
get(Score) when Score >= 2642 andalso Score =< 2642 ->
    262642;
get(Score) when Score >= 2643 andalso Score =< 2643 ->
    262643;
get(Score) when Score >= 2644 andalso Score =< 2644 ->
    262644;
get(Score) when Score >= 2645 andalso Score =< 2645 ->
    262645;
get(Score) when Score >= 2646 andalso Score =< 2646 ->
    262646;
get(Score) when Score >= 2647 andalso Score =< 2647 ->
    262647;
get(Score) when Score >= 2648 andalso Score =< 2648 ->
    262648;
get(Score) when Score >= 2649 andalso Score =< 2649 ->
    262649;
get(Score) when Score >= 2650 andalso Score =< 2650 ->
    262650;
get(Score) when Score >= 2651 andalso Score =< 2651 ->
    262651;
get(Score) when Score >= 2652 andalso Score =< 2652 ->
    262652;
get(Score) when Score >= 2653 andalso Score =< 2653 ->
    262653;
get(Score) when Score >= 2654 andalso Score =< 2654 ->
    262654;
get(Score) when Score >= 2655 andalso Score =< 2655 ->
    262655;
get(Score) when Score >= 2656 andalso Score =< 2656 ->
    262656;
get(Score) when Score >= 2657 andalso Score =< 2657 ->
    262657;
get(Score) when Score >= 2658 andalso Score =< 2658 ->
    262658;
get(Score) when Score >= 2659 andalso Score =< 2659 ->
    262659;
get(Score) when Score >= 2660 andalso Score =< 2660 ->
    262660;
get(Score) when Score >= 2661 andalso Score =< 2661 ->
    262661;
get(Score) when Score >= 2662 andalso Score =< 2662 ->
    262662;
get(Score) when Score >= 2663 andalso Score =< 2663 ->
    262663;
get(Score) when Score >= 2664 andalso Score =< 2664 ->
    262664;
get(Score) when Score >= 2665 andalso Score =< 2665 ->
    262665;
get(Score) when Score >= 2666 andalso Score =< 2666 ->
    262666;
get(Score) when Score >= 2667 andalso Score =< 2667 ->
    262667;
get(Score) when Score >= 2668 andalso Score =< 2668 ->
    262668;
get(Score) when Score >= 2669 andalso Score =< 2669 ->
    262669;
get(Score) when Score >= 2670 andalso Score =< 2670 ->
    262670;
get(Score) when Score >= 2671 andalso Score =< 2671 ->
    262671;
get(Score) when Score >= 2672 andalso Score =< 2672 ->
    262672;
get(Score) when Score >= 2673 andalso Score =< 2673 ->
    262673;
get(Score) when Score >= 2674 andalso Score =< 2674 ->
    262674;
get(Score) when Score >= 2675 andalso Score =< 2675 ->
    262675;
get(Score) when Score >= 2676 andalso Score =< 2676 ->
    262676;
get(Score) when Score >= 2677 andalso Score =< 2677 ->
    262677;
get(Score) when Score >= 2678 andalso Score =< 2678 ->
    262678;
get(Score) when Score >= 2679 andalso Score =< 2679 ->
    262679;
get(Score) when Score >= 2680 andalso Score =< 2680 ->
    262680;
get(Score) when Score >= 2681 andalso Score =< 2681 ->
    262681;
get(Score) when Score >= 2682 andalso Score =< 2682 ->
    262682;
get(Score) when Score >= 2683 andalso Score =< 2683 ->
    262683;
get(Score) when Score >= 2684 andalso Score =< 2684 ->
    262684;
get(Score) when Score >= 2685 andalso Score =< 2685 ->
    262685;
get(Score) when Score >= 2686 andalso Score =< 2686 ->
    262686;
get(Score) when Score >= 2687 andalso Score =< 2687 ->
    262687;
get(Score) when Score >= 2688 andalso Score =< 2688 ->
    262688;
get(Score) when Score >= 2689 andalso Score =< 2689 ->
    262689;
get(Score) when Score >= 2690 andalso Score =< 2690 ->
    262690;
get(Score) when Score >= 2691 andalso Score =< 2691 ->
    262691;
get(Score) when Score >= 2692 andalso Score =< 2692 ->
    262692;
get(Score) when Score >= 2693 andalso Score =< 2693 ->
    262693;
get(Score) when Score >= 2694 andalso Score =< 2694 ->
    262694;
get(Score) when Score >= 2695 andalso Score =< 2695 ->
    262695;
get(Score) when Score >= 2696 andalso Score =< 2696 ->
    262696;
get(Score) when Score >= 2697 andalso Score =< 2697 ->
    262697;
get(Score) when Score >= 2698 andalso Score =< 2698 ->
    262698;
get(Score) when Score >= 2699 andalso Score =< 2699 ->
    262699;
get(Score) when Score >= 2700 andalso Score =< 2700 ->
    262700;
get(Score) when Score >= 2701 andalso Score =< 2701 ->
    262701;
get(Score) when Score >= 2702 andalso Score =< 2702 ->
    262702;
get(Score) when Score >= 2703 andalso Score =< 2703 ->
    262703;
get(Score) when Score >= 2704 andalso Score =< 2704 ->
    262704;
get(Score) when Score >= 2705 andalso Score =< 2705 ->
    262705;
get(Score) when Score >= 2706 andalso Score =< 2706 ->
    262706;
get(Score) when Score >= 2707 andalso Score =< 2707 ->
    262707;
get(Score) when Score >= 2708 andalso Score =< 2708 ->
    262708;
get(Score) when Score >= 2709 andalso Score =< 2709 ->
    262709;
get(Score) when Score >= 2710 andalso Score =< 2710 ->
    262710;
get(Score) when Score >= 2711 andalso Score =< 2711 ->
    262711;
get(Score) when Score >= 2712 andalso Score =< 2712 ->
    262712;
get(Score) when Score >= 2713 andalso Score =< 2713 ->
    262713;
get(Score) when Score >= 2714 andalso Score =< 2714 ->
    262714;
get(Score) when Score >= 2715 andalso Score =< 2715 ->
    262715;
get(Score) when Score >= 2716 andalso Score =< 2716 ->
    262716;
get(Score) when Score >= 2717 andalso Score =< 2717 ->
    262717;
get(Score) when Score >= 2718 andalso Score =< 2718 ->
    262718;
get(Score) when Score >= 2719 andalso Score =< 2719 ->
    262719;
get(Score) when Score >= 2720 andalso Score =< 2720 ->
    262720;
get(Score) when Score >= 2721 andalso Score =< 2721 ->
    262721;
get(Score) when Score >= 2722 andalso Score =< 2722 ->
    262722;
get(Score) when Score >= 2723 andalso Score =< 2723 ->
    262723;
get(Score) when Score >= 2724 andalso Score =< 2724 ->
    262724;
get(Score) when Score >= 2725 andalso Score =< 2725 ->
    262725;
get(Score) when Score >= 2726 andalso Score =< 2726 ->
    262726;
get(Score) when Score >= 2727 andalso Score =< 2727 ->
    262727;
get(Score) when Score >= 2728 andalso Score =< 2728 ->
    262728;
get(Score) when Score >= 2729 andalso Score =< 2729 ->
    262729;
get(Score) when Score >= 2730 andalso Score =< 2730 ->
    262730;
get(Score) when Score >= 2731 andalso Score =< 2731 ->
    262731;
get(Score) when Score >= 2732 andalso Score =< 2732 ->
    262732;
get(Score) when Score >= 2733 andalso Score =< 2733 ->
    262733;
get(Score) when Score >= 2734 andalso Score =< 2734 ->
    262734;
get(Score) when Score >= 2735 andalso Score =< 2735 ->
    262735;
get(Score) when Score >= 2736 andalso Score =< 2736 ->
    262736;
get(Score) when Score >= 2737 andalso Score =< 2737 ->
    262737;
get(Score) when Score >= 2738 andalso Score =< 2738 ->
    262738;
get(Score) when Score >= 2739 andalso Score =< 2739 ->
    262739;
get(Score) when Score >= 2740 andalso Score =< 2740 ->
    262740;
get(Score) when Score >= 2741 andalso Score =< 2741 ->
    262741;
get(Score) when Score >= 2742 andalso Score =< 2742 ->
    262742;
get(Score) when Score >= 2743 andalso Score =< 2743 ->
    262743;
get(Score) when Score >= 2744 andalso Score =< 2744 ->
    262744;
get(Score) when Score >= 2745 andalso Score =< 2745 ->
    262745;
get(Score) when Score >= 2746 andalso Score =< 2746 ->
    262746;
get(Score) when Score >= 2747 andalso Score =< 2747 ->
    262747;
get(Score) when Score >= 2748 andalso Score =< 2748 ->
    262748;
get(Score) when Score >= 2749 andalso Score =< 2749 ->
    262749;
get(Score) when Score >= 2750 andalso Score =< 2750 ->
    262750;
get(Score) when Score >= 2751 andalso Score =< 2751 ->
    262751;
get(Score) when Score >= 2752 andalso Score =< 2752 ->
    262752;
get(Score) when Score >= 2753 andalso Score =< 2753 ->
    262753;
get(Score) when Score >= 2754 andalso Score =< 2754 ->
    262754;
get(Score) when Score >= 2755 andalso Score =< 2755 ->
    262755;
get(Score) when Score >= 2756 andalso Score =< 2756 ->
    262756;
get(Score) when Score >= 2757 andalso Score =< 2757 ->
    262757;
get(Score) when Score >= 2758 andalso Score =< 2758 ->
    262758;
get(Score) when Score >= 2759 andalso Score =< 2759 ->
    262759;
get(Score) when Score >= 2760 andalso Score =< 2760 ->
    262760;
get(Score) when Score >= 2761 andalso Score =< 2761 ->
    262761;
get(Score) when Score >= 2762 andalso Score =< 2762 ->
    262762;
get(Score) when Score >= 2763 andalso Score =< 2763 ->
    262763;
get(Score) when Score >= 2764 andalso Score =< 2764 ->
    262764;
get(Score) when Score >= 2765 andalso Score =< 2765 ->
    262765;
get(Score) when Score >= 2766 andalso Score =< 2766 ->
    262766;
get(Score) when Score >= 2767 andalso Score =< 2767 ->
    262767;
get(Score) when Score >= 2768 andalso Score =< 2768 ->
    262768;
get(Score) when Score >= 2769 andalso Score =< 2769 ->
    262769;
get(Score) when Score >= 2770 andalso Score =< 2770 ->
    262770;
get(Score) when Score >= 2771 andalso Score =< 2771 ->
    262771;
get(Score) when Score >= 2772 andalso Score =< 2772 ->
    262772;
get(Score) when Score >= 2773 andalso Score =< 2773 ->
    262773;
get(Score) when Score >= 2774 andalso Score =< 2774 ->
    262774;
get(Score) when Score >= 2775 andalso Score =< 2775 ->
    262775;
get(Score) when Score >= 2776 andalso Score =< 2776 ->
    262776;
get(Score) when Score >= 2777 andalso Score =< 2777 ->
    262777;
get(Score) when Score >= 2778 andalso Score =< 2778 ->
    262778;
get(Score) when Score >= 2779 andalso Score =< 2779 ->
    262779;
get(Score) when Score >= 2780 andalso Score =< 2780 ->
    262780;
get(Score) when Score >= 2781 andalso Score =< 2781 ->
    262781;
get(Score) when Score >= 2782 andalso Score =< 2782 ->
    262782;
get(Score) when Score >= 2783 andalso Score =< 2783 ->
    262783;
get(Score) when Score >= 2784 andalso Score =< 2784 ->
    262784;
get(Score) when Score >= 2785 andalso Score =< 2785 ->
    262785;
get(Score) when Score >= 2786 andalso Score =< 2786 ->
    262786;
get(Score) when Score >= 2787 andalso Score =< 2787 ->
    262787;
get(Score) when Score >= 2788 andalso Score =< 2788 ->
    262788;
get(Score) when Score >= 2789 andalso Score =< 2789 ->
    262789;
get(Score) when Score >= 2790 andalso Score =< 2790 ->
    262790;
get(Score) when Score >= 2791 andalso Score =< 2791 ->
    262791;
get(Score) when Score >= 2792 andalso Score =< 2792 ->
    262792;
get(Score) when Score >= 2793 andalso Score =< 2793 ->
    262793;
get(Score) when Score >= 2794 andalso Score =< 2794 ->
    262794;
get(Score) when Score >= 2795 andalso Score =< 2795 ->
    262795;
get(Score) when Score >= 2796 andalso Score =< 2796 ->
    262796;
get(Score) when Score >= 2797 andalso Score =< 2797 ->
    262797;
get(Score) when Score >= 2798 andalso Score =< 2798 ->
    262798;
get(Score) when Score >= 2799 andalso Score =< 2799 ->
    262799;
get(Score) when Score >= 2800 andalso Score =< 2800 ->
    262800;
get(Score) when Score >= 2801 andalso Score =< 2801 ->
    262801;
get(Score) when Score >= 2802 andalso Score =< 2802 ->
    262802;
get(Score) when Score >= 2803 andalso Score =< 2803 ->
    262803;
get(Score) when Score >= 2804 andalso Score =< 2804 ->
    262804;
get(Score) when Score >= 2805 andalso Score =< 2805 ->
    262805;
get(Score) when Score >= 2806 andalso Score =< 2806 ->
    262806;
get(Score) when Score >= 2807 andalso Score =< 2807 ->
    262807;
get(Score) when Score >= 2808 andalso Score =< 2808 ->
    262808;
get(Score) when Score >= 2809 andalso Score =< 2809 ->
    262809;
get(Score) when Score >= 2810 andalso Score =< 2810 ->
    262810;
get(Score) when Score >= 2811 andalso Score =< 2811 ->
    262811;
get(Score) when Score >= 2812 andalso Score =< 2812 ->
    262812;
get(Score) when Score >= 2813 andalso Score =< 2813 ->
    262813;
get(Score) when Score >= 2814 andalso Score =< 2814 ->
    262814;
get(Score) when Score >= 2815 andalso Score =< 2815 ->
    262815;
get(Score) when Score >= 2816 andalso Score =< 2816 ->
    262816;
get(Score) when Score >= 2817 andalso Score =< 2817 ->
    262817;
get(Score) when Score >= 2818 andalso Score =< 2818 ->
    262818;
get(Score) when Score >= 2819 andalso Score =< 2819 ->
    262819;
get(Score) when Score >= 2820 andalso Score =< 2820 ->
    262820;
get(Score) when Score >= 2821 andalso Score =< 2821 ->
    262821;
get(Score) when Score >= 2822 andalso Score =< 2822 ->
    262822;
get(Score) when Score >= 2823 andalso Score =< 2823 ->
    262823;
get(Score) when Score >= 2824 andalso Score =< 2824 ->
    262824;
get(Score) when Score >= 2825 andalso Score =< 2825 ->
    262825;
get(Score) when Score >= 2826 andalso Score =< 2826 ->
    262826;
get(Score) when Score >= 2827 andalso Score =< 2827 ->
    262827;
get(Score) when Score >= 2828 andalso Score =< 2828 ->
    262828;
get(Score) when Score >= 2829 andalso Score =< 2829 ->
    262829;
get(Score) when Score >= 2830 andalso Score =< 2830 ->
    262830;
get(Score) when Score >= 2831 andalso Score =< 2831 ->
    262831;
get(Score) when Score >= 2832 andalso Score =< 2832 ->
    262832;
get(Score) when Score >= 2833 andalso Score =< 2833 ->
    262833;
get(Score) when Score >= 2834 andalso Score =< 2834 ->
    262834;
get(Score) when Score >= 2835 andalso Score =< 2835 ->
    262835;
get(Score) when Score >= 2836 andalso Score =< 2836 ->
    262836;
get(Score) when Score >= 2837 andalso Score =< 2837 ->
    262837;
get(Score) when Score >= 2838 andalso Score =< 2838 ->
    262838;
get(Score) when Score >= 2839 andalso Score =< 2839 ->
    262839;
get(Score) when Score >= 2840 andalso Score =< 2840 ->
    262840;
get(Score) when Score >= 2841 andalso Score =< 2841 ->
    262841;
get(Score) when Score >= 2842 andalso Score =< 2842 ->
    262842;
get(Score) when Score >= 2843 andalso Score =< 2843 ->
    262843;
get(Score) when Score >= 2844 andalso Score =< 2844 ->
    262844;
get(Score) when Score >= 2845 andalso Score =< 2845 ->
    262845;
get(Score) when Score >= 2846 andalso Score =< 2846 ->
    262846;
get(Score) when Score >= 2847 andalso Score =< 2847 ->
    262847;
get(Score) when Score >= 2848 andalso Score =< 2848 ->
    262848;
get(Score) when Score >= 2849 andalso Score =< 2849 ->
    262849;
get(Score) when Score >= 2850 andalso Score =< 2850 ->
    262850;
get(Score) when Score >= 2851 andalso Score =< 2851 ->
    262851;
get(Score) when Score >= 2852 andalso Score =< 2852 ->
    262852;
get(Score) when Score >= 2853 andalso Score =< 2853 ->
    262853;
get(Score) when Score >= 2854 andalso Score =< 2854 ->
    262854;
get(Score) when Score >= 2855 andalso Score =< 2855 ->
    262855;
get(Score) when Score >= 2856 andalso Score =< 2856 ->
    262856;
get(Score) when Score >= 2857 andalso Score =< 2857 ->
    262857;
get(Score) when Score >= 2858 andalso Score =< 2858 ->
    262858;
get(Score) when Score >= 2859 andalso Score =< 2859 ->
    262859;
get(Score) when Score >= 2860 andalso Score =< 2860 ->
    262860;
get(Score) when Score >= 2861 andalso Score =< 2861 ->
    262861;
get(Score) when Score >= 2862 andalso Score =< 2862 ->
    262862;
get(Score) when Score >= 2863 andalso Score =< 2863 ->
    262863;
get(Score) when Score >= 2864 andalso Score =< 2864 ->
    262864;
get(Score) when Score >= 2865 andalso Score =< 2865 ->
    262865;
get(Score) when Score >= 2866 andalso Score =< 2866 ->
    262866;
get(Score) when Score >= 2867 andalso Score =< 2867 ->
    262867;
get(Score) when Score >= 2868 andalso Score =< 2868 ->
    262868;
get(Score) when Score >= 2869 andalso Score =< 2869 ->
    262869;
get(Score) when Score >= 2870 andalso Score =< 2870 ->
    262870;
get(Score) when Score >= 2871 andalso Score =< 2871 ->
    262871;
get(Score) when Score >= 2872 andalso Score =< 2872 ->
    262872;
get(Score) when Score >= 2873 andalso Score =< 2873 ->
    262873;
get(Score) when Score >= 2874 andalso Score =< 2874 ->
    262874;
get(Score) when Score >= 2875 andalso Score =< 2875 ->
    262875;
get(Score) when Score >= 2876 andalso Score =< 2876 ->
    262876;
get(Score) when Score >= 2877 andalso Score =< 2877 ->
    262877;
get(Score) when Score >= 2878 andalso Score =< 2878 ->
    262878;
get(Score) when Score >= 2879 andalso Score =< 2879 ->
    262879;
get(Score) when Score >= 2880 andalso Score =< 2880 ->
    262880;
get(Score) when Score >= 2881 andalso Score =< 2881 ->
    262881;
get(Score) when Score >= 2882 andalso Score =< 2882 ->
    262882;
get(Score) when Score >= 2883 andalso Score =< 2883 ->
    262883;
get(Score) when Score >= 2884 andalso Score =< 2884 ->
    262884;
get(Score) when Score >= 2885 andalso Score =< 2885 ->
    262885;
get(Score) when Score >= 2886 andalso Score =< 2886 ->
    262886;
get(Score) when Score >= 2887 andalso Score =< 2887 ->
    262887;
get(Score) when Score >= 2888 andalso Score =< 2888 ->
    262888;
get(Score) when Score >= 2889 andalso Score =< 2889 ->
    262889;
get(Score) when Score >= 2890 andalso Score =< 2890 ->
    262890;
get(Score) when Score >= 2891 andalso Score =< 2891 ->
    262891;
get(Score) when Score >= 2892 andalso Score =< 2892 ->
    262892;
get(Score) when Score >= 2893 andalso Score =< 2893 ->
    262893;
get(Score) when Score >= 2894 andalso Score =< 2894 ->
    262894;
get(Score) when Score >= 2895 andalso Score =< 2895 ->
    262895;
get(Score) when Score >= 2896 andalso Score =< 2896 ->
    262896;
get(Score) when Score >= 2897 andalso Score =< 2897 ->
    262897;
get(Score) when Score >= 2898 andalso Score =< 2898 ->
    262898;
get(Score) when Score >= 2899 andalso Score =< 2899 ->
    262899;
get(Score) when Score >= 2900 andalso Score =< 2900 ->
    262900;
get(Score) when Score >= 2901 andalso Score =< 2901 ->
    262901;
get(Score) when Score >= 2902 andalso Score =< 2902 ->
    262902;
get(Score) when Score >= 2903 andalso Score =< 2903 ->
    262903;
get(Score) when Score >= 2904 andalso Score =< 2904 ->
    262904;
get(Score) when Score >= 2905 andalso Score =< 2905 ->
    262905;
get(Score) when Score >= 2906 andalso Score =< 2906 ->
    262906;
get(Score) when Score >= 2907 andalso Score =< 2907 ->
    262907;
get(Score) when Score >= 2908 andalso Score =< 2908 ->
    262908;
get(Score) when Score >= 2909 andalso Score =< 2909 ->
    262909;
get(Score) when Score >= 2910 andalso Score =< 2910 ->
    262910;
get(Score) when Score >= 2911 andalso Score =< 2911 ->
    262911;
get(Score) when Score >= 2912 andalso Score =< 2912 ->
    262912;
get(Score) when Score >= 2913 andalso Score =< 2913 ->
    262913;
get(Score) when Score >= 2914 andalso Score =< 2914 ->
    262914;
get(Score) when Score >= 2915 andalso Score =< 2915 ->
    262915;
get(Score) when Score >= 2916 andalso Score =< 2916 ->
    262916;
get(Score) when Score >= 2917 andalso Score =< 2917 ->
    262917;
get(Score) when Score >= 2918 andalso Score =< 2918 ->
    262918;
get(Score) when Score >= 2919 andalso Score =< 2919 ->
    262919;
get(Score) when Score >= 2920 andalso Score =< 2920 ->
    262920;
get(Score) when Score >= 2921 andalso Score =< 2921 ->
    262921;
get(Score) when Score >= 2922 andalso Score =< 2922 ->
    262922;
get(Score) when Score >= 2923 andalso Score =< 2923 ->
    262923;
get(Score) when Score >= 2924 andalso Score =< 2924 ->
    262924;
get(Score) when Score >= 2925 andalso Score =< 2925 ->
    262925;
get(Score) when Score >= 2926 andalso Score =< 2926 ->
    262926;
get(Score) when Score >= 2927 andalso Score =< 2927 ->
    262927;
get(Score) when Score >= 2928 andalso Score =< 2928 ->
    262928;
get(Score) when Score >= 2929 andalso Score =< 2929 ->
    262929;
get(Score) when Score >= 2930 andalso Score =< 2930 ->
    262930;
get(Score) when Score >= 2931 andalso Score =< 2931 ->
    262931;
get(Score) when Score >= 2932 andalso Score =< 2932 ->
    262932;
get(Score) when Score >= 2933 andalso Score =< 2933 ->
    262933;
get(Score) when Score >= 2934 andalso Score =< 2934 ->
    262934;
get(Score) when Score >= 2935 andalso Score =< 2935 ->
    262935;
get(Score) when Score >= 2936 andalso Score =< 2936 ->
    262936;
get(Score) when Score >= 2937 andalso Score =< 2937 ->
    262937;
get(Score) when Score >= 2938 andalso Score =< 2938 ->
    262938;
get(Score) when Score >= 2939 andalso Score =< 2939 ->
    262939;
get(Score) when Score >= 2940 andalso Score =< 2940 ->
    262940;
get(Score) when Score >= 2941 andalso Score =< 2941 ->
    262941;
get(Score) when Score >= 2942 andalso Score =< 2942 ->
    262942;
get(Score) when Score >= 2943 andalso Score =< 2943 ->
    262943;
get(Score) when Score >= 2944 andalso Score =< 2944 ->
    262944;
get(Score) when Score >= 2945 andalso Score =< 2945 ->
    262945;
get(Score) when Score >= 2946 andalso Score =< 2946 ->
    262946;
get(Score) when Score >= 2947 andalso Score =< 2947 ->
    262947;
get(Score) when Score >= 2948 andalso Score =< 2948 ->
    262948;
get(Score) when Score >= 2949 andalso Score =< 2949 ->
    262949;
get(Score) when Score >= 2950 andalso Score =< 2950 ->
    262950;
get(Score) when Score >= 2951 andalso Score =< 2951 ->
    262951;
get(Score) when Score >= 2952 andalso Score =< 2952 ->
    262952;
get(Score) when Score >= 2953 andalso Score =< 2953 ->
    262953;
get(Score) when Score >= 2954 andalso Score =< 2954 ->
    262954;
get(Score) when Score >= 2955 andalso Score =< 2955 ->
    262955;
get(Score) when Score >= 2956 andalso Score =< 2956 ->
    262956;
get(Score) when Score >= 2957 andalso Score =< 2957 ->
    262957;
get(Score) when Score >= 2958 andalso Score =< 2958 ->
    262958;
get(Score) when Score >= 2959 andalso Score =< 2959 ->
    262959;
get(Score) when Score >= 2960 andalso Score =< 2960 ->
    262960;
get(Score) when Score >= 2961 andalso Score =< 2961 ->
    262961;
get(Score) when Score >= 2962 andalso Score =< 2962 ->
    262962;
get(Score) when Score >= 2963 andalso Score =< 2963 ->
    262963;
get(Score) when Score >= 2964 andalso Score =< 2964 ->
    262964;
get(Score) when Score >= 2965 andalso Score =< 2965 ->
    262965;
get(Score) when Score >= 2966 andalso Score =< 2966 ->
    262966;
get(Score) when Score >= 2967 andalso Score =< 2967 ->
    262967;
get(Score) when Score >= 2968 andalso Score =< 2968 ->
    262968;
get(Score) when Score >= 2969 andalso Score =< 2969 ->
    262969;
get(Score) when Score >= 2970 andalso Score =< 2970 ->
    262970;
get(Score) when Score >= 2971 andalso Score =< 2971 ->
    262971;
get(Score) when Score >= 2972 andalso Score =< 2972 ->
    262972;
get(Score) when Score >= 2973 andalso Score =< 2973 ->
    262973;
get(Score) when Score >= 2974 andalso Score =< 2974 ->
    262974;
get(Score) when Score >= 2975 andalso Score =< 2975 ->
    262975;
get(Score) when Score >= 2976 andalso Score =< 2976 ->
    262976;
get(Score) when Score >= 2977 andalso Score =< 2977 ->
    262977;
get(Score) when Score >= 2978 andalso Score =< 2978 ->
    262978;
get(Score) when Score >= 2979 andalso Score =< 2979 ->
    262979;
get(Score) when Score >= 2980 andalso Score =< 2980 ->
    262980;
get(Score) when Score >= 2981 andalso Score =< 2981 ->
    262981;
get(Score) when Score >= 2982 andalso Score =< 2982 ->
    262982;
get(Score) when Score >= 2983 andalso Score =< 2983 ->
    262983;
get(Score) when Score >= 2984 andalso Score =< 2984 ->
    262984;
get(Score) when Score >= 2985 andalso Score =< 2985 ->
    262985;
get(Score) when Score >= 2986 andalso Score =< 2986 ->
    262986;
get(Score) when Score >= 2987 andalso Score =< 2987 ->
    262987;
get(Score) when Score >= 2988 andalso Score =< 2988 ->
    262988;
get(Score) when Score >= 2989 andalso Score =< 2989 ->
    262989;
get(Score) when Score >= 2990 andalso Score =< 2990 ->
    262990;
get(Score) when Score >= 2991 andalso Score =< 2991 ->
    262991;
get(Score) when Score >= 2992 andalso Score =< 2992 ->
    262992;
get(Score) when Score >= 2993 andalso Score =< 2993 ->
    262993;
get(Score) when Score >= 2994 andalso Score =< 2994 ->
    262994;
get(Score) when Score >= 2995 andalso Score =< 2995 ->
    262995;
get(Score) when Score >= 2996 andalso Score =< 2996 ->
    262996;
get(Score) when Score >= 2997 andalso Score =< 2997 ->
    262997;
get(Score) when Score >= 2998 andalso Score =< 2998 ->
    262998;
get(Score) when Score >= 2999 andalso Score =< 2999 ->
    262999;
get(Score) when Score >= 3000 andalso Score =< 9999 ->
    263000;
get(_Score) ->
    0.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152, 1153, 1154, 1155, 1156, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1197, 1198, 1199, 1200, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1243, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1254, 1255, 1256, 1257, 1258, 1259, 1260, 1261, 1262, 1263, 1264, 1265, 1266, 1267, 1268, 1269, 1270, 1271, 1272, 1273, 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281, 1282, 1283, 1284, 1285, 1286, 1287, 1288, 1289, 1290, 1291, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318, 1319, 1320, 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368, 1369, 1370, 1371, 1372, 1373, 1374, 1375, 1376, 1377, 1378, 1379, 1380, 1381, 1382, 1383, 1384, 1385, 1386, 1387, 1388, 1389, 1390, 1391, 1392, 1393, 1394, 1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1403, 1404, 1405, 1406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422, 1423, 1424, 1425, 1426, 1427, 1428, 1429, 1430, 1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1441, 1442, 1443, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1451, 1452, 1453, 1454, 1455, 1456, 1457, 1458, 1459, 1460, 1461, 1462, 1463, 1464, 1465, 1466, 1467, 1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1482, 1483, 1484, 1485, 1486, 1487, 1488, 1489, 1490, 1491, 1492, 1493, 1494, 1495, 1496, 1497, 1498, 1499, 1500, 1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1523, 1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531, 1532, 1533, 1534, 1535, 1536, 1537, 1538, 1539, 1540, 1541, 1542, 1543, 1544, 1545, 1546, 1547, 1548, 1549, 1550, 1551, 1552, 1553, 1554, 1555, 1556, 1557, 1558, 1559, 1560, 1561, 1562, 1563, 1564, 1565, 1566, 1567, 1568, 1569, 1570, 1571, 1572, 1573, 1574, 1575, 1576, 1577, 1578, 1579, 1580, 1581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 1589, 1590, 1591, 1592, 1593, 1594, 1595, 1596, 1597, 1598, 1599, 1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621, 1622, 1623, 1624, 1625, 1626, 1627, 1628, 1629, 1630, 1631, 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1642, 1643, 1644, 1645, 1646, 1647, 1648, 1649, 1650, 1651, 1652, 1653, 1654, 1655, 1656, 1657, 1658, 1659, 1660, 1661, 1662, 1663, 1664, 1665, 1666, 1667, 1668, 1669, 1670, 1671, 1672, 1673, 1674, 1675, 1676, 1677, 1678, 1679, 1680, 1681, 1682, 1683, 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1716, 1717, 1718, 1719, 1720, 1721, 1722, 1723, 1724, 1725, 1726, 1727, 1728, 1729, 1730, 1731, 1732, 1733, 1734, 1735, 1736, 1737, 1738, 1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746, 1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755, 1756, 1757, 1758, 1759, 1760, 1761, 1762, 1763, 1764, 1765, 1766, 1767, 1768, 1769, 1770, 1771, 1772, 1773, 1774, 1775, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785, 1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799, 1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823, 1824, 1825, 1826, 1827, 1828, 1829, 1830, 1831, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 1845, 1846, 1847, 1848, 1849, 1850, 1851, 1852, 1853, 1854, 1855, 1856, 1857, 1858, 1859, 1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870, 1871, 1872, 1873, 1874, 1875, 1876, 1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1888, 1889, 1890, 1891, 1892, 1893, 1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050, 2051, 2052, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 2061, 2062, 2063, 2064, 2065, 2066, 2067, 2068, 2069, 2070, 2071, 2072, 2073, 2074, 2075, 2076, 2077, 2078, 2079, 2080, 2081, 2082, 2083, 2084, 2085, 2086, 2087, 2088, 2089, 2090, 2091, 2092, 2093, 2094, 2095, 2096, 2097, 2098, 2099, 2100, 2101, 2102, 2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111, 2112, 2113, 2114, 2115, 2116, 2117, 2118, 2119, 2120, 2121, 2122, 2123, 2124, 2125, 2126, 2127, 2128, 2129, 2130, 2131, 2132, 2133, 2134, 2135, 2136, 2137, 2138, 2139, 2140, 2141, 2142, 2143, 2144, 2145, 2146, 2147, 2148, 2149, 2150, 2151, 2152, 2153, 2154, 2155, 2156, 2157, 2158, 2159, 2160, 2161, 2162, 2163, 2164, 2165, 2166, 2167, 2168, 2169, 2170, 2171, 2172, 2173, 2174, 2175, 2176, 2177, 2178, 2179, 2180, 2181, 2182, 2183, 2184, 2185, 2186, 2187, 2188, 2189, 2190, 2191, 2192, 2193, 2194, 2195, 2196, 2197, 2198, 2199, 2200, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2216, 2217, 2218, 2219, 2220, 2221, 2222, 2223, 2224, 2225, 2226, 2227, 2228, 2229, 2230, 2231, 2232, 2233, 2234, 2235, 2236, 2237, 2238, 2239, 2240, 2241, 2242, 2243, 2244, 2245, 2246, 2247, 2248, 2249, 2250, 2251, 2252, 2253, 2254, 2255, 2256, 2257, 2258, 2259, 2260, 2261, 2262, 2263, 2264, 2265, 2266, 2267, 2268, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2276, 2277, 2278, 2279, 2280, 2281, 2282, 2283, 2284, 2285, 2286, 2287, 2288, 2289, 2290, 2291, 2292, 2293, 2294, 2295, 2296, 2297, 2298, 2299, 2300, 2301, 2302, 2303, 2304, 2305, 2306, 2307, 2308, 2309, 2310, 2311, 2312, 2313, 2314, 2315, 2316, 2317, 2318, 2319, 2320, 2321, 2322, 2323, 2324, 2325, 2326, 2327, 2328, 2329, 2330, 2331, 2332, 2333, 2334, 2335, 2336, 2337, 2338, 2339, 2340, 2341, 2342, 2343, 2344, 2345, 2346, 2347, 2348, 2349, 2350, 2351, 2352, 2353, 2354, 2355, 2356, 2357, 2358, 2359, 2360, 2361, 2362, 2363, 2364, 2365, 2366, 2367, 2368, 2369, 2370, 2371, 2372, 2373, 2374, 2375, 2376, 2377, 2378, 2379, 2380, 2381, 2382, 2383, 2384, 2385, 2386, 2387, 2388, 2389, 2390, 2391, 2392, 2393, 2394, 2395, 2396, 2397, 2398, 2399, 2400, 2401, 2402, 2403, 2404, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2415, 2416, 2417, 2418, 2419, 2420, 2421, 2422, 2423, 2424, 2425, 2426, 2427, 2428, 2429, 2430, 2431, 2432, 2433, 2434, 2435, 2436, 2437, 2438, 2439, 2440, 2441, 2442, 2443, 2444, 2445, 2446, 2447, 2448, 2449, 2450, 2451, 2452, 2453, 2454, 2455, 2456, 2457, 2458, 2459, 2460, 2461, 2462, 2463, 2464, 2465, 2466, 2467, 2468, 2469, 2470, 2471, 2472, 2473, 2474, 2475, 2476, 2477, 2478, 2479, 2480, 2481, 2482, 2483, 2484, 2485, 2486, 2487, 2488, 2489, 2490, 2491, 2492, 2493, 2494, 2495, 2496, 2497, 2498, 2499, 2500, 2501, 2502, 2503, 2504, 2505, 2506, 2507, 2508, 2509, 2510, 2511, 2512, 2513, 2514, 2515, 2516, 2517, 2518, 2519, 2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 2528, 2529, 2530, 2531, 2532, 2533, 2534, 2535, 2536, 2537, 2538, 2539, 2540, 2541, 2542, 2543, 2544, 2545, 2546, 2547, 2548, 2549, 2550, 2551, 2552, 2553, 2554, 2555, 2556, 2557, 2558, 2559, 2560, 2561, 2562, 2563, 2564, 2565, 2566, 2567, 2568, 2569, 2570, 2571, 2572, 2573, 2574, 2575, 2576, 2577, 2578, 2579, 2580, 2581, 2582, 2583, 2584, 2585, 2586, 2587, 2588, 2589, 2590, 2591, 2592, 2593, 2594, 2595, 2596, 2597, 2598, 2599, 2600, 2601, 2602, 2603, 2604, 2605, 2606, 2607, 2608, 2609, 2610, 2611, 2612, 2613, 2614, 2615, 2616, 2617, 2618, 2619, 2620, 2621, 2622, 2623, 2624, 2625, 2626, 2627, 2628, 2629, 2630, 2631, 2632, 2633, 2634, 2635, 2636, 2637, 2638, 2639, 2640, 2641, 2642, 2643, 2644, 2645, 2646, 2647, 2648, 2649, 2650, 2651, 2652, 2653, 2654, 2655, 2656, 2657, 2658, 2659, 2660, 2661, 2662, 2663, 2664, 2665, 2666, 2667, 2668, 2669, 2670, 2671, 2672, 2673, 2674, 2675, 2676, 2677, 2678, 2679, 2680, 2681, 2682, 2683, 2684, 2685, 2686, 2687, 2688, 2689, 2690, 2691, 2692, 2693, 2694, 2695, 2696, 2697, 2698, 2699, 2700, 2701, 2702, 2703, 2704, 2705, 2706, 2707, 2708, 2709, 2710, 2711, 2712, 2713, 2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721, 2722, 2723, 2724, 2725, 2726, 2727, 2728, 2729, 2730, 2731, 2732, 2733, 2734, 2735, 2736, 2737, 2738, 2739, 2740, 2741, 2742, 2743, 2744, 2745, 2746, 2747, 2748, 2749, 2750, 2751, 2752, 2753, 2754, 2755, 2756, 2757, 2758, 2759, 2760, 2761, 2762, 2763, 2764, 2765, 2766, 2767, 2768, 2769, 2770, 2771, 2772, 2773, 2774, 2775, 2776, 2777, 2778, 2779, 2780, 2781, 2782, 2783, 2784, 2785, 2786, 2787, 2788, 2789, 2790, 2791, 2792, 2793, 2794, 2795, 2796, 2797, 2798, 2799, 2800, 2801, 2802, 2803, 2804, 2805, 2806, 2807, 2808, 2809, 2810, 2811, 2812, 2813, 2814, 2815, 2816, 2817, 2818, 2819, 2820, 2821, 2822, 2823, 2824, 2825, 2826, 2827, 2828, 2829, 2830, 2831, 2832, 2833, 2834, 2835, 2836, 2837, 2838, 2839, 2840, 2841, 2842, 2843, 2844, 2845, 2846, 2847, 2848, 2849, 2850, 2851, 2852, 2853, 2854, 2855, 2856, 2857, 2858, 2859, 2860, 2861, 2862, 2863, 2864, 2865, 2866, 2867, 2868, 2869, 2870, 2871, 2872, 2873, 2874, 2875, 2876, 2877, 2878, 2879, 2880, 2881, 2882, 2883, 2884, 2885, 2886, 2887, 2888, 2889, 2890, 2891, 2892, 2893, 2894, 2895, 2896, 2897, 2898, 2899, 2900, 2901, 2902, 2903, 2904, 2905, 2906, 2907, 2908, 2909, 2910, 2911, 2912, 2913, 2914, 2915, 2916, 2917, 2918, 2919, 2920, 2921, 2922, 2923, 2924, 2925, 2926, 2927, 2928, 2929, 2930, 2931, 2932, 2933, 2934, 2935, 2936, 2937, 2938, 2939, 2940, 2941, 2942, 2943, 2944, 2945, 2946, 2947, 2948, 2949, 2950, 2951, 2952, 2953, 2954, 2955, 2956, 2957, 2958, 2959, 2960, 2961, 2962, 2963, 2964, 2965, 2966, 2967, 2968, 2969, 2970, 2971, 2972, 2973, 2974, 2975, 2976, 2977, 2978, 2979, 2980, 2981, 2982, 2983, 2984, 2985, 2986, 2987, 2988, 2989, 2990, 2991, 2992, 2993, 2994, 2995, 2996, 2997, 2998, 2999, 3000, 3001].
