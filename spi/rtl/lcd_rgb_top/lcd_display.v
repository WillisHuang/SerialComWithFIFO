//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           lcd_display
// Last modified Date:  2020/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        绘制频谱界面
//                      
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2020/05/28 20:28:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module lcd_display(
    input                lcd_pclk,       //时钟
    input                rst_n,          //复位，低电平有效
    input        [10:0]  pixel_xpos,     //当前像素点横坐标
    input        [10:0]  pixel_ypos,     //当前像素点纵坐标  
    input        [10:0]  h_disp,         //LCD屏水平分辨率
    input        [10:0]  v_disp,         //LCD屏垂直分辨率       
    output       [15:0]  pixel_data,     //像素数据
    
    //FFT请求和数据接口
    input        [6:0]   fft_point_cnt,  //FFT频谱位置
    input        [15:0]  fft_data,       //FFT频率幅值
    output               fft_point_done, //FFT当前频谱绘制完成
    output               data_req        //请求数据信号
    );

//parameter define            
localparam BLACK  = 16'b00000_000000_00000;     //RGB565 黑色
localparam WHITE  = 16'b11111_111111_11111;     //RGB565 白色

//*****************************************************
//**                    main code
//*****************************************************

//请求像素数据信号（这里加8是为了图像居中显示）
//v_disp[10:6]表示每个频谱间隔的像素,垂直方向分辨率越大,间隔越大
assign data_req = ((pixel_ypos == fft_point_cnt * v_disp[10:6] + 4'd8 - 4'd1)
                    && (pixel_xpos == h_disp - 1)) ? 1'b1 : 1'b0;

//在要显示图像的列，显示fft_data长度的白色条纹
assign pixel_data = ((pixel_ypos == fft_point_cnt * v_disp[10:6] + 4'd8)
                    && (pixel_xpos <= fft_data)) ? WHITE : BLACK;                                 

//fft_point_done标志着一个频点上的频谱绘制完成,该信号会触发fft_point_cnt加1
assign fft_point_done  = ((pixel_ypos == fft_point_cnt * v_disp[10:6] + 4'd8)
                    && (pixel_xpos == h_disp - 1)) ? 1'b1 : 1'b0;                    
                    
endmodule 
