# hdmi_demo_tmct
Send video/audio over HDMI on an FPGA  
This project is a port of Sameer Puri's HDMI library to various prototype boards.  
[hdl-util/hdmi](https://github.com/hdl-util/hdmi)  
Project files for the development environment will also be included so you can use them as a reference for creating your own project.


音声パケット付きDVI(HDMI)出力ライブラリ  
このプロジェクトはSameer PuriさんのHDMIライブラリを色々なプロトタイプボードに移植したものです。  
[hdl-util/hdmi](https://github.com/hdl-util/hdmi)  
開発環境のプロジェクトファイルも含まれるので、新しいプロジェクトを作る際の参考として使用することができます。  
※日本語の解説文は英文解説の後にあります。

![HDMI-FPGAテスト環境の写真(1)](./image/hdmi_test(1).jpg "Photo of HDMI test environment(1)")

---
## Specifications, etc.
The evaluation board, output signal specifications, etc. are as follows:  
*As a typical specification, this document shows an example port to Terasic DE0.  
For other board projects, please see below.  
- Terasic DE0 ... This document
- [Terasic DE0CV](./board/terasic_de0cv/readme.md)

*Since the PLL and serializer use Intel-specific IP, these must be replaced when porting to non-Intel FPGAs.

|  | Specifications |
| :-- | :-- |
| Evaluation Board | Terasic DE0<br/>(Intel EP3C16F484C6) |
| Tool | QuartusII Web Edition Version 13.1 |
| Video | Resolution: 720×480p<br/>Refresh rate: 59.94Hz<br/>Pixcel clock: 27MHz |
| Audio | Resolution: 16bit<br/>Sampling rate: 48KHz<br/>Number of channels: 2(Stereo) |
| Output driver| LVDS_E_3R<br/>VCCIO=3.3V<br/>altlvds_tx is used as a serializer. |

　

The result of the logical synthesis is as follows.

```
Family : Cyclone III
Device : EP3C16F484C6
Timing Models : Final
Total logic elements : 1,120 / 15,408 ( 7 % )
    Total combinational functions : 1,064 / 15,408 ( 7 % )
    Dedicated logic registers : 416 / 15,408 ( 3 % )
Total registers : 416
Total pins : 18 / 347 ( 5 % )
Total virtual pins : 0
Total memory bits : 0 / 516,096 ( 0 % )
Embedded Multiplier 9-bit elements : 0 / 112 ( 0 % )
Total PLLs : 1 / 4 ( 25 % )
```


## Folder Structure
Everything specific to the board/FPGA device is placed under /boards/terasic_de0/. (The project files themselves are also placed under this folder as they are strongly board/FPGA device dependent.)

| Path | Details |
| :-- | :-- |
| /board/terasic_de0/ | Contains QuartusII project files for Terasic DE0 |
| /board/terasic_de0/ip/pll/ | CycloneIII altpll |
| /board/terasic_de0/ip/serializer/ | CycloneIII altlvds_tx |
| /board/terasic_de0/output_files/ | Logic synthesis output folder |
| /board/terasic_de0/rtl/ | DE0-specific rtl<br/>　- serializer.sv ... Wrapper for altlvds_tx (including MSB first to LSB first conversion)<br/>　- hdmi_test_top.sv ... Top-level entry (including image and audio test pattern generator) |
| /board/terasic_de0/sdc/ | Timing constraint setting |
| /rtl/ | Sammer's HDMI library, etc.<br/>　- hdmi.sv ... HDMI library body<br/>　※Serializer.sv is not used. |


## Hardware Connections
The outputs from DE0 are assigned so that the differential outputs are next to each other as much as possible, as shown below.  

| Signal name | FPGA<br/>Pin | GPIO 0<br/>Pin | HDMI-Connector<br/>Pin | Remarks |
| :-- | :-- | :-- | :-- | :-- |
| O_TMDS_DATA[2]+ | AA16 | 4 | 1:(TMDS)Data2+ |  |
| O_TMDS_DATA[2]- | AB16 | 2 | 3:(TMDS)Data2- |  |
| O_TMDS_DATA[1]+ | AA15 | 5 | 4:(TMDS)Data1+ |  |
| O_TMDS_DATA[1]- | AB15 | 6 | 6:(TMDS)Data1- |  |
| O_TMDS_DATA[0]+ | AA14 | 7 | 7:(TMDS)Data0+ |  |
| O_TMDS_DATA[0]- | AB14 | 8 | 9:(TMDS)Data0- |  |
| O_TMDS_CLK+ | AA13 | 10 | 10:(TMDS)Clock+ |  |
| O_TMDS_CLK- | AB13 | 9 | 12:(TMDS)Clock- |  |
| O_AUDIO | V8 | 36 | - | - | Audio test pattern frequency output |
| O_AUDIO_CLK | W6 | 38 | - | Audio sampling clock output |
| O_VIDEO_CLK | U7 | 40 | - | Pixel clock output |
| O_PLL_LOCKED | J1 | - | - | PLL lock output<br/>Connected to LEDG0 |
| I_AUDIO_PITCH[3] | G4 | - | - | Audio test pattern frequency selection<br/>onnected to SW3 |
| I_AUDIO_PITCH[2] | H6 | - | - | Audio test pattern frequency selection<br/>onnected to SW2 |
| I_AUDIO_PITCH[1] | H5 | - | - | Audio test pattern frequency selection<br/>onnected to SW1 |
| I_AUDIO_PITCH[0] | J6 | - | - | Audio test pattern frequency selection<br/>onnected to SW0 |
| I_CLK | G21 | - | - | 50MHz will be input<br/>The following are generated by the PLL:<br/>- Serializer operating clock<br/>- Pixel clock<br/>- Audio sampling clock |
| I_RESET_N | H2 | - | - | Connected to BUTTON0<br/>Press = Reset |

　

The wiring of the test environment is shown in the figure below.  
The CycloneIII I/O cells on the DE0 do not support TMDS, the physical layer of HDMI, so the TMDS driver is emulated by LVDS_E_3R and a resistor/coupling capacitor. The resistor value in the figure below is 200Ω, but a resistance value of 220-330Ω is better.  
(*In addition to that, if VCCIO=3.3V, coupling capacitors would be unnecessary.)

![DE0 to HDMI cable connection diagram](./image/hdmi_test(3).gif "DE0 to HDMI cable connection diagram")

Please refer to the following for the pin assignment of the HDMI connector.

- **HDMI pin assignments**  
  [https://ss1.xrea.com/tmct.s1009.xrea.com/ref/ta-xx-7e3m01.html#hdmi](https://ss1.xrea.com/tmct.s1009.xrea.com/ref/ta-xx-7e3m01.html#hdmi)

> +5V, HPD, SCL, SDA, and CEC are not video signals, but some TVs and monitors may not show images if these signals are not connected properly.


## Operation test
After connecting the monitor and transferring the logic to DE0, it will immediately start working and LEDG0 will light up to indicate PLL lock.  
You will see a screen on your monitor with a colorful test pattern scrolling up to the left.  

![Photo of HDMI test environment(2)](./image/hdmi_test(4).jpg "Photo of HDMI test environment(2)")

The assignment of switches and LEDs is as follows.

| Assign | Details |
| :-- | :-- |
| LEDG0 | **PLL lock state**<br/>Lights up when the PLL is locked. |
| BUTTON0 | **Reset**<br/>Press down to reset. |
| SW0〜3 | **Audio test pattern frequency change**<br/>Turning on any of the switches will output a test tone, and changing the switch pattern will change the frequency.<br/>The waveform of the test audio is a sawtooth wave with low volume. |


## Special thanks
The following sites and projects were referenced in the production of this project.

- **hdl-util/hdmi**  
  [https://github.com/hdl-util/hdmi](https://github.com/hdl-util/hdmi)
- **廉価FPGAでHDMI(DVI)出力**  
  [http://sa89a.net/mp.cgi/ele/fpga_hdmi.htm](http://sa89a.net/mp.cgi/ele/fpga_hdmi.htm)
- **ついに、Kintex-7で安定したHDMI 1080p出力に成功！**  
  [http://nahitafu.cocolog-nifty.com/nahitafu/2020/11/post-fc5a2f.html](http://nahitafu.cocolog-nifty.com/nahitafu/2020/11/post-fc5a2f.html)


---
## 仕様など
今回使用した評価ボード、出力信号の仕様などは以下の通りです。  
※代表的なスペックとして、このドキュメントではTerasic DE0への移植例を示します。  
その他のボードのプロジェクトは以下をご覧ください。  
- Terasic DE0 ... このドキュメント
- [Terasic DE0CV](./board/terasic_de0cv/readme.md)

※PLLとシリアライザにIntel固有IPを利用しているため、Intel以外のFPGAに移植する際はこれらを置き換える必要があります。

|  | 仕様 |
| :-- | :-- |
| 評価ボード | Terasic DE0<br/>(Intel EP3C16F484C6) |
| ツール | QuartusII Web Edition Version 13.1 |
| 画像 | 解像度: 720×480p<br/>リフレッシュレート: 59.94Hz<br/>画素クロック: 27MHz |
| 音声 | 解像度: 16bit<br/>サンプリングレート: 48KHz<br/>チャンネル数: 2(ステレオ) |
| 出力ドライバ | LVDS_E_3R<br/>ただしVCCIO=3.3V<br/>シリアライザとしてaltlvds_txを使用 |

　

論理合成結果は以下のようになりました。

```
Family : Cyclone III
Device : EP3C16F484C6
Timing Models : Final
Total logic elements : 1,120 / 15,408 ( 7 % )
    Total combinational functions : 1,064 / 15,408 ( 7 % )
    Dedicated logic registers : 416 / 15,408 ( 3 % )
Total registers : 416
Total pins : 18 / 347 ( 5 % )
Total virtual pins : 0
Total memory bits : 0 / 516,096 ( 0 % )
Embedded Multiplier 9-bit elements : 0 / 112 ( 0 % )
Total PLLs : 1 / 4 ( 25 % )
```


## フォルダ構成
ボード・FPGAデバイスに固有のものはすべて /boards/terasic_de0/ の下に配置しています。(プロジェクトファイル自体もボード・FPGAデバイスに強く依存するため、このフォルダの下に配置しています。)

| Path | Details |
| :-- | :-- |
| /board/terasic_de0/ | Terasic DE0向けのQuartusIIのプロジェクトファイルが含まれる |
| /board/terasic_de0/ip/pll/ | CycloneIII altpll |
| /board/terasic_de0/ip/serializer/ | CycloneIII altlvds_tx |
| /board/terasic_de0/output_files/ | 論理合成出力フォルダ |
| /board/terasic_de0/rtl/ | DE0固有rtl<br/>　- serializer.sv ... altlvds_txのラッパー(MSB first→LSB first変換含む)<br/>　- hdmi_test_top.sv ... トップレベルエントリ(画像・音声テストパターン生成器含む) |
| /board/terasic_de0/sdc/ | タイミング制約設定 |
| /rtl/ | SammerさんのHDMIライブラリなど<br/>　- hdmi.sv ... HDMIライブラリ本体<br/>　※serializer.svは未使用 |


## ハードウェアの結線
DE0からの出力は以下のようにできるだけ差動出力が隣になるようアサインしています。  

| 信号名 | FPGA<br/>Pin | GPIO 0<br/>Pin | HDMI-Connector<br/>Pin | Remarks |
| :-- | :-- | :-- | :-- | :-- |
| O_TMDS_DATA[2]+ | AA16 | 4 | 1:(TMDS)Data2+ |  |
| O_TMDS_DATA[2]- | AB16 | 2 | 3:(TMDS)Data2- |  |
| O_TMDS_DATA[1]+ | AA15 | 5 | 4:(TMDS)Data1+ |  |
| O_TMDS_DATA[1]- | AB15 | 6 | 6:(TMDS)Data1- |  |
| O_TMDS_DATA[0]+ | AA14 | 7 | 7:(TMDS)Data0+ |  |
| O_TMDS_DATA[0]- | AB14 | 8 | 9:(TMDS)Data0- |  |
| O_TMDS_CLK+ | AA13 | 10 | 10:(TMDS)Clock+ |  |
| O_TMDS_CLK- | AB13 | 9 | 12:(TMDS)Clock- |  |
| O_AUDIO | V8 | 36 | - | - | 音声テストパターン周波数出力 |
| O_AUDIO_CLK | W6 | 38 | - | 音声サンプリングクロック出力 |
| O_VIDEO_CLK | U7 | 40 | - | 画素クロック出力 |
| O_PLL_LOCKED | J1 | - | - | PLLロック出力<br/>LEDG0に接続されています |
| I_AUDIO_PITCH[3] | G4 | - | - | 音声テストパターン周波数選択<br/>SW3に接続されています |
| I_AUDIO_PITCH[2] | H6 | - | - | 音声テストパターン周波数選択<br/>SW2に接続されています |
| I_AUDIO_PITCH[1] | H5 | - | - | 音声テストパターン周波数選択<br/>SW1に接続されています |
| I_AUDIO_PITCH[0] | J6 | - | - | 音声テストパターン周波数選択<br/>SW0に接続されています |
| I_CLK | G21 | - | - | 50MHzが入力されます<br/>以下はPLLで生成されます:<br/>- シリアライザの動作クロック<br/>- 画素クロック<br/>- 音声サンプリングクロック |
| I_RESET_N | H2 | - | - | BUTTON0に接続されています<br/>押下=リセット |

　

実際の結線は以下の通り。  
DE0に載っているCycloneIIIのI/OセルはHDMIの物理層であるTMDSに対応していないため、LVDS_E_3Rと抵抗・カップリングコンデンサでTMDSドライバをエミュレートしています。下図の抵抗値は200Ωとなっていますが、抵抗値は220〜330Ωがベターです。  
(※あとVCCIO=3.3Vの場合はカップリングコンデンサは不要です。)

![DE0とHDMIケーブルの接続図](./image/hdmi_test(3).gif "DE0 to HDMI cable connection diagram")

HDMIコネクタのピンアサインは以下を参考にどうぞ。

- **HDMIピンアサイン**  
  [https://ss1.xrea.com/tmct.s1009.xrea.com/ref/ta-xx-7e3m01.html#hdmi](https://ss1.xrea.com/tmct.s1009.xrea.com/ref/ta-xx-7e3m01.html#hdmi)

> +5V,HPD,SCL,SDA,CEC は画像信号ではありませんが、TVやモニタによってはこれらが正しく接続されていないと映像が映らないことがあります。


## 動作させる
モニタを接続してDE0に論理を転送するとただちに動作を始め、LEDG0が点灯してPLLロックを示します。  
モニタにはカラフルなテストパターンが左上にスクロールしていくような画面が表示されます。  
(下の写真はちょっと古いです。Githubに貼ってあるものは画面の四隅に白い枠線が表示されます。)

![HDMI-FPGAテスト環境の写真(2)](./image/hdmi_test(4).jpg "Photo of HDMI test environment(2)")

スイッチやLEDなどのアサインは以下の通り。

| Assign | Details |
| :-- | :-- |
| LEDG0 | **PLLロック状態**<br/>PLLがロックすると点灯します。 |
| BUTTON0 | **リセット**<br/>押下するとリセット、離すと解除されます。 |
| SW0〜3 | **音声テストパターン周波数変更**<br/>いずれかのスイッチをONするとテスト音が出力され、スイッチのパターンを変えると周波数が変わります。<br/>テスト音声の波形は音量小さめののこぎり波です。 |

　

こちらも参考までにご覧ください。

- **FPGAから音声付きHDMI信号を出力する**  
  [https://ss1.xrea.com/tmct.s1009.xrea.com/doc/ta-ja-7e6b01.html](https://ss1.xrea.com/tmct.s1009.xrea.com/doc/ta-ja-7e6b01.html)


## Special thanks
このプロジェクトの製作にあたり、以下のサイト・プロジェクトを参照しました。

- **hdl-util/hdmi**  
  [https://github.com/hdl-util/hdmi](https://github.com/hdl-util/hdmi)
- **廉価FPGAでHDMI(DVI)出力**  
  [http://sa89a.net/mp.cgi/ele/fpga_hdmi.htm](http://sa89a.net/mp.cgi/ele/fpga_hdmi.htm)
- **ついに、Kintex-7で安定したHDMI 1080p出力に成功！**  
  [http://nahitafu.cocolog-nifty.com/nahitafu/2020/11/post-fc5a2f.html](http://nahitafu.cocolog-nifty.com/nahitafu/2020/11/post-fc5a2f.html)

