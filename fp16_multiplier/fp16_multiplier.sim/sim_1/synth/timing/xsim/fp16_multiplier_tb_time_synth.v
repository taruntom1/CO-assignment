// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Wed Sep 30 16:13:47 2026
// Host        : TARUN-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {E:/CO
//               assignment/fp16_multiplier/fp16_multiplier.sim/sim_1/synth/timing/xsim/fp16_multiplier_tb_time_synth.v}
// Design      : fp16_multiplier
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Power Summary\": {\n      \"Dynamic Power\": {\n        \"Value\": \"17.347\"\n      },\n      \"Static Power\": {\n        \"Value\": \"0.747\"\n      },\n      \"Total Power\": {\n        \"Value\": \"18.094\"\n      }\n    },\n    \"Timing Summary\": {\n      \"Status\": \"Timing constraints are not met.\"\n    }\n  },\n  \"Design Flow Data\": {\n    \"Design Data\": {\n      \"Design Mode\": \"Project flow\",\n      \"Top Methodology\": \"Verilog\"\n    },\n    \"Synthesis\": {\n      \"Run Time\": \"48.664000 seconds\"\n    }\n  }\n}" *) 
module fp16_multiplier
   (a,
    b,
    product);
  input [15:0]a;
  input [15:0]b;
  output [15:0]product;

  wire [15:0]a;
  wire [15:0]a_IBUF;
  wire [15:0]b;
  wire [15:0]b_IBUF;
  wire [4:1]exponent_result;
  wire exponent_result1_n_100;
  wire exponent_result1_n_101;
  wire exponent_result1_n_102;
  wire exponent_result1_n_103;
  wire exponent_result1_n_104;
  wire exponent_result1_n_105;
  wire exponent_result1_n_85;
  wire exponent_result1_n_86;
  wire exponent_result1_n_87;
  wire exponent_result1_n_88;
  wire exponent_result1_n_89;
  wire exponent_result1_n_90;
  wire exponent_result1_n_91;
  wire exponent_result1_n_92;
  wire exponent_result1_n_93;
  wire exponent_result1_n_94;
  wire exponent_result1_n_95;
  wire exponent_result1_n_96;
  wire exponent_result1_n_97;
  wire exponent_result1_n_98;
  wire exponent_result1_n_99;
  wire p_0_in;
  wire [15:0]product;
  wire product1;
  wire [15:0]product_OBUF;
  wire \product_OBUF[12]_inst_i_3_n_0 ;
  wire \product_OBUF[14]_inst_i_10_n_0 ;
  wire \product_OBUF[14]_inst_i_11_n_0 ;
  wire \product_OBUF[14]_inst_i_12_n_0 ;
  wire \product_OBUF[14]_inst_i_13_n_0 ;
  wire \product_OBUF[14]_inst_i_14_n_0 ;
  wire \product_OBUF[14]_inst_i_15_n_0 ;
  wire \product_OBUF[14]_inst_i_3_n_0 ;
  wire \product_OBUF[14]_inst_i_4_n_0 ;
  wire \product_OBUF[14]_inst_i_5_n_0 ;
  wire \product_OBUF[14]_inst_i_6_n_0 ;
  wire \product_OBUF[14]_inst_i_7_n_0 ;
  wire \product_OBUF[14]_inst_i_8_n_0 ;
  wire \product_OBUF[14]_inst_i_9_n_0 ;
  wire \product_OBUF[15]_inst_i_10_n_0 ;
  wire \product_OBUF[15]_inst_i_11_n_0 ;
  wire \product_OBUF[15]_inst_i_2_n_0 ;
  wire \product_OBUF[15]_inst_i_3_n_0 ;
  wire \product_OBUF[15]_inst_i_5_n_0 ;
  wire \product_OBUF[15]_inst_i_6_n_0 ;
  wire \product_OBUF[15]_inst_i_7_n_0 ;
  wire \product_OBUF[15]_inst_i_8_n_0 ;
  wire \product_OBUF[15]_inst_i_9_n_0 ;
  wire \product_OBUF[9]_inst_i_2_n_0 ;
  wire \product_OBUF[9]_inst_i_3_n_0 ;
  wire \product_OBUF[9]_inst_i_4_n_0 ;
  wire NLW_exponent_result1_CARRYCASCOUT_UNCONNECTED;
  wire NLW_exponent_result1_MULTSIGNOUT_UNCONNECTED;
  wire NLW_exponent_result1_OVERFLOW_UNCONNECTED;
  wire NLW_exponent_result1_PATTERNBDETECT_UNCONNECTED;
  wire NLW_exponent_result1_PATTERNDETECT_UNCONNECTED;
  wire NLW_exponent_result1_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_exponent_result1_ACOUT_UNCONNECTED;
  wire [17:0]NLW_exponent_result1_BCOUT_UNCONNECTED;
  wire [3:0]NLW_exponent_result1_CARRYOUT_UNCONNECTED;
  wire [47:22]NLW_exponent_result1_P_UNCONNECTED;
  wire [47:0]NLW_exponent_result1_PCOUT_UNCONNECTED;

initial begin
 $sdf_annotate("fp16_multiplier_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[10]_inst 
       (.I(a[10]),
        .O(a_IBUF[10]));
  IBUF \a_IBUF[11]_inst 
       (.I(a[11]),
        .O(a_IBUF[11]));
  IBUF \a_IBUF[12]_inst 
       (.I(a[12]),
        .O(a_IBUF[12]));
  IBUF \a_IBUF[13]_inst 
       (.I(a[13]),
        .O(a_IBUF[13]));
  IBUF \a_IBUF[14]_inst 
       (.I(a[14]),
        .O(a_IBUF[14]));
  IBUF \a_IBUF[15]_inst 
       (.I(a[15]),
        .O(a_IBUF[15]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \a_IBUF[3]_inst 
       (.I(a[3]),
        .O(a_IBUF[3]));
  IBUF \a_IBUF[4]_inst 
       (.I(a[4]),
        .O(a_IBUF[4]));
  IBUF \a_IBUF[5]_inst 
       (.I(a[5]),
        .O(a_IBUF[5]));
  IBUF \a_IBUF[6]_inst 
       (.I(a[6]),
        .O(a_IBUF[6]));
  IBUF \a_IBUF[7]_inst 
       (.I(a[7]),
        .O(a_IBUF[7]));
  IBUF \a_IBUF[8]_inst 
       (.I(a[8]),
        .O(a_IBUF[8]));
  IBUF \a_IBUF[9]_inst 
       (.I(a[9]),
        .O(a_IBUF[9]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[10]_inst 
       (.I(b[10]),
        .O(b_IBUF[10]));
  IBUF \b_IBUF[11]_inst 
       (.I(b[11]),
        .O(b_IBUF[11]));
  IBUF \b_IBUF[12]_inst 
       (.I(b[12]),
        .O(b_IBUF[12]));
  IBUF \b_IBUF[13]_inst 
       (.I(b[13]),
        .O(b_IBUF[13]));
  IBUF \b_IBUF[14]_inst 
       (.I(b[14]),
        .O(b_IBUF[14]));
  IBUF \b_IBUF[15]_inst 
       (.I(b[15]),
        .O(b_IBUF[15]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  IBUF \b_IBUF[2]_inst 
       (.I(b[2]),
        .O(b_IBUF[2]));
  IBUF \b_IBUF[3]_inst 
       (.I(b[3]),
        .O(b_IBUF[3]));
  IBUF \b_IBUF[4]_inst 
       (.I(b[4]),
        .O(b_IBUF[4]));
  IBUF \b_IBUF[5]_inst 
       (.I(b[5]),
        .O(b_IBUF[5]));
  IBUF \b_IBUF[6]_inst 
       (.I(b[6]),
        .O(b_IBUF[6]));
  IBUF \b_IBUF[7]_inst 
       (.I(b[7]),
        .O(b_IBUF[7]));
  IBUF \b_IBUF[8]_inst 
       (.I(b[8]),
        .O(b_IBUF[8]));
  IBUF \b_IBUF[9]_inst 
       (.I(b[9]),
        .O(b_IBUF[9]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-13 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    exponent_result1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,a_IBUF[9:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_exponent_result1_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,b_IBUF[9:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_exponent_result1_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_exponent_result1_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_exponent_result1_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(1'b0),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_exponent_result1_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_exponent_result1_OVERFLOW_UNCONNECTED),
        .P({NLW_exponent_result1_P_UNCONNECTED[47:22],p_0_in,exponent_result1_n_85,exponent_result1_n_86,exponent_result1_n_87,exponent_result1_n_88,exponent_result1_n_89,exponent_result1_n_90,exponent_result1_n_91,exponent_result1_n_92,exponent_result1_n_93,exponent_result1_n_94,exponent_result1_n_95,exponent_result1_n_96,exponent_result1_n_97,exponent_result1_n_98,exponent_result1_n_99,exponent_result1_n_100,exponent_result1_n_101,exponent_result1_n_102,exponent_result1_n_103,exponent_result1_n_104,exponent_result1_n_105}),
        .PATTERNBDETECT(NLW_exponent_result1_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_exponent_result1_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_exponent_result1_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_exponent_result1_UNDERFLOW_UNCONNECTED));
  OBUF \product_OBUF[0]_inst 
       (.I(product_OBUF[0]),
        .O(product[0]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[0]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_94),
        .I3(exponent_result1_n_95),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[0]));
  OBUF \product_OBUF[10]_inst 
       (.I(product_OBUF[10]),
        .O(product[10]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000069)) 
    \product_OBUF[10]_inst_i_1 
       (.I0(b_IBUF[10]),
        .I1(p_0_in),
        .I2(a_IBUF[10]),
        .I3(\product_OBUF[14]_inst_i_3_n_0 ),
        .I4(\product_OBUF[14]_inst_i_4_n_0 ),
        .I5(\product_OBUF[14]_inst_i_5_n_0 ),
        .O(product_OBUF[10]));
  OBUF \product_OBUF[11]_inst 
       (.I(product_OBUF[11]),
        .O(product[11]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFF02)) 
    \product_OBUF[11]_inst_i_1 
       (.I0(exponent_result[1]),
        .I1(\product_OBUF[14]_inst_i_3_n_0 ),
        .I2(\product_OBUF[14]_inst_i_4_n_0 ),
        .I3(\product_OBUF[14]_inst_i_5_n_0 ),
        .O(product_OBUF[11]));
  LUT5 #(
    .INIT(32'h7E81817E)) 
    \product_OBUF[11]_inst_i_2 
       (.I0(a_IBUF[10]),
        .I1(b_IBUF[10]),
        .I2(p_0_in),
        .I3(a_IBUF[11]),
        .I4(b_IBUF[11]),
        .O(exponent_result[1]));
  OBUF \product_OBUF[12]_inst 
       (.I(product_OBUF[12]),
        .O(product[12]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFF02)) 
    \product_OBUF[12]_inst_i_1 
       (.I0(exponent_result[2]),
        .I1(\product_OBUF[14]_inst_i_3_n_0 ),
        .I2(\product_OBUF[14]_inst_i_4_n_0 ),
        .I3(\product_OBUF[14]_inst_i_5_n_0 ),
        .O(product_OBUF[12]));
  LUT6 #(
    .INIT(64'h870F0F1E0F781EF0)) 
    \product_OBUF[12]_inst_i_2 
       (.I0(b_IBUF[10]),
        .I1(a_IBUF[10]),
        .I2(\product_OBUF[12]_inst_i_3_n_0 ),
        .I3(b_IBUF[11]),
        .I4(p_0_in),
        .I5(a_IBUF[11]),
        .O(exponent_result[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \product_OBUF[12]_inst_i_3 
       (.I0(b_IBUF[12]),
        .I1(a_IBUF[12]),
        .O(\product_OBUF[12]_inst_i_3_n_0 ));
  OBUF \product_OBUF[13]_inst 
       (.I(product_OBUF[13]),
        .O(product[13]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFF02)) 
    \product_OBUF[13]_inst_i_1 
       (.I0(exponent_result[3]),
        .I1(\product_OBUF[14]_inst_i_3_n_0 ),
        .I2(\product_OBUF[14]_inst_i_4_n_0 ),
        .I3(\product_OBUF[14]_inst_i_5_n_0 ),
        .O(product_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    \product_OBUF[13]_inst_i_2 
       (.I0(\product_OBUF[14]_inst_i_6_n_0 ),
        .I1(b_IBUF[13]),
        .I2(a_IBUF[13]),
        .I3(a_IBUF[12]),
        .I4(b_IBUF[12]),
        .O(exponent_result[3]));
  OBUF \product_OBUF[14]_inst 
       (.I(product_OBUF[14]),
        .O(product[14]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFF02)) 
    \product_OBUF[14]_inst_i_1 
       (.I0(exponent_result[4]),
        .I1(\product_OBUF[14]_inst_i_3_n_0 ),
        .I2(\product_OBUF[14]_inst_i_4_n_0 ),
        .I3(\product_OBUF[14]_inst_i_5_n_0 ),
        .O(product_OBUF[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \product_OBUF[14]_inst_i_10 
       (.I0(a_IBUF[13]),
        .I1(b_IBUF[13]),
        .O(\product_OBUF[14]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \product_OBUF[14]_inst_i_11 
       (.I0(\product_OBUF[15]_inst_i_2_n_0 ),
        .I1(\product_OBUF[15]_inst_i_3_n_0 ),
        .O(\product_OBUF[14]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h0220200820080880)) 
    \product_OBUF[14]_inst_i_12 
       (.I0(\product_OBUF[14]_inst_i_14_n_0 ),
        .I1(\product_OBUF[14]_inst_i_7_n_0 ),
        .I2(b_IBUF[13]),
        .I3(a_IBUF[13]),
        .I4(\product_OBUF[14]_inst_i_6_n_0 ),
        .I5(\product_OBUF[14]_inst_i_15_n_0 ),
        .O(\product_OBUF[14]_inst_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hFF80F800F8008000)) 
    \product_OBUF[14]_inst_i_13 
       (.I0(b_IBUF[12]),
        .I1(a_IBUF[12]),
        .I2(\product_OBUF[14]_inst_i_6_n_0 ),
        .I3(\product_OBUF[14]_inst_i_7_n_0 ),
        .I4(a_IBUF[13]),
        .I5(b_IBUF[13]),
        .O(\product_OBUF[14]_inst_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0120048004801200)) 
    \product_OBUF[14]_inst_i_14 
       (.I0(a_IBUF[11]),
        .I1(p_0_in),
        .I2(b_IBUF[11]),
        .I3(\product_OBUF[12]_inst_i_3_n_0 ),
        .I4(a_IBUF[10]),
        .I5(b_IBUF[10]),
        .O(\product_OBUF[14]_inst_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \product_OBUF[14]_inst_i_15 
       (.I0(a_IBUF[12]),
        .I1(b_IBUF[12]),
        .O(\product_OBUF[14]_inst_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h8007077F7FF8F880)) 
    \product_OBUF[14]_inst_i_2 
       (.I0(b_IBUF[12]),
        .I1(a_IBUF[12]),
        .I2(\product_OBUF[14]_inst_i_6_n_0 ),
        .I3(a_IBUF[13]),
        .I4(b_IBUF[13]),
        .I5(\product_OBUF[14]_inst_i_7_n_0 ),
        .O(exponent_result[4]));
  LUT6 #(
    .INIT(64'h000000040004044F)) 
    \product_OBUF[14]_inst_i_3 
       (.I0(exponent_result[3]),
        .I1(\product_OBUF[14]_inst_i_8_n_0 ),
        .I2(b_IBUF[14]),
        .I3(a_IBUF[14]),
        .I4(\product_OBUF[14]_inst_i_9_n_0 ),
        .I5(\product_OBUF[14]_inst_i_10_n_0 ),
        .O(\product_OBUF[14]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \product_OBUF[14]_inst_i_4 
       (.I0(\product_OBUF[14]_inst_i_11_n_0 ),
        .I1(product1),
        .O(\product_OBUF[14]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBB8B888)) 
    \product_OBUF[14]_inst_i_5 
       (.I0(\product_OBUF[14]_inst_i_11_n_0 ),
        .I1(\product_OBUF[14]_inst_i_4_n_0 ),
        .I2(\product_OBUF[14]_inst_i_12_n_0 ),
        .I3(\product_OBUF[14]_inst_i_13_n_0 ),
        .I4(a_IBUF[14]),
        .I5(b_IBUF[14]),
        .O(\product_OBUF[14]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEF8E080000000)) 
    \product_OBUF[14]_inst_i_6 
       (.I0(b_IBUF[10]),
        .I1(a_IBUF[10]),
        .I2(b_IBUF[11]),
        .I3(p_0_in),
        .I4(a_IBUF[11]),
        .I5(\product_OBUF[12]_inst_i_3_n_0 ),
        .O(\product_OBUF[14]_inst_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \product_OBUF[14]_inst_i_7 
       (.I0(b_IBUF[14]),
        .I1(a_IBUF[14]),
        .O(\product_OBUF[14]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0480120012004800)) 
    \product_OBUF[14]_inst_i_8 
       (.I0(a_IBUF[11]),
        .I1(p_0_in),
        .I2(b_IBUF[11]),
        .I3(\product_OBUF[12]_inst_i_3_n_0 ),
        .I4(a_IBUF[10]),
        .I5(b_IBUF[10]),
        .O(\product_OBUF[14]_inst_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80EAEA80)) 
    \product_OBUF[14]_inst_i_9 
       (.I0(\product_OBUF[14]_inst_i_6_n_0 ),
        .I1(a_IBUF[12]),
        .I2(b_IBUF[12]),
        .I3(b_IBUF[13]),
        .I4(a_IBUF[13]),
        .O(\product_OBUF[14]_inst_i_9_n_0 ));
  OBUF \product_OBUF[15]_inst 
       (.I(product_OBUF[15]),
        .O(product[15]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00141414)) 
    \product_OBUF[15]_inst_i_1 
       (.I0(\product_OBUF[15]_inst_i_2_n_0 ),
        .I1(b_IBUF[15]),
        .I2(a_IBUF[15]),
        .I3(\product_OBUF[15]_inst_i_3_n_0 ),
        .I4(product1),
        .O(product_OBUF[15]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \product_OBUF[15]_inst_i_10 
       (.I0(b_IBUF[10]),
        .I1(b_IBUF[11]),
        .I2(b_IBUF[12]),
        .I3(b_IBUF[14]),
        .I4(b_IBUF[13]),
        .O(\product_OBUF[15]_inst_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \product_OBUF[15]_inst_i_11 
       (.I0(b_IBUF[10]),
        .I1(b_IBUF[11]),
        .I2(b_IBUF[12]),
        .I3(b_IBUF[14]),
        .I4(b_IBUF[13]),
        .O(\product_OBUF[15]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \product_OBUF[15]_inst_i_2 
       (.I0(\product_OBUF[15]_inst_i_5_n_0 ),
        .I1(\product_OBUF[15]_inst_i_6_n_0 ),
        .I2(\product_OBUF[15]_inst_i_7_n_0 ),
        .I3(\product_OBUF[15]_inst_i_8_n_0 ),
        .I4(\product_OBUF[15]_inst_i_9_n_0 ),
        .I5(\product_OBUF[15]_inst_i_10_n_0 ),
        .O(\product_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF80000000)) 
    \product_OBUF[15]_inst_i_3 
       (.I0(a_IBUF[13]),
        .I1(a_IBUF[14]),
        .I2(a_IBUF[12]),
        .I3(a_IBUF[11]),
        .I4(a_IBUF[10]),
        .I5(\product_OBUF[15]_inst_i_10_n_0 ),
        .O(\product_OBUF[15]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000001)) 
    \product_OBUF[15]_inst_i_4 
       (.I0(a_IBUF[13]),
        .I1(a_IBUF[14]),
        .I2(a_IBUF[12]),
        .I3(a_IBUF[11]),
        .I4(a_IBUF[10]),
        .I5(\product_OBUF[15]_inst_i_11_n_0 ),
        .O(product1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \product_OBUF[15]_inst_i_5 
       (.I0(a_IBUF[7]),
        .I1(a_IBUF[6]),
        .I2(a_IBUF[8]),
        .I3(a_IBUF[9]),
        .I4(a_IBUF[4]),
        .I5(a_IBUF[5]),
        .O(\product_OBUF[15]_inst_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \product_OBUF[15]_inst_i_6 
       (.I0(a_IBUF[2]),
        .I1(a_IBUF[3]),
        .I2(a_IBUF[0]),
        .I3(a_IBUF[1]),
        .O(\product_OBUF[15]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \product_OBUF[15]_inst_i_7 
       (.I0(a_IBUF[10]),
        .I1(a_IBUF[11]),
        .I2(a_IBUF[12]),
        .I3(a_IBUF[14]),
        .I4(a_IBUF[13]),
        .O(\product_OBUF[15]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \product_OBUF[15]_inst_i_8 
       (.I0(b_IBUF[7]),
        .I1(b_IBUF[6]),
        .I2(b_IBUF[8]),
        .I3(b_IBUF[9]),
        .I4(b_IBUF[4]),
        .I5(b_IBUF[5]),
        .O(\product_OBUF[15]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \product_OBUF[15]_inst_i_9 
       (.I0(b_IBUF[2]),
        .I1(b_IBUF[3]),
        .I2(b_IBUF[0]),
        .I3(b_IBUF[1]),
        .O(\product_OBUF[15]_inst_i_9_n_0 ));
  OBUF \product_OBUF[1]_inst 
       (.I(product_OBUF[1]),
        .O(product[1]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[1]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_93),
        .I3(exponent_result1_n_94),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[1]));
  OBUF \product_OBUF[2]_inst 
       (.I(product_OBUF[2]),
        .O(product[2]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[2]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_92),
        .I3(exponent_result1_n_93),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[2]));
  OBUF \product_OBUF[3]_inst 
       (.I(product_OBUF[3]),
        .O(product[3]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[3]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_91),
        .I3(exponent_result1_n_92),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[3]));
  OBUF \product_OBUF[4]_inst 
       (.I(product_OBUF[4]),
        .O(product[4]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[4]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_90),
        .I3(exponent_result1_n_91),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[4]));
  OBUF \product_OBUF[5]_inst 
       (.I(product_OBUF[5]),
        .O(product[5]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[5]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_89),
        .I3(exponent_result1_n_90),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[5]));
  OBUF \product_OBUF[6]_inst 
       (.I(product_OBUF[6]),
        .O(product[6]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[6]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_88),
        .I3(exponent_result1_n_89),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[6]));
  OBUF \product_OBUF[7]_inst 
       (.I(product_OBUF[7]),
        .O(product[7]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[7]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_87),
        .I3(exponent_result1_n_88),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[7]));
  OBUF \product_OBUF[8]_inst 
       (.I(product_OBUF[8]),
        .O(product[8]));
  LUT5 #(
    .INIT(32'h0000A280)) 
    \product_OBUF[8]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_3_n_0 ),
        .I1(p_0_in),
        .I2(exponent_result1_n_86),
        .I3(exponent_result1_n_87),
        .I4(\product_OBUF[14]_inst_i_3_n_0 ),
        .O(product_OBUF[8]));
  OBUF \product_OBUF[9]_inst 
       (.I(product_OBUF[9]),
        .O(product[9]));
  LUT6 #(
    .INIT(64'hBBAABABAAAAAAAAA)) 
    \product_OBUF[9]_inst_i_1 
       (.I0(\product_OBUF[9]_inst_i_2_n_0 ),
        .I1(\product_OBUF[14]_inst_i_3_n_0 ),
        .I2(exponent_result1_n_86),
        .I3(exponent_result1_n_85),
        .I4(p_0_in),
        .I5(\product_OBUF[9]_inst_i_3_n_0 ),
        .O(product_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    \product_OBUF[9]_inst_i_2 
       (.I0(\product_OBUF[15]_inst_i_2_n_0 ),
        .I1(\product_OBUF[15]_inst_i_3_n_0 ),
        .I2(product1),
        .O(\product_OBUF[9]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000000000117177F)) 
    \product_OBUF[9]_inst_i_3 
       (.I0(b_IBUF[14]),
        .I1(a_IBUF[14]),
        .I2(\product_OBUF[14]_inst_i_9_n_0 ),
        .I3(\product_OBUF[14]_inst_i_10_n_0 ),
        .I4(\product_OBUF[9]_inst_i_4_n_0 ),
        .I5(\product_OBUF[14]_inst_i_4_n_0 ),
        .O(\product_OBUF[9]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h2A80802A802A2A80)) 
    \product_OBUF[9]_inst_i_4 
       (.I0(\product_OBUF[14]_inst_i_14_n_0 ),
        .I1(b_IBUF[12]),
        .I2(a_IBUF[12]),
        .I3(a_IBUF[13]),
        .I4(b_IBUF[13]),
        .I5(\product_OBUF[14]_inst_i_6_n_0 ),
        .O(\product_OBUF[9]_inst_i_4_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
